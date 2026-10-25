#!/usr/bin/env python3
"""Differential testing of SelectionDAG vs GlobalISel for RISC-V.

For every input .ll file, each `llc` RUN line is replayed twice:
  SDAG : llc <flags> -global-isel=0
  GISel: llc <flags> -global-isel=1 -global-isel-abort=2 -pass-remarks-missed=gisel.*

Every function is then classified as one of:
  identical     normalized asm is the same
  gisel-worse   GISel emits more instructions
  gisel-better  GISel emits fewer instructions
  different     same instruction count, different code
  fallback      GISel gave up and SDAG was used (reason recorded)
  crash         GISel llc failed while SDAG succeeded

With --exec, functions whose assembly differs are also run under qemu-user and
compared (see exec_oracle.py); a difference in results is a miscompile.

Two campaign shapes:
  default     every configuration once, plus --mutate fixed-seed mutants of each
  --explore   mutant rounds with varying seeds, mutation counts and llc flags
              until the time budget runs out (see explore.py)

Results go to <out>/report.json, <out>/summary.md and <out>/diffs/*.diff.
"""

import argparse
import collections
import concurrent.futures as cf
import dataclasses
import difflib
import hashlib
import json
import os
import re
import shlex
import shutil
import subprocess
import sys
import tempfile
import time

import exec_oracle
import explore

# RUN lines using these flags do not produce comparable assembly.
SKIP_FLAGS = re.compile(
    r"^-(stop-after|stop-before|start-after|start-before|run-pass|print-|debug"
    r"|filetype=obj|filetype=null|x$|mir|pass-remarks|time-passes|stats)"
)
# Flags we control ourselves.
DROP_FLAGS = re.compile(r"^-(global-isel|o$|o=)")

SED_RE = re.compile(r"""^s(.)(.*?)\1(.*?)\1(g?)$""")


def join_run_lines(text):
    """Return the logical RUN commands of a lit test (continuations joined)."""
    cmds, cur = [], None
    for line in text.splitlines():
        m = re.match(r"^\s*;\s*RUN:\s?(.*)$", line)
        if not m:
            if cur is not None:
                cmds.append(cur)
                cur = None
            continue
        body = m.group(1).rstrip()
        cont = body.endswith("\\")
        if cont:
            body = body[:-1]
        cur = body if cur is None else cur + " " + body
        if not cont:
            cmds.append(cur)
            cur = None
    if cur is not None:
        cmds.append(cur)
    return cmds


def parse_run(cmd):
    """Turn one RUN command into (sed_substitutions, llc_flags) or None."""
    stages = [s.strip() for s in cmd.split("|")]
    seds = []
    llc_stage = None
    for i, st in enumerate(stages):
        try:
            toks = shlex.split(st)
        except ValueError:
            return None
        if not toks:
            return None
        if toks[0] == "sed" and llc_stage is None:
            args = [t for t in toks[1:] if t not in ("-e", "%s")]
            for a in args:
                m = SED_RE.match(a)
                if not m:
                    return None
                seds.append((m.group(2), m.group(3), bool(m.group(4))))
        elif toks[0] == "cat" and toks[1:] == ["%s"]:
            continue
        elif toks[0] == "llc":
            llc_stage = toks[1:]
            # Anything after llc must just be checking output.
            for rest in stages[i + 1:]:
                if not rest.startswith("FileCheck"):
                    return None
            break
        else:
            return None
    if llc_stage is None:
        return None

    flags = []
    it = iter(llc_stage)
    for t in it:
        if t in ("<", "%s"):
            continue
        if t == "-o":
            next(it, None)
            continue
        if SKIP_FLAGS.match(t):
            return None
        if DROP_FLAGS.match(t):
            continue
        if "%" in t:
            return None
        flags.append(t)
    if not any(f.startswith(("-mtriple=riscv", "--mtriple=riscv")) for f in flags):
        return None
    return seds, flags


def apply_seds(text, seds):
    for pat, rep, glob in seds:
        # sed uses BRE; tests only use literal words so a literal replace is enough.
        text = text.replace(pat, rep) if glob else text.replace(pat, rep, 1)
    return text


LOCAL_LABEL = re.compile(r"\.L[A-Za-z_]*\d+(?:_\d+)*")


def split_functions(asm):
    """Return {name: [normalized lines]} for every function in the asm."""
    funcs = {}
    pending = set()
    cur, body = None, None
    for raw in asm.splitlines():
        line = raw.split("#", 1)[0].rstrip()
        m = re.match(r"^\s*\.type\s+([^,\s]+),\s*@function", line)
        if m:
            pending.add(m.group(1).strip('"'))
            continue
        if cur is None:
            m = re.match(r"^(\S+):$", line)
            if m and m.group(1).strip('"') in pending:
                cur, body = m.group(1).strip('"'), []
            continue
        if line.startswith(".Lfunc_end") or re.match(r"^\s*\.size\s", line):
            funcs[cur] = normalize(body)
            cur = None
            continue
        s = line.strip()
        if not s or (s.startswith(".") and not s.endswith(":")):
            continue  # directives (cfi, p2align, ...)
        body.append(s)
    return funcs


def normalize(lines):
    mapping = {}

    def sub(m):
        return mapping.setdefault(m.group(0), f".L{len(mapping)}")

    return [re.sub(r"\s+", " ", LOCAL_LABEL.sub(sub, l)) for l in lines]


def inst_count(lines):
    return sum(1 for l in lines if not l.endswith(":"))


REMARK_RE = re.compile(r"remark: [^:]*:\d+:\d+: (.*) \(in function: (.+)\)\s*$")
FALLBACK_RE = re.compile(r"Instruction selection used fallback path for (.+)$")


# Widths GISel has register banks and legal types for; everything else is a
# non-standard width that behaves like the next one up.
STD_WIDTHS = (1, 8, 16, 32, 64, 128)
VEC_COUNT = re.compile(r"<\s*(vscale x )?\d+ x ")
SCALAR_WIDTH = re.compile(r"\b([si])(\d+)\b")


def _bucket_width(m):
    prefix, n = m.group(1), int(m.group(2))
    if n in STD_WIDTHS:
        return f"{prefix}{n}"
    nxt = next((w for w in STD_WIDTHS if n < w), 256)
    return f"{prefix}{nxt}~"


def normalize_key(key):
    """Collapse detail that splits one gap into many categories.

    <4 x s32> and <8 x s32> are the same missing legalization, and so are s24
    and s17 (both reported as the bucketed width with a trailing "~").
    """
    key = VEC_COUNT.sub(lambda m: f"<{m.group(1) or ''}N x ", key)
    return SCALAR_WIDTH.sub(_bucket_width, key)


def reason_key(msg):
    """Collapse a GISel failure remark into a groupable category."""
    m = re.match(r"unable to translate instruction: ([^:']+)(?::\s*'(.*)')?", msg)
    if m:
        key = "translate: " + m.group(1).strip()
        inst = (m.group(2) or "").split("=", 1)[-1]
        ty = re.search(r"<[^>]+>|\b(?:i\d+|half|bfloat|float|double|fp128|x86_fp80|ptr)\b", inst)
        if ty and not m.group(1).startswith("call"):
            key += " " + ty.group(0)
        return normalize_key(key)
    m = re.match(r"(?:unable to (legalize|select|map) instruction|(cannot select)): (.*)", msg)
    if m:
        kind = m.group(1) or "select"
        rest = m.group(3)
        op = re.search(r"\b(G_[A-Z_0-9]+|[A-Z][A-Z_0-9]+)\b", rest)
        tys = re.findall(r"\((s\d+|p\d+|<[^>]+>)\)", rest)
        key = f"{kind}: {op.group(1) if op else '?'}"
        if tys:
            key += " " + ",".join(dict.fromkeys(tys))
        return normalize_key(key)
    return normalize_key(re.sub(r":.*", "", msg))


def run_llc(llc, flags, src, timeout):
    try:
        p = subprocess.run(
            [llc] + flags + ["-o", "-"],
            input=src,
            capture_output=True,
            text=True,
            timeout=timeout,
        )
        return p.returncode, p.stdout, p.stderr
    except subprocess.TimeoutExpired:
        return -999, "", "timeout"


def first_error(stderr):
    for l in stderr.splitlines():
        if "LLVM ERROR" in l or "Assertion" in l or "error:" in l or l == "timeout":
            return l.strip()[:1000]
    lines = [l for l in stderr.splitlines() if l.strip()]
    return lines[0][:300] if lines else "unknown failure"


def crash_sig(err):
    """Cluster key for a crash line, independent of host libc, paths and line numbers.

    glibc:  llc: /p/X.cpp:216: const T* ns::C::f(args) const: Assertion `cond' failed.
    Darwin: Assertion failed: (cond), function f, file X.cpp, line 216.
    """
    m = re.search(r"([\w.+-]+):\d+: (.*?): Assertion `(.*)' failed", err)
    if m:
        fn = re.search(r"([\w~]+)\s*\(", m.group(2))
        err = f"Assertion failed: ({m.group(3)}), function {fn.group(1) if fn else m.group(2)}, file {m.group(1)}"
    else:
        err = re.sub(r"(Assertion failed: .*, file [^,]+), line \d+\.?", r"\1", err)
    err = re.sub(r" \(in function: [^)]*\)", "", err)
    return re.sub(r"0x[0-9a-f]+|%\d+", "N", err)[:300]


@dataclasses.dataclass
class Job:
    """One llc configuration to test, optionally on a mutant of `path`."""

    path: str
    seds: list
    flags: list
    seed: int = None          # mutation seed; None runs the input unmutated
    mutations: int = 3        # mutations the mutator applies
    scalable: bool = False    # let the mutator use scalable vector types
    exec_ok: bool = True      # may the execution oracle run on this job?

    @property
    def config(self):
        return " ".join(self.flags)


def mutate(src, job, args):
    argv = [args.ir_mutate, f"-seed={job.seed}", f"-n={job.mutations}"]
    if job.scalable:
        argv.append("-scalable")
    try:
        p = subprocess.run(argv, input=src, capture_output=True, text=True,
                           timeout=args.timeout)
    except subprocess.TimeoutExpired:
        return None
    return p.stdout if p.returncode == 0 else None


def mutant_path(job, args):
    """Where a mutant is written. Stable across runs for the same job."""
    tag = str(job.seed)
    if job.mutations != args.mutations or job.scalable:
        tag += f".{job.mutations}{'s' if job.scalable else ''}"
    h = hashlib.sha1((job.path + job.config + tag).encode()).hexdigest()[:10]
    return os.path.join(args.out, "mutants", f"{os.path.basename(job.path)[:-3]}.{h}.ll")


def process(job, args):
    with open(job.path) as f:
        src = apply_seds(f.read(), job.seds)
    cfg = job.config
    if job.seed is not None:
        if args.deadline and time.time() > args.deadline:
            return {"file": "(not generated)", "config": cfg,
                    "skipped": "time budget", "mutant_of": job.path}
        src = mutate(src, job, args)
        if src is None:
            return {"file": job.path, "config": cfg, "skipped": "mutator failed"}
        mpath = mutant_path(job, args)
        with open(mpath, "w") as f:
            f.write(src)
        res = process_src(mpath, src, job, cfg, args)
        res["mutant_of"] = job.path
        res["mutant"] = {"seed": job.seed, "mutations": job.mutations,
                         "scalable": job.scalable}
        boring = "skipped" in res or (
            "functions" in res and all(fn["status"] == "identical" for fn in res["functions"]))
        if boring:
            os.remove(mpath)
        return res
    res = process_src(job.path, src, job, cfg, args)
    if job.seds:
        res["seds"] = job.seds
    return res


# Statuses where GISel produced its own code for the function, so the two
# selectors can be compared by running the result.
EXECUTABLE = ("different", "gisel-worse", "gisel-better")


def run_exec_oracle(path, src, job, funcs, args):
    """Miscompile findings for the functions whose assembly differs."""
    names = [fn["name"] for fn in funcs if fn["status"] in EXECUTABLE]
    if not names or (args.deadline and time.time() > args.deadline):
        return []
    diffs = {fn["name"]: fn.get("diff", "") for fn in funcs}
    try:
        found = exec_oracle.check(args, src, job.flags, names[: args.exec_max_funcs],
                                  job.seed or 1)
    except RuntimeError as e:   # qemu missing: report once, then stay off
        if not getattr(args, "_exec_broken", False):
            print(f"execution oracle disabled: {e}", file=sys.stderr)
            args._exec_broken = True
        args.exec_oracle = False
        return []
    for mc in found:
        mc["key"] = exec_oracle.miscompile_key(mc["xlen"], diffs.get(mc["function"], ""))
    return found


def process_src(path, src, job, cfg, args):
    flags = job.flags
    rc_s, asm_s, err_s = run_llc(args.llc, flags + ["-global-isel=0"], src, args.timeout)
    if rc_s != 0:
        return {"file": path, "config": cfg, "skipped": "sdag failed: " + first_error(err_s)}
    rc_g, asm_g, err_g = run_llc(
        args.llc,
        flags + ["-global-isel=1", "-global-isel-abort=2", "-pass-remarks-missed=gisel.*"],
        src,
        args.timeout,
    )
    if rc_g != 0:
        return {"file": path, "config": cfg, "crash": first_error(err_g)}

    reasons, fallbacks = {}, set()
    for l in err_g.splitlines():
        m = REMARK_RE.search(l)
        if m:
            reasons.setdefault(m.group(2), m.group(1))
        m = FALLBACK_RE.search(l)
        if m:
            fallbacks.add(m.group(1).strip())

    fs, fg = split_functions(asm_s), split_functions(asm_g)
    funcs = []
    for name, body_s in fs.items():
        body_g = fg.get(name)
        rec = {"name": name, "sdag": inst_count(body_s)}
        if name in fallbacks or body_g is None:
            rec["status"] = "fallback"
            msg = reasons.get(name, "silent fallback (no remark emitted)")
            rec["reason"] = msg
            rec["reason_key"] = reason_key(msg)
        else:
            rec["gisel"] = inst_count(body_g)
            d = rec["gisel"] - rec["sdag"]
            if body_g == body_s:
                rec["status"] = "identical"
            elif d > 0:
                rec["status"] = "gisel-worse"
            elif d < 0:
                rec["status"] = "gisel-better"
            else:
                rec["status"] = "different"
            if rec["status"] != "identical":
                rec["diff"] = "\n".join(
                    difflib.unified_diff(body_s, body_g, "sdag", "gisel", lineterm="", n=3)
                )
        funcs.append(rec)
    res = {"file": path, "config": cfg, "functions": funcs}
    if args.exec_oracle and job.exec_ok:
        mcs = run_exec_oracle(path, src, job, funcs, args)
        if mcs:
            res["miscompiles"] = mcs
    return res


def input_files(args):
    files = []
    for p in args.inputs:
        if os.path.isdir(p):
            if args.recursive:
                for root, dirs, names in os.walk(p):
                    dirs.sort()
                    files += [os.path.join(root, n) for n in sorted(names) if n.endswith(".ll")]
            else:
                files += [os.path.join(p, n) for n in sorted(os.listdir(p)) if n.endswith(".ll")]
        else:
            files.append(p)
    if args.filter:
        rx = re.compile(args.filter)
        files = [f for f in files if rx.search(f)]
    return files


def base_jobs(args):
    """One Job per (input, llc configuration), unmutated."""
    jobs = []
    for f in input_files(args):
        if args.config:
            for c in args.config:
                jobs.append(Job(f, [], shlex.split(c) + ["-verify-machineinstrs"]))
            continue
        try:
            with open(f) as fh:
                text = fh.read()
        except (OSError, UnicodeDecodeError):
            continue
        seen = set()
        for cmd in join_run_lines(text):
            r = parse_run(cmd)
            if r is None:
                continue
            key = (tuple(map(tuple, r[0])), tuple(r[1]))
            if key not in seen:
                seen.add(key)
                jobs.append(Job(f, r[0], r[1]))
    return jobs


def exec_sampled(job, args):
    """Deterministic --exec-rate sampling, so a rerun tests the same jobs."""
    if args.exec_rate >= 1:
        return True
    if args.exec_rate <= 0:
        return False
    h = hashlib.sha1(f"{job.path}|{job.config}|{job.seed}".encode()).hexdigest()
    return int(h[:8], 16) / 0x1_0000_0000 < args.exec_rate


def collect_jobs(args):
    jobs = base_jobs(args)
    for j in jobs:
        j.exec_ok = True if args.exec_originals_only else exec_sampled(j, args)
    if args.mutate:
        for b in list(jobs):
            for s in range(args.mutate_seed, args.mutate_seed + args.mutate):
                j = dataclasses.replace(b, seed=s, mutations=args.mutations)
                j.exec_ok = not args.exec_originals_only and exec_sampled(j, args)
                jobs.append(j)
    return jobs


def gen_stress(args, tmpdir):
    paths = []
    for seed in range(args.stress_seed, args.stress_seed + args.stress):
        out = os.path.join(tmpdir, f"stress-{seed}.ll")
        subprocess.run(
            [args.llvm_stress, f"-seed={seed}", f"-size={args.stress_size}", "-o", out],
            check=True,
        )
        paths.append(out)
    return paths


def write_reports(results, args):
    os.makedirs(os.path.join(args.out, "diffs"), exist_ok=True)
    with open(os.path.join(args.out, "report.json"), "w") as f:
        json.dump(results, f, indent=1)

    status = collections.Counter()
    reasons = collections.defaultdict(list)
    crashes = collections.defaultdict(list)
    miscompiles = collections.defaultdict(list)
    deltas = []
    skipped = 0
    # The explore pass counts results it does not keep into one entry.
    agg_reasons = collections.Counter()
    agg_crashes = collections.Counter()
    dropped = 0
    for r in results:
        if r.get("dropped"):
            dropped += r["results"]
            status.update(r["status"])
            agg_reasons.update(r["reasons"])
            agg_crashes.update(r["crashes"])
            continue
        if "skipped" in r:
            skipped += 1
            continue
        if "crash" in r:
            crashes[crash_sig(r["crash"])].append(r)
            continue
        for mc in r.get("miscompiles", []):
            status["miscompile"] += 1
            miscompiles[mc["key"]].append((r, mc))
        for fn in r["functions"]:
            status[fn["status"]] += 1
            if fn["status"] == "fallback":
                reasons[fn["reason_key"]].append(
                    (r["file"], r["config"], fn["name"], "mutant_of" in r))
            elif fn["status"] != "identical":
                deltas.append((fn["gisel"] - fn["sdag"], r, fn))

    deltas.sort(key=lambda x: -x[0])
    for i, (d, r, fn) in enumerate(deltas):
        fname = f"{i:05d}_{d:+d}_{os.path.basename(r['file'])}_{fn['name']}"
        fname = re.sub(r"[^\w.+-]", "_", fname)[:150] + ".diff"
        fn["diff_file"] = fname
        with open(os.path.join(args.out, "diffs", fname), "w") as f:
            f.write(f"; file:   {r['file']}\n; config: {r['config']}\n")
            f.write(f"; func:   {fn['name']}  sdag={fn['sdag']} gisel={fn['gisel']}\n")
            f.write(fn["diff"] + "\n")

    md = ["# SelectionDAG vs GlobalISel (RISC-V)", ""]
    md.append(f"Configurations run: {len(results) - skipped} (skipped {skipped} where SDAG itself failed)"
              + (f"; {dropped} further mutants were counted only" if dropped else ""))
    md.append("")
    md.append("| status | functions |\n|---|---|")
    for k in ["identical", "different", "gisel-better", "gisel-worse", "fallback"]:
        md.append(f"| {k} | {status[k]} |")
    md.append(f"| crash (configs) | {sum(len(v) for v in crashes.values())} |")
    md.append(f"| miscompile (functions) | {status['miscompile']} |")

    if miscompiles:
        md += ["", "## Miscompiles (GISel result differs from both SelectionDAG builds)", ""]
        for k, v in sorted(miscompiles.items(), key=lambda kv: -len(kv[1])):
            md.append(f"- {len(v)}x `{k}`")
            for r, mc in v[:3]:
                md.append(f"  - `{r['file']}` @{mc['function']} `{r['config']}`"
                          f" ({mc['input_count']}/{mc['of_inputs']} inputs)")

    # "NEW" marks categories that only mutants reach: the existing tests never
    # exercise them, so they are the gaps worth adding tests for.
    md += ["", "## Fallback reasons (most common first)", ""]
    md.append("| count | new | reason | example |\n|---|---|---|---|")
    def rcount(k):
        return len(reasons.get(k, ())) + agg_reasons[k]
    keys = list(reasons) + [k for k in agg_reasons if k not in reasons]
    ordered = sorted(keys, key=lambda k: (any(not m for *_, m in reasons.get(k, ())), -rcount(k)))
    for k in ordered[: args.top]:
        v = reasons.get(k, ())
        new = bool(v) and all(m for *_, m in v)
        ex = f"`{v[0][0]}` @{v[0][2]} `{v[0][1]}`" if v else "(counted only)"
        md.append(f"| {rcount(k)} | {'NEW' if new else ''} | `{k}` | {ex} |")
    if len(ordered) > args.top:
        md.append(f"\n({len(ordered) - args.top} more categories in report.json)")

    md += ["", "## GISel crashes", ""]
    for k, v in sorted(crashes.items(), key=lambda kv: (any("mutant_of" not in r for r in kv[1]), -len(kv[1]))):
        new = all("mutant_of" in r for r in v)
        md.append(f"- {len(v) + agg_crashes[k]}x {'**NEW** ' if new else ''}`{k}`")
        for r in v[:3]:
            md.append(f"  - `{r['file']}` `{r['config']}`")
    for k, n in agg_crashes.items():
        if k not in crashes:
            md.append(f"- {n}x `{k}` (counted only)")

    md += ["", f"## Largest GISel regressions (top {args.top})", ""]
    md.append("| +insts | sdag | gisel | function | file | diff |\n|---|---|---|---|---|---|")
    for d, r, fn in [x for x in deltas if x[0] > 0][: args.top]:
        md.append(
            f"| {d:+d} | {fn['sdag']} | {fn['gisel']} | `{fn['name']}` | "
            f"`{os.path.basename(r['file'])}` | `diffs/{fn['diff_file']}` |"
        )

    per_file = collections.Counter()
    for d, r, fn in deltas:
        if d > 0:
            per_file[os.path.basename(r["file"])] += d
    md += ["", "## Files with the most extra GISel instructions", ""]
    for f, d in per_file.most_common(args.top):
        md.append(f"- `{f}`: +{d}")

    with open(os.path.join(args.out, "summary.md"), "w") as f:
        f.write("\n".join(md) + "\n")
    return status, crashes, reasons


def write_meta(args, root, started, njobs, budget_skipped=0, extra=None):
    def out(cmd):
        try:
            return subprocess.run(cmd, capture_output=True, text=True, cwd=root).stdout.strip()
        except OSError:
            return ""

    version = out([args.llc, "--version"])
    meta = {
        "started": started,
        "finished": time.time(),
        "jobs": njobs,
        "revision": out(["git", "rev-parse", "HEAD"]),
        "dirty_llvm": bool(out(["git", "status", "--porcelain", "--", "llvm"])),
        "llc": args.llc,
        "llc_version": next((l.strip() for l in version.splitlines() if "LLVM version" in l), ""),
        "inputs": args.inputs if not args.stress else [f"llvm-stress x{args.stress}"],
        "filter": args.filter,
        "config": args.config,
        "mutate": args.mutate,
        "mutate_seed": args.mutate_seed,
        "mutations": args.mutations,
        "stress": args.stress,
        "time_budget": args.time_budget,
        "budget_skipped": budget_skipped,
        "recursive": args.recursive,
        "explore": args.explore,
        "exec": bool(args.exec_oracle),
        "exec_rate": args.exec_rate,
        "exec_inputs": args.exec_inputs,
    }
    meta.update(extra or {})
    with open(os.path.join(args.out, "meta.json"), "w") as f:
        json.dump(meta, f, indent=1)


HERE = os.path.dirname(os.path.abspath(__file__))


def load_history(path):
    """Category keys seen in earlier runs (see fuzz_site.py --dump-keys)."""
    if not path or not os.path.exists(path):
        return set()
    with open(path) as f:
        return set(json.load(f).get("keys", []))


def result_keys(res):
    """("kind", key) for every finding in one result."""
    keys = []
    if "crash" in res:
        keys.append(("crash", crash_sig(res["crash"])))
    for fn in res.get("functions", []):
        if fn["status"] == "fallback":
            keys.append(("fallback", fn["reason_key"]))
    for mc in res.get("miscompiles", []):
        keys.append(("miscompile", mc["key"]))
    return keys


def llvm_src():
    """llvm-project checkout: $LLVM_SRC, else the llvm-project submodule."""
    return os.path.abspath(os.environ.get("LLVM_SRC") or os.path.join(HERE, "llvm-project"))


def llvm_bin(tool):
    """Tool from $LLVM_BUILD/bin, else <llvm_src>/build/bin."""
    return os.path.join(os.environ.get("LLVM_BUILD") or os.path.join(llvm_src(), "build"), "bin", tool)


def main():
    root = llvm_src()
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("inputs", nargs="*", default=[os.path.join(root, "llvm/test/CodeGen/RISCV")],
                    help=".ll files or directories (default: llvm/test/CodeGen/RISCV)")
    ap.add_argument("--no-recursive", dest="recursive", action="store_false",
                    help="do not descend into subdirectories (rvv/, GlobalISel/, ...)")
    ap.add_argument("--llc", default=llvm_bin("llc"))
    ap.add_argument("--llvm-stress", default=llvm_bin("llvm-stress"))
    ap.add_argument("--out", default=os.path.join(HERE, "out"))
    ap.add_argument("--filter", help="only files whose path matches this regex")
    ap.add_argument("--config", action="append",
                    help="explicit llc flags, e.g. '-mtriple=riscv64 -mattr=+m,+d'. "
                         "Overrides RUN lines; may be repeated")
    ap.add_argument("--stress", type=int, default=0, help="also test N llvm-stress generated files")
    ap.add_argument("--stress-seed", type=int, default=1)
    ap.add_argument("--stress-size", type=int, default=50)
    ap.add_argument("--mutate", type=int, default=0,
                    help="also run N FuzzMutate mutants of every test configuration")
    ap.add_argument("--mutate-seed", type=int, default=1)
    ap.add_argument("--mutations", type=int, default=3, help="mutations applied per mutant")
    ap.add_argument("--ir-mutate", default=llvm_bin("ir-mutate"))
    ap.add_argument("-j", "--jobs", type=int, default=os.cpu_count())
    ap.add_argument("--timeout", type=int, default=60)
    ap.add_argument("--top", type=int, default=40)
    ap.add_argument("--time-budget", type=float, default=0,
                    help="minutes; mutant configurations not started by then are skipped (0 = no limit)")
    ap.add_argument("--history", help="JSON file of category keys seen in earlier runs; "
                                      "used to recognize novelty while exploring")
    exec_oracle.add_arguments(ap)
    ap.add_argument("--exec-rate", type=float, default=1.0,
                    help="fraction of mutant configurations the execution oracle runs on")
    ap.add_argument("--exec-originals-only", action="store_true",
                    help="run the execution oracle on the input tests only, never on mutants")
    explore.add_arguments(ap)
    args = ap.parse_args()
    args.deadline = time.time() + args.time_budget * 60 if args.time_budget else None
    args.history_keys = load_history(args.history)

    tmpdir = tempfile.mkdtemp(prefix="isel-diff-")
    if args.stress:
        if not args.config:
            args.config = ["-mtriple=riscv64 -mattr=+m,+a,+f,+d,+c",
                           "-mtriple=riscv32 -mattr=+m,+a,+f,+d,+c"]
        args.inputs = gen_stress(args, tmpdir)

    for sub in ("diffs", "mutants"):
        shutil.rmtree(os.path.join(args.out, sub), ignore_errors=True)
        os.makedirs(os.path.join(args.out, sub))

    started = time.time()
    if args.explore:
        results, njobs, extra = explore.run(args, process)
    else:
        jobs = collect_jobs(args)
        print(f"{len(jobs)} llc configurations", file=sys.stderr)
        njobs, extra = len(jobs), None
        results = []
        with cf.ThreadPoolExecutor(args.jobs) as ex:
            futs = [ex.submit(process, j, args) for j in jobs]
            for i, fu in enumerate(cf.as_completed(futs), 1):
                results.append(fu.result())
                if i % 100 == 0 or i == len(futs):
                    print(f"  {i}/{len(futs)}", file=sys.stderr)
    results.sort(key=lambda r: (r["file"], r["config"]))

    status, crashes, reasons = write_reports(results, args)
    write_meta(args, root, started, njobs,
               sum(1 for r in results if r.get("skipped") == "time budget"), extra)
    print(dict(status), f"crash-configs={sum(len(v) for v in crashes.values())}")
    print(f"summary: {os.path.join(args.out, 'summary.md')}")


if __name__ == "__main__":
    main()

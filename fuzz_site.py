#!/usr/bin/env python3
"""Static HTML report for isel_diff.py campaigns, styled after CTIT-results.

  python3 fuzz_site.py                 # ingest out/, rebuild site/
  python3 fuzz_site.py --label pr-1234 # tag a run (e.g. a patch)
  python3 fuzz_site.py --render-only   # only re-render from site/data

Each ingested run is stored as site/data/<run>.json; every invocation
re-renders the whole site from those files:

  index.html                    runs grouped by label, with deltas vs. the previous run
  run/<run>.html                run info, summary, filterable findings table
  run/<run>/<finding>.html      snippet, local output, Compiler Explorer link, occurrences
  compare/<old>..<new>.html     categories that appeared / disappeared / changed

Snippets are the smallest input that still reproduces the finding locally:
the single function extracted with llvm-extract (crashes: the first function
that reproduces), optionally shrunk further with llvm-reduce (--reduce).
Compiler Explorer links are only created after the snippet was compiled
remotely on every pane that goes into the link.
"""

import argparse
import collections
import concurrent.futures as cf
import datetime as dt
import difflib
import hashlib
import html
import json
import os
import re
import shlex
import shutil
import subprocess
import sys
import tempfile
import time
import urllib.error
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import exec_oracle as EO  # noqa: E402
import isel_diff as ID  # noqa: E402

ROOT = ID.llvm_src()

GODBOLT = "https://godbolt.org"
# Everything the interestingness test run by llvm-reduce needs to know.
SPEC_ARGS = ("llc", "ir_mutate", "timeout", "exec_inputs", "exec_timeout",
             "exec_budget", "exec_restarts", "exec_max_funcs", "qemu", "lld")
GISEL_FLAGS = ["-global-isel", "-global-isel-abort=2", "-pass-remarks-missed=gisel.*"]
SDAG_FLAGS = ["-global-isel=0"]


# --------------------------------------------------------------------------
# Local reproduction
# --------------------------------------------------------------------------

crash_sig = ID.crash_sig


def assertion_core(sig):
    """Part of a crash message that is stable across LLVM revisions."""
    m = re.search(r"Assertion failed: \((.*)\), function", sig)
    if m:
        return m.group(1)
    m = re.search(r"LLVM ERROR: (.*)", sig)
    return m.group(1)[:80] if m else sig[:80]


def llc(args, flags, src):
    return ID.run_llc(args.llc, flags, src, args.timeout)


def fallback_keys(stderr):
    reasons, fallbacks = {}, set()
    for l in stderr.splitlines():
        m = ID.REMARK_RE.search(l)
        if m:
            reasons.setdefault(m.group(2), m.group(1))
        m = ID.FALLBACK_RE.search(l)
        if m:
            fallbacks.add(m.group(1).strip())
    return {f: ID.reason_key(reasons.get(f, "silent fallback (no remark emitted)")) for f in fallbacks}


def check(args, spec, src):
    """Does `src` still show the finding described by `spec`? Returns details or None."""
    flags = shlex.split(spec["config"])
    kind = spec["kind"]
    if kind == "miscompile":
        fn = spec.get("function")
        # check() is also the llvm-reduce interestingness test, and the oracle
        # sanitizes the module every time, so reduction cannot pass by
        # introducing undefined behaviour.
        hits = [r for r in EO.check(args, src, flags, [fn] if fn else [])
                if not fn or r["function"] == fn]
        if not hits:
            return None
        r = hits[0]
        opts = "\n".join(f"{k}: llc {v}" for k, v in sorted(r["options"].items()))
        return {"function": r["function"],
                "output": f"{r['input_count']} of {r['of_inputs']} inputs differ "
                          f"(first: #{r['inputs'][0]})\n"
                          f"SelectionDAG hash {r['sdag']}, GlobalISel hash {r['gisel']}\n"
                          f"{opts}",
                "inputs": r["inputs"], "input_count": r["input_count"]}
    if kind == "crash":
        rc, _, err = llc(args, flags + GISEL_FLAGS, src)
        if rc == 0:
            return None
        if crash_sig(ID.first_error(err)) != spec["key"]:
            return None
        rc_s, _, _ = llc(args, flags + SDAG_FLAGS, src)
        if rc_s != 0:
            return None
        return {"output": "\n".join(l for l in err.splitlines() if l.strip())[:4000]}
    if kind == "fallback":
        rc, _, err = llc(args, flags + GISEL_FLAGS, src)
        if rc != 0:
            return None
        hits = [f for f, k in fallback_keys(err).items() if k == spec["key"]]
        if not hits:
            return None
        lines = [l for l in err.splitlines() if l.startswith(("remark:", "warning:"))]
        return {"output": "\n".join(lines)[:4000], "function": hits[0]}
    # regression
    rc_s, asm_s, _ = llc(args, flags + SDAG_FLAGS, src)
    rc_g, asm_g, _ = llc(args, flags + ["-global-isel"], src)
    if rc_s or rc_g:
        return None
    fs, fg = ID.split_functions(asm_s), ID.split_functions(asm_g)
    fn = spec["function"]
    if fn not in fs or fn not in fg:
        return None
    s, g = ID.inst_count(fs[fn]), ID.inst_count(fg[fn])
    if g <= s:
        return None
    diff = "\n".join(difflib.unified_diff(fs[fn], fg[fn], "sdag", "gisel", lineterm="", n=3))
    return {"output": diff, "sdag": s, "gisel": g}


def extract(args, src, func):
    try:
        p = subprocess.run([args.llvm_extract, f"--func={func}", "-S", "-o", "-", "-"],
                           input=src, capture_output=True, text=True, timeout=args.timeout)
    except subprocess.TimeoutExpired:
        return None
    return p.stdout if p.returncode == 0 else None


def defined_functions(src):
    """(name, body length) for every definition, smallest first."""
    out = []
    for m in re.finditer(r"^define [^@]*@(\"[^\"]+\"|[\w.$-]+)\(", src, re.M):
        end = src.find("\n}", m.end())
        out.append((m.group(1).strip('"'), (end if end > 0 else len(src)) - m.start()))
    return sorted(out, key=lambda x: x[1])


def tidy(src):
    """Drop the noise llvm-extract leaves behind; keeps attributes and metadata."""
    lines = [l for l in src.splitlines() if not l.startswith(("; ModuleID", "source_filename"))]
    return "\n".join(lines).strip() + "\n"


def reduce(args, spec, src):
    with tempfile.TemporaryDirectory(prefix="fuzz-site-") as d:
        inp, out, sp = (os.path.join(d, n) for n in ("in.ll", "out.ll", "spec.json"))
        with open(inp, "w") as f:
            f.write(src)
        with open(sp, "w") as f:
            extra = {k: getattr(args, k) for k in SPEC_ARGS}
            # Each interestingness run compiles and executes three binaries;
            # keep that cheap so llvm-reduce gets through many of them.
            extra["exec_budget"] = min(args.exec_budget, 10)
            json.dump(dict(spec, **extra), f)
        cmd = [args.llvm_reduce, f"--test={sys.executable}",
               f"--test-arg={os.path.abspath(__file__)}", "--test-arg=--check",
               f"--test-arg={sp}", "-o", out, inp]
        try:
            subprocess.run(cmd, capture_output=True, timeout=args.reduce_timeout, cwd=d)
        except subprocess.TimeoutExpired:
            pass
        if os.path.exists(out):
            with open(out) as f:
                return f.read()
    return None


def read_input(occ):
    with open(occ["file"]) as f:
        return ID.apply_seds(f.read(), [tuple(s) for s in occ.get("seds", [])])


def make_snippet(args, finding):
    """Smallest locally verified reproducer among a few candidate occurrences."""
    best = None
    seen_files = set()
    cands = []
    # Original tests first when there are any: they are linkable and citable.
    for o in sorted(finding["occurrences"], key=lambda o: (bool(o.get("mutant_of")), _size(o["file"]))):
        if o["file"] in seen_files or not os.path.exists(o["file"]):
            continue
        seen_files.add(o["file"])
        cands.append(o)
        if len(cands) == args.candidates:
            break

    for occ in cands:
        spec = {"kind": finding["kind"], "key": finding["key"], "config": occ["config"],
                "function": occ.get("function")}
        full = read_input(occ)
        tries = []
        if occ.get("function"):
            tries.append(occ["function"])
        elif finding["kind"] == "crash":
            tries += [n for n, _ in defined_functions(full)[: args.crash_tries]]
        got = None
        for fn in tries:
            ex = extract(args, full, fn)
            if ex is None:
                continue
            ex = tidy(ex)
            res = check(args, dict(spec, function=fn), ex)
            if res:
                got = (ex, fn, "llvm-extract", res)
                break
        if got is None:
            res = check(args, spec, full)
            if res:
                got = (full, occ.get("function"), "full input", res)
        if got and best is not None and best.get("mutant_of") is None and occ.get("mutant_of"):
            got = None
        if got and (best is None or len(got[0]) < len(best["source"])
                    or (best.get("mutant_of") and not occ.get("mutant_of"))):
            src, fn, how, res = got
            best = {"source": src, "function": res.get("function", fn), "how": how,
                    "config": occ["config"], "origin": occ["file"],
                    "mutant_of": occ.get("mutant_of"), "local": res}
    return best


def reduce_snippet(args, finding):
    best = finding["snippet"]
    if not best or finding["kind"] not in ("crash", "fallback", "miscompile"):
        return
    spec = {"kind": finding["kind"], "key": finding["key"], "config": best["config"],
            "function": best["function"]}
    red = reduce(args, spec, best["source"])
    if red and len(red) < len(best["source"]):
        red = tidy(red)
        res = check(args, spec, red)
        if res:
            best.update(source=red, how=best["how"] + " + llvm-reduce", local=res,
                        function=res.get("function", best["function"]))


def _size(path):
    try:
        return os.path.getsize(path)
    except OSError:
        return 1 << 40


# --------------------------------------------------------------------------
# Compiler Explorer
# --------------------------------------------------------------------------

def ce_request(path, payload=None):
    data = None if payload is None else json.dumps(payload).encode()
    req = urllib.request.Request(GODBOLT + path, data=data, headers={
        "Accept": "application/json", "Content-Type": "application/json"})
    with urllib.request.urlopen(req, timeout=45) as r:
        return json.load(r)


def remote_insts(asm):
    n = 0
    for l in asm:
        t = l.get("text", "")
        if not t[:1].isspace():
            continue
        t = t.split("#", 1)[0].strip()
        if t and not t.startswith("."):
            n += 1
    return n


def panes_for(finding, snip):
    cfg = snip["config"]
    if finding["kind"] == "regression":
        return [{"role": "GlobalISel", "options": cfg + " -global-isel"},
                {"role": "SelectionDAG", "options": cfg + " -global-isel=0"}]
    return [{"role": "GlobalISel", "options": " ".join([cfg] + GISEL_FLAGS)},
            {"role": "SelectionDAG (control)", "options": cfg + " -global-isel=0"}]


def remote_verdict(finding, snip, results):
    g, s = results[0], results[1]
    if s["code"] != 0:
        return "control fails"
    if finding["kind"] == "crash":
        core = assertion_core(finding["key"])
        if g["code"] != 0 and core in g["stderr"]:
            return "reproduces"
        return "crashes differently" if g["code"] != 0 else "no crash on trunk"
    if finding["kind"] == "fallback":
        if g["code"] != 0:
            return "crashes on trunk"
        keys = set(fallback_keys(g["stderr"]).values())
        if finding["key"] in keys:
            return "reproduces"
        return "falls back differently" if keys else "no fallback on trunk"
    if g["code"] != 0:
        return "crashes on trunk"
    return "reproduces" if g["insts"] > s["insts"] else "no regression on trunk"


def godbolt(args, finding, snip, cache):
    panes = panes_for(finding, snip)
    key = hashlib.sha256(json.dumps([args.compiler, snip["source"], panes]).encode()).hexdigest()
    if key in cache:
        return cache[key]
    results = []
    for p in panes:
        r = ce_request(f"/api/compiler/{args.compiler}/compile", {
            "source": snip["source"], "lang": "llvm",
            "options": {"userArguments": p["options"], "filters": {}}})
        stderr = "\n".join(l.get("text", "") for l in r.get("stderr", []))
        results.append({"role": p["role"], "options": p["options"], "code": r.get("code"),
                        "stderr": stderr[:4000], "insts": remote_insts(r.get("asm", []))})
        time.sleep(args.godbolt_delay)
    verified = [{"id": args.compiler, "options": p["options"]} for p in panes]
    config = {"sessions": [{
        "id": 1, "language": "llvm", "source": snip["source"],
        "compilers": [{"_internalid": i, "id": c["id"], "options": c["options"], "filters": {},
                       "libs": [], "specialoutputs": [], "tools": [], "overrides": []}
                      for i, c in enumerate(verified, start=1)],
        "executors": []}], "trees": []}
    url = ce_request("/api/shortener", config)["url"]
    rt = ce_request("/api/shortlinkinfo/" + url.rstrip("/").rsplit("/", 1)[1])
    sess = rt["sessions"][0]
    assert sess["source"] == snip["source"] and sess["language"] == "llvm"
    assert [(c["id"], c["options"]) for c in sess["compilers"]] == \
        [(c["id"], c["options"]) for c in verified]
    entry = {"url": url, "compiler": args.compiler, "panes": results,
             "verdict": remote_verdict(finding, snip, results),
             "checked": dt.datetime.now(dt.timezone.utc).strftime("%Y-%m-%d %H:%M UTC")}
    cache[key] = entry
    return entry


# --------------------------------------------------------------------------
# Findings
# --------------------------------------------------------------------------

def slug(*parts):
    s = re.sub(r"[^A-Za-z0-9]+", "-", " ".join(parts)).strip("-").lower()[:60]
    return f"{s}-{hashlib.sha1('|'.join(parts).encode()).hexdigest()[:8]}"


def collect_findings(report, top_regressions):
    crashes = collections.defaultdict(list)
    fallbacks = collections.defaultdict(list)
    miscompiles = collections.defaultdict(list)
    regs = {}
    status = collections.Counter()
    # Mutants the explore pass counted without keeping (see explore.py).
    counted_only = collections.Counter()
    dropped = 0
    skipped = 0
    for r in report:
        base = {"file": r["file"], "config": r["config"], "seds": r.get("seds", []),
                "mutant_of": r.get("mutant_of")}
        if r.get("dropped"):
            dropped += r["results"]
            status.update(r["status"])
            for key, n in r["reasons"].items():
                counted_only[("fallback", key)] += n
            for key, n in r["crashes"].items():
                counted_only[("crash", key)] += n
            continue
        if "skipped" in r:
            skipped += 1
            continue
        if "crash" in r:
            status["crash"] += 1
            crashes[crash_sig(r["crash"])].append(base)
            continue
        for mc in r.get("miscompiles", []):
            status["miscompile"] += 1
            miscompiles[mc["key"]].append(dict(
                base, function=mc["function"], inputs=mc["inputs"],
                input_count=mc["input_count"], of_inputs=mc["of_inputs"]))
        for fn in r["functions"]:
            status[fn["status"]] += 1
            if fn["status"] == "fallback":
                fallbacks[fn["reason_key"]].append(dict(base, function=fn["name"], reason=fn["reason"]))
            elif fn["status"] == "gisel-worse":
                d = fn["gisel"] - fn["sdag"]
                k = (r.get("mutant_of") or r["file"], fn["name"])
                if k not in regs or d > regs[k]["delta"]:
                    regs[k] = dict(base, function=fn["name"], delta=d, sdag=fn["sdag"], gisel=fn["gisel"])

    findings = []
    groups_by_kind = (("miscompile", miscompiles), ("crash", crashes), ("fallback", fallbacks))
    for kind, groups in groups_by_kind:
        for key, occ in groups.items():
            extra = counted_only.pop((kind, key), 0)
            findings.append({
                "id": slug(kind, key), "kind": kind, "key": key,
                "count": len(occ) + extra, "counted_only": extra,
                "configs": len({o["config"] for o in occ}),
                "files": len({o.get("mutant_of") or o["file"] for o in occ}),
                "new": all(o["mutant_of"] for o in occ), "occurrences": occ})
    # Categories that only turned up in results the explore pass did not keep.
    for (kind, key), n in counted_only.items():
        findings.append({
            "id": slug(kind, key), "kind": kind, "key": key, "count": n,
            "counted_only": n, "configs": 0, "files": 0, "new": True, "occurrences": []})
    for occ in sorted(regs.values(), key=lambda o: -o["delta"])[:top_regressions]:
        name = os.path.basename(occ.get("mutant_of") or occ["file"])
        key = f"+{occ['delta']} insts: {occ['function']} ({name})"
        findings.append({
            "id": slug("regression", name, occ["function"]), "kind": "regression", "key": key,
            "count": occ["delta"], "configs": 1, "files": 1, "new": bool(occ["mutant_of"]),
            "occurrences": [occ]})
    order = {"miscompile": 0, "crash": 1, "fallback": 2, "regression": 3}
    findings.sort(key=lambda f: (order[f["kind"]], not f["new"] if f["kind"] == "fallback" else 0,
                                 -f["count"]))
    return findings, status, skipped, dropped


def category_key(kind, key):
    """Identity of a category across runs. Fallback keys are normalized so that
    runs made before normalization still compare."""
    return f"{kind}|{ID.normalize_key(key) if kind == 'fallback' else key}"


def seen_categories(site, exclude=()):
    """Every category any earlier run on the site has already reported."""
    keys = set()
    ddir = os.path.join(site, "data")
    for n in sorted(os.listdir(ddir)) if os.path.isdir(ddir) else []:
        if not n.endswith(".json"):
            continue
        with open(os.path.join(ddir, n)) as f:
            run = json.load(f)
        if run["id"] in exclude:
            continue
        for f_ in run["findings"]:
            if f_["kind"] != "regression":
                keys.add(category_key(f_["kind"], f_["key"]))
    return keys


def ingest(args):
    with open(os.path.join(args.results, "report.json")) as f:
        report = json.load(f)
    with open(os.path.join(args.results, "meta.json")) as f:
        meta = json.load(f)
    findings, status, skipped, dropped = collect_findings(report, args.top_regressions)
    seen = seen_categories(args.site)
    for f in findings:
        # "new" has always meant "only mutants reach this"; first_seen is the
        # stronger statement: no run on this site ever reported it.
        f["first_seen"] = f["kind"] != "regression" \
            and category_key(f["kind"], f["key"]) not in seen
    # The recursive test tree yields thousands of categories per run, and the
    # whole site is republished daily; only the most interesting findings get a
    # snippet and a page of their own.
    detail = findings[: args.detail_limit]
    for f in findings[args.detail_limit:]:
        f["no_detail"] = True
    print(f"{len(findings)} findings; building snippets for {len(detail)}", file=sys.stderr)

    with cf.ThreadPoolExecutor(args.jobs) as ex:
        snippets = list(ex.map(lambda f: make_snippet(args, f), detail))
    for f in findings:
        f["snippet"] = None
    for f, s in zip(detail, snippets):
        f["snippet"] = s
    if args.reduce:
        # Only the findings that will get a Compiler Explorer link: reduction is slow.
        todo = [f for f in detail if f["snippet"]][: args.godbolt_limit]
        print(f"reducing {len(todo)} snippets", file=sys.stderr)
        with cf.ThreadPoolExecutor(args.jobs) as ex:
            list(ex.map(lambda f: reduce_snippet(args, f), todo))

    cache_path = os.path.join(args.site, "godbolt-cache.json")
    cache = json.load(open(cache_path)) if os.path.exists(cache_path) else {}
    uploaded = 0
    if args.godbolt:
        for f in findings:
            # Compiler Explorer compiles but cannot execute RISC-V, so a
            # miscompile has nothing to verify remotely.
            if not f["snippet"] or f["kind"] == "miscompile" or uploaded >= args.godbolt_limit:
                continue
            try:
                f["godbolt"] = godbolt(args, f, f["snippet"], cache)
                uploaded += 1
                print(f"  godbolt {f['godbolt']['verdict']:>22}  {f['key'][:70]}", file=sys.stderr)
            except (urllib.error.URLError, AssertionError, KeyError, TimeoutError) as e:
                f["godbolt_error"] = f"{type(e).__name__}: {e}"[:300]
        with open(cache_path, "w") as fh:
            json.dump(cache, fh, indent=1)

    for f in findings:
        f["occurrence_total"] = len(f["occurrences"])
        keep = 0 if f.get("no_detail") else args.max_occurrences
        f["occurrences"] = [{k: v for k, v in o.items() if k != "seds"}
                            for o in f["occurrences"][:keep]]

    started = dt.datetime.fromtimestamp(meta["started"], dt.timezone.utc)
    run_id = f"{args.label}-{meta['revision'][:10]}-{started.strftime('%Y%m%d-%H%M%S')}"
    run = {"id": run_id, "label": args.label, "meta": meta, "status": dict(status),
           "skipped": skipped, "dropped": dropped, "findings": findings,
           "compiler": args.compiler}
    os.makedirs(os.path.join(args.site, "data"), exist_ok=True)
    with open(os.path.join(args.site, "data", run_id + ".json"), "w") as f:
        json.dump(run, f)
    return run_id


def archive_run(run):
    """Drop per-finding detail so old runs cost little space on the site."""
    for f in run["findings"]:
        f["occurrences"] = []
        sn = f.get("snippet")
        if sn:
            f["snippet"] = {"how": sn["how"], "lines": sn.get("lines", sn.get("source", "").count("\n"))}
        g = f.get("godbolt")
        if g:
            f["godbolt"] = {k: g[k] for k in ("url", "verdict", "compiler", "checked") if k in g}
    run["archived"] = True


def prune(site, keep_full):
    runs = collections.defaultdict(list)
    ddir = os.path.join(site, "data")
    for n in os.listdir(ddir):
        if n.endswith(".json"):
            with open(os.path.join(ddir, n)) as f:
                r = json.load(f)
            runs[r["label"]].append((r["meta"]["started"], n, r))
    for rs in runs.values():
        rs.sort(key=lambda x: x[0], reverse=True)
        for _, n, r in rs[keep_full:]:
            if not r.get("archived"):
                archive_run(r)
                with open(os.path.join(ddir, n), "w") as f:
                    json.dump(r, f)
                print(f"archived {r['id']}", file=sys.stderr)


# --------------------------------------------------------------------------
# Rendering
# --------------------------------------------------------------------------


def finding_link(run, f, prefix=""):
    if run.get("archived") or f.get("no_detail"):
        return E(f["key"])
    return f'<a href="{prefix}{run["id"]}/{f["id"]}.html">{E(f["key"])}</a>'

CSS = """\
* { font-family: monospace; }
table { border-spacing: .5em .1em; margin: 0 0 0 -.5em; }
.wide { overflow-x: auto; }
th { text-align: right; white-space: nowrap; vertical-align: bottom; }
td { text-align: right; white-space: nowrap; vertical-align: top; }
th.l, td.l { text-align: left; }
th.d, td.d { text-align: left; }
td.msg { text-align: left; white-space: normal; }
td.err { word-break: break-all; max-width: 50em; }
p { max-width: 40em; }
pre { margin-left: 2em; white-space: pre-wrap; }
pre.code { white-space: pre; overflow-x: auto; background: #f6f6f6; padding: .5em; max-width: 100em; }
.bad { font-weight: bold; background-color: rgba(255, 0, 0, 0.3); }
.up { color: #b00000; }
.down { color: #007000; }
.fp { color: #b00000; font-weight: bold; }
.tp { color: #007000; }
.dim { color: #777777; }
.new { color: #b00000; font-weight: bold; }
.add { color: #007000; }
.del { color: #b00000; }
"""

FILTER_JS = """\
(() => {
  const input = document.getElementById("filter");
  const apply = () => {
    const query = input.value.trim().toLowerCase();
    let shown = 0;
    for (const group of document.querySelectorAll(".group")) {
      group.hidden = query !== "" && !group.dataset.key.includes(query);
      if (!group.hidden) shown++;
    }
    const none = document.getElementById("nomatch");
    if (none) none.hidden = shown !== 0;
  };
  input.value = new URLSearchParams(location.search).get("q") || "";
  input.addEventListener("input", apply);
  apply();
})();
"""

E = html.escape
STATUS_COLS = [("identical", "identical", False), ("different", "different", None),
               ("gisel-better", "better", False), ("gisel-worse", "worse", True),
               ("fallback", "fallback", True), ("crash", "crash", True),
               ("miscompile", "miscompile", True)]
# Statuses that have rows in the findings table; the rest only appear in the run summary.
STATUS_QUERY = {"gisel-worse": "regression", "fallback": "fallback", "crash": "crash",
                "miscompile": "miscompile"}


def page(title, depth, body, footer):
    up = "../" * depth
    return (f"<!DOCTYPE html>\n<meta charset=\"utf-8\" />\n"
            f"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\n"
            f"<title>{E(title)}</title>\n<link rel=\"stylesheet\" href=\"{up}style.css\" />\n"
            f"<nav>\n<a href=\"{up}index.html\">Index</a> |\n<a href=\"{up}about.html\">About</a>\n</nav>\n"
            f"<hr />\n{body}\n<hr />\n<p class=\"dim\">{footer}</p>\n")


def dur(sec):
    sec = int(sec)
    h, m, s = sec // 3600, sec % 3600 // 60, sec % 60
    return f"{h}h{m:02d}m" if h else f"{m}m{s:02d}s"


def when(ts):
    return dt.datetime.fromtimestamp(ts, dt.timezone.utc)


def delta(cur, prev, bad_up):
    if prev is None:
        return ""
    d = cur - prev
    cls = "" if d == 0 or bad_up is None else ("up" if (d > 0) == bad_up else "down")
    return f'<span class="{cls}">({d:+d})</span>' if cls else f"({d:+d})"


def rev_link(meta):
    r = meta["revision"]
    dirty = " + local changes" if meta.get("dirty_llvm") else ""
    return f'<a href="https://github.com/llvm/llvm-project/commit/{r}">{r}</a>{dirty}'


def test_link(meta, path):
    rel = os.path.relpath(path, ROOT)
    if rel.startswith("llvm/test/"):
        return f'<a href="https://github.com/llvm/llvm-project/blob/{meta["revision"]}/{E(rel)}">{E(os.path.basename(path))}</a>'
    return E(os.path.basename(path))


def occ_label(meta, o):
    if o.get("mutant_of"):
        return f'{E(os.path.basename(o["file"]))} <span class="dim">(mutant of</span> {test_link(meta, o["mutant_of"])}<span class="dim">)</span>'
    return test_link(meta, o["file"])


def verdict_span(f):
    g = f.get("godbolt")
    if not g:
        if f["kind"] == "miscompile":
            return '<span class="dim" title="Compiler Explorer cannot execute RISC-V">n/a</span>'
        if f.get("godbolt_error"):
            return '<span class="fp" title="{}">error</span>'.format(E(f["godbolt_error"]))
        return '<span class="dim">-</span>'
    cls = "tp" if g["verdict"] == "reproduces" else "fp"
    return f'<a href="{E(g["url"])}">G</a> <span class="{cls}">{E(g["verdict"])}</span>'


def counts(run):
    st = dict(run["status"])
    kinds = collections.Counter(f["kind"] for f in run["findings"])
    new = sum(1 for f in run["findings"] if f.get("first_seen"))
    repro = sum(1 for f in run["findings"] if f.get("godbolt", {}).get("verdict") == "reproduces")
    return st, kinds, new, repro


def mutant_only(run):
    return sum(1 for f in run["findings"] if f["new"] and f["kind"] != "regression")


def tags(f):
    """NEW (never seen on this site) and M (only mutants reach it)."""
    out = []
    if f.get("first_seen"):
        out.append('<span class="new" title="never reported by any earlier run">NEW</span>')
    if f["new"] and f["kind"] != "regression":
        out.append('<span class="dim" title="only mutants reach this category">M</span>')
    return " ".join(out)


def render_index(runs, site):
    by_label = collections.defaultdict(list)
    for r in runs:
        by_label[r["label"]].append(r)
    main_runs = sorted(by_label.get("main", []), key=lambda r: r["meta"]["started"])
    rows = []
    hdr = ("<tr><th></th><th></th><th class=\"l\">Date</th><th class=\"l\">Revision</th><th>Time</th><th>Configs</th>"
           + "".join(f"<th>{E(n)}</th><th class=\"d\"></th>" for _, n, _ in STATUS_COLS)
           + "<th>Categories</th><th class=\"d\"></th><th>NEW</th><th>Godbolt</th></tr>")
    ncol = 8 + 2 * len(STATUS_COLS) + 2
    for label in sorted(by_label, key=lambda l: (l != "main", l)):
        rs = sorted(by_label[label], key=lambda r: r["meta"]["started"], reverse=True)
        rows.append(f'<tbody class="group" data-key="{E(label.lower())} {" ".join(r["meta"]["revision"][:10] for r in rs)}">')
        rows.append(f'<tr><td class="l" colspan="{ncol}"><h4>{E(label)}:</h4></td></tr>')
        rows.append(hdr)
        for i, r in enumerate(rs):
            prev = rs[i + 1] if i + 1 < len(rs) else None
            st, kinds, new, repro = counts(r)
            pst = counts(prev)[0] if prev else None
            m = r["meta"]
            c = f'<a href="compare/{prev["id"]}..{r["id"]}.html">C</a>' if prev else ""
            base = [b for b in main_runs if b["meta"]["started"] <= m["started"]]
            b = (f'<a href="compare/{base[-1]["id"]}..{r["id"]}.html">B</a>'
                 if label != "main" and base else "")
            started = when(m["started"])
            cells = [f"<td>{c}</td><td>{b}</td>",
                     f'<td class="l"><a href="run/{r["id"]}.html" title="Run {E(r["id"])}, started {started:%Y-%m-%d %H:%M} UTC">{started:%Y-%m-%d}</a></td>',
                     f'<td class="l">{E(m["revision"][:10])}{"*" if m.get("dirty_llvm") else ""}</td>',
                     f'<td>{dur(m["finished"] - m["started"])}</td><td>{m["jobs"]}</td>']
            for k, _, bad_up in STATUS_COLS:
                v = st.get(k, 0)
                cls = ' class="bad"' if k == "crash" and v else ""
                q = f'?q={STATUS_QUERY[k]}' if k in STATUS_QUERY else "#summary"
                cells.append(f'<td{cls}><a href="run/{r["id"]}.html{q}">{v}</a></td>'
                             f'<td class="d">{delta(v, pst.get(k, 0), bad_up) if pst else ""}</td>')
            ncat = kinds["crash"] + kinds["fallback"] + kinds["miscompile"]
            pcat = (lambda k: k["crash"] + k["fallback"] + k["miscompile"])(counts(prev)[1]) if prev else None
            cells.append(f"<td>{ncat}</td><td class=\"d\">{delta(ncat, pcat, True)}</td>"
                         f"<td>{new}</td><td>{repro}</td>")
            rows.append("<tr>" + "".join(cells) + "</tr>")
        rows.append("</tbody>")
    body = ("<form onsubmit=\"return false\">\n<label>Filter: <input id=\"filter\" placeholder=\"label or revision\" /></label>\n</form>\n<hr />\n"
            "Each row is one isel_diff.py campaign: every RISC-V CodeGen RUN line (plus mutants) compiled with\n"
            "SelectionDAG and GlobalISel. Counts are functions; \"crash\" counts configurations.\n"
            "Click \"C\" to compare a run with the previous run of the same label, \"B\" to compare with the\n"
            "latest main run. \"Godbolt\" counts findings that reproduce on Compiler Explorer trunk.\n"
            "<p><b>main</b> uses the same mutation seeds every day, so its deltas come from LLVM changes.\n"
            "<b>explore</b> runs until its time budget is spent, with new seeds, varying mutation counts\n"
            "and mutated llc flags; its \"B\" link lists what it found beyond main, and its own deltas\n"
            "are partly chance. \"NEW\" counts categories that no earlier run on this site reported.</p>\n"
            f"<div class=\"wide\">\n<table>\n{''.join(rows)}\n</table>\n</div>\n"
            "<p id=\"nomatch\" class=\"dim\" hidden>No runs match the filter.</p>\n"
            "<script src=\"filter.js\"></script>")
    return page("RISC-V ISel Diff Results", 0, body, f"Generated {now()}.")


def now():
    return dt.datetime.now(dt.timezone.utc).strftime("%Y-%m-%d %H:%M UTC")


def kv(rows):
    return "<table>\n" + "\n".join(f'<tr><td class="l">{k}:</td><td class="l">{v}</td></tr>' for k, v in rows) + "\n</table>"


def run_inputs(m):
    parts = [E(", ".join(os.path.relpath(p, ROOT) if os.path.isabs(p) else p for p in m["inputs"]))]
    if m.get("filter"):
        parts.append(f"filter <code>{E(m['filter'])}</code>")
    if m.get("config"):
        parts.append("configs " + E("; ".join(m["config"])))
    return ", ".join(parts)


def mutation_info(m):
    if m.get("explore"):
        parts = [f"explore: seeds from {m.get('explore_seed')}, 1-{m.get('max_mutations', 8)} "
                 f"mutations per mutant, llc flags mutated",
                 f"{m.get('kept', 0)} results kept, {m.get('dropped', 0)} counted only",
                 f"{m.get('new_category_count', 0)} categories the run's history did not have"]
        if m.get("corpus_in") or m.get("corpus_out"):
            parts.append(f"corpus {m.get('corpus_in', 0)} in, {m.get('corpus_out', 0)} saved")
        return "; ".join(parts)
    if m.get("mutate"):
        return (f"{m['mutate']} mutants per config, {m['mutations']} mutations each, "
                f"seeds from {m['mutate_seed']}")
    return '<span class="dim">none</span>'


def exec_info(m):
    if not m.get("exec"):
        return '<span class="dim">off</span>'
    where = "input tests only" if m.get("exec_originals_only") else \
        f"{100 * m.get('exec_rate', 1):.0f}% of mutants"
    return f"qemu, {m.get('exec_inputs')} inputs per function, {where}"


def render_run(run):
    m = run["meta"]
    st, kinds, new, repro = counts(run)
    total = sum(v for k, v in st.items() if k != "crash") or 1
    info = kv([
        ("Label", E(run["label"])),
        ("LLVM revision", rev_link(m)),
        ("llc", E(m.get("llc_version") or m["llc"])),
        ("Inputs", run_inputs(m)),
        ("Mutation", mutation_info(m)),
        ("Execution oracle", exec_info(m)),
        ("Started", f"{when(m['started']):%Y-%m-%d %H:%M} UTC"),
        ("Finished", f"{when(m['finished']):%Y-%m-%d %H:%M} UTC"),
        ("Duration", dur(m["finished"] - m["started"])),
        ("Configurations", f"{m['jobs']} ({run['skipped'] or sum(m.get('skipped_reasons', {}).values())}"
                           " skipped: SDAG failed or mutator gave up"
                           + (f", {m['budget_skipped']} mutants over the {m['time_budget']:g} min time budget"
                              if m.get("budget_skipped") else "") + ")"),
        ("Compiler Explorer", f"{E(run['compiler'])} ({repro} of {sum(1 for f in run['findings'] if f.get('godbolt'))} checked findings reproduce)"),
    ])
    summ = ["<table>", "<tr><th class=\"l\">Status</th><th>Functions</th><th>%</th></tr>"]
    for k, n, _ in STATUS_COLS:
        v = st.get(k, 0)
        pct = "" if k == "crash" else f"{100 * v / total:.1f}"
        unit = " configs" if k == "crash" else ""
        summ.append(f'<tr><td class="l">{E(k)}</td><td>{v}{unit}</td><td>{pct}</td></tr>')
    summ.append(f'<tr><td class="l">categories</td><td>{kinds["miscompile"]} miscompile, '
                f'{kinds["crash"]} crash, {kinds["fallback"]} fallback</td><td></td></tr>')
    summ.append(f'<tr><td class="l">NEW (never seen before)</td><td>{new}</td><td></td></tr>')
    summ.append(f'<tr><td class="l">M (mutants only)</td><td>{mutant_only(run)}</td><td></td></tr>')
    if run.get("dropped"):
        summ.append(f'<tr><td class="l">counted only</td><td>{run["dropped"]} mutants</td><td></td></tr>')
    summ.append("</table>")

    rows = ["<tr><th class=\"l\">Kind</th><th class=\"l\"></th><th>Count</th><th>Configs</th><th>Files</th>"
            "<th class=\"l\">Category</th><th class=\"l\">Snippet</th><th class=\"l\">Compiler Explorer</th></tr>"]
    for f in run["findings"]:
        k = f["kind"]
        key = (f'{k} {f["key"]} {"new" if f.get("first_seen") else ""} '
               f'{"mutant-only" if f["new"] else ""} '
               f'{f.get("godbolt", {}).get("verdict", "")}').lower()
        kind = f'<span class="fp">{k}</span>' if k in ("crash", "miscompile") else E(k)
        newc = tags(f)
        sn = f["snippet"]
        nlines = sn.get("lines", sn.get("source", "").count("\n")) if sn else 0
        snip = (f'{E(sn["how"])} ({nlines} lines)' if sn else
                '<span class="dim">no detail</span>' if f.get("no_detail") else
                '<span class="dim">not reproduced</span>')
        cnt = f"+{f['count']}" if k == "regression" else str(f["count"])
        if f.get("counted_only"):
            cnt = f'<span title="{f["counted_only"]} of these were counted without being kept">{cnt}*</span>'
        rows.append(f'<tr class="group" data-key="{E(key)}"><td class="l">{kind}</td><td class="l">{newc}</td>'
                    f'<td>{cnt}</td><td>{f["configs"]}</td><td>{f["files"]}</td>'
                    f'<td class="msg">{finding_link(run, f)}</td>'
                    f'<td class="l">{snip}</td><td class="l">{verdict_span(f)}</td></tr>')
    body = (f"<h3>Run {E(run['id'])}:</h3>\n{info}\n<h4 id=\"summary\">Summary:</h4>\n{''.join(summ)}\n"
            f"<h4>Findings ({len(run['findings'])}):</h4>\n"
            "<form onsubmit=\"return false\">\n<label>Filter: <input id=\"filter\" placeholder=\"kind, opcode, type, new, reproduces\" /></label>\n</form>\n"
            "<p>Miscompiles are clustered by the instructions the two selectors disagree on;\n"
            "crashes by assertion; fallbacks by GlobalISel remark (opcode + types);\n"
            "regressions are the functions where GlobalISel emits the most extra instructions.\n"
            "<b>NEW</b> marks categories no earlier run reported, <b>M</b> categories that only\n"
            "mutants reach. A count with <code>*</code> includes mutants that were counted without\n"
            "being kept.</p>\n"
            + ('<p class="dim">This run is archived: snippets and occurrences were dropped.</p>\n'
               if run.get("archived") else
               '<p class="dim">Findings below the snippet cutoff are listed without a page of their own.</p>\n'
               if any(f.get("no_detail") for f in run["findings"]) else "")
            +
            f"<div class=\"wide\">\n<table>\n{''.join(rows)}\n</table>\n</div>\n"
            "<p id=\"nomatch\" class=\"dim\" hidden>No findings match the filter. The findings table lists crash,\n"
            "fallback and regression categories; identical/different/better counts are only in the summary.</p>\n"
            "<script src=\"../filter.js\"></script>")
    return page(f"Run {run['id']}", 1, body, f"Generated {now()}.")


def render_finding(run, f):
    m = run["meta"]
    sn = f["snippet"]
    rows = [("Run", f'<a href="../{run["id"]}.html">{E(run["id"])}</a>'),
            ("Kind", E(f["kind"])),
            ("Category", E(f["key"]) + " " + tags(f)),
            ("Occurrences", f"{f['occurrence_total'] if f['kind'] != 'regression' else 1} "
                            f"in {f['configs']} configs, {f['files']} test files"
                            + (f", {f['counted_only']} more counted only"
                               if f.get("counted_only") else ""))]
    parts = []
    if sn:
        src_file = occ_label(m, {"file": sn["origin"], "mutant_of": sn.get("mutant_of")})
        gflags = ["-global-isel"] if f["kind"] == "regression" else GISEL_FLAGS
        if f["kind"] == "miscompile":
            llc_cmd = (f"./exec_oracle.py --flags '{sn['config']}'"
                       + (f" --funcs {sn['function']}" if sn.get("function") else "")
                       + " snippet.ll")
        else:
            llc_cmd = (f"llc {sn['config']} {' '.join(gflags)} snippet.ll -o -\n"
                       f"llc {sn['config']} {' '.join(SDAG_FLAGS)} snippet.ll -o -")
        rows += [("Snippet from", f'{src_file}{" @" + E(sn["function"]) if sn.get("function") else ""} via {E(sn["how"])}'),
                 ("Config", f'<code>{E(sn["config"])}</code>'),
                 ("Local check", f'<span class="tp">reproduces</span> at {E(m["revision"][:10])}')]
        g = f.get("godbolt")
        if g:
            rows.append(("Compiler Explorer", f'<a href="{E(g["url"])}">{E(g["url"])}</a> '
                                              f'({E(g["compiler"])}, checked {E(g["checked"])}): {verdict_span(f)}'))
        elif f["kind"] == "miscompile":
            rows.append(("Compiler Explorer",
                         '<span class="dim">not applicable: Compiler Explorer compiles RISC-V '
                         'but cannot run it</span>'))
        elif f.get("godbolt_error"):
            rows.append(("Compiler Explorer", f'<span class="fp">{E(f["godbolt_error"])}</span>'))
        else:
            rows.append(("Compiler Explorer", '<span class="dim">not uploaded (over --godbolt-limit or disabled)</span>'))
        parts.append(f"<h4>Snippet:</h4>\n<pre class=\"code\">{E(sn['source'])}</pre>")
        parts.append(f"<h4>Reproduce:</h4>\n<pre>{E(llc_cmd)}</pre>")
        title = "Assembly diff (SelectionDAG vs GlobalISel):" if f["kind"] == "regression" else \
            "Local execution result:" if f["kind"] == "miscompile" else "Local llc output:"
        parts.append(f"<h4>{title}</h4>\n<pre class=\"code\">{diff_html(sn['local']['output']) if f['kind'] == 'regression' else E(sn['local']['output'])}</pre>")
        if g:
            pr = ["<table>", "<tr><th class=\"l\">Pane</th><th class=\"l\">Options</th><th>Exit</th><th>Insts</th><th class=\"l\">stderr</th></tr>"]
            for p in g["panes"]:
                first = "<br>".join(E(l) for l in p["stderr"].splitlines()[:3]) or '<span class="dim">-</span>'
                pr.append(f'<tr><td class="l">{E(p["role"])}</td><td class="l"><code>{E(p["options"])}</code></td>'
                          f'<td>{p["code"]}</td><td>{p["insts"]}</td><td class="msg err">{first}</td></tr>')
            pr.append("</table>")
            parts.insert(1, "<h4>Compiler Explorer panes:</h4>\n" + "".join(pr))
    else:
        rows.append(("Snippet", '<span class="dim">no candidate reproduced locally (the finding may depend on the whole module or on mutator output that was not kept)</span>'))
    occ = ["<table>", "<tr><th class=\"l\">Input</th><th class=\"l\">Function</th><th class=\"l\">Config</th></tr>"]
    for o in f["occurrences"]:
        occ.append(f'<tr><td class="l">{occ_label(m, o)}</td><td class="l">{E(o.get("function") or "")}</td>'
                   f'<td class="l"><code>{E(o["config"])}</code></td></tr>')
    occ.append("</table>")
    more = f" (first {len(f['occurrences'])})" if f["occurrence_total"] > len(f["occurrences"]) else ""
    body = (f"<h3>{E(f['kind'])}: {E(f['key'])}</h3>\n{kv(rows)}\n" + "\n".join(parts)
            + f"\n<h4>Occurrences ({f['occurrence_total']}){more}:</h4>\n" + "".join(occ))
    return page(f"{f['kind']}: {f['key']}", 2, body, f"Generated {now()}.")


def diff_html(diff):
    out = []
    for l in diff.splitlines():
        cls = "add" if l.startswith("+") and not l.startswith("+++") else \
              "del" if l.startswith("-") and not l.startswith("---") else ""
        out.append(f'<span class="{cls}">{E(l)}</span>' if cls else E(l))
    return "\n".join(out)


def render_compare(old, new):
    def cats(run):
        return {(f["kind"], f["key"]): f for f in run["findings"] if f["kind"] != "regression"}
    a, b = cats(old), cats(new)

    def table(items, run, sign):
        rows = ["<table>", "<tr><th class=\"l\">Kind</th><th>Count</th><th class=\"l\">Category</th></tr>"]
        for (k, key), f in sorted(items, key=lambda kv: -kv[1]["count"]):
            rows.append(f'<tr><td class="l">{E(k)}</td><td>{sign}{f["count"]}</td>'
                        f'<td class="msg">{finding_link(run, f, "../run/")}</td></tr>')
        rows.append("</table>")
        return "".join(rows) if len(rows) > 3 else '<p class="dim">none</p>'

    added = [(k, b[k]) for k in b.keys() - a.keys()]
    gone = [(k, a[k]) for k in a.keys() - b.keys()]
    changed = sorted(((k, a[k]["count"], b[k]["count"]) for k in a.keys() & b.keys()
                      if a[k]["count"] != b[k]["count"]), key=lambda x: -abs(x[2] - x[1]))
    ch = ["<table>", "<tr><th class=\"l\">Kind</th><th>Old</th><th>New</th><th class=\"d\"></th><th class=\"l\">Category</th></tr>"]
    for (k, key), o, n in changed[:300]:
        ch.append(f'<tr><td class="l">{E(k)}</td><td>{o}</td><td>{n}</td><td class="d">{delta(n, o, True)}</td>'
                  f'<td class="msg">{finding_link(new, b[(k, key)], "../run/")}</td></tr>')
    ch.append("</table>")
    st_rows = ["<table>", "<tr><th class=\"l\">Status</th><th>Old</th><th>New</th><th class=\"d\"></th></tr>"]
    for k, _, bad_up in STATUS_COLS:
        o, n = old["status"].get(k, 0), new["status"].get(k, 0)
        st_rows.append(f'<tr><td class="l">{E(k)}</td><td>{o}</td><td>{n}</td><td class="d">{delta(n, o, bad_up)}</td></tr>')
    st_rows.append("</table>")
    body = (f"<h3>Compare:</h3>\n" + kv([
        ("Old", f'<a href="../run/{old["id"]}.html">{E(old["id"])}</a> at {rev_link(old["meta"])}'),
        ("New", f'<a href="../run/{new["id"]}.html">{E(new["id"])}</a> at {rev_link(new["meta"])}')])
        + "\n<p class=\"dim\">Mutants differ between runs unless the seeds and inputs are identical, so NEW categories can move between runs by chance.</p>"
        + f"\n<h4>Status:</h4>\n{''.join(st_rows)}"
        + f"\n<h4>Only in new run ({len(added)}):</h4>\n{table(added, new, '')}"
        + f"\n<h4>Gone in new run ({len(gone)}):</h4>\n{table(gone, old, '')}"
        + f"\n<h4>Count changed ({len(changed)}):</h4>\n" + ("".join(ch) if changed else '<p class="dim">none</p>'))
    return page(f"Compare {old['id']}..{new['id']}", 1, body, f"Generated {now()}.")


ABOUT = """\
<h3>About:</h3>
<p>Differential testing of the two RISC-V instruction selectors. For every <code>llc</code> RUN line in
<code>llvm/test/CodeGen/RISCV/*.ll</code>, the input is compiled with <code>-global-isel=0</code> and with
<code>-global-isel -global-isel-abort=2 -pass-remarks-missed=gisel.*</code>. Mutants come from
<code>ir-mutate</code>, a standalone driver for <code>llvm/lib/FuzzMutate</code>.</p>
<p>Function statuses: <b>identical</b> (same asm after label normalization), <b>different</b> (same instruction
count), <b>better</b>/<b>worse</b> (GlobalISel emits fewer/more instructions), <b>fallback</b> (GlobalISel gave
up and SelectionDAG was used). <b>crash</b> counts configurations where GlobalISel llc failed but SelectionDAG
succeeded.</p>
<p><b>miscompile</b> means the generated code computes something else. Functions whose assembly differs are
sanitized (<code>ir-mutate -sanitize</code> replaces undef/poison, drops poison-generating and fast-math
flags, and guards divisors and shift amounts), linked into a freestanding harness
(<code>ir-mutate -harness</code>) that calls them on 64 pseudo-random argument tuples and hashes the return
value and a memory arena, and run under qemu-user. The function is reported only when two SelectionDAG builds
at different <code>-O</code> levels agree and GlobalISel differs, which filters out results that still depend
on undefined behaviour or on the frame layout. Compiler Explorer compiles RISC-V but cannot run it, so
miscompiles have no remote verdict.</p>
<p>Fallback categories are normalized: vector element counts become <code>N</code> (<code>&lt;4 x s32&gt;</code>
and <code>&lt;8 x s32&gt;</code> are the same gap) and non-standard scalar widths are bucketed to the next
standard width with a trailing <code>~</code>. <b>NEW</b> marks a category no earlier run reported;
<b>M</b> marks one that only mutants reach. The explore pass keeps only a few occurrences per category and
counts the rest, which is what a <code>*</code> on a count means.</p>
<p>Snippets are the smallest candidate that reproduces the finding with the local llc: the single function
extracted with <code>llvm-extract</code> (for crashes, the first function that reproduces), optionally
reduced with <code>llvm-reduce</code>. Compiler Explorer links are created only after compiling the snippet
remotely on every pane in the link; the verdict compares the remote result with the local one.
"reproduces" means the same category on trunk; anything else usually means trunk moved on.</p>
<p>Within a run, findings are ordered miscompile, crash, fallback (categories only mutants reach first),
regression, and the leading <code>--detail-limit</code> of them get a snippet and a page; the rest are
listed in the run's table only. Older runs keep only their summary and findings table; snippets and
occurrences are kept for the most recent runs of each label. Source: <a href="https://github.com/zeyi2/llvm-fuzz">zeyi2/llvm-fuzz</a>.</p>
<pre>python3 isel_diff.py --mutate 5 --exec --exec-originals-only
python3 isel_diff.py --explore --time-budget 60 --exec --exec-rate 0.1 --out out-explore
python3 fuzz_site.py [--label NAME] [--reduce] [--no-godbolt]</pre>
"""


def render(site):
    runs = []
    for n in sorted(os.listdir(os.path.join(site, "data"))):
        if n.endswith(".json"):
            with open(os.path.join(site, "data", n)) as f:
                runs.append(json.load(f))
    for sub in ("run", "compare"):
        os.makedirs(os.path.join(site, sub), exist_ok=True)

    def write(rel, text):
        p = os.path.join(site, rel)
        os.makedirs(os.path.dirname(p), exist_ok=True)
        with open(p, "w") as f:
            f.write(text)

    write("style.css", CSS)
    write("filter.js", FILTER_JS)
    write("about.html", page("About", 0, ABOUT, f"Generated {now()}."))
    write("index.html", render_index(runs, site))
    by_label = collections.defaultdict(list)
    for r in runs:
        by_label[r["label"]].append(r)
        write(f"run/{r['id']}.html", render_run(r))
        if r.get("archived"):
            shutil.rmtree(os.path.join(site, "run", r["id"]), ignore_errors=True)
            continue
        for f in r["findings"]:
            if f.get("no_detail"):
                continue
            write(f"run/{r['id']}/{f['id']}.html", render_finding(r, f))
    mains = sorted(by_label.get("main", []), key=lambda r: r["meta"]["started"])
    for label, rs in by_label.items():
        rs.sort(key=lambda r: r["meta"]["started"])
        for old, new in zip(rs, rs[1:]):
            write(f"compare/{old['id']}..{new['id']}.html", render_compare(old, new))
        if label != "main":
            for r in rs:
                base = [b for b in mains if b["meta"]["started"] <= r["meta"]["started"]]
                if base:
                    write(f"compare/{base[-1]['id']}..{r['id']}.html", render_compare(base[-1], r))
    return len(runs)


# --------------------------------------------------------------------------

def check_main(spec_path, file):
    """llvm-reduce interestingness test: exit 0 when the finding still reproduces."""
    with open(spec_path) as f:
        spec = json.load(f)
    with open(file) as f:
        src = f.read()
    ns = argparse.Namespace(**{k: spec[k] for k in SPEC_ARGS})
    return 0 if check(ns, spec, src) else 1


def dump_keys(site, out):
    keys = sorted(seen_categories(site))
    text = json.dumps({"keys": keys}, indent=0)
    if out == "-":
        print(text)
    else:
        with open(out, "w") as f:
            f.write(text)
    print(f"{len(keys)} categories seen so far", file=sys.stderr)


def main():
    if len(sys.argv) == 4 and sys.argv[1] == "--check":
        sys.exit(check_main(sys.argv[2], sys.argv[3]))
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--results", default=os.path.join(HERE, "out"), help="isel_diff.py output directory")
    ap.add_argument("--site", default=os.path.join(HERE, "site"))
    ap.add_argument("--label", default="main", help="group name on the index (e.g. main, pr-12345)")
    ap.add_argument("--render-only", action="store_true")
    ap.add_argument("--llc", default=ID.llvm_bin("llc"))
    ap.add_argument("--llvm-extract", default=ID.llvm_bin("llvm-extract"))
    ap.add_argument("--llvm-reduce", default=ID.llvm_bin("llvm-reduce"))
    ap.add_argument("--ir-mutate", default=ID.llvm_bin("ir-mutate"))
    ap.add_argument("--dump-keys", metavar="FILE",
                    help="write the categories every run on the site has reported "
                         "(for isel_diff.py --history) and exit; \"-\" for stdout")
    EO.add_arguments(ap)
    ap.add_argument("--reduce", action="store_true",
                    help="shrink crash/fallback snippets of the first --godbolt-limit findings with llvm-reduce")
    ap.add_argument("--reduce-timeout", type=int, default=120)
    ap.add_argument("--candidates", type=int, default=4, help="occurrences tried per finding")
    ap.add_argument("--crash-tries", type=int, default=60, help="functions tried per crashing input")
    ap.add_argument("--top-regressions", type=int, default=30)
    ap.add_argument("--max-occurrences", type=int, default=15)
    ap.add_argument("--detail-limit", type=int, default=1200,
                    help="findings per run that get a snippet and a page of their own")
    ap.add_argument("--no-godbolt", dest="godbolt", action="store_false")
    ap.add_argument("--godbolt-limit", type=int, default=40, help="max findings checked on Compiler Explorer per run")
    ap.add_argument("--godbolt-delay", type=float, default=0.5)
    ap.add_argument("--compiler", default="llc-assertions-trunk")
    ap.add_argument("-j", "--jobs", type=int, default=os.cpu_count())
    ap.add_argument("--timeout", type=int, default=60)
    # The whole site is republished every day and GitHub Pages caps it at 1 GB;
    # a run of the recursive test tree carries a few thousand findings.
    ap.add_argument("--keep-full", type=int, default=3,
                    help="runs per label that keep snippets and finding pages; older runs are archived")
    args = ap.parse_args()

    os.makedirs(os.path.join(args.site, "data"), exist_ok=True)
    if args.dump_keys:
        dump_keys(args.site, args.dump_keys)
        return
    if not args.render_only:
        run_id = ingest(args)
        print(f"ingested {run_id}", file=sys.stderr)
    prune(args.site, args.keep_full)
    n = render(args.site)
    print(f"rendered {n} run(s): {os.path.join(args.site, 'index.html')}")


if __name__ == "__main__":
    main()

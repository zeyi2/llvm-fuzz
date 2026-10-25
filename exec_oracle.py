#!/usr/bin/env python3
"""Execution (miscompile) oracle for the two RISC-V instruction selectors.

Given a module and the functions whose assembly differs between SelectionDAG
and GlobalISel, every function is built and run three times:

  b0  SelectionDAG at the configuration's -O level
  b1  SelectionDAG at a different -O level
  b2  GlobalISel

A function is reported only when b0 and b1 agree and b2 differs from them.
Inputs whose result still depends on leftover undefined behaviour (an
uninitialized value, a stack address that depends on the frame layout, ...)
make the two SelectionDAG builds disagree as well, so they are filtered out.

Each build is a freestanding ELF: `ir-mutate -sanitize` removes undefined
behaviour from the module, `ir-mutate -harness` generates a driver that calls
every function on pseudo-random inputs and writes one 8-byte hash of the
return value and of a memory arena per call, and `ld.lld` links the two
objects at fixed addresses. The binaries run under qemu-user.

Standalone use (mostly for debugging the oracle itself):

  ./exec_oracle.py --flags '-mtriple=riscv64 -mattr=+m' module.ll
"""

import argparse
import os
import re
import shlex
import shutil
import subprocess
import sys
import tempfile
import time

# Pinned so that identical inputs give identical addresses in all three
# builds; .text is high enough for the ELF headers to stay above
# mmap_min_addr, and the arena is far away from everything else.
TEXT_ADDR = "0x100000"
ARENA_ADDR = "0x40000000"

OPT_FLAG = re.compile(r"-O(\d|s|z)")
TEST_LINE = re.compile(r"^; test (\d+) (.*)$")


def xlen_of(flags):
    for f in flags:
        if f.startswith(("-mtriple=", "--mtriple=", "-march=")):
            return 32 if "riscv32" in f or "rv32" in f else 64
    return 64


def opt_level(flags):
    lvl = "2"
    for f in flags:
        m = OPT_FLAG.fullmatch(f)
        if m:
            lvl = m.group(1)
    return lvl


def _strip_opt(flags):
    return [f for f in flags if not OPT_FLAG.fullmatch(f)]


def _text(argv, src, timeout):
    """Run a tool on textual IR; returns stdout or None."""
    try:
        p = subprocess.run(argv, input=src, capture_output=True, text=True, timeout=timeout)
    except (subprocess.TimeoutExpired, OSError):
        return None
    return p.stdout if p.returncode == 0 else None


def sanitize(args, src):
    return _text([args.ir_mutate, "-sanitize"], src, args.timeout)


def harness(args, src, xlen, funcs, seed):
    """(harness IR, [function name per test index]) for the sanitized module."""
    argv = [args.ir_mutate, "-harness", f"-xlen={xlen}",
            f"-inputs={args.exec_inputs}", f"-seed={seed}"]
    if funcs:
        argv.append("-funcs=" + ",".join(funcs))
    out = _text(argv, src, args.timeout)
    if out is None:
        return None
    names = {}
    for line in out.splitlines():
        m = TEST_LINE.match(line)
        if m:
            names[int(m.group(1))] = m.group(2)
        elif not line.startswith(";"):
            break
    if not names:
        return None
    return out, [names[i] for i in sorted(names)]


def _obj(args, src, flags, path):
    try:
        p = subprocess.run([args.llc] + flags + ["-filetype=obj", "-o", path],
                           input=src, capture_output=True, text=True, timeout=args.timeout)
    except (subprocess.TimeoutExpired, OSError):
        return False
    return p.returncode == 0 and os.path.exists(path)


def _link(args, objs, elf):
    try:
        p = subprocess.run([args.lld, "-o", elf, f"-Ttext={TEXT_ADDR}",
                            f"--section-start=.arena={ARENA_ADDR}"] + objs,
                           capture_output=True, text=True, timeout=args.timeout)
    except (subprocess.TimeoutExpired, OSError):
        return False
    return p.returncode == 0 and os.path.exists(elf)


def _qemu(args, elf, xlen, start, budget):
    qemu = shlex.split(args.qemu.format(xlen=xlen))
    try:
        p = subprocess.run(qemu + [elf, str(start)], capture_output=True,
                           timeout=max(1.0, min(args.exec_timeout, budget)))
    except subprocess.TimeoutExpired:
        return None, b""
    except OSError as e:
        raise RuntimeError(f"cannot run {' '.join(qemu)}: {e}")
    return p.returncode, p.stdout


def _collect(args, elf, xlen, ntests, stop):
    """{(test, input): hash} plus the tests that crashed or timed out.

    A function that dies takes the rest of its run with it, so the run is
    restarted at the next function (the harness takes a start index). Looping
    mutants make this the expensive part of the oracle, so the whole thing
    gives up when it runs out of time; the functions already measured are
    still compared.
    """
    ni = args.exec_inputs
    out, crashed, start, restarts = {}, set(), 0, 0
    while start < ntests and time.time() < stop:
        rc, data = _qemu(args, elf, xlen, start, stop - time.time())
        done = len(data) // 8
        for k in range(done):
            out[(start + k // ni, k % ni)] = data[8 * k:8 * k + 8]
        if rc == 0 and done == (ntests - start) * ni:
            break
        bad = start + done // ni
        crashed.add(bad)
        for i in range(ni):
            out.pop((bad, i), None)
        start, restarts = bad + 1, restarts + 1
        if restarts > args.exec_restarts:
            break
    return out, crashed


def miscompile_key(xlen, diff, limit=6):
    """Cluster key for a mismatch: the mnemonics the two selectors disagree on."""
    ops = []
    for line in diff.splitlines():
        if line[:1] not in ("+", "-") or line[:3] in ("+++", "---"):
            continue
        tok = line[1:].strip().split()
        if not tok or tok[0].endswith(":"):
            continue
        op = tok[0].lower()
        if op not in ops:
            ops.append(op)
    ops.sort()
    return f"miscompile rv{xlen}: " + (",".join(ops[:limit]) or "?")


def check(args, src, flags, funcs, seed=1):
    """Mismatches for `funcs` in `src` compiled with `flags`; [] if none."""
    xlen = xlen_of(flags)
    san = sanitize(args, src)
    if san is None:
        return []
    h = harness(args, san, xlen, funcs, seed)
    if h is None:
        return []
    htext, names = h

    base = opt_level(flags)
    other = "0" if base != "0" else "2"
    flags = _strip_opt([f for f in flags if not f.startswith("-global-isel")])
    variants = [("b0", flags + [f"-O{base}", "-global-isel=0"]),
                ("b1", flags + [f"-O{other}", "-global-isel=0"]),
                ("b2", flags + [f"-O{base}", "-global-isel", "-global-isel-abort=2"])]

    stop = time.time() + args.exec_budget
    d = tempfile.mkdtemp(prefix="exec-oracle-")
    try:
        hobj = os.path.join(d, "harness.o")
        # The harness must use the configuration's ABI to call the module, but
        # it is not under test, so it is always SelectionDAG at -O2.
        if not _obj(args, htext, flags + ["-O2", "-global-isel=0"], hobj):
            return []
        runs = {}
        for name, vflags in variants:
            # Same-length paths keep argv (and therefore the initial stack)
            # byte-identical across the three runs.
            vd = os.path.join(d, name)
            os.mkdir(vd)
            obj, elf = os.path.join(vd, "m.o"), os.path.join(vd, "a.elf")
            if not _obj(args, san, vflags, obj) or not _link(args, [hobj, obj], elf):
                return []
            runs[name] = _collect(args, elf, xlen, len(names), stop)
    finally:
        shutil.rmtree(d, ignore_errors=True)

    (a, ca), (b, cb), (g, cg) = runs["b0"], runs["b1"], runs["b2"]
    bad = {}
    for k in sorted(set(a) & set(b) & set(g)):
        if a[k] == b[k] != g[k]:
            bad.setdefault(k[0], []).append(k[1])
    out = []
    for t, inputs in sorted(bad.items()):
        k = (t, inputs[0])
        out.append({
            "function": names[t], "xlen": xlen, "inputs": inputs[:8],
            "input_count": len(inputs), "of_inputs": args.exec_inputs,
            "sdag": a[k].hex(), "gisel": g[k].hex(), "seed": seed,
            "options": {n: " ".join(f) for n, f in variants},
        })
    skipped = sorted(ca | cb | cg)
    if out and skipped:
        out[0]["skipped_functions"] = [names[t] for t in skipped]
    return out


def add_arguments(ap, default_lld="ld.lld"):
    ap.add_argument("--exec", dest="exec_oracle", action="store_true",
                    help="run the qemu execution oracle on functions where GlobalISel "
                         "succeeded but emitted different assembly")
    ap.add_argument("--exec-inputs", type=int, default=64,
                    help="argument tuples per function (default 64)")
    ap.add_argument("--exec-timeout", type=float, default=10, help="seconds per qemu run")
    ap.add_argument("--exec-budget", type=float, default=25,
                    help="seconds of qemu time per configuration (all three builds)")
    ap.add_argument("--exec-restarts", type=int, default=4,
                    help="max qemu restarts per binary after a crashing function")
    ap.add_argument("--exec-max-funcs", type=int, default=24,
                    help="max functions tested per configuration")
    ap.add_argument("--qemu", default="qemu-riscv{xlen}",
                    help="qemu-user command; {xlen} is 32 or 64")
    ap.add_argument("--lld", default=default_lld)
    return ap


def main():
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    import isel_diff as ID

    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("input")
    ap.add_argument("--flags", default="-mtriple=riscv64")
    ap.add_argument("--funcs", help="comma separated; default every eligible function")
    ap.add_argument("--llc", default=ID.llvm_bin("llc"))
    ap.add_argument("--ir-mutate", default=ID.llvm_bin("ir-mutate"))
    ap.add_argument("--timeout", type=int, default=60)
    ap.add_argument("--seed", type=int, default=1)
    add_arguments(ap)
    args = ap.parse_args()

    with open(args.input) as f:
        src = f.read()
    res = check(args, src, shlex.split(args.flags),
                args.funcs.split(",") if args.funcs else [], args.seed)
    if not res:
        print("no mismatch")
        return 1
    for r in res:
        print(f"{r['function']}: {r['input_count']}/{r['of_inputs']} inputs differ "
              f"(sdag {r['sdag']} != gisel {r['gisel']}), inputs {r['inputs']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())

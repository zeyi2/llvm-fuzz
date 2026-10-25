# llvm-fuzz

Daily differential testing of the RISC-V SelectionDAG and GlobalISel
instruction selectors in LLVM. Every `llc` RUN line in
`llvm/test/CodeGen/RISCV` (recursively, so `rvv/` and `GlobalISel/` too), plus
FuzzMutate mutants of each, is compiled with both selectors. GlobalISel
fallbacks, crashes, miscompiles and code-size regressions are grouped into
findings, each with a reduced snippet and a verified Compiler Explorer link.

Functions whose assembly differs are also executed: `ir-mutate -sanitize`
removes undefined behaviour, `ir-mutate -harness` builds a freestanding
driver that calls them on pseudo-random inputs and hashes the results, and the
binaries run under qemu-user. A function is reported as a miscompile only when
two SelectionDAG builds at different `-O` levels agree and GlobalISel differs
(see `exec_oracle.py`).

Each day runs two campaigns: `main` repeats the same fixed-seed mutants so its
deltas come from LLVM changes, and `explore` mutates with new seeds, varying
mutation counts and mutated `llc` flags until its time budget runs out, keeping
only results that add a category, a novelty or a top regression
(see `explore.py`).

**Results: https://broken.life/llvm-fuzz/**

The `llvm-project` submodule tracks upstream `main` and is updated daily by
`update-llvm.yaml`; `fuzz.yaml` then builds `llc` and runs the campaign
(`isel_diff.py`, `fuzz_site.py`) and publishes the site to `gh-pages`.

Run locally:

```sh
git submodule update --init --depth 1 llvm-project
./build.sh
python3 isel_diff.py --mutate 5 && python3 fuzz_site.py --reduce
open site/index.html
```

The execution oracle needs `qemu-riscv32`/`qemu-riscv64` and `ld.lld` on
`PATH`:

```sh
python3 isel_diff.py --mutate 5 --exec --exec-originals-only
python3 isel_diff.py --explore --time-budget 60 --exec --exec-rate 0.1 \
    --history history.json --corpus corpus --corpus-out corpus --out out-explore
```

`--qemu 'CMD {xlen}'` overrides how the binaries are run, which is how to test
on a host without qemu-user (macOS, for instance): point it at a wrapper that
runs them in a Linux container.

`python3 fuzz_site.py --dump-keys history.json` writes the categories every
published run has reported, which is what makes a finding "NEW" and what the
explore pass treats as novelty.

| | |
| --- | --- |
| `build.sh` | builds `llc`, `llvm-extract`, `llvm-reduce` and `ir-mutate` |
| `ir-mutate/` | FuzzMutate driver, plus the UB sanitizer and the execution harness |
| `isel_diff.py` | the campaign: collects configurations, compiles, diffs, reports |
| `exec_oracle.py` | builds, links and runs the three binaries under qemu |
| `explore.py` | explore scheduling: flag mutation, energy, corpus, novelty filter |
| `fuzz_site.py` | groups results into findings, reduces snippets, renders the site |

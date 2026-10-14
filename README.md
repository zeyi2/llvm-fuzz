# llvm-fuzz

Daily differential testing of the RISC-V SelectionDAG and GlobalISel
instruction selectors in LLVM. Every `llc` RUN line in
`llvm/test/CodeGen/RISCV`, plus FuzzMutate mutants of each, is compiled with
both selectors. GlobalISel fallbacks, crashes and code-size regressions are
grouped into findings, each with a reduced snippet and a verified Compiler
Explorer link.

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

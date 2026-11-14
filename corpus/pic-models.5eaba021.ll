; isel-diff-config: -mtriple=riscv64 -relocation-model=pic -mattr=+zba -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@external_var = external global i32
@internal_var = internal global i32 42
@G = global i128 0
@G.1 = global i1 false

; Function Attrs: nounwind
define ptr @f1() #0 {
entry:
  %B = urem i32 0, 42
  %C = icmp uge i32 %B, %B
  store i32 %B, ptr @internal_var, align 4
  store i1 %C, ptr @G.1, align 1
  ret ptr @external_var
}

; Function Attrs: nounwind
define ptr @f2() #0 {
entry:
  %LGV = load i128, ptr @G, align 4
  %B = and i128 %LGV, 0
  store i128 %B, ptr poison, align 4
  ret ptr @internal_var
}

attributes #0 = { nounwind }

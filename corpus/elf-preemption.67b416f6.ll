; isel-diff-config: -mtriple=riscv64 -relocation-model=static -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@preemptable_var = global i32 42
@dsolocal_var = dso_local global i32 42
@weak_dsolocal_var = weak dso_local global i32 42
@hidden_var = hidden global i32 42
@protected_var = protected global i32 42
@G = global i128 42
@G.1 = global i1 true

; Function Attrs: nounwind
define ptr @get_preemptable_var() #0 {
  %B = xor i1 false, true
  store i1 %B, ptr poison, align 1
  ret ptr @preemptable_var
}

; Function Attrs: nounwind
declare ptr @get_dsolocal_var() #0

; Function Attrs: nounwind
declare ptr @get_weak_dsolocal_var() #0

; Function Attrs: nounwind
declare ptr @get_hidden_var() #0

; Function Attrs: nounwind
define ptr @get_protected_var() #0 {
  %LGV1 = load i128, ptr @G, align 4
  %C = icmp uge i128 170141183460469231731687303715884105727, %LGV1
  store i1 %C, ptr @G.1, align 1
  ret ptr @protected_var
}

; Function Attrs: nounwind
define ptr @preemptable_func() #0 {
  %C = icmp eq i32 0, -1
  store i1 %C, ptr @G.1, align 1
  ret ptr @preemptable_func
}

; Function Attrs: nounwind
declare dso_local ptr @dsolocal_func() #0

; Function Attrs: nounwind
declare dso_local ptr @weak_dsolocal_func() #0

; Function Attrs: nounwind
declare dso_local void @call_dsolocal_func() #0

attributes #0 = { nounwind }

; isel-diff-config: -mtriple=riscv64 -relocation-model=pic -mattr=+v -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@preemptable_var = global i32 42
@dsolocal_var = dso_local global i32 42
@weak_dsolocal_var = weak dso_local global i32 42
@hidden_var = hidden global i32 42
@protected_var = protected global i32 42
@G = global double 0.000000e+00
@G.1 = global i1 false

; Function Attrs: nounwind
declare ptr @get_preemptable_var() #0

; Function Attrs: nounwind
define ptr @get_dsolocal_var() #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load double, ptr @G, align 8
  %C = fcmp ole double f0x7FEFFFFFFFFFFFFF, %LGV1
  %B = xor i1 %C, true
  store i1 %C, ptr @G.1, align 1
  store i1 %B, ptr %A, align 1
  ret ptr @dsolocal_var
}

; Function Attrs: nounwind
declare ptr @get_weak_dsolocal_var() #0

; Function Attrs: nounwind
declare ptr @get_hidden_var() #0

; Function Attrs: nounwind
define ptr @get_protected_var() #0 {
  %C = fcmp uno <4 x float> splat (float 4.200000e+01), zeroinitializer
  store <4 x i1> %C, ptr poison, align 1
  ret ptr @protected_var
}

; Function Attrs: nounwind
declare ptr @preemptable_func() #0

; Function Attrs: nounwind
declare dso_local ptr @dsolocal_func() #0

; Function Attrs: nounwind
declare dso_local ptr @weak_dsolocal_func() #0

; Function Attrs: nounwind
declare dso_local void @call_dsolocal_func() #0

attributes #0 = { nounwind }

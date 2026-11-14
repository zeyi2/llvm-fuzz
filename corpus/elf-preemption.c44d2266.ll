; isel-diff-config: -mtriple=riscv32 -relocation-model=static -mattr=+zbkb,+d -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@preemptable_var = global i32 42
@dsolocal_var = dso_local global i32 42
@weak_dsolocal_var = weak dso_local global i32 42
@hidden_var = hidden global i32 42
@protected_var = protected global i32 42
@G = global double 1.000000e+00
@G.1 = global i1 false
@G.2 = global i64 0
@G.3 = global float 0.000000e+00
@G.4 = global i1 true

; Function Attrs: nounwind
declare ptr @get_preemptable_var() #0

; Function Attrs: nounwind
declare ptr @get_dsolocal_var() #0

; Function Attrs: nounwind
define ptr @get_weak_dsolocal_var() #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load double, ptr @G, align 8
  %C = fcmp olt double %LGV, 4.940660e-324
  %C2 = icmp slt i1 %C, %C
  store i1 %C, ptr @G.1, align 1
  store i1 %C2, ptr %A, align 1
  ret ptr @weak_dsolocal_var
}

; Function Attrs: nounwind
define ptr @get_hidden_var() #0 {
  %LGV1 = load float, ptr @G.3, align 4
  %C = fcmp uno float +inf, %LGV1
  store i1 %C, ptr @G.4, align 1
  ret ptr @hidden_var
}

; Function Attrs: nounwind
define ptr @get_protected_var() #0 {
  %B = shl i1 false, false
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  store i1 %B, ptr %A, align 1
  ret ptr @protected_var
}

; Function Attrs: nounwind
define ptr @preemptable_func() #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = icmp ne i32 0, -1
  store i1 %C, ptr %A, align 1
  ret ptr @preemptable_func
}

; Function Attrs: nounwind
declare dso_local ptr @dsolocal_func() #0

; Function Attrs: nounwind
define weak dso_local ptr @weak_dsolocal_func() #0 {
  %LGV = load i64, ptr @G.2, align 4
  %B = lshr i64 42, %LGV
  store i64 %B, ptr poison, align 4
  ret ptr @weak_dsolocal_func
}

; Function Attrs: nounwind
declare dso_local void @call_dsolocal_func() #0

attributes #0 = { nounwind }

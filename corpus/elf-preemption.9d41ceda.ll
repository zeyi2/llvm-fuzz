; isel-diff-config: -mtriple=riscv32 -relocation-model=static -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@preemptable_var = global i32 42
@dsolocal_var = dso_local global i32 42
@weak_dsolocal_var = weak dso_local global i32 42
@hidden_var = hidden global i32 42
@protected_var = protected global i32 42
@G = global i128 0
@G.1 = global ptr poison
@G.2 = global i1 true
@G.3 = global i1 false

; Function Attrs: nounwind
declare ptr @get_preemptable_var() #0

; Function Attrs: nounwind
declare ptr @get_dsolocal_var() #0

; Function Attrs: nounwind
define ptr @get_weak_dsolocal_var() #0 {
  %LGV = load i1, ptr @G.2, align 1
  %C = icmp eq i1 false, %LGV
  store i1 %C, ptr @G.3, align 1
  ret ptr @weak_dsolocal_var
}

; Function Attrs: nounwind
declare ptr @get_hidden_var() #0

; Function Attrs: nounwind
declare ptr @get_protected_var() #0

; Function Attrs: nounwind
declare ptr @preemptable_func() #0

; Function Attrs: nounwind
define dso_local ptr @dsolocal_func() #0 {
  %LGV = load i128, ptr @G, align 4
  switch i128 %LGV, label %SW_D [
    i128 6971272556898656672, label %SW_C
    i128 11403032109433074207, label %SW_C1
    i128 2126914480990646029, label %SW_C2
  ]

BB:                                               ; preds = %SW_C2, %SW_C1, %SW_D
  ret ptr @dsolocal_func

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %LGV3 = load ptr, ptr @G.1, align 8
  ret ptr %LGV3

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare dso_local ptr @weak_dsolocal_func() #0

; Function Attrs: nounwind
declare dso_local void @call_dsolocal_func() #0

attributes #0 = { nounwind }

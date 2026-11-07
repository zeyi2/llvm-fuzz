; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-zicfilp,+f -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 2147483647
@G.1 = global i1 true
@G.2 = global i1 true

; Function Attrs: nounwind
define ptr @nest_receiver(ptr nest %arg) #0 {
  %C = icmp sle i1 false, false
  store i1 %C, ptr @G.1, align 1
  ret ptr %arg
}

; Function Attrs: nounwind
define ptr @nest_caller(ptr %arg) #0 {
  %A = alloca i32, align 4
  %L5 = load i64, ptr %A, align 4
  %L3 = load i32, ptr %A, align 4
  %L = load float, ptr %A, align 4
  %G = getelementptr i64, ptr %arg, i32 %L3
  store i32 poison, ptr %A, align 4
  %LGV = load i32, ptr @G, align 4
  %C = fcmp une float %L, +inf
  %C6 = icmp slt i64 0, %L5
  %result = call ptr @nest_receiver(ptr nest %arg)
  %B = shl i32 2147483647, %LGV
  store i32 %B, ptr %A, align 4
  store i1 %C, ptr @G.1, align 1
  store ptr %G, ptr %result, align 8
  store i1 %C6, ptr @G.2, align 1
  ret ptr %result
}

attributes #0 = { nounwind }

!llvm.module.flags = !{!2, !3}

!2 = !{i32 8, !"cf-protection-branch", i32 1}
!3 = !{i32 1, !"cf-branch-label-scheme", !"unlabeled"}

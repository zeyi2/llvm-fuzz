; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+d,+zvfh -O2 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 42)
@G.1 = global i32 2147483647
@G.2 = global i64 0

; Function Attrs: nounwind
define ptr @nest_receiver(ptr nest %arg) #0 {
  %A5 = alloca i1, align 1
  store i1 false, ptr %A5, align 1
  %A1 = alloca i16, align 2
  store i16 1, ptr %A1, align 2
  %A = alloca <2 x i64>, align 16
  %L2 = load i16, ptr %A1, align 2
  switch i16 %L2, label %SW_D [
    i16 24685, label %SW_C
    i16 23136, label %SW_C3
    i16 -882, label %SW_C4
  ]

BB:                                               ; preds = %SW_C4, %SW_C3, %SW_C, %SW_D
  store <2 x i64> poison, ptr %A, align 16
  %LGV = load <2 x i64>, ptr @G, align 16
  %B = ashr <2 x i64> %LGV, splat (i64 4294967296)
  store <2 x i64> %B, ptr %A, align 16
  ret ptr %arg

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %B7 = udiv i32 2147483647, -1
  %L6 = load i1, ptr %A5, align 1
  store i32 %B7, ptr @G.1, align 4
  br i1 %L6, label %BB, label %SW_C

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  %G = getelementptr <2 x i64>, ptr %arg, i128 42
  store ptr %G, ptr poison, align 8
  br label %BB
}

; Function Attrs: nounwind
define ptr @nest_caller(ptr %arg) #0 {
  %result = call ptr @nest_receiver(ptr nest %arg)
  %L = load i1, ptr %result, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %1 = phi i64 [ %LGV, %F ], [ -9223372036854775808, %T ]
  %G = getelementptr ptr, ptr %arg, i16 1
  store i64 %1, ptr %result, align 4
  ret ptr %G

T:                                                ; preds = %0
  %LGV1 = load i64, ptr @G.2, align 4
  br label %BB

F:                                                ; preds = %0
  %LGV = load i64, ptr @G.2, align 4
  br label %BB
}

attributes #0 = { nounwind }

!llvm.module.flags = !{!2, !3}

!2 = !{i32 8, !"cf-protection-branch", i32 1}
!3 = !{i32 1, !"cf-branch-label-scheme", !"unlabeled"}

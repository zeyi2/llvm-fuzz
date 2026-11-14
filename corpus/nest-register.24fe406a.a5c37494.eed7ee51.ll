; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+d,+zvfh,+zbs,+zihintpause,+zbb,+zba -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 42)
@G.1 = global i32 2147483647
@G.2 = global i64 0
@G.3 = global i1 false
@G.4 = global i16 -32768
@G.5 = global <4 x float> splat (float 1.000000e+00)
@G.6 = global <4 x i1> splat (i1 true)
@G.7 = global ptr poison
@G.8 = global <4 x i32> splat (i32 -2147483648)

; Function Attrs: nounwind
define ptr @nest_receiver(ptr nest %arg) #0 {
  %LGV2 = load <4 x float>, ptr @G.5, align 16
  %LGV1 = load i16, ptr @G.4, align 2
  %A5 = alloca i1, align 1
  %L = load <4 x float>, ptr %A5, align 16
  %C = fcmp oeq <4 x float> %L, %LGV2
  store i1 false, ptr %A5, align 1
  %A1 = alloca i16, align 2
  store i16 1, ptr %A1, align 2
  %B2 = add i16 -32768, %LGV1
  %A = alloca <2 x i64>, align 16
  store <4 x i1> %C, ptr @G.6, align 1
  switch i16 %B2, label %SW_D [
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
  %A5 = alloca i16, align 2
  store i16 poison, ptr %A5, align 2
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %result = call ptr @nest_receiver(ptr nest %arg)
  %L = load i1, ptr %result, align 1
  %G1 = getelementptr ptr, ptr %arg, i1 %L
  %B4 = add i16 0, 42
  %G9 = getelementptr ptr, ptr %arg, i16 %B4
  store ptr %G1, ptr %A, align 8
  store i16 %B4, ptr %A5, align 2
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %1 = phi i64 [ %LGV, %F ], [ -9223372036854775808, %T ]
  store i64 %1, ptr %result, align 4
  ret ptr %G9

T:                                                ; preds = %0
  %B7 = udiv <4 x i32> splat (i32 65536), splat (i32 -2147483648)
  %B = udiv i1 %L, false
  store i1 %B, ptr @G.3, align 1
  store <4 x i32> %B7, ptr @G.8, align 16
  br label %BB

F:                                                ; preds = %0
  %C = icmp ule i1 true, false
  %LGV = load i64, ptr @G.2, align 4
  %G6 = getelementptr <4 x i32>, ptr %G1, i1 %L
  store i1 %C, ptr @G.3, align 1
  store ptr %G6, ptr @G.7, align 8
  br label %BB
}

attributes #0 = { nounwind }

!llvm.module.flags = !{!2, !3}

!2 = !{i32 8, !"cf-protection-branch", i32 1}
!3 = !{i32 1, !"cf-branch-label-scheme", !"unlabeled"}

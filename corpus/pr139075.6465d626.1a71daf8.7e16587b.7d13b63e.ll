; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+zvl16384b,+f,+zve64d,+zba -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half 4.200000e+01
@G.1 = global ptr poison
@G.2 = global i32 1
@G.3 = global i1 false
@G.4 = global float 1.401300e-45
@G.5 = global i1 true
@G.6 = global ptr poison
@G.7 = global i128 -1
@G.8 = global ptr poison
@G.9 = global ptr poison
@G.10 = global i8 1
@G.11 = global i64 -1

define void @a(ptr %0, ptr %1) {
  %A = alloca i1, align 1
  %L11 = load i8, ptr %A, align 1
  %L4 = load i8, ptr %A, align 1
  %L3 = load i8, ptr %A, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i8, ptr @G.10, align 1
  %LGV5 = load i128, ptr @G.7, align 4
  %C8 = fcmp oeq float +inf, 1.000000e+00
  %G4 = getelementptr inbounds ptr, ptr %1, i1 false
  %L = load i128, ptr %G4, align 4
  %LGV1 = load float, ptr @G.4, align 4
  %C2 = fcmp ueq float 1.401300e-45, %LGV1
  %G3 = getelementptr ptr, ptr %1, i1 %C2
  %G10 = getelementptr i128, ptr %0, i32 0
  %L10 = load float, ptr %G10, align 4
  %C6 = icmp sle i128 %L, %LGV5
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %0, ptr align 4 %1, i64 2048, i1 false)
  %G = getelementptr half, ptr %0, i1 true
  store ptr %G, ptr @G.1, align 8
  store i1 %C8, ptr @G.3, align 1
  store i1 %C6, ptr @G.3, align 1
  %B5 = shl i8 %L3, %L4
  store i1 %C2, ptr @G.5, align 1
  %G2 = getelementptr float, ptr %1, i1 %C6
  %G13 = getelementptr ptr, ptr %A, i16 42
  store ptr %G4, ptr @G.6, align 8
  store ptr %G10, ptr @G.8, align 8
  store ptr %G2, ptr @G.9, align 8
  store i8 %B5, ptr @G.10, align 1
  switch i8 %LGV, label %SW_D [
    i8 -10, label %SW_C
    i8 -93, label %SW_C4
    i8 17, label %SW_C5
  ]

BB:                                               ; preds = %SW_C5, %SW_C4, %SW_C, %SW_D
  store ptr %G3, ptr %G2, align 8
  %G7 = getelementptr i128, ptr %1, i1 false
  store ptr %G7, ptr %A, align 8
  ret void

SW_D:                                             ; preds = %SW_D, %2
  %3 = phi i8 [ %3, %SW_D ], [ %L11, %2 ]
  %C = fcmp uge float %LGV1, %L10
  store i1 %C, ptr %A, align 1
  store i8 %3, ptr %A, align 1
  br i1 %C6, label %SW_D, label %BB

SW_C:                                             ; preds = %2
  %G8 = getelementptr i1, ptr %1, i1 true
  store ptr %G8, ptr %G13, align 8
  br label %BB

SW_C4:                                            ; preds = %SW_C4, %2
  %4 = phi float [ %4, %SW_C4 ], [ %L10, %2 ]
  %G9 = getelementptr ptr, ptr %0, i1 %C6
  store float %4, ptr %G9, align 4
  br i1 %C2, label %BB, label %SW_C4

SW_C5:                                            ; preds = %2
  %B = udiv i64 0, 9223372036854775807
  store i64 %B, ptr @G.11, align 4
  br label %BB
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }

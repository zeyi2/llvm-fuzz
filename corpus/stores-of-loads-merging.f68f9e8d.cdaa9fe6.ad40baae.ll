; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+b,+zvfh,+xtheadba -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.401300e-45
@G.1 = global double 4.940660e-324
@G.2 = global i1 true
@G.3 = global i1 false
@G.4 = global <2 x i64> splat (i64 -9223372036854775808)
@G.5 = global i128 0
@G.6 = global i128 -170141183460469231731687303715884105728
@G.7 = global i128 0

declare void @g()

declare void @f(ptr, ptr, ptr, ptr, ptr, ptr, double)

declare void @f1(ptr, ptr, double)

declare void @i8_i16(ptr, ptr)

define void @i8_i16_rotate(ptr %p, ptr %q) {
  %A3 = alloca i64, align 8
  store i64 -1, ptr %A3, align 4
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %p0 = getelementptr i8, ptr %p, i64 0
  %L1 = load i1, ptr %p0, align 1
  %p1 = getelementptr i8, ptr %p, i64 1
  %G = getelementptr i1, ptr %p0, i1 %L1
  %x0 = load i8, ptr %p0, align 2
  %L4 = load i64, ptr %A3, align 4
  switch i64 %L4, label %SW_D [
    i64 -1482393206999530625, label %SW_C
  ]

BB:                                               ; preds = %SW_C, %SW_D
  %x1 = load i8, ptr %p1, align 1
  call void @g()
  %q1 = getelementptr i8, ptr %q, i64 1
  store i8 %x1, ptr %G, align 2
  %G2 = getelementptr i1, ptr %p, i8 %x1
  store i8 %x0, ptr %q1, align 1
  store ptr %G2, ptr %A, align 8
  ret void

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %G5 = getelementptr i64, ptr %q, i16 0
  %L = load float, ptr %G5, align 4
  store ptr %G5, ptr %A3, align 8
  %B = fmul float %L, 1.000000e+00
  store float %B, ptr poison, align 4
  br label %BB
}

define void @i8_i16_resched_readnone_ld(ptr %p, ptr %q) {
  %LGV2 = load i128, ptr @G.6, align 4
  %LGV1 = load i128, ptr @G.5, align 4
  %B3 = xor i128 %LGV1, %LGV2
  %LGV = load i1, ptr @G.3, align 1
  %p0 = getelementptr i8, ptr %p, i64 0
  %p1 = getelementptr i8, ptr %p, i64 1
  %G4 = getelementptr i32, ptr %p1, i1 %LGV
  %x0 = load i8, ptr %p0, align 2
  call void @g() #1
  %x1 = load i8, ptr %p1, align 1
  %B = xor i1 %LGV, true
  call void @g()
  %q0 = getelementptr i8, ptr %q, i64 0
  store i8 %x0, ptr %q0, align 2
  %G = getelementptr ptr, ptr %p, i1 %LGV
  store i8 %x1, ptr %G4, align 1
  store i1 %B, ptr %G, align 1
  store i128 %B3, ptr @G.7, align 4
  ret void
}

define void @i8_i16_resched_readnone_st(ptr %p, ptr %q) {
  %A8 = alloca i1, align 1
  store i1 false, ptr %A8, align 1
  %A6 = alloca i1, align 1
  store i1 true, ptr %A6, align 1
  %A2 = alloca i16, align 2
  store i16 poison, ptr %A2, align 2
  %A9 = alloca i1, align 1
  store i1 true, ptr %A9, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %G = getelementptr ptr, ptr %p, i64 4294967296
  %G3 = getelementptr ptr, ptr %q, i1 false
  %p0 = getelementptr i8, ptr %p, i64 0
  %p1 = getelementptr i8, ptr %p, i64 1
  %L = load i128, ptr %p1, align 4
  %x0 = load i8, ptr %p0, align 2
  %x1 = load i8, ptr %p1, align 1
  call void @g()
  %q0 = getelementptr i8, ptr %q, i64 0
  store i8 %x0, ptr %q0, align 2
  call void @g() #1
  store ptr %G3, ptr %p0, align 8
  switch i128 %L, label %SW_D [
    i128 7988626035081044135, label %SW_C
    i128 3912566020839313634, label %SW_C1
    i128 5453059470661708397, label %SW_C2
    i128 7901903161065403378, label %SW_C3
    i128 4066024207784953079, label %SW_C4
    i128 6939581321485092290, label %SW_C5
    i128 9439115266464814376, label %SW_C6
    i128 4100155540787907986, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C6, %SW_C5, %SW_C4, %SW_C2, %SW_C1, %SW_C
  %q1 = getelementptr i8, ptr %q, i64 1
  store i8 %x1, ptr %q1, align 1
  ret void

SW_D:                                             ; preds = %0
  %L7 = load i1, ptr %A6, align 1
  br i1 %L7, label %T, label %F

BB5:                                              ; preds = %F, %T
  %LGV = load <2 x i64>, ptr @G.4, align 16
  %E = extractelement <2 x i64> %LGV, i1 true
  store i64 %E, ptr %A9, align 4
  ret void

SW_C:                                             ; preds = %0
  %G4 = getelementptr ptr, ptr %p, i16 -1
  store ptr %G4, ptr poison, align 8
  br label %BB

SW_C1:                                            ; preds = %SW_C1, %0
  %1 = phi i16 [ %1, %SW_C1 ], [ 1, %0 ]
  %L8 = load i1, ptr %G, align 1
  store i16 %1, ptr %A2, align 2
  br i1 %L8, label %BB, label %SW_C1

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  ret void

SW_C4:                                            ; preds = %SW_C4, %0
  %L10 = load i1, ptr %A9, align 1
  br i1 %L10, label %BB, label %SW_C4

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  br label %BB

SW_C7:                                            ; preds = %0
  br label %BB

T:                                                ; preds = %T, %SW_D
  %L9 = load i1, ptr %A8, align 1
  br i1 %L9, label %T, label %BB5

F:                                                ; preds = %SW_D
  br label %BB5
}

declare void @i32_i64(ptr, ptr)

declare void @i32_i64_rotate(ptr, ptr)

declare void @v2i8_v4i8(ptr, ptr)

declare void @v16i8_v32i8(ptr, ptr)

declare void @two_half(ptr, ptr)

declare void @two_half_unaligned(ptr, ptr)

declare void @two_float(ptr, ptr)

declare void @two_float_unaligned(ptr, ptr)

declare void @two_float_rotate(ptr, ptr)

declare void @two_double(ptr, ptr)

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare i32 @llvm.experimental.constrained.fptoui.i32.f64(double, metadata) #0

attributes #0 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { memory(none) }

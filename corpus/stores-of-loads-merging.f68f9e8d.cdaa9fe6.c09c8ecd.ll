; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+b,+zvfh,+xtheadba,+zfh,+a -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.401300e-45
@G.1 = global double 4.940660e-324
@G.2 = global i1 true
@G.3 = global i1 false
@G.4 = global i1 true
@G.5 = global i128 -1
@G.6 = global ptr poison
@G.7 = global <2 x i64> splat (i64 -1)
@G.8 = global <2 x i1> zeroinitializer

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
  call void @g()
  %q1 = getelementptr i8, ptr %q, i64 1
  %x1 = load i8, ptr %p1, align 1
  store i8 %x0, ptr %q1, align 1
  %G2 = getelementptr i1, ptr %p, i8 %x1
  store ptr %G2, ptr %A, align 8
  store i8 %x1, ptr %G, align 2
  %G1 = getelementptr i8, ptr %p, i64 %L4
  store ptr %G1, ptr @G.6, align 8
  ret void

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %G5 = getelementptr i64, ptr %q, i16 0
  store ptr %G5, ptr %A3, align 8
  br label %BB
}

define void @i8_i16_resched_readnone_ld(ptr %p, ptr %q) {
  %LGV4 = load <2 x i64>, ptr @G.7, align 16
  %C = icmp sgt <2 x i64> splat (i64 1), %LGV4
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %LGV = load i1, ptr @G.3, align 1
  %p0 = getelementptr i8, ptr %p, i64 0
  %p1 = getelementptr inbounds i8, ptr %p, i64 1
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
  %G2 = getelementptr i128, ptr %p, i8 %x1
  store ptr %G2, ptr %A, align 8
  store <2 x i1> %C, ptr @G.8, align 1
  ret void
}

define void @i8_i16_resched_readnone_st(ptr %p, ptr %q) {
  %A20 = alloca i1, align 1
  store i1 false, ptr %A20, align 1
  %A17 = alloca i1, align 1
  store i1 false, ptr %A17, align 1
  %A5 = alloca i128, align 8
  store i128 42, ptr %A5, align 4
  %A2 = alloca i1, align 1
  store i1 false, ptr %A2, align 1
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

BB:                                               ; preds = %SW_C7, %SW_C6, %BB1, %SW_C4, %SW_C2, %SW_C1, %BB4
  %q1 = getelementptr i8, ptr %q, i64 1
  store i8 %x1, ptr %q1, align 1
  ret void

SW_D:                                             ; preds = %0
  ret void

SW_C:                                             ; preds = %0
  %L6 = load i128, ptr %A5, align 4
  switch i128 %L6, label %SW_D7 [
    i128 8707081774615322870, label %SW_C8
    i128 10668842410914266442, label %SW_C9
    i128 9228036495666364965, label %SW_C10
    i128 1362579305004417862, label %SW_C11
    i128 8161238506760730768, label %SW_C12
    i128 8712721453969723434, label %SW_C13
    i128 4452974362974800019, label %SW_C14
    i128 4508708516871660380, label %SW_C15
  ]

BB4:                                              ; preds = %SW_C13, %SW_C11, %SW_C10, %SW_C9
  br label %BB

SW_C1:                                            ; preds = %SW_C1, %0
  %L8 = load i1, ptr %G, align 1
  br i1 %L8, label %BB, label %SW_C1

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  ret void

SW_C4:                                            ; preds = %SW_C4, %0
  %L10 = load i1, ptr %A9, align 1
  br i1 %L10, label %BB, label %SW_C4

SW_C5:                                            ; preds = %0
  %LGV = load i1, ptr @G.4, align 1
  br i1 %LGV, label %T, label %F

BB1:                                              ; preds = %F, %T
  br label %BB

SW_C6:                                            ; preds = %0
  br label %BB

SW_C7:                                            ; preds = %0
  br label %BB

T:                                                ; preds = %T, %SW_C5
  %L3 = load i1, ptr %A2, align 1
  br i1 %L3, label %T, label %BB1

F:                                                ; preds = %SW_C5
  br label %BB1

SW_D7:                                            ; preds = %SW_C
  ret void

SW_C8:                                            ; preds = %SW_C
  ret void

SW_C9:                                            ; preds = %SW_C9, %SW_C
  %L18 = load i1, ptr %A17, align 1
  br i1 %L18, label %BB4, label %SW_C9

SW_C10:                                           ; preds = %SW_C
  br label %BB4

SW_C11:                                           ; preds = %SW_C
  br label %BB4

SW_C12:                                           ; preds = %SW_C
  ret void

SW_C13:                                           ; preds = %SW_C13, %SW_C
  %L21 = load i1, ptr %A20, align 1
  br i1 %L21, label %SW_C13, label %BB4

SW_C14:                                           ; preds = %SW_C
  %G22 = getelementptr ptr, ptr %A2, i128 %L6
  store ptr %G22, ptr @G.6, align 8
  ret void

SW_C15:                                           ; preds = %SW_C
  ret void
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

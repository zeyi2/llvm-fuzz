; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+b,+zicsr,+zfh,+f,+zba -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global double +qnan
@G.2 = global i1 false
@G.3 = global i128 0
@G.4 = global i32 1
@G.5 = global i1 true
@G.6 = global ptr poison
@G.7 = global i8 0
@G.8 = global <4 x i32> zeroinitializer
@G.9 = global <4 x i32> splat (i32 -2147483648)
@G.10 = global i16 1
@G.11 = global i16 0

declare void @g()

declare void @f(ptr, ptr, ptr, ptr, ptr, ptr, double)

declare void @f1(ptr, ptr, double)

declare void @i8_i16(ptr, ptr)

declare void @i8_i16_rotate(ptr, ptr)

declare void @i8_i16_resched_readnone_ld(ptr, ptr)

declare void @i8_i16_resched_readnone_st(ptr, ptr)

define void @i32_i64(ptr %p, ptr %q) {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV1 = load i8, ptr @G.7, align 1
  %LGV = load i128, ptr @G.3, align 4
  %B = add i128 %LGV, -170141183460469231731687303715884105728
  %C = fcmp ord double 1.000000e+00, +inf
  %p0 = getelementptr i8, ptr %p, i64 0
  %G = getelementptr ptr, ptr %p, i1 false
  %p1 = getelementptr i8, ptr %p, i64 4
  %x0 = load i32, ptr %p0, align 8
  %x1 = load i32, ptr %p1, align 4
  call void @g()
  %q0 = getelementptr i8, ptr %q, i64 0
  %B2 = add i32 65536, %x0
  %q1 = getelementptr i8, ptr %q, i64 4
  store i32 %x0, ptr %q0, align 8
  store i32 %x1, ptr %q1, align 4
  store i1 %C, ptr @G.2, align 1
  switch i8 %LGV1, label %SW_D [
    i8 29, label %SW_C
    i8 -14, label %SW_C2
    i8 -25, label %SW_C3
    i8 49, label %SW_C4
    i8 -107, label %SW_C5
    i8 26, label %SW_C6
    i8 -128, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C5, %SW_C3, %SW_C2, %SW_C, %SW_D
  store i128 %B, ptr @G.3, align 4
  store i32 %B2, ptr @G.4, align 4
  store ptr %G, ptr @G.6, align 8
  ret void

SW_D:                                             ; preds = %SW_D, %0
  br i1 %C, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %SW_C2, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %SW_C2

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %SW_C4, %0
  %LGV10 = load <4 x i32>, ptr @G.9, align 16
  %LGV9 = load <4 x i32>, ptr @G.8, align 16
  %B11 = sub <4 x i32> %LGV9, %LGV10
  store <4 x i32> %B11, ptr %A, align 16
  br i1 false, label %SW_C4, label %BB8

BB8:                                              ; preds = %SW_C4
  ret void

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  ret void

SW_C7:                                            ; preds = %0
  br label %BB
}

declare void @i32_i64_rotate(ptr, ptr)

declare void @v2i8_v4i8(ptr, ptr)

declare void @v16i8_v32i8(ptr, ptr)

declare void @two_half(ptr, ptr)

declare void @two_half_unaligned(ptr, ptr)

declare void @two_float(ptr, ptr)

declare void @two_float_unaligned(ptr, ptr)

define void @two_float_rotate(ptr %p, ptr %q) {
  %LGV = load i1, ptr @G.2, align 1
  %p0 = getelementptr i8, ptr %p, i64 0
  %p1 = getelementptr i8, ptr %p, i64 4
  %L5 = load i1, ptr %p1, align 1
  %x0 = load float, ptr %p0, align 8
  %x1 = load float, ptr %p1, align 4
  call void @g()
  %q0 = getelementptr i8, ptr %q, i64 0
  %L = load i1, ptr %q0, align 1
  %B = sub i1 %LGV, %L5
  %q1 = getelementptr i8, ptr %p0, i64 4
  store float %x1, ptr %q0, align 8
  store i1 %B, ptr @G.5, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  store float %x0, ptr %q1, align 4
  %G = getelementptr ptr, ptr %p0, i1 %LGV
  br i1 %L5, label %T7, label %F8

BB6:                                              ; preds = %F8, %T7
  %G2 = getelementptr ptr, ptr %p1, i1 %L
  store ptr %G, ptr %p0, align 8
  store ptr %G2, ptr %p0, align 8
  ret void

T:                                                ; preds = %0
  %C = fcmp ueq float %x0, %x1
  %C2 = icmp ugt i1 %LGV, %C
  store i1 %C, ptr @G.5, align 1
  store i1 %C2, ptr @G.5, align 1
  ret void

F:                                                ; preds = %0
  %LGV10 = load i16, ptr @G.10, align 2
  %B11 = sub i16 -1, %LGV10
  store i16 %B11, ptr @G.11, align 2
  br label %BB

T7:                                               ; preds = %BB
  br label %BB6

F8:                                               ; preds = %BB
  br label %BB6
}

declare void @two_double(ptr, ptr)

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare i32 @llvm.experimental.constrained.fptoui.i32.f64(double, metadata) #0

attributes #0 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

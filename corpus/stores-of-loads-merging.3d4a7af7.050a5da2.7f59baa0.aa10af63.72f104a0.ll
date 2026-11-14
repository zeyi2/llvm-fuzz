; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+b,+zicsr,+f,+zfa -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global double +qnan
@G.2 = global i1 false
@G.3 = global float 1.401300e-45
@G.4 = global i128 170141183460469231731687303715884105727
@G.5 = global ptr poison
@G.6 = global i16 0
@G.7 = global <2 x i64> zeroinitializer
@G.8 = global <2 x i64> splat (i64 -1)
@G.9 = global ptr poison

declare void @g()

declare void @f(ptr, ptr, ptr, ptr, ptr, ptr, double)

declare void @f1(ptr, ptr, double)

declare void @i8_i16(ptr, ptr)

declare void @i8_i16_rotate(ptr, ptr)

declare void @i8_i16_resched_readnone_ld(ptr, ptr)

declare void @i8_i16_resched_readnone_st(ptr, ptr)

define void @i32_i64(ptr %p, ptr %q) {
  %C = fcmp ord double 1.000000e+00, +inf
  %p0 = getelementptr i8, ptr %p, i64 0
  %p1 = getelementptr i8, ptr %p, i64 4
  %G1 = getelementptr ptr, ptr %p, i1 %C
  %G = getelementptr ptr, ptr %p, i1 %C
  %x0 = load i32, ptr %p0, align 8
  %x1 = load i32, ptr %p1, align 4
  call void @g()
  %q0 = getelementptr i8, ptr %q, i64 0
  %L = load i1, ptr %q0, align 1
  %C5 = icmp sgt i32 %x1, %x0
  %q1 = getelementptr i8, ptr %q, i64 4
  store i32 %x0, ptr %q0, align 8
  store i32 %x1, ptr %q1, align 4
  store i1 %C, ptr @G.2, align 1
  store ptr %G1, ptr %q0, align 8
  br i1 %L, label %T, label %F

BB:                                               ; preds = %T
  %LGV4 = load i16, ptr @G.6, align 2
  store ptr %G, ptr %q1, align 8
  %B = shl i16 256, %LGV4
  %C2 = icmp uge i1 %C5, %L
  store i1 %C2, ptr %p0, align 1
  store i16 %B, ptr %p0, align 2
  ret void

T:                                                ; preds = %0
  %LGV = load i128, ptr @G.4, align 4
  %G3 = getelementptr i32, ptr %p, i128 %LGV
  store ptr %G3, ptr @G.5, align 8
  br label %BB

F:                                                ; preds = %0
  %G8 = getelementptr i32, ptr %G, i32 %x0
  store ptr %G8, ptr @G.9, align 8
  ret void
}

declare void @i32_i64_rotate(ptr, ptr)

declare void @v2i8_v4i8(ptr, ptr)

declare void @v16i8_v32i8(ptr, ptr)

declare void @two_half(ptr, ptr)

declare void @two_half_unaligned(ptr, ptr)

declare void @two_float(ptr, ptr)

declare void @two_float_unaligned(ptr, ptr)

define void @two_float_rotate(ptr %p, ptr %q) {
  %p0 = getelementptr i8, ptr %p, i64 0
  %p1 = getelementptr i8, ptr %p, i64 4
  %x0 = load float, ptr %p0, align 8
  %x1 = load float, ptr %p1, align 4
  %C6 = fcmp oeq float %x1, %x0
  call void @g()
  %q0 = getelementptr i8, ptr %q, i64 0
  %C = fcmp une float %x1, %x1
  %L = load i1, ptr %q0, align 1
  store float %x1, ptr %q0, align 8
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  %G = getelementptr ptr, ptr %p, i8 -1
  br i1 %B, label %T3, label %F4

BB2:                                              ; preds = %F4, %T3
  store float %x0, ptr %G, align 4
  ret void

T:                                                ; preds = %0
  %G3 = getelementptr <8 x i8>, ptr %p, i1 %C
  store ptr %G3, ptr %p0, align 8
  ret void

F:                                                ; preds = %0
  %LGV = load <2 x i64>, ptr @G.7, align 16
  %B = lshr i1 %L, true
  %B1 = and <2 x i64> %LGV, splat (i64 4294967296)
  %B3 = add i1 true, %L
  store i1 %B, ptr %p0, align 1
  store i1 %C6, ptr @G.2, align 1
  store <2 x i64> %B1, ptr @G.8, align 16
  br label %BB

T3:                                               ; preds = %T3, %BB
  br i1 %B3, label %BB2, label %T3

F4:                                               ; preds = %BB
  br label %BB2
}

declare void @two_double(ptr, ptr)

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare i32 @llvm.experimental.constrained.fptoui.i32.f64(double, metadata) #0

attributes #0 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

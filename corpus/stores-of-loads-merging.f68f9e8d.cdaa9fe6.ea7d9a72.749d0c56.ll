; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+b,+xtheadba,+c -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.401300e-45
@G.1 = global double 4.940660e-324
@G.2 = global i1 true
@G.3 = global i1 false
@G.4 = global i64 42
@G.5 = global ptr poison

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
  %G1 = getelementptr i64, ptr %p0, i64 0
  call void @g()
  %q1 = getelementptr i8, ptr %q, i64 1
  store i8 %x1, ptr %G, align 2
  %G2 = getelementptr i1, ptr %p, i8 %x1
  store i8 %x0, ptr %q1, align 1
  store ptr %G2, ptr %A, align 8
  store ptr %G1, ptr %A3, align 8
  ret void

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %G5 = getelementptr i64, ptr %q, i16 0
  %G3 = getelementptr i1, ptr %p, i8 127
  store ptr %G5, ptr %A3, align 8
  store ptr %G3, ptr @G.5, align 8
  br label %BB
}

declare void @i8_i16_resched_readnone_ld(ptr, ptr)

declare void @i8_i16_resched_readnone_st(ptr, ptr)

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

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+b,+zicsr,+f,+a,+zfh -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global double +qnan
@G.2 = global i1 false
@G.3 = global float 1.401300e-45

declare void @g()

declare void @f(ptr, ptr, ptr, ptr, ptr, ptr, double)

declare void @f1(ptr, ptr, double)

declare void @i8_i16(ptr, ptr)

declare void @i8_i16_rotate(ptr, ptr)

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

define void @two_float_rotate(ptr %p, ptr %q) {
  %p0 = getelementptr i8, ptr %p, i64 0
  %L4 = load i1, ptr %p0, align 1
  br i1 %L4, label %T2, label %F3

BB1:                                              ; preds = %F3, %T2
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

T:                                                ; preds = %BB1
  %G3 = getelementptr <8 x i8>, ptr %p, i1 %C
  store ptr %G3, ptr %p0, align 8
  ret void

F:                                                ; preds = %BB1
  %B = lshr i1 %L, true
  %B3 = add i1 true, %L
  store i1 %B, ptr %p0, align 1
  store i1 %C6, ptr @G.2, align 1
  br label %BB

T3:                                               ; preds = %T3, %BB
  br i1 %B3, label %BB2, label %T3

F4:                                               ; preds = %BB
  br label %BB2

T2:                                               ; preds = %0
  br label %BB1

F3:                                               ; preds = %0
  br label %BB1
}

declare void @two_double(ptr, ptr)

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare i32 @llvm.experimental.constrained.fptoui.i32.f64(double, metadata) #0

attributes #0 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

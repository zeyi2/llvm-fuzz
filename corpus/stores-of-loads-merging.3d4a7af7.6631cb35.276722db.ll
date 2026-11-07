; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+b,+zicsr -O1 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global double +qnan
@G.2 = global i1 false
@G.3 = global ptr poison
@G.4 = global ptr poison

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
  %G = getelementptr ptr, ptr %p, i32 42
  %L1 = load i1, ptr %G, align 1
  %L2 = load i1, ptr %A, align 1
  br i1 %L2, label %T, label %F

BB:                                               ; preds = %F, %T
  %C = fcmp ord double 1.000000e+00, +inf
  %p0 = getelementptr i8, ptr %p, i64 0
  store i1 %C, ptr @G.2, align 1
  %q0 = getelementptr i8, ptr %q, i64 0
  %p1 = getelementptr i8, ptr %p, i64 4
  %L = load i1, ptr %p0, align 1
  %C1 = icmp sgt i1 %L, %C
  %x1 = load i32, ptr %p1, align 4
  store i1 %C1, ptr %p1, align 1
  %x0 = load i32, ptr %p0, align 8
  store i32 %x0, ptr %q0, align 8
  store i32 %x1, ptr %G, align 4
  call void @g()
  ret void

T:                                                ; preds = %T, %0
  br i1 %L1, label %BB, label %T

F:                                                ; preds = %0
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
  %q0 = getelementptr i8, ptr %q, i64 0
  call void @g()
  %p0 = getelementptr i8, ptr %p, i64 0
  %L = load i1, ptr %q0, align 1
  %q1 = getelementptr i8, ptr %q, i64 4
  %x0 = load float, ptr %p0, align 8
  %p1 = getelementptr i8, ptr %p, i64 4
  %x1 = load float, ptr %p1, align 4
  store float %x1, ptr %q0, align 8
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  %G = getelementptr ptr, ptr %p0, i1 %L
  store float %x0, ptr %q1, align 4
  store ptr %G, ptr @G.3, align 8
  ret void

T:                                                ; preds = %0
  ret void

F:                                                ; preds = %0
  %G1 = getelementptr ptr, ptr %p, i64 4294967296
  store ptr %G1, ptr @G.4, align 8
  br label %BB
}

declare void @two_double(ptr, ptr)

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare i32 @llvm.experimental.constrained.fptoui.i32.f64(double, metadata) #0

attributes #0 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

; isel-diff-config: -mtriple=riscv64 -mattr=+v,+b,+zicsr -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global double +qnan
@G.2 = global i1 false

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
  %x0 = load i32, ptr %p0, align 8
  %x1 = load i32, ptr %p1, align 4
  call void @g()
  %q0 = getelementptr i8, ptr %q, i64 0
  %q1 = getelementptr i8, ptr %q, i64 4
  store i32 %x0, ptr %q0, align 8
  store i32 %x1, ptr %q1, align 4
  store i1 %C, ptr @G.2, align 1
  ret void
}

declare void @i32_i64_rotate(ptr, ptr)

declare void @v2i8_v4i8(ptr, ptr)

declare void @v16i8_v32i8(ptr, ptr)

define void @two_half(ptr %p, ptr %q) {
  %LGV1 = load double, ptr @G.1, align 8
  %LGV = load double, ptr @G, align 8
  %p0 = getelementptr i8, ptr %p, i64 0
  %p1 = getelementptr i8, ptr %p, i64 2
  %x0 = load half, ptr %p0, align 4
  %x1 = load half, ptr %p1, align 2
  call void @g()
  %q0 = getelementptr i8, ptr %q, i64 0
  %q1 = getelementptr i8, ptr %q, i64 2
  store half %x0, ptr %q0, align 4
  %C = fcmp oge double %LGV, %LGV1
  store half %x1, ptr %q1, align 2
  store i1 %C, ptr @G.2, align 1
  ret void
}

declare void @two_half_unaligned(ptr, ptr)

declare void @two_float(ptr, ptr)

declare void @two_float_unaligned(ptr, ptr)

define void @two_float_rotate(ptr %p, ptr %q) {
  %LGV = load i1, ptr @G.2, align 1
  %p0 = getelementptr i8, ptr %p, i64 0
  %p1 = getelementptr i8, ptr %p, i64 4
  %x0 = load float, ptr %p0, align 8
  %x1 = load float, ptr %p1, align 4
  call void @g()
  %q0 = getelementptr i8, ptr %q, i64 0
  %L = load i1, ptr %q0, align 1
  %q1 = getelementptr i8, ptr %q, i64 4
  store float %x1, ptr %q0, align 8
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  store float %x0, ptr %q1, align 4
  ret void

T:                                                ; preds = %0
  ret void

F:                                                ; preds = %0
  br label %BB
}

declare void @two_double(ptr, ptr)

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare i32 @llvm.experimental.constrained.fptoui.i32.f64(double, metadata) #0

attributes #0 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+b,+zicsr,+zfa,+zfh -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global double +qnan
@G.2 = global i1 false
@G.3 = global ptr poison
@G.4 = global ptr poison
@G.5 = global i8 42
@G.6 = global float 1.000000e+00
@G.7 = global i1 true
@G.8 = global half 0.000000e+00
@G.9 = global half 5.960460e-08
@G.10 = global i32 -2147483648

declare void @g()

declare void @f(ptr, ptr, ptr, ptr, ptr, ptr, double)

declare void @f1(ptr, ptr, double)

declare void @i8_i16(ptr, ptr)

declare void @i8_i16_rotate(ptr, ptr)

declare void @i8_i16_resched_readnone_ld(ptr, ptr)

declare void @i8_i16_resched_readnone_st(ptr, ptr)

define void @i32_i64(ptr %p, ptr %q) {
  %A = alloca ptr, align 8
  %L = load i1, ptr %A, align 1
  store ptr poison, ptr %A, align 8
  %G = getelementptr ptr, ptr %q, i1 false
  %B = xor i16 42, -1
  %C = fcmp ord double 1.000000e+00, +inf
  %p0 = getelementptr i8, ptr %p, i64 0
  %p1 = getelementptr i8, ptr %p, i64 4
  %x0 = load i32, ptr %p0, align 8
  %x1 = load i32, ptr %p1, align 4
  call void @g()
  %q0 = getelementptr i8, ptr %q, i64 0
  %G2 = getelementptr ptr, ptr %q, i1 %L
  store i32 %x0, ptr %q0, align 8
  %G3 = getelementptr i32, ptr %p1, i64 4294967296
  %B1 = and i32 %x1, %x0
  store i32 %x1, ptr %G2, align 4
  store i1 %C, ptr @G.2, align 1
  store i16 %B, ptr %p0, align 2
  store ptr %G, ptr @G.4, align 8
  store ptr %G3, ptr %A, align 8
  store i32 %B1, ptr @G.10, align 4
  ret void
}

declare void @i32_i64_rotate(ptr, ptr)

declare void @v2i8_v4i8(ptr, ptr)

declare void @v16i8_v32i8(ptr, ptr)

define void @two_half(ptr %p, ptr %q) {
  %LGV3 = load half, ptr @G.8, align 2
  %LGV2 = load i8, ptr @G.5, align 1
  %B = fmul half 1.000000e+00, %LGV3
  %LGV1 = load double, ptr @G.1, align 8
  %C1 = fcmp uno double %LGV1, %LGV1
  %p0 = getelementptr i8, ptr %p, i64 0
  %p1 = getelementptr i8, ptr %p, i64 2
  %x0 = load half, ptr %p0, align 4
  %x1 = load half, ptr %p1, align 2
  call void @g()
  %B2 = fadd double %LGV1, 4.940660e-324
  %q0 = getelementptr i8, ptr %q, i64 0
  %q1 = getelementptr i8, ptr %q, i64 2
  %G = getelementptr bfloat, ptr %q0, i8 %LGV2
  store half %x0, ptr %q0, align 4
  store half %x1, ptr %q1, align 2
  store i1 %C1, ptr @G.2, align 1
  store ptr %G, ptr @G.3, align 8
  store half %B, ptr @G.9, align 2
  store double %B2, ptr @G.1, align 8
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
  %G = getelementptr ptr, ptr %q, i1 %LGV
  %q1 = getelementptr i8, ptr %q, i64 4
  store float %x1, ptr %q0, align 8
  store ptr %G, ptr @G.3, align 8
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  store float %x0, ptr %q1, align 4
  ret void

T:                                                ; preds = %0
  %LGV1 = load float, ptr @G.6, align 4
  %C = fcmp ole float %x0, %LGV1
  store i1 %C, ptr @G.7, align 1
  ret void

F:                                                ; preds = %0
  %G3 = getelementptr ptr, ptr %p, i128 170141183460469231731687303715884105727
  store ptr %G3, ptr @G.4, align 8
  br label %BB
}

declare void @two_double(ptr, ptr)

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare i32 @llvm.experimental.constrained.fptoui.i32.f64(double, metadata) #0

attributes #0 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

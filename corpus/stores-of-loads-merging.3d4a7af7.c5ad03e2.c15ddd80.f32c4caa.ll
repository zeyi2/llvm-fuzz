; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+b,+zicsr,+zfh,+f -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global double +qnan
@G.2 = global i1 false
@G.3 = global i128 0
@G.4 = global i32 1
@G.5 = global i1 true
@G.6 = global ptr poison

declare void @g()

declare void @f(ptr, ptr, ptr, ptr, ptr, ptr, double)

declare void @f1(ptr, ptr, double)

declare void @i8_i16(ptr, ptr)

declare void @i8_i16_rotate(ptr, ptr)

declare void @i8_i16_resched_readnone_ld(ptr, ptr)

declare void @i8_i16_resched_readnone_st(ptr, ptr)

define void @i32_i64(ptr %p, ptr %q) {
  %A = alloca i16, align 2
  store i16 poison, ptr %A, align 2
  %LGV = load i128, ptr @G.3, align 4
  %B = add i128 %LGV, -170141183460469231731687303715884105728
  %C = fcmp contract ord double 1.000000e+00, +inf
  %p0 = getelementptr i8, ptr %p, i64 0
  %G = getelementptr ptr, ptr %p, i1 false
  %L = load i16, ptr %G, align 2
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
  store i128 %B, ptr @G.3, align 4
  store i32 %B2, ptr @G.4, align 4
  store ptr %G, ptr @G.6, align 8
  %B3 = urem i16 %L, -1
  store i16 %B3, ptr %A, align 2
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
  %LGV = load i1, ptr @G.2, align 1
  %p0 = getelementptr i8, ptr %p, i64 0
  %p1 = getelementptr i8, ptr %p, i64 4
  %x0 = load float, ptr %p0, align 8
  %G3 = getelementptr ptr, ptr %q, i1 %LGV
  %x1 = load float, ptr %p1, align 4
  call void @g()
  %q0 = getelementptr i8, ptr %q, i64 0
  %L = load i1, ptr %q0, align 1
  %q1 = getelementptr i8, ptr %q, i64 4
  store float %x1, ptr %q0, align 8
  store ptr %G3, ptr %q1, align 8
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  store float %x0, ptr %q1, align 4
  %G = getelementptr ptr, ptr %p0, i1 %LGV
  %G2 = getelementptr ptr, ptr %p1, i1 %L
  store ptr %G, ptr %p0, align 8
  store ptr %G2, ptr %p0, align 8
  ret void

T:                                                ; preds = %0
  %C = fcmp ueq float %x0, %x1
  store i1 %C, ptr @G.5, align 1
  ret void

F:                                                ; preds = %0
  br label %BB
}

declare void @two_double(ptr, ptr)

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare i32 @llvm.experimental.constrained.fptoui.i32.f64(double, metadata) #0

attributes #0 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

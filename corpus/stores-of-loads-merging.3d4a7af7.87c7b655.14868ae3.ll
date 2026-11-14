; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+zicsr -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global double +qnan
@G.2 = global i1 false
@G.3 = global i64 0
@G.4 = global float 0.000000e+00

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
  %A2 = alloca i1, align 1
  store i1 poison, ptr %A2, align 1
  %A7 = alloca i1, align 1
  store i1 true, ptr %A7, align 1
  %A = alloca i64, align 8
  store i64 42, ptr %A, align 4
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
  %L3 = load i64, ptr %A, align 4
  switch i64 %L3, label %SW_D [
    i64 2377827060650424617, label %SW_C
    i64 -467308498815162961, label %SW_C4
    i64 -9138460278545703510, label %SW_C5
    i64 -4146871640520964516, label %SW_C6
  ]

BB1:                                              ; preds = %SW_C5, %SW_C4, %SW_C, %SW_D
  store float %x0, ptr %q1, align 4
  ret void

T:                                                ; preds = %0
  ret void

F:                                                ; preds = %0
  br label %BB

SW_D:                                             ; preds = %BB
  br label %BB1

SW_C:                                             ; preds = %SW_C, %BB
  %L8 = load i1, ptr %A7, align 1
  br i1 %L8, label %BB1, label %SW_C

SW_C4:                                            ; preds = %BB
  br label %BB1

SW_C5:                                            ; preds = %BB
  br label %BB1

SW_C6:                                            ; preds = %BB
  %LGV1 = load float, ptr @G.4, align 4
  %C = fcmp oge float %x0, %LGV1
  store i1 %C, ptr %A2, align 1
  ret void
}

declare void @two_double(ptr, ptr)

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare i32 @llvm.experimental.constrained.fptoui.i32.f64(double, metadata) #0

attributes #0 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

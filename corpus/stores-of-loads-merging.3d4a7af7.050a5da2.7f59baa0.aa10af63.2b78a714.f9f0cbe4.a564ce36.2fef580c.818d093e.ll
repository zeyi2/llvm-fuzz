; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+b,+zicsr,+a,+zfh,+d,+xtheadba -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global double +qnan
@G.2 = global i1 false
@G.3 = global float 1.401300e-45
@G.4 = global i64 1
@G.5 = global half 6.550400e+04
@G.6 = global i32 1
@G.7 = global i32 -2147483648
@G.8 = global i32 -1

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
  %A12 = alloca i1, align 1
  store i1 false, ptr %A12, align 1
  %A7 = alloca i128, align 8
  store i128 170141183460469231731687303715884105727, ptr %A7, align 4
  %LGV = load half, ptr @G.5, align 2
  %C2 = fcmp ueq half %LGV, 6.550400e+04
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %p0 = getelementptr i8, ptr %p, i64 0
  %L4 = load i1, ptr %p0, align 1
  store i1 %C2, ptr %A, align 1
  br i1 %L4, label %T2, label %F3

BB1:                                              ; preds = %F3, %BB3
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
  %G = getelementptr ptr, ptr %G1, i8 -1
  br i1 %B, label %T3, label %F4

BB2:                                              ; preds = %F4, %T3
  %C1 = fcmp oge float %x0, f0x7F7FFFFF
  store float %x0, ptr %G, align 4
  store i1 %C1, ptr %p1, align 1
  ret void

T:                                                ; preds = %BB1
  %G3 = getelementptr <8 x i8>, ptr %p, i1 %C
  store ptr %G3, ptr %p0, align 8
  ret void

F:                                                ; preds = %BB1
  %LGV1 = load i64, ptr @G.4, align 4
  %B = lshr i1 %L, true
  %B3 = add i1 true, %L
  store i1 %B, ptr %p0, align 1
  store i1 %C6, ptr @G.2, align 1
  %G2 = getelementptr ptr, ptr %q, i64 %LGV1
  %G1 = getelementptr i1, ptr %q0, i1 %C2
  store ptr %G2, ptr %A, align 8
  br label %BB

T3:                                               ; preds = %T3, %BB
  br i1 %B3, label %BB2, label %T3

F4:                                               ; preds = %BB
  br label %BB2

T2:                                               ; preds = %0
  %L8 = load i128, ptr %A7, align 4
  switch i128 %L8, label %SW_D [
    i128 13574585503858988264, label %SW_C
    i128 15005045406679158026, label %SW_C9
    i128 9387271964095179861, label %SW_C10
    i128 17840181577032973859, label %SW_C11
  ]

BB6:                                              ; preds = %SW_C11, %SW_C9, %SW_C
  %LGV16 = load i32, ptr @G.8, align 4
  %C17 = icmp ule i32 %LGV16, 42
  br i1 %C17, label %T4, label %F5

BB3:                                              ; preds = %F5
  br label %BB1

F3:                                               ; preds = %0
  br label %BB1

T4:                                               ; preds = %BB6
  ret void

F5:                                               ; preds = %BB6
  br label %BB3

SW_D:                                             ; preds = %T2
  %LGV14 = load i32, ptr @G.6, align 4
  %B15 = add i32 2147483647, %LGV14
  store i32 %B15, ptr @G.7, align 4
  ret void

SW_C:                                             ; preds = %SW_C, %T2
  %L13 = load i1, ptr %A12, align 1
  br i1 %L13, label %BB6, label %SW_C

SW_C9:                                            ; preds = %T2
  br label %BB6

SW_C10:                                           ; preds = %T2
  %C19 = icmp sle i128 %L8, 0
  store i1 %C19, ptr poison, align 1
  ret void

SW_C11:                                           ; preds = %T2
  br label %BB6
}

declare void @two_double(ptr, ptr)

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare i32 @llvm.experimental.constrained.fptoui.i32.f64(double, metadata) #0

attributes #0 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

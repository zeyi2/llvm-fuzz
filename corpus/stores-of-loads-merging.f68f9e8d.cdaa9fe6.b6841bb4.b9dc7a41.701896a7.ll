; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+b,+zvfh,+xtheadba -O2 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.401300e-45
@G.1 = global double 4.940660e-324
@G.2 = global i1 true
@G.3 = global i1 false
@G.4 = global <4 x i32> splat (i32 1)
@G.5 = global ptr poison
@G.6 = global i32 -1

declare void @g()

declare void @f(ptr, ptr, ptr, ptr, ptr, ptr, double)

declare void @f1(ptr, ptr, double)

declare void @i8_i16(ptr, ptr)

define void @i8_i16_rotate(ptr %p, ptr %q) {
  %A4 = alloca ptr, align 8
  store ptr poison, ptr %A4, align 8
  %A2 = alloca float, align 4
  store float poison, ptr %A2, align 4
  %C = fcmp uge double f0x7FEFFFFFFFFFFFFF, +qnan
  %B1 = fadd float 0.000000e+00, 0.000000e+00
  store float %B1, ptr %A2, align 4
  br label %BB1

BB1:                                              ; preds = %0
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
  store i1 %C, ptr %p1, align 1
  switch i64 %L4, label %SW_D [
    i64 -1482393206999530625, label %SW_C
  ]

BB:                                               ; preds = %SW_C, %SW_D
  %x1 = load i8, ptr %p1, align 1
  %B = and i1 true, %C
  %G1 = getelementptr i64, ptr %p1, i8 %x1
  call void @g()
  %q1 = getelementptr i8, ptr %q, i64 1
  store i8 %x1, ptr %G, align 2
  %G2 = getelementptr i1, ptr %p, i8 %x1
  store i8 %x0, ptr %q1, align 1
  store ptr %G2, ptr %A, align 8
  store ptr %G1, ptr @G.5, align 8
  store i1 %B, ptr %A3, align 1
  ret void

SW_D:                                             ; preds = %BB1
  %G3 = getelementptr <4 x i32>, ptr %p, i32 -1
  store ptr %G3, ptr %A4, align 8
  br label %BB

SW_C:                                             ; preds = %BB1
  %G5 = getelementptr i64, ptr %q, i16 0
  store ptr %G5, ptr %A3, align 8
  br label %BB
}

define void @i8_i16_resched_readnone_ld(ptr %p, ptr %q) {
  %LGV = load i1, ptr @G.3, align 1
  %p0 = getelementptr i8, ptr %p, i64 0
  %L3 = load i128, ptr %p0, align 4
  %G5 = getelementptr i1, ptr %q, i1 %LGV
  %L1 = load <4 x i32>, ptr %p0, align 16
  %B2 = mul <4 x i32> splat (i32 65536), %L1
  %p1 = getelementptr i8, ptr %p, i64 1
  %G4 = getelementptr i32, ptr %p1, i1 %LGV
  %x0 = load i8, ptr %p0, align 2
  call void @g() #1
  %x1 = load i8, ptr %p1, align 1
  %B = xor i1 %LGV, true
  call void @g()
  %q0 = getelementptr i8, ptr %q, i64 0
  %G6 = getelementptr i64, ptr %q, i128 %L3
  %L2 = load i32, ptr %q0, align 4
  store i8 %x0, ptr %q0, align 2
  %G = getelementptr ptr, ptr %p, i1 %LGV
  %B3 = ashr i32 65536, %L2
  store i8 %x1, ptr %G4, align 1
  store i1 %B, ptr %G, align 1
  store <4 x i32> %B2, ptr @G.4, align 16
  store ptr %G5, ptr @G.5, align 8
  store i32 %B3, ptr @G.6, align 4
  store ptr %G6, ptr %G, align 8
  ret void
}

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
attributes #1 = { memory(none) }

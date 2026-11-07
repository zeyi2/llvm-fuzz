; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zcb -O3 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 42
@G.1 = global i8 -1
@G.2 = global bfloat 1.000000e+00
@G.3 = global i1 false
@G.4 = global i1 true
@G.5 = global i32 0
@G.6 = global i1 true
@G.7 = global ptr poison

declare i8 @out8(i8, i8, i8)

declare i16 @out16(i16, i16, i16)

declare i32 @out32(i32, i32, i32)

declare i64 @out64(i64, i64, i64)

declare i8 @in8(i8, i8, i8)

declare i16 @in16(i16, i16, i16)

declare i32 @in32(i32, i32, i32)

declare i64 @in64(i64, i64, i64)

declare i32 @in_commutativity_0_0_1(i32, i32, i32)

define i32 @in_commutativity_0_1_0(i32 %x, i32 %y, i32 %mask) {
  %LGV = load i32, ptr @G, align 4
  %n0 = xor i32 %x, %y
  %n1 = and i32 %n0, %mask
  %C = icmp sgt i32 %y, %n0
  %r = xor i32 %y, %n1
  %B = xor i32 %LGV, 0
  store i32 %B, ptr @G, align 4
  store i1 %C, ptr @G.4, align 1
  ret i32 %r
}

define i32 @in_commutativity_0_1_1(i32 %x, i32 %y, i32 %mask) {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV = load i8, ptr @G.1, align 1
  %n0 = xor i32 %x, %y
  switch i8 %LGV, label %SW_D [
    i8 -64, label %SW_C
  ]

BB:                                               ; preds = %SW_C
  %n1 = and i32 %mask, %n0
  %r = xor i32 %y, %n1
  %B2 = and i32 %n1, %n1
  store i32 %B2, ptr %A, align 4
  ret i32 %r

SW_D:                                             ; preds = %0
  %B = mul i32 42, -1
  ret i32 %B

SW_C:                                             ; preds = %0
  br label %BB
}

declare i32 @in_commutativity_1_0_0(i32, i32, i32)

declare i32 @in_commutativity_1_0_1(i32, i32, i32)

declare i32 @in_commutativity_1_1_0(i32, i32, i32)

define i32 @in_commutativity_1_1_1(i32 %x, i32 %y, i32 %mask) {
  %LGV = load i32, ptr @G.5, align 4
  %C = icmp slt i32 %x, %LGV
  %A = alloca <2 x i64>, align 16
  store <2 x i64> poison, ptr %A, align 16
  %G = getelementptr i32, ptr %A, i32 %LGV
  %B = and <2 x i64> zeroinitializer, splat (i64 -9223372036854775808)
  %n0 = xor i32 %x, %y
  %n1 = and i32 %mask, %n0
  %r = xor i32 %x, %n1
  store <2 x i64> %B, ptr %A, align 16
  store i1 %C, ptr %A, align 1
  store ptr %G, ptr @G.7, align 8
  ret i32 %r
}

declare i32 @in_complex_y0(i32, i32, i32, i32)

declare i32 @in_complex_y1(i32, i32, i32, i32)

declare i32 @in_complex_m0(i32, i32, i32, i32)

declare i32 @in_complex_m1(i32, i32, i32, i32)

declare i32 @in_complex_y0_m0(i32, i32, i32, i32, i32)

declare i32 @in_complex_y1_m0(i32, i32, i32, i32, i32)

define i32 @in_complex_y0_m1(i32 %x, i32 %y_hi, i32 %y_low, i32 %m_a, i32 %m_b) {
  %A = alloca i1, align 1
  %L = load i32, ptr %A, align 4
  store i1 poison, ptr %A, align 1
  %y = and i32 %y_hi, %y_low
  %C1 = icmp ult i32 %m_b, %L
  %mask = xor i32 %m_a, %m_b
  %n0 = xor i32 %x, %y
  %n1 = and i32 %mask, %n0
  %r = xor i32 %n1, %y
  store i1 %C1, ptr %A, align 1
  ret i32 %r
}

define i32 @in_complex_y1_m1(i32 %x, i32 %y_hi, i32 %y_low, i32 %m_a, i32 %m_b) {
  %C = icmp sle i32 %x, %m_a
  %y = and i32 %y_hi, %y_low
  %mask = xor i32 %m_a, %m_b
  %E = extractelement <4 x i32> zeroinitializer, i32 2147483647
  %n1 = and i32 %mask, %E
  %r = xor i32 %y, %n1
  store i1 %C, ptr @G.6, align 1
  ret i32 %r
}

declare i32 @out_constant_varx_mone(i32, i32, i32)

declare i32 @in_constant_varx_mone(i32, i32, i32)

declare i32 @out_constant_varx_mone_invmask(i32, i32, i32)

declare i32 @in_constant_varx_mone_invmask(i32, i32, i32)

declare i32 @out_constant_varx_42(i32, i32, i32)

declare i32 @in_constant_varx_42(i32, i32, i32)

declare i32 @out_constant_varx_42_invmask(i32, i32, i32)

declare i32 @in_constant_varx_42_invmask(i32, i32, i32)

declare i32 @out_constant_mone_vary(i32, i32, i32)

declare i32 @in_constant_mone_vary(i32, i32, i32)

declare i32 @out_constant_mone_vary_invmask(i32, i32, i32)

declare i32 @in_constant_mone_vary_invmask(i32, i32, i32)

declare i32 @out_constant_42_vary(i32, i32, i32)

declare i32 @in_constant_42_vary(i32, i32, i32)

declare i32 @out_constant_42_vary_invmask(i32, i32, i32)

declare i32 @in_constant_42_vary_invmask(i32, i32, i32)

; Function Attrs: nounwind
declare void @use32(i32) #0

; Function Attrs: nounwind
declare i32 @in_multiuse_A(i32, i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @in_multiuse_B(i32, i32, i32, i32) #0

declare i32 @n0_badmask(i32, i32, i32, i32)

declare i32 @n0_badxor(i32, i32, i32)

declare i32 @n1_thirdvar(i32, i32, i32, i32)

attributes #0 = { nounwind }

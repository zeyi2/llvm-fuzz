; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32d -mattr=+zhinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 9223372036854775807
@G.1 = global i64 0
@G.2 = global i1 false
@G.3 = global i32 65536

; Function Attrs: nounwind
define float @spill_i32_to_float(i32 %a) #0 {
  %1 = bitcast i32 %a to float
  call void asm sideeffect "", "~{x0},~{x1},~{x2},~{x3},~{x4},~{x5},~{x6},~{x7},~{x8},~{x9},~{x10},~{x11},~{x12},~{x13},~{x14},~{x15},~{x16},~{x17},~{x18},~{x19},~{x20},~{x21},~{x22},~{x23},~{x24},~{x25},~{x26},~{x27},~{x28},~{x29},~{x30},~{x31},~{f0_d},~{f1_d},~{f2_d},~{f3_d},~{f4_d},~{f5_d},~{f6_d},~{f7_d},~{f8_d},~{f9_d},~{f10_d},~{f11_d},~{f12_d},~{f13_d},~{f14_d},~{f15_d},~{f16_d},~{f17_d},~{f18_d},~{f19_d},~{f20_d},~{f21_d},~{f22_d},~{f23_d},~{f24_d},~{f25_d},~{f26_d},~{f27_d},~{f28_d},~{f29_d},~{f30_d},~{f31_d}"() #0
  %C = fcmp oge bfloat +qnan, 1.000000e+00
  store i1 %C, ptr @G.2, align 1
  ret float %1
}

; Function Attrs: nounwind
declare i32 @spill_float_to_i32(float) #0

; Function Attrs: nounwind
define double @spill_i64_to_double(i64 %a) #0 {
  %LGV = load i64, ptr @G, align 4
  %B = xor i64 %a, %LGV
  %1 = bitcast i64 %a to double
  call void asm sideeffect "", "~{x0},~{x1},~{x2},~{x3},~{x4},~{x5},~{x6},~{x7},~{x8},~{x9},~{x10},~{x11},~{x12},~{x13},~{x14},~{x15},~{x16},~{x17},~{x18},~{x19},~{x20},~{x21},~{x22},~{x23},~{x24},~{x25},~{x26},~{x27},~{x28},~{x29},~{x30},~{x31},~{f0_d},~{f1_d},~{f2_d},~{f3_d},~{f4_d},~{f5_d},~{f6_d},~{f7_d},~{f8_d},~{f9_d},~{f10_d},~{f11_d},~{f12_d},~{f13_d},~{f14_d},~{f15_d},~{f16_d},~{f17_d},~{f18_d},~{f19_d},~{f20_d},~{f21_d},~{f22_d},~{f23_d},~{f24_d},~{f25_d},~{f26_d},~{f27_d},~{f28_d},~{f29_d},~{f30_d},~{f31_d}"() #0
  store i64 %B, ptr @G.1, align 4
  ret double %1
}

; Function Attrs: nounwind
define i64 @spill_double_to_i64(double %a) #0 {
  %1 = bitcast double %a to i64
  call void asm sideeffect "", "~{x0},~{x1},~{x2},~{x3},~{x4},~{x5},~{x6},~{x7},~{x8},~{x9},~{x10},~{x11},~{x12},~{x13},~{x14},~{x15},~{x16},~{x17},~{x18},~{x19},~{x20},~{x21},~{x22},~{x23},~{x24},~{x25},~{x26},~{x27},~{x28},~{x29},~{x30},~{x31},~{f0_d},~{f1_d},~{f2_d},~{f3_d},~{f4_d},~{f5_d},~{f6_d},~{f7_d},~{f8_d},~{f9_d},~{f10_d},~{f11_d},~{f12_d},~{f13_d},~{f14_d},~{f15_d},~{f16_d},~{f17_d},~{f18_d},~{f19_d},~{f20_d},~{f21_d},~{f22_d},~{f23_d},~{f24_d},~{f25_d},~{f26_d},~{f27_d},~{f28_d},~{f29_d},~{f30_d},~{f31_d}"() #0
  %B = xor i64 %1, %1
  store i64 %B, ptr @G, align 4
  ret i64 %1
}

; Function Attrs: nounwind
define float @fill_i32_to_float(i32 %a) #0 {
  %LGV = load i32, ptr @G.3, align 4
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  call void asm sideeffect "", "~{x0},~{x1},~{x2},~{x3},~{x4},~{x5},~{x6},~{x7},~{x8},~{x9},~{x10},~{x11},~{x12},~{x13},~{x14},~{x15},~{x16},~{x17},~{x18},~{x19},~{x20},~{x21},~{x22},~{x23},~{x24},~{x25},~{x26},~{x27},~{x28},~{x29},~{x30},~{x31},~{f0_d},~{f1_d},~{f2_d},~{f3_d},~{f4_d},~{f5_d},~{f6_d},~{f7_d},~{f8_d},~{f9_d},~{f10_d},~{f11_d},~{f12_d},~{f13_d},~{f14_d},~{f15_d},~{f16_d},~{f17_d},~{f18_d},~{f19_d},~{f20_d},~{f21_d},~{f22_d},~{f23_d},~{f24_d},~{f25_d},~{f26_d},~{f27_d},~{f28_d},~{f29_d},~{f30_d},~{f31_d}"() #0
  %1 = bitcast i32 %a to float
  %L = load i1, ptr %A, align 1
  %B = add i32 %a, %LGV
  store i32 %B, ptr @G.3, align 4
  br i1 %L, label %T, label %F

BB:                                               ; preds = %T
  ret float %1

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  ret float %1
}

; Function Attrs: nounwind
define i32 @fill_float_to_i32(float %a) #0 {
  %A = alloca i16, align 2
  store i16 poison, ptr %A, align 2
  call void asm sideeffect "", "~{x0},~{x1},~{x2},~{x3},~{x4},~{x5},~{x6},~{x7},~{x8},~{x9},~{x10},~{x11},~{x12},~{x13},~{x14},~{x15},~{x16},~{x17},~{x18},~{x19},~{x20},~{x21},~{x22},~{x23},~{x24},~{x25},~{x26},~{x27},~{x28},~{x29},~{x30},~{x31},~{f0_d},~{f1_d},~{f2_d},~{f3_d},~{f4_d},~{f5_d},~{f6_d},~{f7_d},~{f8_d},~{f9_d},~{f10_d},~{f11_d},~{f12_d},~{f13_d},~{f14_d},~{f15_d},~{f16_d},~{f17_d},~{f18_d},~{f19_d},~{f20_d},~{f21_d},~{f22_d},~{f23_d},~{f24_d},~{f25_d},~{f26_d},~{f27_d},~{f28_d},~{f29_d},~{f30_d},~{f31_d}"() #0
  %1 = bitcast float %a to i32
  %B = ashr i16 0, 0
  store i16 %B, ptr %A, align 2
  ret i32 %1
}

; Function Attrs: nounwind
declare double @fill_i64_to_double(i64) #0

; Function Attrs: nounwind
declare i64 @fill_double_to_i64(double) #0

attributes #0 = { nounwind }

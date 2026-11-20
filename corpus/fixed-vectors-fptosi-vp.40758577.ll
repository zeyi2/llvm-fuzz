; isel-diff-config: -mtriple=riscv32 -mattr=+zvfhmin -O2 -code-model=small -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true

define <4 x i7> @vfptosi_v4i7_v4f16(<4 x half> %va, <4 x i1> %m, i32 zeroext %evl) {
  %C = fcmp ogt bfloat 0.000000e+00, 4.200000e+01
  %v = fptosi <4 x half> %va to <4 x i7>
  store i1 %C, ptr poison, align 1
  ret <4 x i7> %v
}

define <4 x i8> @vfptosi_v4i8_v4f16(<4 x half> %va, <4 x i1> %m, i32 zeroext %evl) {
  %A = alloca <2 x i1>, align 1
  store <2 x i1> poison, ptr %A, align 1
  %C = icmp ule <2 x i64> splat (i64 4294967296), zeroinitializer
  %v = fptosi <4 x half> %va to <4 x i8>
  store <2 x i1> %C, ptr %A, align 1
  ret <4 x i8> %v
}

declare <4 x i8> @vfptosi_v4i8_v4f16_unmasked(<4 x half>, i32 zeroext)

declare <4 x i16> @vfptosi_v4i16_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

define <4 x i16> @vfptosi_v4i16_v4f16_unmasked(<4 x half> %va, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = icmp sle i32 %evl, %evl
  %v = fptosi <4 x half> %va to <4 x i16>
  store i1 %C, ptr %A, align 1
  ret <4 x i16> %v
}

declare <4 x i32> @vfptosi_v4i32_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

define <4 x i32> @vfptosi_v4i32_v4f16_unmasked(<4 x half> %va, i32 zeroext %evl) {
  %C = icmp ne i32 %evl, %evl
  %v = fptosi <4 x half> %va to <4 x i32>
  store i1 %C, ptr poison, align 1
  ret <4 x i32> %v
}

declare <4 x i64> @vfptosi_v4i64_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vfptosi_v4i64_v4f16_unmasked(<4 x half>, i32 zeroext)

declare <4 x i8> @vfptosi_v4i8_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vfptosi_v4i8_v4f32_unmasked(<4 x float>, i32 zeroext)

declare <4 x i16> @vfptosi_v4i16_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

define <4 x i16> @vfptosi_v4i16_v4f32_unmasked(<4 x float> %va, i32 zeroext %evl) {
  %B = fsub <4 x float> %va, splat (float 1.401300e-45)
  %v = fptosi <4 x float> %va to <4 x i16>
  store <4 x float> %B, ptr poison, align 16
  ret <4 x i16> %v
}

declare <4 x i32> @vfptosi_v4i32_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vfptosi_v4i32_v4f32_unmasked(<4 x float>, i32 zeroext)

declare <4 x i64> @vfptosi_v4i64_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vfptosi_v4i64_v4f32_unmasked(<4 x float>, i32 zeroext)

declare <4 x i8> @vfptosi_v4i8_v4f64(<4 x double>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vfptosi_v4i8_v4f64_unmasked(<4 x double>, i32 zeroext)

declare <4 x i16> @vfptosi_v4i16_v4f64(<4 x double>, <4 x i1>, i32 zeroext)

define <4 x i16> @vfptosi_v4i16_v4f64_unmasked(<4 x double> %va, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i1, ptr @G, align 1
  %v = fptosi <4 x double> %va to <4 x i16>
  %C = icmp ne i1 %LGV, true
  store i1 %C, ptr %A, align 1
  ret <4 x i16> %v
}

declare <4 x i32> @vfptosi_v4i32_v4f64(<4 x double>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vfptosi_v4i32_v4f64_unmasked(<4 x double>, i32 zeroext)

declare <4 x i64> @vfptosi_v4i64_v4f64(<4 x double>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vfptosi_v4i64_v4f64_unmasked(<4 x double>, i32 zeroext)

declare <32 x i64> @vfptosi_v32i64_v32f64(<32 x double>, <32 x i1>, i32 zeroext)

declare <32 x i64> @vfptosi_v32i64_v32f64_unmasked(<32 x double>, i32 zeroext)

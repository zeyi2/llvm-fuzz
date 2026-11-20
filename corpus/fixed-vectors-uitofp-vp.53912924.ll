; isel-diff-config: -mtriple=riscv32 -mattr=+m,+zvfh -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 -1
@G.1 = global i1 true

declare <4 x half> @vuitofp_v4f16_v4i7(<4 x i7>, <4 x i1>, i32 zeroext)

declare <4 x half> @vuitofp_v4f16_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x half> @vuitofp_v4f16_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <4 x half> @vuitofp_v4f16_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x half> @vuitofp_v4f16_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <4 x half> @vuitofp_v4f16_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x half> @vuitofp_v4f16_v4i32_unmasked(<4 x i32>, i32 zeroext)

define <4 x half> @vuitofp_v4f16_v4i64(<4 x i64> %va, <4 x i1> %m, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i128, ptr @G, align 4
  %C = icmp slt i128 %LGV, 18446744073709551616
  %v = uitofp <4 x i64> %va to <4 x half>
  store i1 %C, ptr %A, align 1
  ret <4 x half> %v
}

declare <4 x half> @vuitofp_v4f16_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <4 x float> @vuitofp_v4f32_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x float> @vuitofp_v4f32_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <4 x float> @vuitofp_v4f32_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

define <4 x float> @vuitofp_v4f32_v4i16_unmasked(<4 x i16> %va, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp oeq bfloat +inf, 9.183550e-41
  %v = uitofp <4 x i16> %va to <4 x float>
  store i1 %C, ptr %A, align 1
  ret <4 x float> %v
}

define <4 x float> @vuitofp_v4f32_v4i32(<4 x i32> %va, <4 x i1> %m, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i1, ptr @G.1, align 1
  %v = uitofp <4 x i32> %va to <4 x float>
  %B = and i1 %LGV, false
  store i1 %B, ptr %A, align 1
  ret <4 x float> %v
}

declare <4 x float> @vuitofp_v4f32_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <4 x float> @vuitofp_v4f32_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x float> @vuitofp_v4f32_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <4 x double> @vuitofp_v4f64_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x double> @vuitofp_v4f64_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <4 x double> @vuitofp_v4f64_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x double> @vuitofp_v4f64_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <4 x double> @vuitofp_v4f64_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x double> @vuitofp_v4f64_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <4 x double> @vuitofp_v4f64_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x double> @vuitofp_v4f64_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <32 x double> @vuitofp_v32f64_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <32 x double> @vuitofp_v32f64_v32i64_unmasked(<32 x i64>, i32 zeroext)

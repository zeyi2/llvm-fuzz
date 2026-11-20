; isel-diff-config: -mtriple=riscv64 -mattr=+m,+zvfhmin,+f -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 0
@G.1 = global float +inf
@G.2 = global i32 1

declare <4 x half> @vsitofp_v4f16_v4i7(<4 x i7>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i8_unmasked(<4 x i8>, i32 zeroext)

define <4 x float> @vsitofp_v4f32_v4i16(<4 x i16> %va, <4 x i1> %m, i32 zeroext %evl) {
  %LGV = load i64, ptr @G, align 4
  %v = sitofp <4 x i16> %va to <4 x float>
  %B = shl i64 %LGV, 1
  store i64 %B, ptr poison, align 4
  ret <4 x float> %v
}

declare <4 x float> @vsitofp_v4f32_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i32_unmasked(<4 x i32>, i32 zeroext)

define <4 x float> @vsitofp_v4f32_v4i64(<4 x i64> %va, <4 x i1> %m, i32 zeroext %evl) {
  %B = urem i32 %evl, 42
  %v = sitofp <4 x i64> %va to <4 x float>
  store i32 %B, ptr @G.2, align 4
  ret <4 x float> %v
}

declare <4 x float> @vsitofp_v4f32_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

define <4 x double> @vsitofp_v4f64_v4i32_unmasked(<4 x i32> %va, i32 zeroext %evl) {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %v = sitofp <4 x i32> %va to <4 x double>
  %C = fcmp ogt <4 x double> %v, splat (double +qnan)
  store <4 x i1> %C, ptr %A, align 1
  ret <4 x double> %v
}

declare <4 x double> @vsitofp_v4f64_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <32 x double> @vsitofp_v32f64_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

define <32 x double> @vsitofp_v32f64_v32i64_unmasked(<32 x i64> %va, i32 zeroext %evl) {
  %LGV = load float, ptr @G.1, align 4
  %C = fcmp one float 0.000000e+00, %LGV
  %v = sitofp <32 x i64> %va to <32 x double>
  store i1 %C, ptr poison, align 1
  ret <32 x double> %v
}

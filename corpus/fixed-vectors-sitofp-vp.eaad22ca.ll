; isel-diff-config: -mtriple=riscv64 -mattr=+m,+zvfh -O0 -code-model=medium -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x float> splat (float 1.401300e-45)
@G.1 = global i1 true

define <4 x half> @vsitofp_v4f16_v4i7(<4 x i7> %va, <4 x i1> %m, i32 zeroext %evl) {
  %v = sitofp <4 x i7> %va to <4 x half>
  %B = ashr i32 %evl, %evl
  store i32 %B, ptr poison, align 4
  ret <4 x half> %v
}

declare <4 x half> @vsitofp_v4f16_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

define <4 x half> @vsitofp_v4f16_v4i8_unmasked(<4 x i8> %va, i32 zeroext %evl) {
  %C = fcmp une half +inf, +qnan
  %v = sitofp <4 x i8> %va to <4 x half>
  store i1 %C, ptr @G.1, align 1
  ret <4 x half> %v
}

declare <4 x half> @vsitofp_v4f16_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

define <4 x half> @vsitofp_v4f16_v4i64_unmasked(<4 x i64> %va, i32 zeroext %evl) {
  %A = alloca <4 x float>, align 16
  store <4 x float> poison, ptr %A, align 16
  %LGV = load <4 x float>, ptr @G, align 16
  %S = shufflevector <4 x float> splat (float 1.000000e+00), <4 x float> %LGV, <4 x i32> poison
  %v = sitofp <4 x i64> %va to <4 x half>
  store <4 x float> %S, ptr %A, align 16
  ret <4 x half> %v
}

declare <4 x float> @vsitofp_v4f32_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <32 x double> @vsitofp_v32f64_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <32 x double> @vsitofp_v32f64_v32i64_unmasked(<32 x i64>, i32 zeroext)

; isel-diff-config: -mtriple=riscv64 -mattr=+m,+zvfh,+zve32x -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 42)
@G.1 = global i64 42
@G.2 = global i32 2147483647
@G.3 = global i1 true

declare <4 x half> @vsitofp_v4f16_v4i7(<4 x i7>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i8_unmasked(<4 x i8>, i32 zeroext)

define <4 x half> @vsitofp_v4f16_v4i16(<4 x i16> %va, <4 x i1> %m, i32 zeroext %evl) {
  %B = sdiv <8 x i8> splat (i8 42), zeroinitializer
  %v = sitofp <4 x i16> %va to <4 x half>
  store <8 x i8> %B, ptr @G, align 8
  ret <4 x half> %v
}

declare <4 x half> @vsitofp_v4f16_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

define <4 x half> @vsitofp_v4f16_v4i32_unmasked(<4 x i32> %va, i32 zeroext %evl) {
  %v = sitofp <4 x i32> %va to <4 x half>
  %B = lshr i64 0, 42
  store i64 %B, ptr @G.1, align 4
  ret <4 x half> %v
}

declare <4 x half> @vsitofp_v4f16_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i16_unmasked(<4 x i16>, i32 zeroext)

define <4 x float> @vsitofp_v4f32_v4i32(<4 x i32> %va, <4 x i1> %m, i32 zeroext %evl) {
  %LGV = load i32, ptr @G.2, align 4
  %C = icmp ugt i32 %evl, %LGV
  %v = sitofp <4 x i32> %va to <4 x float>
  store i1 %C, ptr @G.3, align 1
  ret <4 x float> %v
}

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

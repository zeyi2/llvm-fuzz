; isel-diff-config: -mtriple=riscv32 -mattr=+m -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <2 x i64> zeroinitializer
@G.2 = global <4 x i32> splat (i32 -2147483648)
@G.3 = global <4 x i1> splat (i1 true)

declare <4 x half> @vsitofp_v4f16_v4i7(<4 x i7>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

define <4 x half> @vsitofp_v4f16_v4i32_unmasked(<4 x i32> %va, i32 zeroext %evl) {
  %LGV = load <4 x i32>, ptr @G.2, align 16
  %C = icmp eq <4 x i32> %LGV, %va
  %v = sitofp <4 x i32> %va to <4 x half>
  store <4 x i1> %C, ptr @G.3, align 1
  ret <4 x half> %v
}

declare <4 x half> @vsitofp_v4f16_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x half> @vsitofp_v4f16_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

define <4 x float> @vsitofp_v4f32_v4i16_unmasked(<4 x i16> %va, i32 zeroext %evl) {
  %LGV = load <2 x i64>, ptr @G.1, align 16
  %v = sitofp <4 x i16> %va to <4 x float>
  %B = or <2 x i64> splat (i64 -1), %LGV
  store <2 x i64> %B, ptr poison, align 16
  ret <4 x float> %v
}

define <4 x float> @vsitofp_v4f32_v4i32(<4 x i32> %va, <4 x i1> %m, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = icmp ult i32 %evl, -1
  %v = sitofp <4 x i32> %va to <4 x float>
  store i1 %C, ptr %A, align 1
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

define <32 x double> @vsitofp_v32f64_v32i64(<32 x i64> %va, <32 x i1> %m, i32 zeroext %evl) {
  %LGV = load i1, ptr @G, align 1
  %v = sitofp <32 x i64> %va to <32 x double>
  %B = lshr i1 true, %LGV
  store i1 %B, ptr poison, align 1
  ret <32 x double> %v
}

declare <32 x double> @vsitofp_v32f64_v32i64_unmasked(<32 x i64>, i32 zeroext)

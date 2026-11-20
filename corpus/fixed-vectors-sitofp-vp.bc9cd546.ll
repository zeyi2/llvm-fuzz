; isel-diff-config: -mtriple=riscv64 -mattr=+m,+zvfhmin -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <4 x float> zeroinitializer
@G.2 = global i32 -1

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

declare <4 x float> @vsitofp_v4f32_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

define <4 x float> @vsitofp_v4f32_v4i16_unmasked(<4 x i16> %va, i32 zeroext %evl) {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %v = sitofp <4 x i16> %va to <4 x float>
  %B = lshr i32 %evl, -1
  store i32 %B, ptr %A, align 4
  ret <4 x float> %v
}

declare <4 x float> @vsitofp_v4f32_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x float> @vsitofp_v4f32_v4i64_unmasked(<4 x i64>, i32 zeroext)

define <4 x double> @vsitofp_v4f64_v4i8(<4 x i8> %va, <4 x i1> %m, i32 zeroext %evl) {
  %LGV = load i1, ptr @G, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F
  %v = sitofp <4 x i8> %va to <4 x double>
  ret <4 x double> %v

T:                                                ; preds = %0
  ret <4 x double> zeroinitializer

F:                                                ; preds = %0
  %LGV1 = load i32, ptr @G.2, align 4
  %C = icmp uge i32 %evl, %LGV1
  store i1 %C, ptr poison, align 1
  br label %BB
}

declare <4 x double> @vsitofp_v4f64_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <4 x double> @vsitofp_v4f64_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

define <4 x double> @vsitofp_v4f64_v4i64_unmasked(<4 x i64> %va, i32 zeroext %evl) {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV1 = load <4 x float>, ptr @G.1, align 16
  %C = fcmp ugt <4 x float> zeroinitializer, %LGV1
  %v = sitofp <4 x i64> %va to <4 x double>
  store <4 x i1> %C, ptr %A, align 1
  ret <4 x double> %v
}

declare <32 x double> @vsitofp_v32f64_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <32 x double> @vsitofp_v32f64_v32i64_unmasked(<32 x i64>, i32 zeroext)

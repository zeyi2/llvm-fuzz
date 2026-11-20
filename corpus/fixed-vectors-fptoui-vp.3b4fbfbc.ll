; isel-diff-config: -mtriple=riscv64 -mattr=+m,+zvfh -O3 -code-model=small -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false

declare <4 x i7> @vfptoui_v4i7_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vfptoui_v4i8_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vfptoui_v4i8_v4f16_unmasked(<4 x half>, i32 zeroext)

declare <4 x i16> @vfptoui_v4i16_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vfptoui_v4i16_v4f16_unmasked(<4 x half>, i32 zeroext)

declare <4 x i32> @vfptoui_v4i32_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vfptoui_v4i32_v4f16_unmasked(<4 x half>, i32 zeroext)

declare <4 x i64> @vfptoui_v4i64_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vfptoui_v4i64_v4f16_unmasked(<4 x half>, i32 zeroext)

declare <4 x i8> @vfptoui_v4i8_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vfptoui_v4i8_v4f32_unmasked(<4 x float>, i32 zeroext)

declare <4 x i16> @vfptoui_v4i16_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

define <4 x i16> @vfptoui_v4i16_v4f32_unmasked(<4 x float> %va, i32 zeroext %evl) {
  %C = icmp sgt i8 -128, 0
  %v = fptoui <4 x float> %va to <4 x i16>
  store i1 %C, ptr @G, align 1
  ret <4 x i16> %v
}

define <4 x i32> @vfptoui_v4i32_v4f32(<4 x float> %va, <4 x i1> %m, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %v = fptoui <4 x float> %va to <4 x i32>
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <4 x i32> %v

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

declare <4 x i32> @vfptoui_v4i32_v4f32_unmasked(<4 x float>, i32 zeroext)

declare <4 x i64> @vfptoui_v4i64_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vfptoui_v4i64_v4f32_unmasked(<4 x float>, i32 zeroext)

declare <4 x i8> @vfptoui_v4i8_v4f64(<4 x double>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vfptoui_v4i8_v4f64_unmasked(<4 x double>, i32 zeroext)

define <4 x i16> @vfptoui_v4i16_v4f64(<4 x double> %va, <4 x i1> %m, i32 zeroext %evl) {
  %C = icmp sgt i32 %evl, -1
  %v = fptoui <4 x double> %va to <4 x i16>
  store i1 %C, ptr @G, align 1
  ret <4 x i16> %v
}

declare <4 x i16> @vfptoui_v4i16_v4f64_unmasked(<4 x double>, i32 zeroext)

declare <4 x i32> @vfptoui_v4i32_v4f64(<4 x double>, <4 x i1>, i32 zeroext)

define <4 x i32> @vfptoui_v4i32_v4f64_unmasked(<4 x double> %va, i32 zeroext %evl) {
  %v = fptoui <4 x double> %va to <4 x i32>
  %C = icmp ne i16 1, -1
  store i1 %C, ptr @G, align 1
  ret <4 x i32> %v
}

declare <4 x i64> @vfptoui_v4i64_v4f64(<4 x double>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vfptoui_v4i64_v4f64_unmasked(<4 x double>, i32 zeroext)

declare <32 x i64> @vfptoui_v32i64_v32f64(<32 x double>, <32 x i1>, i32 zeroext)

declare <32 x i64> @vfptoui_v32i64_v32f64_unmasked(<32 x double>, i32 zeroext)

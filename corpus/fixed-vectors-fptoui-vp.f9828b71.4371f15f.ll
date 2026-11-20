; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx -O1 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 4294967296
@G.1 = global i1 false
@G.2 = global <4 x float> splat (float 1.000000e+00)
@G.3 = global double 4.940660e-324
@G.4 = global <4 x float> splat (float +qnan)
@G.6 = global <4 x float> splat (float +inf)
@G.7 = global i32 -2147483648
@G.5 = global i1 false

declare <4 x i7> @vfptoui_v4i7_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vfptoui_v4i8_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

define <4 x i8> @vfptoui_v4i8_v4f16_unmasked(<4 x half> %va, i32 zeroext %evl) {
  %v = fptoui <4 x half> %va to <4 x i8>
  %B = sub <8 x i8> splat (i8 -128), splat (i8 -128)
  %A = alloca <8 x i8>, align 8
  %L = load i8, ptr %A, align 1
  store <8 x i8> poison, ptr %A, align 8
  %L1 = load i8, ptr %A, align 1
  %C = icmp slt i8 %L, %L1
  store i1 %C, ptr @G.5, align 1
  store <8 x i8> %B, ptr %A, align 8
  ret <4 x i8> %v
}

declare <4 x i16> @vfptoui_v4i16_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vfptoui_v4i16_v4f16_unmasked(<4 x half>, i32 zeroext)

define <4 x i32> @vfptoui_v4i32_v4f16(<4 x half> %va, <4 x i1> %m, i32 zeroext %evl) {
  %LGV = load i64, ptr @G, align 4
  %v = fptoui <4 x half> %va to <4 x i32>
  %C = icmp eq i64 4294967296, %LGV
  store i1 %C, ptr @G.1, align 1
  ret <4 x i32> %v
}

declare <4 x i32> @vfptoui_v4i32_v4f16_unmasked(<4 x half>, i32 zeroext)

declare <4 x i64> @vfptoui_v4i64_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vfptoui_v4i64_v4f16_unmasked(<4 x half>, i32 zeroext)

declare <4 x i8> @vfptoui_v4i8_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

define <4 x i8> @vfptoui_v4i8_v4f32_unmasked(<4 x float> %va, i32 zeroext %evl) {
  %LGV1 = load <4 x float>, ptr @G.4, align 16
  %S = shufflevector <4 x float> %va, <4 x float> %LGV1, <4 x i32> poison
  %v = fptoui <4 x float> %va to <4 x i8>
  %B = fmul <4 x float> %va, splat (float +qnan)
  store <4 x float> %B, ptr @G.2, align 16
  store <4 x float> %S, ptr @G.6, align 16
  %B1 = frem <4 x float> %S, %va
  store <4 x float> %B1, ptr poison, align 16
  ret <4 x i8> %v
}

declare <4 x i16> @vfptoui_v4i16_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vfptoui_v4i16_v4f32_unmasked(<4 x float>, i32 zeroext)

declare <4 x i32> @vfptoui_v4i32_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vfptoui_v4i32_v4f32_unmasked(<4 x float>, i32 zeroext)

declare <4 x i64> @vfptoui_v4i64_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vfptoui_v4i64_v4f32_unmasked(<4 x float>, i32 zeroext)

declare <4 x i8> @vfptoui_v4i8_v4f64(<4 x double>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vfptoui_v4i8_v4f64_unmasked(<4 x double>, i32 zeroext)

declare <4 x i16> @vfptoui_v4i16_v4f64(<4 x double>, <4 x i1>, i32 zeroext)

define <4 x i16> @vfptoui_v4i16_v4f64_unmasked(<4 x double> %va, i32 zeroext %evl) {
  %LGV = load i32, ptr @G.7, align 4
  %v = fptoui <4 x double> %va to <4 x i16>
  %B1 = lshr i64 4294967296, -9223372036854775808
  %B = shl i32 -1, %LGV
  store i32 %B, ptr poison, align 4
  store i64 %B1, ptr poison, align 4
  ret <4 x i16> %v
}

declare <4 x i32> @vfptoui_v4i32_v4f64(<4 x double>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vfptoui_v4i32_v4f64_unmasked(<4 x double>, i32 zeroext)

define <4 x i64> @vfptoui_v4i64_v4f64(<4 x double> %va, <4 x i1> %m, i32 zeroext %evl) {
  %v = fptoui <4 x double> %va to <4 x i64>
  %E = extractelement <4 x double> %va, i1 false
  %C = icmp eq <4 x i1> %m, splat (i1 true)
  store double %E, ptr @G.3, align 8
  store <4 x i1> %C, ptr poison, align 1
  ret <4 x i64> %v
}

declare <4 x i64> @vfptoui_v4i64_v4f64_unmasked(<4 x double>, i32 zeroext)

declare <32 x i64> @vfptoui_v32i64_v32f64(<32 x double>, <32 x i1>, i32 zeroext)

declare <32 x i64> @vfptoui_v32i64_v32f64_unmasked(<32 x double>, i32 zeroext)

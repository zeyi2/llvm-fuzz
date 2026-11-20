; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+d,+zfh,+v,+zbb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <4 x i32> zeroinitializer
@G.2 = global <16 x i1> splat (i1 true)

define <2 x half> @select_v2f16(i1 zeroext %c, <2 x half> %a, <2 x half> %b) {
  %LGV1 = load <4 x i32>, ptr @G.1, align 16
  %B = lshr <4 x i32> splat (i32 -2147483648), %LGV1
  %v = select i1 %c, <2 x half> %a, <2 x half> %b
  store <4 x i32> %B, ptr poison, align 16
  ret <2 x half> %v
}

declare <2 x half> @selectcc_v2f16(half, half, <2 x half>, <2 x half>)

declare <4 x half> @select_v4f16(i1 zeroext, <4 x half>, <4 x half>)

declare <4 x half> @selectcc_v4f16(half, half, <4 x half>, <4 x half>)

declare <8 x half> @select_v8f16(i1 zeroext, <8 x half>, <8 x half>)

declare <8 x half> @selectcc_v8f16(half, half, <8 x half>, <8 x half>)

declare <16 x half> @select_v16f16(i1 zeroext, <16 x half>, <16 x half>)

define <16 x half> @selectcc_v16f16(half %a, half %b, <16 x half> %c, <16 x half> %d) {
  %cmp = fcmp oeq half %a, %b
  %v = select i1 %cmp, <16 x half> %c, <16 x half> %d
  %C = icmp uge i1 %cmp, %cmp
  store i1 %C, ptr @G, align 1
  ret <16 x half> %v
}

declare <2 x float> @select_v2f32(i1 zeroext, <2 x float>, <2 x float>)

declare <2 x float> @selectcc_v2f32(float, float, <2 x float>, <2 x float>)

declare <4 x float> @select_v4f32(i1 zeroext, <4 x float>, <4 x float>)

declare <4 x float> @selectcc_v4f32(float, float, <4 x float>, <4 x float>)

declare <8 x float> @select_v8f32(i1 zeroext, <8 x float>, <8 x float>)

declare <8 x float> @selectcc_v8f32(float, float, <8 x float>, <8 x float>)

define <16 x float> @select_v16f32(i1 zeroext %c, <16 x float> %a, <16 x float> %b) {
  %v = select i1 %c, <16 x float> %a, <16 x float> %b
  %C = fcmp ogt <16 x float> %v, %b
  store <16 x i1> %C, ptr @G.2, align 2
  ret <16 x float> %v
}

declare <16 x float> @selectcc_v16f32(float, float, <16 x float>, <16 x float>)

declare <2 x double> @select_v2f64(i1 zeroext, <2 x double>, <2 x double>)

declare <2 x double> @selectcc_v2f64(double, double, <2 x double>, <2 x double>)

declare <4 x double> @select_v4f64(i1 zeroext, <4 x double>, <4 x double>)

declare <4 x double> @selectcc_v4f64(double, double, <4 x double>, <4 x double>)

declare <8 x double> @select_v8f64(i1 zeroext, <8 x double>, <8 x double>)

declare <8 x double> @selectcc_v8f64(double, double, <8 x double>, <8 x double>)

declare <16 x double> @select_v16f64(i1 zeroext, <16 x double>, <16 x double>)

declare <16 x double> @selectcc_v16f64(double, double, <16 x double>, <16 x double>)

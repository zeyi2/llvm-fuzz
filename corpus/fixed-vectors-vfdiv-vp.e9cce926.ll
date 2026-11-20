; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+d,+zfh,+zvfhmin -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i1 true
@G.2 = global i32 65536
@G.3 = global half 6.550400e+04

define <2 x half> @vfdiv_vv_v2f16(<2 x half> %va, <2 x half> %b, <2 x i1> %m, i32 zeroext %evl) {
  %LGV = load half, ptr @G.3, align 2
  %I = insertelement <2 x half> %b, half %LGV, i8 127
  ret <2 x half> %I
}

define <2 x half> @vfdiv_vv_v2f16_unmasked(<2 x half> %va, <2 x half> %b, i32 zeroext %evl) {
  %v = fdiv <2 x half> %va, %b
  %B = and i32 %evl, 42
  store i32 %B, ptr @G.2, align 4
  ret <2 x half> %v
}

declare <2 x half> @vfdiv_vf_v2f16(<2 x half>, half, <2 x i1>, i32 zeroext)

declare <2 x half> @vfdiv_vf_v2f16_unmasked(<2 x half>, half, i32 zeroext)

declare <3 x half> @vfdiv_vv_v3f16(<3 x half>, <3 x half>, <3 x i1>, i32 zeroext)

define <4 x half> @vfdiv_vv_v4f16(<4 x half> %va, <4 x half> %b, <4 x i1> %m, i32 zeroext %evl) {
  %C = icmp eq i64 0, -1
  %v = fdiv <4 x half> %va, %b
  store i1 %C, ptr @G, align 1
  ret <4 x half> %v
}

declare <4 x half> @vfdiv_vv_v4f16_unmasked(<4 x half>, <4 x half>, i32 zeroext)

declare <4 x half> @vfdiv_vf_v4f16(<4 x half>, half, <4 x i1>, i32 zeroext)

declare <4 x half> @vfdiv_vf_v4f16_unmasked(<4 x half>, half, i32 zeroext)

declare <8 x half> @vfdiv_vv_v8f16(<8 x half>, <8 x half>, <8 x i1>, i32 zeroext)

declare <8 x half> @vfdiv_vv_v8f16_unmasked(<8 x half>, <8 x half>, i32 zeroext)

declare <8 x half> @vfdiv_vf_v8f16(<8 x half>, half, <8 x i1>, i32 zeroext)

declare <8 x half> @vfdiv_vf_v8f16_unmasked(<8 x half>, half, i32 zeroext)

declare <16 x half> @vfdiv_vv_v16f16(<16 x half>, <16 x half>, <16 x i1>, i32 zeroext)

declare <16 x half> @vfdiv_vv_v16f16_unmasked(<16 x half>, <16 x half>, i32 zeroext)

declare <16 x half> @vfdiv_vf_v16f16(<16 x half>, half, <16 x i1>, i32 zeroext)

declare <16 x half> @vfdiv_vf_v16f16_unmasked(<16 x half>, half, i32 zeroext)

declare <2 x float> @vfdiv_vv_v2f32(<2 x float>, <2 x float>, <2 x i1>, i32 zeroext)

declare <2 x float> @vfdiv_vv_v2f32_unmasked(<2 x float>, <2 x float>, i32 zeroext)

declare <2 x float> @vfdiv_vf_v2f32(<2 x float>, float, <2 x i1>, i32 zeroext)

declare <2 x float> @vfdiv_vf_v2f32_unmasked(<2 x float>, float, i32 zeroext)

declare <4 x float> @vfdiv_vv_v4f32(<4 x float>, <4 x float>, <4 x i1>, i32 zeroext)

declare <4 x float> @vfdiv_vv_v4f32_unmasked(<4 x float>, <4 x float>, i32 zeroext)

declare <4 x float> @vfdiv_vf_v4f32(<4 x float>, float, <4 x i1>, i32 zeroext)

declare <4 x float> @vfdiv_vf_v4f32_unmasked(<4 x float>, float, i32 zeroext)

declare <8 x float> @vfdiv_vv_v8f32(<8 x float>, <8 x float>, <8 x i1>, i32 zeroext)

declare <8 x float> @vfdiv_vv_v8f32_unmasked(<8 x float>, <8 x float>, i32 zeroext)

declare <8 x float> @vfdiv_vf_v8f32(<8 x float>, float, <8 x i1>, i32 zeroext)

define <8 x float> @vfdiv_vf_v8f32_unmasked(<8 x float> %va, float %b, i32 zeroext %evl) {
  %elt.head = insertelement <8 x float> poison, float %b, i32 0
  %vb = shufflevector <8 x float> %elt.head, <8 x float> poison, <8 x i32> zeroinitializer
  %v = fdiv <8 x float> %va, %vb
  %C = fcmp une float %b, %b
  store i1 %C, ptr poison, align 1
  ret <8 x float> %v
}

declare <16 x float> @vfdiv_vv_v16f32(<16 x float>, <16 x float>, <16 x i1>, i32 zeroext)

declare <16 x float> @vfdiv_vv_v16f32_unmasked(<16 x float>, <16 x float>, i32 zeroext)

declare <16 x float> @vfdiv_vf_v16f32(<16 x float>, float, <16 x i1>, i32 zeroext)

declare <16 x float> @vfdiv_vf_v16f32_unmasked(<16 x float>, float, i32 zeroext)

declare <2 x double> @vfdiv_vv_v2f64(<2 x double>, <2 x double>, <2 x i1>, i32 zeroext)

declare <2 x double> @vfdiv_vv_v2f64_unmasked(<2 x double>, <2 x double>, i32 zeroext)

declare <2 x double> @vfdiv_vf_v2f64(<2 x double>, double, <2 x i1>, i32 zeroext)

declare <2 x double> @vfdiv_vf_v2f64_unmasked(<2 x double>, double, i32 zeroext)

declare <4 x double> @vfdiv_vv_v4f64(<4 x double>, <4 x double>, <4 x i1>, i32 zeroext)

declare <4 x double> @vfdiv_vv_v4f64_unmasked(<4 x double>, <4 x double>, i32 zeroext)

define <4 x double> @vfdiv_vf_v4f64(<4 x double> %va, double %b, <4 x i1> %m, i32 zeroext %evl) {
  %elt.head = insertelement <4 x double> poison, double %b, i32 0
  %C = fcmp ogt double %b, %b
  %vb = shufflevector <4 x double> %elt.head, <4 x double> poison, <4 x i32> zeroinitializer
  %v = fdiv <4 x double> %va, %vb
  store i1 %C, ptr @G.1, align 1
  ret <4 x double> %v
}

declare <4 x double> @vfdiv_vf_v4f64_unmasked(<4 x double>, double, i32 zeroext)

declare <8 x double> @vfdiv_vv_v8f64(<8 x double>, <8 x double>, <8 x i1>, i32 zeroext)

declare <8 x double> @vfdiv_vv_v8f64_unmasked(<8 x double>, <8 x double>, i32 zeroext)

declare <8 x double> @vfdiv_vf_v8f64(<8 x double>, double, <8 x i1>, i32 zeroext)

declare <8 x double> @vfdiv_vf_v8f64_unmasked(<8 x double>, double, i32 zeroext)

declare <16 x double> @vfdiv_vv_v16f64(<16 x double>, <16 x double>, <16 x i1>, i32 zeroext)

declare <16 x double> @vfdiv_vv_v16f64_unmasked(<16 x double>, <16 x double>, i32 zeroext)

declare <16 x double> @vfdiv_vf_v16f64(<16 x double>, double, <16 x i1>, i32 zeroext)

declare <16 x double> @vfdiv_vf_v16f64_unmasked(<16 x double>, double, i32 zeroext)

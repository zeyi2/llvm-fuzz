; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+d,+zvfh,+v,+m -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 0
@G.1 = global i1 true
@G.2 = global i1 true
@G.3 = global <2 x half> splat (half +qnan)
@G.4 = global i1 true
@G.5 = global <2 x half> splat (half 4.200000e+01)
@G.6 = global bfloat 0.000000e+00

declare <2 x bfloat> @vfneg_vv_v2bf16(<2 x bfloat>, <2 x i1>, i32 zeroext)

define <2 x bfloat> @vfneg_vv_v2bf16_unmasked(<2 x bfloat> %va, i32 zeroext %evl) {
  %LGV = load bfloat, ptr @G.6, align 2
  %v = fneg <2 x bfloat> %va
  %I = insertelement <2 x bfloat> %v, bfloat %LGV, i64 -9223372036854775808
  ret <2 x bfloat> %I
}

declare <4 x bfloat> @vfneg_vv_v4bf16(<4 x bfloat>, <4 x i1>, i32 zeroext)

declare <4 x bfloat> @vfneg_vv_v4bf16_unmasked(<4 x bfloat>, i32 zeroext)

declare <8 x bfloat> @vfneg_vv_v8bf16(<8 x bfloat>, <8 x i1>, i32 zeroext)

declare <8 x bfloat> @vfneg_vv_v8bf16_unmasked(<8 x bfloat>, i32 zeroext)

declare <16 x bfloat> @vfneg_vv_v16bf16(<16 x bfloat>, <16 x i1>, i32 zeroext)

define <16 x bfloat> @vfneg_vv_v16bf16_unmasked(<16 x bfloat> %va, i32 zeroext %evl) {
  %LGV = load i128, ptr @G, align 4
  %v = fneg <16 x bfloat> %va
  switch i128 %LGV, label %SW_D [
    i128 8819067620077334910, label %SW_C
    i128 9080729894826100005, label %SW_C1
    i128 3796508946803098757, label %SW_C2
  ]

BB:                                               ; preds = %SW_C2, %SW_C, %SW_D
  ret <16 x bfloat> %v

SW_D:                                             ; preds = %SW_D, %0
  %LGV3 = load i1, ptr @G.1, align 1
  br i1 %LGV3, label %SW_D, label %BB

SW_C:                                             ; preds = %SW_C, %0
  %LGV4 = load i1, ptr @G.2, align 1
  br i1 %LGV4, label %SW_C, label %BB

SW_C1:                                            ; preds = %0
  ret <16 x bfloat> splat (bfloat +qnan)

SW_C2:                                            ; preds = %0
  br label %BB
}

declare <2 x half> @vfneg_vv_v2f16(<2 x half>, <2 x i1>, i32 zeroext)

define <2 x half> @vfneg_vv_v2f16_unmasked(<2 x half> %va, i32 zeroext %evl) {
  %A14 = alloca i1, align 1
  store i1 false, ptr %A14, align 1
  %A11 = alloca i1, align 1
  store i1 true, ptr %A11, align 1
  %A = alloca i128, align 8
  store i128 170141183460469231731687303715884105727, ptr %A, align 4
  %LGV = load i128, ptr @G, align 4
  %L = load i128, ptr %A, align 4
  switch i128 %L, label %SW_D [
    i128 7787578821911498436, label %SW_C
    i128 6199520216258541822, label %SW_C1
    i128 15186350754199806597, label %SW_C2
    i128 5044765262109110299, label %SW_C3
    i128 5923190343088326080, label %SW_C4
    i128 5538446266707684039, label %SW_C5
    i128 17830893056024175293, label %SW_C6
    i128 3811024393403591235, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C6, %SW_C4, %SW_C3, %SW_C2, %SW_C1, %SW_D
  %v = fneg <2 x half> %va
  ret <2 x half> %v

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %LGV8 = load <2 x half>, ptr @G.3, align 4
  ret <2 x half> %LGV8

SW_C1:                                            ; preds = %SW_C1, %0
  %LGV9 = load i1, ptr @G.4, align 1
  br i1 %LGV9, label %BB, label %SW_C1

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %SW_C4, %0
  %LGV10 = load i1, ptr @G.4, align 1
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %BB, label %SW_C4

SW_C5:                                            ; preds = %0
  %LGV13 = load <2 x half>, ptr @G.5, align 4
  ret <2 x half> %LGV13

SW_C6:                                            ; preds = %SW_C6, %0
  %L15 = load i1, ptr %A14, align 1
  br i1 %L15, label %SW_C6, label %BB

SW_C7:                                            ; preds = %0
  br label %BB
}

declare <4 x half> @vfneg_vv_v4f16(<4 x half>, <4 x i1>, i32 zeroext)

declare <4 x half> @vfneg_vv_v4f16_unmasked(<4 x half>, i32 zeroext)

declare <8 x half> @vfneg_vv_v8f16(<8 x half>, <8 x i1>, i32 zeroext)

declare <8 x half> @vfneg_vv_v8f16_unmasked(<8 x half>, i32 zeroext)

declare <16 x half> @vfneg_vv_v16f16(<16 x half>, <16 x i1>, i32 zeroext)

declare <16 x half> @vfneg_vv_v16f16_unmasked(<16 x half>, i32 zeroext)

declare <2 x float> @vfneg_vv_v2f32(<2 x float>, <2 x i1>, i32 zeroext)

declare <2 x float> @vfneg_vv_v2f32_unmasked(<2 x float>, i32 zeroext)

declare <4 x float> @vfneg_vv_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

declare <4 x float> @vfneg_vv_v4f32_unmasked(<4 x float>, i32 zeroext)

declare <8 x float> @vfneg_vv_v8f32(<8 x float>, <8 x i1>, i32 zeroext)

declare <8 x float> @vfneg_vv_v8f32_unmasked(<8 x float>, i32 zeroext)

declare <16 x float> @vfneg_vv_v16f32(<16 x float>, <16 x i1>, i32 zeroext)

declare <16 x float> @vfneg_vv_v16f32_unmasked(<16 x float>, i32 zeroext)

declare <2 x double> @vfneg_vv_v2f64(<2 x double>, <2 x i1>, i32 zeroext)

declare <2 x double> @vfneg_vv_v2f64_unmasked(<2 x double>, i32 zeroext)

declare <4 x double> @vfneg_vv_v4f64(<4 x double>, <4 x i1>, i32 zeroext)

declare <4 x double> @vfneg_vv_v4f64_unmasked(<4 x double>, i32 zeroext)

declare <8 x double> @vfneg_vv_v8f64(<8 x double>, <8 x i1>, i32 zeroext)

declare <8 x double> @vfneg_vv_v8f64_unmasked(<8 x double>, i32 zeroext)

declare <15 x double> @vfneg_vv_v15f64(<15 x double>, <15 x i1>, i32 zeroext)

declare <15 x double> @vfneg_vv_v15f64_unmasked(<15 x double>, i32 zeroext)

declare <16 x double> @vfneg_vv_v16f64(<16 x double>, <16 x i1>, i32 zeroext)

declare <16 x double> @vfneg_vv_v16f64_unmasked(<16 x double>, i32 zeroext)

declare <32 x double> @vfneg_vv_v32f64(<32 x double>, <32 x i1>, i32 zeroext)

declare <32 x double> @vfneg_vv_v32f64_unmasked(<32 x double>, i32 zeroext)

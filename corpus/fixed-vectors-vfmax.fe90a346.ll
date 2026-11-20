; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+d,+zfh,+zvfh,+zfbfmin,+zvfbfmin,+a -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 -1
@G.1 = global i1 true
@G.2 = global <4 x bfloat> splat (bfloat 9.183550e-41)
@G.3 = global <4 x i1> zeroinitializer

declare <2 x bfloat> @vfmax_v2bf16_vv(<2 x bfloat>, <2 x bfloat>)

declare <2 x bfloat> @vfmax_v2bf16_vf(<2 x bfloat>, bfloat)

declare <2 x bfloat> @vfmax_v2bf16_fv(<2 x bfloat>, bfloat)

declare <4 x bfloat> @vfmax_v4bf16_vv(<4 x bfloat>, <4 x bfloat>)

define <4 x bfloat> @vfmax_v4bf16_vf(<4 x bfloat> %a, bfloat %b) {
  %LGV = load <4 x bfloat>, ptr @G.2, align 8
  %head = insertelement <4 x bfloat> poison, bfloat %b, i32 0
  %splat = shufflevector <4 x bfloat> %head, <4 x bfloat> poison, <4 x i32> zeroinitializer
  %C = fcmp one <4 x bfloat> %splat, %LGV
  %v = call <4 x bfloat> @llvm.maxnum.v4bf16(<4 x bfloat> %a, <4 x bfloat> %splat)
  store <4 x i1> %C, ptr @G.3, align 1
  ret <4 x bfloat> %v
}

declare <4 x bfloat> @vfmax_v4bf16_fv(<4 x bfloat>, bfloat)

declare <8 x bfloat> @vfmax_v8bf16_vv(<8 x bfloat>, <8 x bfloat>)

declare <8 x bfloat> @vfmax_v8bf16_vf(<8 x bfloat>, bfloat)

declare <8 x bfloat> @vfmax_v8bf16_fv(<8 x bfloat>, bfloat)

define <16 x bfloat> @vfmax_v16bf16_vv(<16 x bfloat> %a, <16 x bfloat> %b) {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i128, ptr @G, align 4
  %v = call <16 x bfloat> @llvm.maxnum.v16bf16(<16 x bfloat> %a, <16 x bfloat> %b)
  switch i128 %LGV, label %SW_D [
    i128 8386452013993504923, label %SW_C
    i128 10526052227008719778, label %SW_C1
    i128 18312153354925374545, label %SW_C2
    i128 7440468498508718209, label %SW_C3
    i128 10887494140509113269, label %SW_C4
    i128 12685676347150212170, label %SW_C5
    i128 1105775691482431858, label %SW_C6
  ]

BB:                                               ; preds = %SW_C6, %SW_C3, %SW_C2, %SW_C1, %SW_C
  ret <16 x bfloat> %v

SW_D:                                             ; preds = %0
  ret <16 x bfloat> splat (bfloat +inf)

SW_C:                                             ; preds = %SW_C, %0
  %LGV7 = load i1, ptr @G.1, align 1
  br i1 %LGV7, label %SW_C, label %BB

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  ret <16 x bfloat> %v

SW_C5:                                            ; preds = %0
  ret <16 x bfloat> splat (bfloat 4.200000e+01)

SW_C6:                                            ; preds = %SW_C6, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %SW_C6
}

declare <16 x bfloat> @vfmax_v16bf16_vf(<16 x bfloat>, bfloat)

declare <16 x bfloat> @vfmax_v16bf16_fv(<16 x bfloat>, bfloat)

declare <2 x half> @vfmax_v2f16_vv(<2 x half>, <2 x half>)

declare <2 x half> @vfmax_v2f16_vf(<2 x half>, half)

declare <2 x half> @vfmax_v2f16_fv(<2 x half>, half)

declare <4 x half> @vfmax_v4f16_vv(<4 x half>, <4 x half>)

declare <4 x half> @vfmax_v4f16_vf(<4 x half>, half)

declare <4 x half> @vfmax_v4f16_fv(<4 x half>, half)

declare <8 x half> @vfmax_v8f16_vv(<8 x half>, <8 x half>)

declare <8 x half> @vfmax_v8f16_vf(<8 x half>, half)

declare <8 x half> @vfmax_v8f16_fv(<8 x half>, half)

declare <16 x half> @vfmax_v16f16_vv(<16 x half>, <16 x half>)

declare <16 x half> @vfmax_v16f16_vf(<16 x half>, half)

declare <16 x half> @vfmax_v16f16_fv(<16 x half>, half)

declare <2 x float> @vfmax_v2f32_vv(<2 x float>, <2 x float>)

declare <2 x float> @vfmax_v2f32_vf(<2 x float>, float)

declare <2 x float> @vfmax_v2f32_fv(<2 x float>, float)

declare <4 x float> @vfmax_v4f32_vv(<4 x float>, <4 x float>)

declare <4 x float> @vfmax_v4f32_vf(<4 x float>, float)

declare <4 x float> @vfmax_v4f32_fv(<4 x float>, float)

declare <8 x float> @vfmax_v8f32_vv(<8 x float>, <8 x float>)

declare <8 x float> @vfmax_v8f32_vf(<8 x float>, float)

declare <8 x float> @vfmax_v8f32_fv(<8 x float>, float)

declare <16 x float> @vfmax_v16f32_vv(<16 x float>, <16 x float>)

declare <16 x float> @vfmax_v16f32_vf(<16 x float>, float)

declare <16 x float> @vfmax_v16f32_fv(<16 x float>, float)

declare <2 x double> @vfmax_v2f64_vv(<2 x double>, <2 x double>)

declare <2 x double> @vfmax_v2f64_vf(<2 x double>, double)

declare <2 x double> @vfmax_v2f64_fv(<2 x double>, double)

declare <4 x double> @vfmax_v4f64_vv(<4 x double>, <4 x double>)

declare <4 x double> @vfmax_v4f64_vf(<4 x double>, double)

declare <4 x double> @vfmax_v4f64_fv(<4 x double>, double)

declare <8 x double> @vfmax_v8f64_vv(<8 x double>, <8 x double>)

declare <8 x double> @vfmax_v8f64_vf(<8 x double>, double)

declare <8 x double> @vfmax_v8f64_fv(<8 x double>, double)

declare <16 x double> @vfmax_v16f64_vv(<16 x double>, <16 x double>)

declare <16 x double> @vfmax_v16f64_vf(<16 x double>, double)

declare <16 x double> @vfmax_v16f64_fv(<16 x double>, double)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x bfloat> @llvm.maxnum.v16bf16(<16 x bfloat>, <16 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x half> @llvm.maxnum.v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.maxnum.v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x double> @llvm.maxnum.v16f64(<16 x double>, <16 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x bfloat> @llvm.maxnum.v2bf16(<2 x bfloat>, <2 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x half> @llvm.maxnum.v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.maxnum.v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.maxnum.v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x bfloat> @llvm.maxnum.v4bf16(<4 x bfloat>, <4 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x half> @llvm.maxnum.v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.maxnum.v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @llvm.maxnum.v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x bfloat> @llvm.maxnum.v8bf16(<8 x bfloat>, <8 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x half> @llvm.maxnum.v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.maxnum.v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x double> @llvm.maxnum.v8f64(<8 x double>, <8 x double>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

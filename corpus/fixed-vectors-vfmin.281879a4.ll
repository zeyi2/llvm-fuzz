; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+d,+zfh,+zvfhmin,+zfbfmin,+zvfbfmin -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 -2147483648)
@G.1 = global i1 true
@G.2 = global i1 true
@G.3 = global <2 x i1> splat (i1 true)

declare <2 x bfloat> @vfmin_v2bf16_vv(<2 x bfloat>, <2 x bfloat>)

declare <2 x bfloat> @vfmin_v2bf16_vf(<2 x bfloat>, bfloat)

declare <2 x bfloat> @vfmin_v2bf16_fv(<2 x bfloat>, bfloat)

declare <4 x bfloat> @vfmin_v4bf16_vv(<4 x bfloat>, <4 x bfloat>)

declare <4 x bfloat> @vfmin_v4bf16_vf(<4 x bfloat>, bfloat)

declare <4 x bfloat> @vfmin_v4bf16_fv(<4 x bfloat>, bfloat)

declare <8 x bfloat> @vfmin_v8bf16_vv(<8 x bfloat>, <8 x bfloat>)

define <8 x bfloat> @vfmin_v8bf16_vf(<8 x bfloat> %a, bfloat %b) {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV = load <4 x i32>, ptr @G, align 16
  %C = icmp slt <4 x i32> splat (i32 65536), %LGV
  %head = insertelement <8 x bfloat> poison, bfloat %b, i32 0
  %splat = shufflevector <8 x bfloat> %head, <8 x bfloat> poison, <8 x i32> zeroinitializer
  %v = call <8 x bfloat> @llvm.minnum.v8bf16(<8 x bfloat> %a, <8 x bfloat> %splat)
  store <4 x i1> %C, ptr %A, align 1
  ret <8 x bfloat> %v
}

declare <8 x bfloat> @vfmin_v8bf16_fv(<8 x bfloat>, bfloat)

declare <16 x bfloat> @vfmin_v16bf16_vv(<16 x bfloat>, <16 x bfloat>)

declare <16 x bfloat> @vfmin_v16bf16_vf(<16 x bfloat>, bfloat)

define <16 x bfloat> @vfmin_v16bf16_fv(<16 x bfloat> %a, bfloat %b) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %head = insertelement <16 x bfloat> poison, bfloat %b, i32 0
  %splat = shufflevector <16 x bfloat> %head, <16 x bfloat> poison, <16 x i32> zeroinitializer
  %C = fcmp une bfloat %b, 0.000000e+00
  %v = call <16 x bfloat> @llvm.minnum.v16bf16(<16 x bfloat> %splat, <16 x bfloat> %a)
  store i1 %C, ptr %A, align 1
  ret <16 x bfloat> %v
}

declare <2 x half> @vfmin_v2f16_vv(<2 x half>, <2 x half>)

define <2 x half> @vfmin_v2f16_vf(<2 x half> %a, half %b) {
  %A = alloca <2 x i1>, align 1
  store <2 x i1> poison, ptr %A, align 1
  %C = fcmp ule <2 x half> %a, splat (half 5.960460e-08)
  %head = insertelement <2 x half> poison, half %b, i32 0
  %splat = shufflevector <2 x half> %head, <2 x half> poison, <2 x i32> zeroinitializer
  %v = call <2 x half> @llvm.minnum.v2f16(<2 x half> %a, <2 x half> %splat)
  store <2 x i1> %C, ptr %A, align 1
  ret <2 x half> %v
}

define <2 x half> @vfmin_v2f16_fv(<2 x half> %a, half %b) {
  %head = insertelement <2 x half> poison, half %b, i32 0
  %splat = shufflevector <2 x half> %head, <2 x half> poison, <2 x i32> zeroinitializer
  %B = fmul <2 x half> %splat, %splat
  ret <2 x half> %B
}

declare <4 x half> @vfmin_v4f16_vv(<4 x half>, <4 x half>)

declare <4 x half> @vfmin_v4f16_vf(<4 x half>, half)

declare <4 x half> @vfmin_v4f16_fv(<4 x half>, half)

declare <8 x half> @vfmin_v8f16_vv(<8 x half>, <8 x half>)

declare <8 x half> @vfmin_v8f16_vf(<8 x half>, half)

declare <8 x half> @vfmin_v8f16_fv(<8 x half>, half)

declare <16 x half> @vfmin_v16f16_vv(<16 x half>, <16 x half>)

declare <16 x half> @vfmin_v16f16_vf(<16 x half>, half)

declare <16 x half> @vfmin_v16f16_fv(<16 x half>, half)

declare <2 x float> @vfmin_v2f32_vv(<2 x float>, <2 x float>)

declare <2 x float> @vfmin_v2f32_vf(<2 x float>, float)

define <2 x float> @vfmin_v2f32_fv(<2 x float> %a, float %b) {
  %head = insertelement <2 x float> poison, float %b, i32 0
  %splat = shufflevector <2 x float> %head, <2 x float> poison, <2 x i32> zeroinitializer
  %C = fcmp uge <2 x float> %head, splat (float +qnan)
  %v = call <2 x float> @llvm.minnum.v2f32(<2 x float> %splat, <2 x float> %a)
  store <2 x i1> %C, ptr @G.3, align 1
  ret <2 x float> %v
}

declare <4 x float> @vfmin_v4f32_vv(<4 x float>, <4 x float>)

declare <4 x float> @vfmin_v4f32_vf(<4 x float>, float)

declare <4 x float> @vfmin_v4f32_fv(<4 x float>, float)

declare <8 x float> @vfmin_v8f32_vv(<8 x float>, <8 x float>)

declare <8 x float> @vfmin_v8f32_vf(<8 x float>, float)

declare <8 x float> @vfmin_v8f32_fv(<8 x float>, float)

declare <16 x float> @vfmin_v16f32_vv(<16 x float>, <16 x float>)

declare <16 x float> @vfmin_v16f32_vf(<16 x float>, float)

define <16 x float> @vfmin_v16f32_fv(<16 x float> %a, float %b) {
  %head = insertelement <16 x float> poison, float %b, i32 0
  %splat = shufflevector <16 x float> %head, <16 x float> poison, <16 x i32> zeroinitializer
  %v = call <16 x float> @llvm.minnum.v16f32(<16 x float> %splat, <16 x float> %a)
  %B = sub i1 true, false
  store i1 %B, ptr @G.1, align 1
  ret <16 x float> %v
}

declare <2 x double> @vfmin_v2f64_vv(<2 x double>, <2 x double>)

declare <2 x double> @vfmin_v2f64_vf(<2 x double>, double)

declare <2 x double> @vfmin_v2f64_fv(<2 x double>, double)

define <4 x double> @vfmin_v4f64_vv(<4 x double> %a, <4 x double> %b) {
  %LGV = load i1, ptr @G.1, align 1
  %C = icmp sge i1 true, %LGV
  %v = call <4 x double> @llvm.minnum.v4f64(<4 x double> %a, <4 x double> %b)
  store i1 %C, ptr @G.2, align 1
  ret <4 x double> %v
}

declare <4 x double> @vfmin_v4f64_vf(<4 x double>, double)

declare <4 x double> @vfmin_v4f64_fv(<4 x double>, double)

declare <8 x double> @vfmin_v8f64_vv(<8 x double>, <8 x double>)

declare <8 x double> @vfmin_v8f64_vf(<8 x double>, double)

declare <8 x double> @vfmin_v8f64_fv(<8 x double>, double)

declare <16 x double> @vfmin_v16f64_vv(<16 x double>, <16 x double>)

declare <16 x double> @vfmin_v16f64_vf(<16 x double>, double)

declare <16 x double> @vfmin_v16f64_fv(<16 x double>, double)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x bfloat> @llvm.minnum.v16bf16(<16 x bfloat>, <16 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x half> @llvm.minnum.v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.minnum.v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x double> @llvm.minnum.v16f64(<16 x double>, <16 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x bfloat> @llvm.minnum.v2bf16(<2 x bfloat>, <2 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x half> @llvm.minnum.v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.minnum.v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.minnum.v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x bfloat> @llvm.minnum.v4bf16(<4 x bfloat>, <4 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x half> @llvm.minnum.v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.minnum.v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @llvm.minnum.v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x bfloat> @llvm.minnum.v8bf16(<8 x bfloat>, <8 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x half> @llvm.minnum.v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.minnum.v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x double> @llvm.minnum.v8f64(<8 x double>, <8 x double>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

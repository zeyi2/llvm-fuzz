; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+d,+zvfh,+zfbfmin,+zvfbfmin -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 -1)

; Function Attrs: strictfp
declare <1 x bfloat> @vfadd_vv_v1bf16(<1 x bfloat>, <1 x bfloat>) #0

; Function Attrs: strictfp
declare <2 x bfloat> @vfadd_vv_v2bf16(<2 x bfloat>, <2 x bfloat>) #0

; Function Attrs: strictfp
declare <4 x bfloat> @vfadd_vv_v4bf16(<4 x bfloat>, <4 x bfloat>) #0

; Function Attrs: strictfp
declare <8 x bfloat> @vfadd_vv_v8bf16(<8 x bfloat>, <8 x bfloat>) #0

; Function Attrs: strictfp
declare <16 x bfloat> @vfadd_vv_v16bf16(<16 x bfloat>, <16 x bfloat>) #0

; Function Attrs: strictfp
declare <32 x bfloat> @vfadd_vv_v32bf16(<32 x bfloat>, <32 x bfloat>) #0

; Function Attrs: strictfp
declare <2 x half> @vfadd_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: strictfp
declare <2 x half> @vfadd_vf_v2f16(<2 x half>, half) #0

; Function Attrs: strictfp
declare <4 x half> @vfadd_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: strictfp
declare <4 x half> @vfadd_vf_v4f16(<4 x half>, half) #0

; Function Attrs: strictfp
declare <8 x half> @vfadd_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: strictfp
declare <8 x half> @vfadd_vf_v8f16(<8 x half>, half) #0

; Function Attrs: strictfp
declare <16 x half> @vfadd_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: strictfp
declare <16 x half> @vfadd_vf_v16f16(<16 x half>, half) #0

; Function Attrs: strictfp
declare <32 x half> @vfadd_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: strictfp
declare <32 x half> @vfadd_vf_v32f16(<32 x half>, half) #0

; Function Attrs: strictfp
declare <2 x float> @vfadd_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: strictfp
declare <2 x float> @vfadd_vf_v2f32(<2 x float>, float) #0

; Function Attrs: strictfp
declare <4 x float> @vfadd_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: strictfp
declare <4 x float> @vfadd_vf_v4f32(<4 x float>, float) #0

; Function Attrs: strictfp
declare <8 x float> @vfadd_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: strictfp
declare <8 x float> @vfadd_vf_v8f32(<8 x float>, float) #0

; Function Attrs: strictfp
declare <16 x float> @vfadd_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: strictfp
declare <16 x float> @vfadd_vf_v16f32(<16 x float>, float) #0

; Function Attrs: strictfp
declare <2 x double> @vfadd_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: strictfp
declare <2 x double> @vfadd_vf_v2f64(<2 x double>, double) #0

; Function Attrs: strictfp
declare <4 x double> @vfadd_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: strictfp
declare <4 x double> @vfadd_vf_v4f64(<4 x double>, double) #0

; Function Attrs: strictfp
declare <8 x double> @vfadd_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: strictfp
define <8 x double> @vfadd_vf_v8f64(<8 x double> %va, double %b) #0 {
  %LGV = load <8 x i8>, ptr @G, align 8
  %B = or <8 x i8> %LGV, splat (i8 1)
  %head = insertelement <8 x double> poison, double %b, i32 0
  %splat = shufflevector <8 x double> %head, <8 x double> poison, <8 x i32> zeroinitializer
  %vc = call <8 x double> @llvm.experimental.constrained.fadd.v8f64(<8 x double> %va, <8 x double> %splat, metadata !"round.dynamic", metadata !"fpexcept.ignore")
  store <8 x i8> %B, ptr poison, align 8
  ret <8 x double> %vc
}

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x bfloat> @llvm.experimental.constrained.fadd.v16bf16(<16 x bfloat>, <16 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.fadd.v16f16(<16 x half>, <16 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.fadd.v16f32(<16 x float>, <16 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x bfloat> @llvm.experimental.constrained.fadd.v1bf16(<1 x bfloat>, <1 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x bfloat> @llvm.experimental.constrained.fadd.v2bf16(<2 x bfloat>, <2 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.fadd.v2f16(<2 x half>, <2 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.fadd.v2f32(<2 x float>, <2 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.fadd.v2f64(<2 x double>, <2 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x bfloat> @llvm.experimental.constrained.fadd.v32bf16(<32 x bfloat>, <32 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x half> @llvm.experimental.constrained.fadd.v32f16(<32 x half>, <32 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x bfloat> @llvm.experimental.constrained.fadd.v4bf16(<4 x bfloat>, <4 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.fadd.v4f16(<4 x half>, <4 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.fadd.v4f32(<4 x float>, <4 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.fadd.v4f64(<4 x double>, <4 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x bfloat> @llvm.experimental.constrained.fadd.v8bf16(<8 x bfloat>, <8 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.fadd.v8f16(<8 x half>, <8 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.fadd.v8f32(<8 x float>, <8 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.fadd.v8f64(<8 x double>, <8 x double>, metadata, metadata) #1

attributes #0 = { strictfp }
attributes #1 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

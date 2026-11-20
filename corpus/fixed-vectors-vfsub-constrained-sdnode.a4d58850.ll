; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+d,+zfbfmin,+v -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double +inf
@G.1 = global i1 false
@G.2 = global i32 -1
@G.3 = global i32 0

; Function Attrs: strictfp
declare <1 x bfloat> @vfsub_vv_v1bf16(<1 x bfloat>, <1 x bfloat>) #0

; Function Attrs: strictfp
declare <2 x bfloat> @vfsub_vv_v2bf16(<2 x bfloat>, <2 x bfloat>) #0

; Function Attrs: strictfp
define <4 x bfloat> @vfsub_vv_v4bf16(<4 x bfloat> %va, <4 x bfloat> %vb) #0 {
entry:
  %LGV = load i32, ptr @G.2, align 4
  %B = sdiv i32 -2147483648, %LGV
  %vc = call <4 x bfloat> @llvm.experimental.constrained.fsub.v4bf16(<4 x bfloat> %va, <4 x bfloat> %vb, metadata !"round.dynamic", metadata !"fpexcept.ignore")
  store i32 %B, ptr @G.3, align 4
  ret <4 x bfloat> %vc
}

; Function Attrs: strictfp
declare <8 x bfloat> @vfsub_vv_v8bf16(<8 x bfloat>, <8 x bfloat>) #0

; Function Attrs: strictfp
declare <16 x bfloat> @vfsub_vv_v16bf16(<16 x bfloat>, <16 x bfloat>) #0

; Function Attrs: strictfp
declare <32 x bfloat> @vfsub_vv_v32bf16(<32 x bfloat>, <32 x bfloat>) #0

; Function Attrs: strictfp
declare <2 x half> @vfsub_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: strictfp
declare <2 x half> @vfsub_vf_v2f16(<2 x half>, half) #0

; Function Attrs: strictfp
declare <4 x half> @vfsub_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: strictfp
declare <4 x half> @vfsub_vf_v4f16(<4 x half>, half) #0

; Function Attrs: strictfp
declare <8 x half> @vfsub_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: strictfp
declare <8 x half> @vfsub_vf_v8f16(<8 x half>, half) #0

; Function Attrs: strictfp
declare <8 x half> @vfsub_fv_v8f16(<8 x half>, half) #0

; Function Attrs: strictfp
declare <16 x half> @vfsub_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: strictfp
declare <16 x half> @vfsub_vf_v16f16(<16 x half>, half) #0

; Function Attrs: strictfp
declare <32 x half> @vfsub_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: strictfp
declare <32 x half> @vfsub_vf_v32f16(<32 x half>, half) #0

; Function Attrs: strictfp
declare <2 x float> @vfsub_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: strictfp
declare <2 x float> @vfsub_vf_v2f32(<2 x float>, float) #0

; Function Attrs: strictfp
declare <4 x float> @vfsub_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: strictfp
declare <4 x float> @vfsub_vf_v4f32(<4 x float>, float) #0

; Function Attrs: strictfp
declare <8 x float> @vfsub_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: strictfp
declare <8 x float> @vfsub_vf_v8f32(<8 x float>, float) #0

; Function Attrs: strictfp
declare <8 x float> @vfsub_fv_v8f32(<8 x float>, float) #0

; Function Attrs: strictfp
declare <16 x float> @vfsub_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: strictfp
declare <16 x float> @vfsub_vf_v16f32(<16 x float>, float) #0

; Function Attrs: strictfp
declare <2 x double> @vfsub_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: strictfp
define <2 x double> @vfsub_vf_v2f64(<2 x double> %va, double %b) #0 {
  %LGV = load double, ptr @G, align 8
  %head = insertelement <2 x double> poison, double %b, i32 0
  %splat = shufflevector <2 x double> %head, <2 x double> poison, <2 x i32> zeroinitializer
  %vc = call <2 x double> @llvm.experimental.constrained.fsub.v2f64(<2 x double> %va, <2 x double> %splat, metadata !"round.dynamic", metadata !"fpexcept.ignore")
  %C = fcmp false double %b, %LGV
  store i1 %C, ptr @G.1, align 1
  ret <2 x double> %vc
}

; Function Attrs: strictfp
declare <4 x double> @vfsub_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: strictfp
declare <4 x double> @vfsub_vf_v4f64(<4 x double>, double) #0

; Function Attrs: strictfp
declare <8 x double> @vfsub_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: strictfp
declare <8 x double> @vfsub_vf_v8f64(<8 x double>, double) #0

; Function Attrs: strictfp
declare <8 x double> @vfsub_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x bfloat> @llvm.experimental.constrained.fsub.v16bf16(<16 x bfloat>, <16 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.fsub.v16f16(<16 x half>, <16 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.fsub.v16f32(<16 x float>, <16 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x bfloat> @llvm.experimental.constrained.fsub.v1bf16(<1 x bfloat>, <1 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x bfloat> @llvm.experimental.constrained.fsub.v2bf16(<2 x bfloat>, <2 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.fsub.v2f16(<2 x half>, <2 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.fsub.v2f32(<2 x float>, <2 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.fsub.v2f64(<2 x double>, <2 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x bfloat> @llvm.experimental.constrained.fsub.v32bf16(<32 x bfloat>, <32 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x half> @llvm.experimental.constrained.fsub.v32f16(<32 x half>, <32 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x bfloat> @llvm.experimental.constrained.fsub.v4bf16(<4 x bfloat>, <4 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.fsub.v4f16(<4 x half>, <4 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.fsub.v4f32(<4 x float>, <4 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.fsub.v4f64(<4 x double>, <4 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x bfloat> @llvm.experimental.constrained.fsub.v8bf16(<8 x bfloat>, <8 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.fsub.v8f16(<8 x half>, <8 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.fsub.v8f32(<8 x float>, <8 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.fsub.v8f64(<8 x double>, <8 x double>, metadata, metadata) #1

attributes #0 = { strictfp }
attributes #1 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

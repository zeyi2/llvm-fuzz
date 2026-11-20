; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+d,+zvfh -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true

; Function Attrs: strictfp
declare <2 x half> @vfmsub_vv_v2f16(<2 x half>, <2 x half>, <2 x half>) #0

; Function Attrs: strictfp
declare <2 x half> @vfmsub_vf_v2f16(<2 x half>, <2 x half>, half) #0

; Function Attrs: strictfp
declare <4 x half> @vfmsub_vv_v4f16(<4 x half>, <4 x half>, <4 x half>) #0

; Function Attrs: strictfp
declare <4 x half> @vfmsub_vf_v4f16(<4 x half>, <4 x half>, half) #0

; Function Attrs: strictfp
declare <8 x half> @vfmsub_vv_v8f16(<8 x half>, <8 x half>, <8 x half>) #0

; Function Attrs: strictfp
declare <8 x half> @vfmsub_vf_v8f16(<8 x half>, <8 x half>, half) #0

; Function Attrs: strictfp
declare <16 x half> @vfmsub_vv_v16f16(<16 x half>, <16 x half>, <16 x half>) #0

; Function Attrs: strictfp
declare <16 x half> @vfmsub_vf_v16f16(<16 x half>, <16 x half>, half) #0

; Function Attrs: strictfp
declare <32 x half> @vfmsub_vv_v32f16(<32 x half>, <32 x half>, <32 x half>) #0

; Function Attrs: strictfp
declare <32 x half> @vfmsub_vf_v32f16(<32 x half>, <32 x half>, half) #0

; Function Attrs: strictfp
declare <2 x float> @vfmsub_vv_v2f32(<2 x float>, <2 x float>, <2 x float>) #0

; Function Attrs: strictfp
declare <2 x float> @vfmsub_vf_v2f32(<2 x float>, <2 x float>, float) #0

; Function Attrs: strictfp
declare <4 x float> @vfmsub_vv_v4f32(<4 x float>, <4 x float>, <4 x float>) #0

; Function Attrs: strictfp
declare <4 x float> @vfmsub_vf_v4f32(<4 x float>, <4 x float>, float) #0

; Function Attrs: strictfp
declare <8 x float> @vfmsub_vv_v8f32(<8 x float>, <8 x float>, <8 x float>) #0

; Function Attrs: strictfp
declare <8 x float> @vfmsub_vf_v8f32(<8 x float>, <8 x float>, float) #0

; Function Attrs: strictfp
declare <16 x float> @vfmsub_vv_v16f32(<16 x float>, <16 x float>, <16 x float>) #0

; Function Attrs: strictfp
declare <16 x float> @vfmsub_vf_v16f32(<16 x float>, <16 x float>, float) #0

; Function Attrs: strictfp
define <2 x double> @vfmsub_vv_v2f64(<2 x double> %va, <2 x double> %vb, <2 x double> %vc) #0 {
  %LGV = load i1, ptr @G, align 1
  %neg = fneg <2 x double> %vb
  %vd = call <2 x double> @llvm.experimental.constrained.fma.v2f64(<2 x double> %va, <2 x double> %vc, <2 x double> %neg, metadata !"round.dynamic", metadata !"fpexcept.strict")
  %B = add i1 %LGV, false
  store i1 %B, ptr @G, align 1
  ret <2 x double> %vd
}

; Function Attrs: strictfp
declare <2 x double> @vfmsub_vf_v2f64(<2 x double>, <2 x double>, double) #0

; Function Attrs: strictfp
declare <4 x double> @vfmsub_vv_v4f64(<4 x double>, <4 x double>, <4 x double>) #0

; Function Attrs: strictfp
declare <4 x double> @vfmsub_vf_v4f64(<4 x double>, <4 x double>, double) #0

; Function Attrs: strictfp
declare <8 x double> @vfmsub_vv_v8f64(<8 x double>, <8 x double>, <8 x double>) #0

; Function Attrs: strictfp
declare <8 x double> @vfmsub_vf_v8f64(<8 x double>, <8 x double>, double) #0

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.fma.v16f16(<16 x half>, <16 x half>, <16 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.fma.v16f32(<16 x float>, <16 x float>, <16 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.fma.v2f16(<2 x half>, <2 x half>, <2 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.fma.v2f32(<2 x float>, <2 x float>, <2 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.fma.v2f64(<2 x double>, <2 x double>, <2 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x half> @llvm.experimental.constrained.fma.v32f16(<32 x half>, <32 x half>, <32 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.fma.v4f16(<4 x half>, <4 x half>, <4 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.fma.v4f32(<4 x float>, <4 x float>, <4 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.fma.v4f64(<4 x double>, <4 x double>, <4 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.fma.v8f16(<8 x half>, <8 x half>, <8 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.fma.v8f32(<8 x float>, <8 x float>, <8 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.fma.v8f64(<8 x double>, <8 x double>, <8 x double>, metadata, metadata) #1

attributes #0 = { strictfp }
attributes #1 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

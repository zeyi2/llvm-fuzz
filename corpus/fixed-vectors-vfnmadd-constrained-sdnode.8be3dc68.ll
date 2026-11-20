; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+d,+zvfh -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 42
@G.1 = global i64 -1

; Function Attrs: strictfp
declare <2 x half> @vfnmsub_vv_v2f16(<2 x half>, <2 x half>, <2 x half>) #0

; Function Attrs: strictfp
declare <2 x half> @vfnmsub_vf_v2f16(<2 x half>, <2 x half>, half) #0

; Function Attrs: strictfp
declare <4 x half> @vfnmsub_vv_v4f16(<4 x half>, <4 x half>, <4 x half>) #0

; Function Attrs: strictfp
declare <4 x half> @vfnmsub_vf_v4f16(<4 x half>, <4 x half>, half) #0

; Function Attrs: strictfp
declare <8 x half> @vfnmsub_vv_v8f16(<8 x half>, <8 x half>, <8 x half>) #0

; Function Attrs: strictfp
declare <8 x half> @vfnmsub_vf_v8f16(<8 x half>, <8 x half>, half) #0

; Function Attrs: strictfp
declare <16 x half> @vfnmsub_vv_v16f16(<16 x half>, <16 x half>, <16 x half>) #0

; Function Attrs: strictfp
declare <16 x half> @vfnmsub_vf_v16f16(<16 x half>, <16 x half>, half) #0

; Function Attrs: strictfp
declare <32 x half> @vfnmsub_vv_v32f16(<32 x half>, <32 x half>, <32 x half>) #0

; Function Attrs: strictfp
declare <32 x half> @vfnmsub_vf_v32f16(<32 x half>, <32 x half>, half) #0

; Function Attrs: strictfp
declare <2 x float> @vfnmsub_vv_v2f32(<2 x float>, <2 x float>, <2 x float>) #0

; Function Attrs: strictfp
declare <2 x float> @vfnmsub_vf_v2f32(<2 x float>, <2 x float>, float) #0

; Function Attrs: strictfp
declare <4 x float> @vfnmsub_vv_v4f32(<4 x float>, <4 x float>, <4 x float>) #0

; Function Attrs: strictfp
declare <4 x float> @vfnmsub_vf_v4f32(<4 x float>, <4 x float>, float) #0

; Function Attrs: strictfp
declare <8 x float> @vfnmsub_vv_v8f32(<8 x float>, <8 x float>, <8 x float>) #0

; Function Attrs: strictfp
declare <8 x float> @vfnmsub_vf_v8f32(<8 x float>, <8 x float>, float) #0

; Function Attrs: strictfp
declare <16 x float> @vfnmsub_vv_v16f32(<16 x float>, <16 x float>, <16 x float>) #0

; Function Attrs: strictfp
define <16 x float> @vfnmsub_vf_v16f32(<16 x float> %va, <16 x float> %vb, float %c) #0 {
  %LGV1 = load i64, ptr @G.1, align 4
  %LGV = load i64, ptr @G, align 4
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C2 = icmp sgt i64 %LGV, %LGV1
  %head = insertelement <16 x float> poison, float %c, i32 0
  %splat = shufflevector <16 x float> %head, <16 x float> poison, <16 x i32> zeroinitializer
  %neg = fneg <16 x float> %splat
  %neg2 = fneg <16 x float> %vb
  %vd = call <16 x float> @llvm.experimental.constrained.fma.v16f32(<16 x float> %neg, <16 x float> %va, <16 x float> %neg2, metadata !"round.dynamic", metadata !"fpexcept.strict")
  store i1 %C2, ptr %A, align 1
  ret <16 x float> %vd
}

; Function Attrs: strictfp
declare <2 x double> @vfnmsub_vv_v2f64(<2 x double>, <2 x double>, <2 x double>) #0

; Function Attrs: strictfp
declare <2 x double> @vfnmsub_vf_v2f64(<2 x double>, <2 x double>, double) #0

; Function Attrs: strictfp
declare <4 x double> @vfnmsub_vv_v4f64(<4 x double>, <4 x double>, <4 x double>) #0

; Function Attrs: strictfp
declare <4 x double> @vfnmsub_vf_v4f64(<4 x double>, <4 x double>, double) #0

; Function Attrs: strictfp
declare <8 x double> @vfnmsub_vv_v8f64(<8 x double>, <8 x double>, <8 x double>) #0

; Function Attrs: strictfp
declare <8 x double> @vfnmsub_vf_v8f64(<8 x double>, <8 x double>, double) #0

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

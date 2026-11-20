; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+d,+zfhmin,+experimental-zvfbfa -O2 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <2 x i64> splat (i64 42)
@G.2 = global <2 x i64> splat (i64 -9223372036854775808)
@G.3 = global <8 x float> zeroinitializer

; Function Attrs: strictfp
declare <1 x bfloat> @vfmul_vv_v1bf16(<1 x bfloat>, <1 x bfloat>) #0

; Function Attrs: strictfp
declare <2 x bfloat> @vfmul_vv_v2bf16(<2 x bfloat>, <2 x bfloat>) #0

; Function Attrs: strictfp
declare <4 x bfloat> @vfmul_vv_v4bf16(<4 x bfloat>, <4 x bfloat>) #0

; Function Attrs: strictfp
declare <8 x bfloat> @vfmul_vv_v8bf16(<8 x bfloat>, <8 x bfloat>) #0

; Function Attrs: strictfp
declare <16 x bfloat> @vfmul_vv_v16bf16(<16 x bfloat>, <16 x bfloat>) #0

; Function Attrs: strictfp
declare <32 x bfloat> @vfmul_vv_v32bf16(<32 x bfloat>, <32 x bfloat>) #0

; Function Attrs: strictfp
declare <1 x half> @vfmul_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: strictfp
declare <1 x half> @vfmul_vf_v1f16(<1 x half>, half) #0

; Function Attrs: strictfp
declare <2 x half> @vfmul_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: strictfp
declare <2 x half> @vfmul_vf_v2f16(<2 x half>, half) #0

; Function Attrs: strictfp
declare <4 x half> @vfmul_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: strictfp
declare <4 x half> @vfmul_vf_v4f16(<4 x half>, half) #0

; Function Attrs: strictfp
declare <8 x half> @vfmul_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: strictfp
declare <8 x half> @vfmul_vf_v8f16(<8 x half>, half) #0

; Function Attrs: strictfp
declare <16 x half> @vfmul_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: strictfp
declare <16 x half> @vfmul_vf_v16f16(<16 x half>, half) #0

; Function Attrs: strictfp
define <32 x half> @vfmul_vv_v32f16(<32 x half> %va, <32 x half> %vb) #0 {
entry:
  %LGV = load i1, ptr @G, align 1
  %C = icmp slt i1 true, %LGV
  %vc = call <32 x half> @llvm.experimental.constrained.fmul.v32f16(<32 x half> %va, <32 x half> %vb, metadata !"round.dynamic", metadata !"fpexcept.ignore")
  store i1 %C, ptr poison, align 1
  ret <32 x half> %vc
}

; Function Attrs: strictfp
declare <32 x half> @vfmul_vf_v32f16(<32 x half>, half) #0

; Function Attrs: strictfp
declare <1 x float> @vfmul_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: strictfp
declare <1 x float> @vfmul_vf_v1f32(<1 x float>, float) #0

; Function Attrs: strictfp
declare <2 x float> @vfmul_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: strictfp
declare <2 x float> @vfmul_vf_v2f32(<2 x float>, float) #0

; Function Attrs: strictfp
declare <4 x float> @vfmul_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: strictfp
define <4 x float> @vfmul_vf_v4f32(<4 x float> %va, float %b) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %head = insertelement <4 x float> poison, float %b, i32 0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  %splat = shufflevector <4 x float> %head, <4 x float> poison, <4 x i32> zeroinitializer
  %vc = call <4 x float> @llvm.experimental.constrained.fmul.v4f32(<4 x float> %va, <4 x float> %splat, metadata !"round.dynamic", metadata !"fpexcept.ignore")
  ret <4 x float> %vc

T:                                                ; preds = %0
  ret <4 x float> %head

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: strictfp
declare <8 x float> @vfmul_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: strictfp
define <8 x float> @vfmul_vf_v8f32(<8 x float> %va, float %b) #0 {
  %A = alloca <8 x i1>, align 1
  store <8 x i1> poison, ptr %A, align 1
  %LGV = load <8 x float>, ptr @G.3, align 32
  %head = insertelement <8 x float> poison, float %b, i32 0
  %C = fcmp true <8 x float> %head, %LGV
  %splat = shufflevector <8 x float> %head, <8 x float> poison, <8 x i32> zeroinitializer
  %vc = call <8 x float> @llvm.experimental.constrained.fmul.v8f32(<8 x float> %va, <8 x float> %splat, metadata !"round.dynamic", metadata !"fpexcept.ignore")
  store <8 x i1> %C, ptr %A, align 1
  ret <8 x float> %vc
}

; Function Attrs: strictfp
declare <16 x float> @vfmul_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: strictfp
declare <16 x float> @vfmul_vf_v16f32(<16 x float>, float) #0

; Function Attrs: strictfp
declare <1 x double> @vfmul_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: strictfp
declare <1 x double> @vfmul_vf_v1f64(<1 x double>, double) #0

; Function Attrs: strictfp
declare <2 x double> @vfmul_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: strictfp
declare <2 x double> @vfmul_vf_v2f64(<2 x double>, double) #0

; Function Attrs: strictfp
define <4 x double> @vfmul_vv_v4f64(<4 x double> %va, <4 x double> %vb) #0 {
entry:
  %LGV1 = load <2 x i64>, ptr @G.2, align 16
  %LGV = load <2 x i64>, ptr @G.1, align 16
  %B = or <2 x i64> %LGV, %LGV1
  %vc = call <4 x double> @llvm.experimental.constrained.fmul.v4f64(<4 x double> %va, <4 x double> %vb, metadata !"round.dynamic", metadata !"fpexcept.ignore")
  store <2 x i64> %B, ptr poison, align 16
  ret <4 x double> %vc
}

; Function Attrs: strictfp
declare <4 x double> @vfmul_vf_v4f64(<4 x double>, double) #0

; Function Attrs: strictfp
declare <8 x double> @vfmul_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: strictfp
declare <8 x double> @vfmul_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x bfloat> @llvm.experimental.constrained.fmul.v16bf16(<16 x bfloat>, <16 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.fmul.v16f16(<16 x half>, <16 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.fmul.v16f32(<16 x float>, <16 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x bfloat> @llvm.experimental.constrained.fmul.v1bf16(<1 x bfloat>, <1 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.fmul.v1f16(<1 x half>, <1 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x float> @llvm.experimental.constrained.fmul.v1f32(<1 x float>, <1 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x double> @llvm.experimental.constrained.fmul.v1f64(<1 x double>, <1 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x bfloat> @llvm.experimental.constrained.fmul.v2bf16(<2 x bfloat>, <2 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.fmul.v2f16(<2 x half>, <2 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.fmul.v2f32(<2 x float>, <2 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.fmul.v2f64(<2 x double>, <2 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x bfloat> @llvm.experimental.constrained.fmul.v32bf16(<32 x bfloat>, <32 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x half> @llvm.experimental.constrained.fmul.v32f16(<32 x half>, <32 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x bfloat> @llvm.experimental.constrained.fmul.v4bf16(<4 x bfloat>, <4 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.fmul.v4f16(<4 x half>, <4 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.fmul.v4f32(<4 x float>, <4 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.fmul.v4f64(<4 x double>, <4 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x bfloat> @llvm.experimental.constrained.fmul.v8bf16(<8 x bfloat>, <8 x bfloat>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.fmul.v8f16(<8 x half>, <8 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.fmul.v8f32(<8 x float>, <8 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.fmul.v8f64(<8 x double>, <8 x double>, metadata, metadata) #1

attributes #0 = { strictfp }
attributes #1 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

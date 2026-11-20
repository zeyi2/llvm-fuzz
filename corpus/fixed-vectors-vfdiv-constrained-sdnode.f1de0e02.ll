; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+d,+zvfh,+zbb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x double> splat (double 4.940660e-324)
@G.1 = global i32 0

; Function Attrs: strictfp
declare <2 x half> @vfdiv_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: strictfp
declare <2 x half> @vfdiv_vf_v2f16(<2 x half>, half) #0

; Function Attrs: strictfp
declare <4 x half> @vfdiv_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: strictfp
declare <4 x half> @vfdiv_vf_v4f16(<4 x half>, half) #0

; Function Attrs: strictfp
declare <8 x half> @vfdiv_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: strictfp
declare <8 x half> @vfdiv_vf_v8f16(<8 x half>, half) #0

; Function Attrs: strictfp
declare <8 x half> @vfdiv_fv_v8f16(<8 x half>, half) #0

; Function Attrs: strictfp
declare <16 x half> @vfdiv_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: strictfp
declare <16 x half> @vfdiv_vf_v16f16(<16 x half>, half) #0

; Function Attrs: strictfp
declare <32 x half> @vfdiv_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: strictfp
define <32 x half> @vfdiv_vf_v32f16(<32 x half> %va, half %b) #0 {
  %LGV = load i32, ptr @G.1, align 4
  %head = insertelement <32 x half> poison, half %b, i32 0
  %C = icmp uge i32 %LGV, 65536
  %splat = shufflevector <32 x half> %head, <32 x half> poison, <32 x i32> zeroinitializer
  %vc = call <32 x half> @llvm.experimental.constrained.fdiv.v32f16(<32 x half> %va, <32 x half> %splat, metadata !"round.dynamic", metadata !"fpexcept.ignore")
  store i1 %C, ptr poison, align 1
  ret <32 x half> %vc
}

; Function Attrs: strictfp
declare <2 x float> @vfdiv_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: strictfp
declare <2 x float> @vfdiv_vf_v2f32(<2 x float>, float) #0

; Function Attrs: strictfp
declare <4 x float> @vfdiv_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: strictfp
declare <4 x float> @vfdiv_vf_v4f32(<4 x float>, float) #0

; Function Attrs: strictfp
declare <8 x float> @vfdiv_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: strictfp
declare <8 x float> @vfdiv_vf_v8f32(<8 x float>, float) #0

; Function Attrs: strictfp
declare <8 x float> @vfdiv_fv_v8f32(<8 x float>, float) #0

; Function Attrs: strictfp
declare <16 x float> @vfdiv_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: strictfp
declare <16 x float> @vfdiv_vf_v16f32(<16 x float>, float) #0

; Function Attrs: strictfp
declare <2 x double> @vfdiv_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: strictfp
declare <2 x double> @vfdiv_vf_v2f64(<2 x double>, double) #0

; Function Attrs: strictfp
declare <4 x double> @vfdiv_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: strictfp
define <4 x double> @vfdiv_vf_v4f64(<4 x double> %va, double %b) #0 {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV = load <4 x double>, ptr @G, align 32
  %head = insertelement <4 x double> poison, double %b, i32 0
  %C = fcmp ugt <4 x double> %head, %LGV
  %splat = shufflevector <4 x double> %head, <4 x double> poison, <4 x i32> zeroinitializer
  %vc = call <4 x double> @llvm.experimental.constrained.fdiv.v4f64(<4 x double> %va, <4 x double> %splat, metadata !"round.dynamic", metadata !"fpexcept.ignore")
  store <4 x i1> %C, ptr %A, align 1
  ret <4 x double> %vc
}

; Function Attrs: strictfp
declare <8 x double> @vfdiv_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: strictfp
declare <8 x double> @vfdiv_vf_v8f64(<8 x double>, double) #0

; Function Attrs: strictfp
declare <8 x double> @vfdiv_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.fdiv.v16f16(<16 x half>, <16 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.fdiv.v16f32(<16 x float>, <16 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.fdiv.v2f16(<2 x half>, <2 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.fdiv.v2f32(<2 x float>, <2 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.fdiv.v2f64(<2 x double>, <2 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x half> @llvm.experimental.constrained.fdiv.v32f16(<32 x half>, <32 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.fdiv.v4f16(<4 x half>, <4 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.fdiv.v4f32(<4 x float>, <4 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.fdiv.v4f64(<4 x double>, <4 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.fdiv.v8f16(<8 x half>, <8 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.fdiv.v8f32(<8 x float>, <8 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.fdiv.v8f64(<8 x double>, <8 x double>, metadata, metadata) #1

attributes #0 = { strictfp }
attributes #1 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

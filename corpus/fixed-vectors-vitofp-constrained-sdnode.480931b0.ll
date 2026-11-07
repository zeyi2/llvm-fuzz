; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+d,+zfh,+zvfh,+experimental-zvfbfa -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 -1
@G.1 = global i1 false
@G.2 = global <4 x i1> zeroinitializer
@G.3 = global <2 x i64> zeroinitializer
@G.4 = global i64 -1

; Function Attrs: strictfp
declare <1 x half> @vsitofp_v1i1_v1f16(<1 x i1>) #0

; Function Attrs: strictfp
declare <1 x half> @vuitofp_v1i1_v1f16(<1 x i1>) #0

; Function Attrs: strictfp
define <1 x float> @vsitofp_v1i1_v1f32(<1 x i1> %va) #0 {
  %A = alloca <1 x i1>, align 1
  store <1 x i1> poison, ptr %A, align 1
  %S = shufflevector <1 x i1> %va, <1 x i1> %va, <1 x i32> poison
  %evec = call <1 x float> @llvm.experimental.constrained.sitofp.v1f32.v1i1(<1 x i1> %va, metadata !"round.dynamic", metadata !"fpexcept.strict")
  store <1 x i1> %S, ptr %A, align 1
  ret <1 x float> %evec
}

; Function Attrs: strictfp
declare <1 x float> @vuitofp_v1i1_v1f32(<1 x i1>) #0

; Function Attrs: strictfp
declare <1 x double> @vsitofp_v1i1_v1f64(<1 x i1>) #0

; Function Attrs: strictfp
declare <1 x double> @vuitofp_v1i1_v1f64(<1 x i1>) #0

; Function Attrs: strictfp
declare <2 x half> @vsitofp_v2i1_v2f16(<2 x i1>) #0

; Function Attrs: strictfp
declare <2 x half> @vuitofp_v2i1_v2f16(<2 x i1>) #0

; Function Attrs: strictfp
declare <2 x float> @vsitofp_v2i1_v2f32(<2 x i1>) #0

; Function Attrs: strictfp
declare <2 x float> @vuitofp_v2i1_v2f32(<2 x i1>) #0

; Function Attrs: strictfp
declare <2 x double> @vsitofp_v2i1_v2f64(<2 x i1>) #0

; Function Attrs: strictfp
declare <2 x double> @vuitofp_v2i1_v2f64(<2 x i1>) #0

; Function Attrs: strictfp
define <4 x half> @vsitofp_v4i1_v4f16(<4 x i1> %va) #0 {
  %evec = call <4 x half> @llvm.experimental.constrained.sitofp.v4f16.v4i1(<4 x i1> %va, metadata !"round.dynamic", metadata !"fpexcept.strict")
  %C = fcmp ugt <4 x half> %evec, %evec
  store <4 x i1> %C, ptr @G.2, align 1
  ret <4 x half> %evec
}

; Function Attrs: strictfp
declare <4 x half> @vuitofp_v4i1_v4f16(<4 x i1>) #0

; Function Attrs: strictfp
declare <4 x float> @vsitofp_v4i1_v4f32(<4 x i1>) #0

; Function Attrs: strictfp
declare <4 x float> @vuitofp_v4i1_v4f32(<4 x i1>) #0

; Function Attrs: strictfp
declare <4 x double> @vsitofp_v4i1_v4f64(<4 x i1>) #0

; Function Attrs: strictfp
declare <4 x double> @vuitofp_v4i1_v4f64(<4 x i1>) #0

; Function Attrs: strictfp
declare <8 x half> @vsitofp_v8i1_v8f16(<8 x i1>) #0

; Function Attrs: strictfp
declare <8 x half> @vuitofp_v8i1_v8f16(<8 x i1>) #0

; Function Attrs: strictfp
declare <8 x float> @vsitofp_v8i1_v8f32(<8 x i1>) #0

; Function Attrs: strictfp
declare <8 x float> @vuitofp_v8i1_v8f32(<8 x i1>) #0

; Function Attrs: strictfp
declare <8 x double> @vsitofp_v8i1_v8f64(<8 x i1>) #0

; Function Attrs: strictfp
declare <8 x double> @vuitofp_v8i1_v8f64(<8 x i1>) #0

; Function Attrs: strictfp
declare <16 x half> @vsitofp_v16i1_v16f16(<16 x i1>) #0

; Function Attrs: strictfp
declare <16 x half> @vuitofp_v16i1_v16f16(<16 x i1>) #0

; Function Attrs: strictfp
declare <16 x float> @vsitofp_v16i1_v16f32(<16 x i1>) #0

; Function Attrs: strictfp
declare <16 x float> @vuitofp_v16i1_v16f32(<16 x i1>) #0

; Function Attrs: strictfp
declare <32 x half> @vsitofp_v32i1_v32f16(<32 x i1>) #0

; Function Attrs: strictfp
declare <32 x half> @vuitofp_v32i1_v32f16(<32 x i1>) #0

; Function Attrs: strictfp
declare <1 x half> @vsitofp_v1i8_v1f16(<1 x i8>) #0

; Function Attrs: strictfp
declare <1 x half> @vsitofp_v1i7_v1f16(<1 x i7>) #0

; Function Attrs: strictfp
declare <1 x half> @vuitofp_v1i7_v1f16(<1 x i7>) #0

; Function Attrs: strictfp
declare <1 x half> @vuitofp_v1i8_v1f16(<1 x i8>) #0

; Function Attrs: strictfp
declare <1 x float> @vsitofp_v1i8_v1f32(<1 x i8>) #0

; Function Attrs: strictfp
declare <1 x float> @vuitofp_v1i8_v1f32(<1 x i8>) #0

; Function Attrs: strictfp
declare <1 x double> @vsitofp_v1i8_v1f64(<1 x i8>) #0

; Function Attrs: strictfp
declare <1 x double> @vuitofp_v1i8_v1f64(<1 x i8>) #0

; Function Attrs: strictfp
declare <2 x half> @vsitofp_v2i8_v2f16(<2 x i8>) #0

; Function Attrs: strictfp
declare <2 x half> @vuitofp_v2i8_v2f16(<2 x i8>) #0

; Function Attrs: strictfp
declare <2 x float> @vsitofp_v2i8_v2f32(<2 x i8>) #0

; Function Attrs: strictfp
declare <2 x float> @vuitofp_v2i8_v2f32(<2 x i8>) #0

; Function Attrs: strictfp
declare <2 x double> @vsitofp_v2i8_v2f64(<2 x i8>) #0

; Function Attrs: strictfp
declare <2 x double> @vuitofp_v2i8_v2f64(<2 x i8>) #0

; Function Attrs: strictfp
declare <4 x half> @vsitofp_v4i8_v4f16(<4 x i8>) #0

; Function Attrs: strictfp
declare <4 x half> @vuitofp_v4i8_v4f16(<4 x i8>) #0

; Function Attrs: strictfp
declare <4 x float> @vsitofp_v4i8_v4f32(<4 x i8>) #0

; Function Attrs: strictfp
declare <4 x float> @vuitofp_v4i8_v4f32(<4 x i8>) #0

; Function Attrs: strictfp
declare <4 x double> @vsitofp_v4i8_v4f64(<4 x i8>) #0

; Function Attrs: strictfp
declare <4 x double> @vuitofp_v4i8_v4f64(<4 x i8>) #0

; Function Attrs: strictfp
declare <8 x half> @vsitofp_v8i8_v8f16(<8 x i8>) #0

; Function Attrs: strictfp
declare <8 x half> @vuitofp_v8i8_v8f16(<8 x i8>) #0

; Function Attrs: strictfp
declare <8 x float> @vsitofp_v8i8_v8f32(<8 x i8>) #0

; Function Attrs: strictfp
declare <8 x float> @vuitofp_v8i8_v8f32(<8 x i8>) #0

; Function Attrs: strictfp
declare <8 x double> @vsitofp_v8i8_v8f64(<8 x i8>) #0

; Function Attrs: strictfp
declare <8 x double> @vuitofp_v8i8_v8f64(<8 x i8>) #0

; Function Attrs: strictfp
declare <16 x half> @vsitofp_v16i8_v16f16(<16 x i8>) #0

; Function Attrs: strictfp
declare <16 x half> @vuitofp_v16i8_v16f16(<16 x i8>) #0

; Function Attrs: strictfp
declare <16 x float> @vsitofp_v16i8_v16f32(<16 x i8>) #0

; Function Attrs: strictfp
declare <16 x float> @vuitofp_v16i8_v16f32(<16 x i8>) #0

; Function Attrs: strictfp
declare <32 x half> @vsitofp_v32i8_v32f16(<32 x i8>) #0

; Function Attrs: strictfp
declare <32 x half> @vuitofp_v32i8_v32f16(<32 x i8>) #0

; Function Attrs: strictfp
declare <1 x half> @vsitofp_v1i16_v1f16(<1 x i16>) #0

; Function Attrs: strictfp
declare <1 x half> @vuitofp_v1i16_v1f16(<1 x i16>) #0

; Function Attrs: strictfp
declare <1 x float> @vsitofp_v1i16_v1f32(<1 x i16>) #0

; Function Attrs: strictfp
declare <1 x float> @vuitofp_v1i16_v1f32(<1 x i16>) #0

; Function Attrs: strictfp
declare <1 x double> @vsitofp_v1i16_v1f64(<1 x i16>) #0

; Function Attrs: strictfp
declare <1 x double> @vuitofp_v1i16_v1f64(<1 x i16>) #0

; Function Attrs: strictfp
declare <2 x half> @vsitofp_v2i16_v2f16(<2 x i16>) #0

; Function Attrs: strictfp
declare <2 x half> @vuitofp_v2i16_v2f16(<2 x i16>) #0

; Function Attrs: strictfp
declare <2 x float> @vsitofp_v2i16_v2f32(<2 x i16>) #0

; Function Attrs: strictfp
declare <2 x float> @vuitofp_v2i16_v2f32(<2 x i16>) #0

; Function Attrs: strictfp
declare <2 x double> @vsitofp_v2i16_v2f64(<2 x i16>) #0

; Function Attrs: strictfp
declare <2 x double> @vuitofp_v2i16_v2f64(<2 x i16>) #0

; Function Attrs: strictfp
declare <4 x half> @vsitofp_v4i16_v4f16(<4 x i16>) #0

; Function Attrs: strictfp
declare <4 x half> @vuitofp_v4i16_v4f16(<4 x i16>) #0

; Function Attrs: strictfp
declare <4 x float> @vsitofp_v4i16_v4f32(<4 x i16>) #0

; Function Attrs: strictfp
declare <4 x float> @vuitofp_v4i16_v4f32(<4 x i16>) #0

; Function Attrs: strictfp
declare <4 x double> @vsitofp_v4i16_v4f64(<4 x i16>) #0

; Function Attrs: strictfp
declare <4 x double> @vuitofp_v4i16_v4f64(<4 x i16>) #0

; Function Attrs: strictfp
declare <8 x half> @vsitofp_v8i16_v8f16(<8 x i16>) #0

; Function Attrs: strictfp
declare <8 x half> @vuitofp_v8i16_v8f16(<8 x i16>) #0

; Function Attrs: strictfp
declare <8 x float> @vsitofp_v8i16_v8f32(<8 x i16>) #0

; Function Attrs: strictfp
declare <8 x float> @vuitofp_v8i16_v8f32(<8 x i16>) #0

; Function Attrs: strictfp
declare <8 x double> @vsitofp_v8i16_v8f64(<8 x i16>) #0

; Function Attrs: strictfp
declare <8 x double> @vuitofp_v8i16_v8f64(<8 x i16>) #0

; Function Attrs: strictfp
declare <16 x half> @vsitofp_v16i16_v16f16(<16 x i16>) #0

; Function Attrs: strictfp
define <16 x half> @vuitofp_v16i16_v16f16(<16 x i16> %va) #0 {
  %LGV = load i64, ptr @G, align 4
  %C = icmp eq i64 1, %LGV
  %evec = call <16 x half> @llvm.experimental.constrained.uitofp.v16f16.v16i16(<16 x i16> %va, metadata !"round.dynamic", metadata !"fpexcept.strict")
  store i1 %C, ptr @G.1, align 1
  ret <16 x half> %evec
}

; Function Attrs: strictfp
declare <16 x float> @vsitofp_v16i16_v16f32(<16 x i16>) #0

; Function Attrs: strictfp
declare <16 x float> @vuitofp_v16i16_v16f32(<16 x i16>) #0

; Function Attrs: strictfp
declare <32 x half> @vsitofp_v32i16_v32f16(<32 x i16>) #0

; Function Attrs: strictfp
declare <32 x half> @vuitofp_v32i16_v32f16(<32 x i16>) #0

; Function Attrs: strictfp
declare <1 x half> @vsitofp_v1i32_v1f16(<1 x i32>) #0

; Function Attrs: strictfp
declare <1 x half> @vuitofp_v1i32_v1f16(<1 x i32>) #0

; Function Attrs: strictfp
declare <1 x float> @vsitofp_v1i32_v1f32(<1 x i32>) #0

; Function Attrs: strictfp
declare <1 x float> @vuitofp_v1i32_v1f32(<1 x i32>) #0

; Function Attrs: strictfp
declare <1 x double> @vsitofp_v1i32_v1f64(<1 x i32>) #0

; Function Attrs: strictfp
declare <1 x double> @vuitofp_v1i32_v1f64(<1 x i32>) #0

; Function Attrs: strictfp
declare <2 x half> @vsitofp_v2i32_v2f16(<2 x i32>) #0

; Function Attrs: strictfp
declare <2 x half> @vuitofp_v2i32_v2f16(<2 x i32>) #0

; Function Attrs: strictfp
define <2 x float> @vsitofp_v2i32_v2f32(<2 x i32> %va) #0 {
  %LGV = load <2 x i64>, ptr @G.3, align 16
  %E = extractelement <2 x i64> %LGV, i1 false
  %evec = call <2 x float> @llvm.experimental.constrained.sitofp.v2f32.v2i32(<2 x i32> %va, metadata !"round.dynamic", metadata !"fpexcept.strict")
  store i64 %E, ptr @G.4, align 4
  ret <2 x float> %evec
}

; Function Attrs: strictfp
declare <2 x float> @vuitofp_v2i32_v2f32(<2 x i32>) #0

; Function Attrs: strictfp
declare <2 x double> @vsitofp_v2i32_v2f64(<2 x i32>) #0

; Function Attrs: strictfp
declare <2 x double> @vuitofp_v2i32_v2f64(<2 x i32>) #0

; Function Attrs: strictfp
declare <4 x half> @vsitofp_v4i32_v4f16(<4 x i32>) #0

; Function Attrs: strictfp
declare <4 x half> @vuitofp_v4i32_v4f16(<4 x i32>) #0

; Function Attrs: strictfp
declare <4 x float> @vsitofp_v4i32_v4f32(<4 x i32>) #0

; Function Attrs: strictfp
declare <4 x float> @vuitofp_v4i32_v4f32(<4 x i32>) #0

; Function Attrs: strictfp
declare <4 x double> @vsitofp_v4i32_v4f64(<4 x i32>) #0

; Function Attrs: strictfp
declare <4 x double> @vuitofp_v4i32_v4f64(<4 x i32>) #0

; Function Attrs: strictfp
declare <8 x half> @vsitofp_v8i32_v8f16(<8 x i32>) #0

; Function Attrs: strictfp
declare <8 x half> @vuitofp_v8i32_v8f16(<8 x i32>) #0

; Function Attrs: strictfp
declare <8 x float> @vsitofp_v8i32_v8f32(<8 x i32>) #0

; Function Attrs: strictfp
declare <8 x float> @vuitofp_v8i32_v8f32(<8 x i32>) #0

; Function Attrs: strictfp
declare <8 x double> @vsitofp_v8i32_v8f64(<8 x i32>) #0

; Function Attrs: strictfp
declare <8 x double> @vuitofp_v8i32_v8f64(<8 x i32>) #0

; Function Attrs: strictfp
declare <16 x half> @vsitofp_v16i32_v16f16(<16 x i32>) #0

; Function Attrs: strictfp
declare <16 x half> @vuitofp_v16i32_v16f16(<16 x i32>) #0

; Function Attrs: strictfp
declare <16 x float> @vsitofp_v16i32_v16f32(<16 x i32>) #0

; Function Attrs: strictfp
define <16 x float> @vuitofp_v16i32_v16f32(<16 x i32> %va) #0 {
  %C = fcmp true float 0.000000e+00, 1.000000e+00
  %evec = call <16 x float> @llvm.experimental.constrained.uitofp.v16f32.v16i32(<16 x i32> %va, metadata !"round.dynamic", metadata !"fpexcept.strict")
  store i1 %C, ptr poison, align 1
  ret <16 x float> %evec
}

; Function Attrs: strictfp
declare <1 x half> @vsitofp_v1i64_v1f16(<1 x i64>) #0

; Function Attrs: strictfp
declare <1 x half> @vuitofp_v1i64_v1f16(<1 x i64>) #0

; Function Attrs: strictfp
declare <1 x float> @vsitofp_v1i64_v1f32(<1 x i64>) #0

; Function Attrs: strictfp
declare <1 x float> @vuitofp_v1i64_v1f32(<1 x i64>) #0

; Function Attrs: strictfp
declare <1 x double> @vsitofp_v1i64_v1f64(<1 x i64>) #0

; Function Attrs: strictfp
declare <1 x double> @vuitofp_v1i64_v1f64(<1 x i64>) #0

; Function Attrs: strictfp
declare <2 x half> @vsitofp_v2i64_v2f16(<2 x i64>) #0

; Function Attrs: strictfp
declare <2 x half> @vuitofp_v2i64_v2f16(<2 x i64>) #0

; Function Attrs: strictfp
declare <2 x float> @vsitofp_v2i64_v2f32(<2 x i64>) #0

; Function Attrs: strictfp
declare <2 x float> @vuitofp_v2i64_v2f32(<2 x i64>) #0

; Function Attrs: strictfp
declare <2 x double> @vsitofp_v2i64_v2f64(<2 x i64>) #0

; Function Attrs: strictfp
declare <2 x double> @vuitofp_v2i64_v2f64(<2 x i64>) #0

; Function Attrs: strictfp
declare <4 x half> @vsitofp_v4i64_v4f16(<4 x i64>) #0

; Function Attrs: strictfp
declare <4 x half> @vuitofp_v4i64_v4f16(<4 x i64>) #0

; Function Attrs: strictfp
declare <4 x float> @vsitofp_v4i64_v4f32(<4 x i64>) #0

; Function Attrs: strictfp
declare <4 x float> @vuitofp_v4i64_v4f32(<4 x i64>) #0

; Function Attrs: strictfp
declare <4 x double> @vsitofp_v4i64_v4f64(<4 x i64>) #0

; Function Attrs: strictfp
declare <4 x double> @vuitofp_v4i64_v4f64(<4 x i64>) #0

; Function Attrs: strictfp
declare <8 x half> @vsitofp_v8i64_v8f16(<8 x i64>) #0

; Function Attrs: strictfp
declare <8 x half> @vuitofp_v8i64_v8f16(<8 x i64>) #0

; Function Attrs: strictfp
declare <8 x float> @vsitofp_v8i64_v8f32(<8 x i64>) #0

; Function Attrs: strictfp
declare <8 x float> @vuitofp_v8i64_v8f32(<8 x i64>) #0

; Function Attrs: strictfp
declare <8 x double> @vsitofp_v8i64_v8f64(<8 x i64>) #0

; Function Attrs: strictfp
declare <8 x double> @vuitofp_v8i64_v8f64(<8 x i64>) #0

; Function Attrs: strictfp
declare <2 x bfloat> @vsitofp_v2i8_v2bf16(<2 x i8>) #0

; Function Attrs: strictfp
declare <2 x bfloat> @vuitofp_v2i8_v2bf16(<2 x i8>) #0

; Function Attrs: strictfp
declare <4 x bfloat> @vsitofp_v4i8_v4bf16(<4 x i8>) #0

; Function Attrs: strictfp
declare <4 x bfloat> @vuitofp_v4i8_v4bf16(<4 x i8>) #0

; Function Attrs: strictfp
declare <8 x bfloat> @vsitofp_v8i8_v8bf16(<8 x i8>) #0

; Function Attrs: strictfp
declare <8 x bfloat> @vuitofp_v8i8_v8bf16(<8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.sitofp.v16f16.v16i1(<16 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.sitofp.v16f16.v16i16(<16 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.sitofp.v16f16.v16i32(<16 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.sitofp.v16f16.v16i8(<16 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.sitofp.v16f32.v16i1(<16 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.sitofp.v16f32.v16i16(<16 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.sitofp.v16f32.v16i32(<16 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.sitofp.v16f32.v16i8(<16 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.sitofp.v1f16.v1i1(<1 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.sitofp.v1f16.v1i16(<1 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.sitofp.v1f16.v1i32(<1 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.sitofp.v1f16.v1i64(<1 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.sitofp.v1f16.v1i7(<1 x i7>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.sitofp.v1f16.v1i8(<1 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x float> @llvm.experimental.constrained.sitofp.v1f32.v1i1(<1 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x float> @llvm.experimental.constrained.sitofp.v1f32.v1i16(<1 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x float> @llvm.experimental.constrained.sitofp.v1f32.v1i32(<1 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x float> @llvm.experimental.constrained.sitofp.v1f32.v1i64(<1 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x float> @llvm.experimental.constrained.sitofp.v1f32.v1i8(<1 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x double> @llvm.experimental.constrained.sitofp.v1f64.v1i1(<1 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x double> @llvm.experimental.constrained.sitofp.v1f64.v1i16(<1 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x double> @llvm.experimental.constrained.sitofp.v1f64.v1i32(<1 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x double> @llvm.experimental.constrained.sitofp.v1f64.v1i64(<1 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x double> @llvm.experimental.constrained.sitofp.v1f64.v1i8(<1 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x bfloat> @llvm.experimental.constrained.sitofp.v2bf16.v2i8(<2 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.sitofp.v2f16.v2i1(<2 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.sitofp.v2f16.v2i16(<2 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.sitofp.v2f16.v2i32(<2 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.sitofp.v2f16.v2i64(<2 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.sitofp.v2f16.v2i8(<2 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.sitofp.v2f32.v2i1(<2 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.sitofp.v2f32.v2i16(<2 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.sitofp.v2f32.v2i32(<2 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.sitofp.v2f32.v2i64(<2 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.sitofp.v2f32.v2i8(<2 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.sitofp.v2f64.v2i1(<2 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.sitofp.v2f64.v2i16(<2 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.sitofp.v2f64.v2i32(<2 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.sitofp.v2f64.v2i64(<2 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.sitofp.v2f64.v2i8(<2 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x half> @llvm.experimental.constrained.sitofp.v32f16.v32i1(<32 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x half> @llvm.experimental.constrained.sitofp.v32f16.v32i16(<32 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x half> @llvm.experimental.constrained.sitofp.v32f16.v32i8(<32 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x bfloat> @llvm.experimental.constrained.sitofp.v4bf16.v4i8(<4 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.sitofp.v4f16.v4i1(<4 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.sitofp.v4f16.v4i16(<4 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.sitofp.v4f16.v4i32(<4 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.sitofp.v4f16.v4i64(<4 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.sitofp.v4f16.v4i8(<4 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.sitofp.v4f32.v4i1(<4 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.sitofp.v4f32.v4i16(<4 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.sitofp.v4f32.v4i32(<4 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.sitofp.v4f32.v4i64(<4 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.sitofp.v4f32.v4i8(<4 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.sitofp.v4f64.v4i1(<4 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.sitofp.v4f64.v4i16(<4 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.sitofp.v4f64.v4i32(<4 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.sitofp.v4f64.v4i64(<4 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.sitofp.v4f64.v4i8(<4 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x bfloat> @llvm.experimental.constrained.sitofp.v8bf16.v8i8(<8 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.sitofp.v8f16.v8i1(<8 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.sitofp.v8f16.v8i16(<8 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.sitofp.v8f16.v8i32(<8 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.sitofp.v8f16.v8i64(<8 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.sitofp.v8f16.v8i8(<8 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.sitofp.v8f32.v8i1(<8 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.sitofp.v8f32.v8i16(<8 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.sitofp.v8f32.v8i32(<8 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.sitofp.v8f32.v8i64(<8 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.sitofp.v8f32.v8i8(<8 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.sitofp.v8f64.v8i1(<8 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.sitofp.v8f64.v8i16(<8 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.sitofp.v8f64.v8i32(<8 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.sitofp.v8f64.v8i64(<8 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.sitofp.v8f64.v8i8(<8 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.uitofp.v16f16.v16i1(<16 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.uitofp.v16f16.v16i16(<16 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.uitofp.v16f16.v16i32(<16 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x half> @llvm.experimental.constrained.uitofp.v16f16.v16i8(<16 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.uitofp.v16f32.v16i1(<16 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.uitofp.v16f32.v16i16(<16 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.uitofp.v16f32.v16i32(<16 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x float> @llvm.experimental.constrained.uitofp.v16f32.v16i8(<16 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.uitofp.v1f16.v1i1(<1 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.uitofp.v1f16.v1i16(<1 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.uitofp.v1f16.v1i32(<1 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.uitofp.v1f16.v1i64(<1 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.uitofp.v1f16.v1i7(<1 x i7>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x half> @llvm.experimental.constrained.uitofp.v1f16.v1i8(<1 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x float> @llvm.experimental.constrained.uitofp.v1f32.v1i1(<1 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x float> @llvm.experimental.constrained.uitofp.v1f32.v1i16(<1 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x float> @llvm.experimental.constrained.uitofp.v1f32.v1i32(<1 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x float> @llvm.experimental.constrained.uitofp.v1f32.v1i64(<1 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x float> @llvm.experimental.constrained.uitofp.v1f32.v1i8(<1 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x double> @llvm.experimental.constrained.uitofp.v1f64.v1i1(<1 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x double> @llvm.experimental.constrained.uitofp.v1f64.v1i16(<1 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x double> @llvm.experimental.constrained.uitofp.v1f64.v1i32(<1 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x double> @llvm.experimental.constrained.uitofp.v1f64.v1i64(<1 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x double> @llvm.experimental.constrained.uitofp.v1f64.v1i8(<1 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x bfloat> @llvm.experimental.constrained.uitofp.v2bf16.v2i8(<2 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.uitofp.v2f16.v2i1(<2 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.uitofp.v2f16.v2i16(<2 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.uitofp.v2f16.v2i32(<2 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.uitofp.v2f16.v2i64(<2 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x half> @llvm.experimental.constrained.uitofp.v2f16.v2i8(<2 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.uitofp.v2f32.v2i1(<2 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.uitofp.v2f32.v2i16(<2 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.uitofp.v2f32.v2i32(<2 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.uitofp.v2f32.v2i64(<2 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x float> @llvm.experimental.constrained.uitofp.v2f32.v2i8(<2 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.uitofp.v2f64.v2i1(<2 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.uitofp.v2f64.v2i16(<2 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.uitofp.v2f64.v2i32(<2 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.uitofp.v2f64.v2i64(<2 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x double> @llvm.experimental.constrained.uitofp.v2f64.v2i8(<2 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x half> @llvm.experimental.constrained.uitofp.v32f16.v32i1(<32 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x half> @llvm.experimental.constrained.uitofp.v32f16.v32i16(<32 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x half> @llvm.experimental.constrained.uitofp.v32f16.v32i8(<32 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x bfloat> @llvm.experimental.constrained.uitofp.v4bf16.v4i8(<4 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.uitofp.v4f16.v4i1(<4 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.uitofp.v4f16.v4i16(<4 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.uitofp.v4f16.v4i32(<4 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.uitofp.v4f16.v4i64(<4 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x half> @llvm.experimental.constrained.uitofp.v4f16.v4i8(<4 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.uitofp.v4f32.v4i1(<4 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.uitofp.v4f32.v4i16(<4 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.uitofp.v4f32.v4i32(<4 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.uitofp.v4f32.v4i64(<4 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x float> @llvm.experimental.constrained.uitofp.v4f32.v4i8(<4 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.uitofp.v4f64.v4i1(<4 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.uitofp.v4f64.v4i16(<4 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.uitofp.v4f64.v4i32(<4 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.uitofp.v4f64.v4i64(<4 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x double> @llvm.experimental.constrained.uitofp.v4f64.v4i8(<4 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x bfloat> @llvm.experimental.constrained.uitofp.v8bf16.v8i8(<8 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.uitofp.v8f16.v8i1(<8 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.uitofp.v8f16.v8i16(<8 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.uitofp.v8f16.v8i32(<8 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.uitofp.v8f16.v8i64(<8 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x half> @llvm.experimental.constrained.uitofp.v8f16.v8i8(<8 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.uitofp.v8f32.v8i1(<8 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.uitofp.v8f32.v8i16(<8 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.uitofp.v8f32.v8i32(<8 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.uitofp.v8f32.v8i64(<8 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x float> @llvm.experimental.constrained.uitofp.v8f32.v8i8(<8 x i8>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.uitofp.v8f64.v8i1(<8 x i1>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.uitofp.v8f64.v8i16(<8 x i16>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.uitofp.v8f64.v8i32(<8 x i32>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.uitofp.v8f64.v8i64(<8 x i64>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x double> @llvm.experimental.constrained.uitofp.v8f64.v8i8(<8 x i8>, metadata, metadata) #1

attributes #0 = { strictfp }
attributes #1 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }

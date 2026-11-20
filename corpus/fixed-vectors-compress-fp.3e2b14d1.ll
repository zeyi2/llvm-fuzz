; isel-diff-config: -verify-machineinstrs -mtriple=riscv32 -mattr=+m,+f,+d,+zvfh,+zvfbfmin -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global bfloat 1.000000e+00
@G.1 = global bfloat 4.200000e+01

declare <1 x bfloat> @vector_compress_v1bf16(<1 x bfloat>, <1 x i1>)

declare <1 x bfloat> @vector_compress_v1bf16_passthru(<1 x bfloat>, <1 x bfloat>, <1 x i1>)

declare <2 x bfloat> @vector_compress_v2bf16(<2 x bfloat>, <2 x i1>)

define <2 x bfloat> @vector_compress_v2bf16_passthru(<2 x bfloat> %passthru, <2 x bfloat> %v, <2 x i1> %mask) {
  %ret = call <2 x bfloat> @llvm.experimental.vector.compress.v2bf16(<2 x bfloat> %v, <2 x i1> %mask, <2 x bfloat> %passthru)
  %C = fcmp oeq <2 x bfloat> %v, splat (bfloat 4.200000e+01)
  store <2 x i1> %C, ptr poison, align 1
  ret <2 x bfloat> %ret
}

declare <4 x bfloat> @vector_compress_v4bf16(<4 x bfloat>, <4 x i1>)

declare <4 x bfloat> @vector_compress_v4bf16_passthru(<4 x bfloat>, <4 x bfloat>, <4 x i1>)

define <8 x bfloat> @vector_compress_v8bf16(<8 x bfloat> %v, <8 x i1> %mask) {
  %B = mul <8 x i1> %mask, splat (i1 true)
  %ret = call <8 x bfloat> @llvm.experimental.vector.compress.v8bf16(<8 x bfloat> %v, <8 x i1> %B, <8 x bfloat> poison)
  ret <8 x bfloat> %ret
}

declare <8 x bfloat> @vector_compress_v8bf16_passthru(<8 x bfloat>, <8 x bfloat>, <8 x i1>)

declare <1 x half> @vector_compress_v1f16(<1 x half>, <1 x i1>)

declare <1 x half> @vector_compress_v1f16_passthru(<1 x half>, <1 x half>, <1 x i1>)

declare <2 x half> @vector_compress_v2f16(<2 x half>, <2 x i1>)

define <2 x half> @vector_compress_v2f16_passthru(<2 x half> %passthru, <2 x half> %v, <2 x i1> %mask) {
  %LGV = load bfloat, ptr @G, align 2
  %ret = call <2 x half> @llvm.experimental.vector.compress.v2f16(<2 x half> %v, <2 x i1> %mask, <2 x half> %passthru)
  %B = frem bfloat %LGV, +inf
  store bfloat %B, ptr @G.1, align 2
  ret <2 x half> %ret
}

declare <4 x half> @vector_compress_v4f16(<4 x half>, <4 x i1>)

declare <4 x half> @vector_compress_v4f16_passthru(<4 x half>, <4 x half>, <4 x i1>)

declare <8 x half> @vector_compress_v8f16(<8 x half>, <8 x i1>)

declare <8 x half> @vector_compress_v8f16_passthru(<8 x half>, <8 x half>, <8 x i1>)

declare <1 x float> @vector_compress_v1f32(<1 x float>, <1 x i1>)

declare <1 x float> @vector_compress_v1f32_passthru(<1 x float>, <1 x float>, <1 x i1>)

declare <2 x float> @vector_compress_v2f32(<2 x float>, <2 x i1>)

declare <2 x float> @vector_compress_v2f32_passthru(<2 x float>, <2 x float>, <2 x i1>)

declare <4 x float> @vector_compress_v4f32(<4 x float>, <4 x i1>)

declare <4 x float> @vector_compress_v4f32_passthru(<4 x float>, <4 x float>, <4 x i1>)

declare <8 x float> @vector_compress_v8f32(<8 x float>, <8 x i1>)

declare <8 x float> @vector_compress_v8f32_passthru(<8 x float>, <8 x float>, <8 x i1>)

define <1 x double> @vector_compress_v1f64(<1 x double> %v, <1 x i1> %mask) {
  %C = icmp sge <1 x i1> %mask, splat (i1 true)
  %ret = call <1 x double> @llvm.experimental.vector.compress.v1f64(<1 x double> %v, <1 x i1> %C, <1 x double> poison)
  ret <1 x double> %ret
}

declare <1 x double> @vector_compress_v1f64_passthru(<1 x double>, <1 x double>, <1 x i1>)

declare <2 x double> @vector_compress_v2f64(<2 x double>, <2 x i1>)

declare <2 x double> @vector_compress_v2f64_passthru(<2 x double>, <2 x double>, <2 x i1>)

declare <4 x double> @vector_compress_v4f64(<4 x double>, <4 x i1>)

declare <4 x double> @vector_compress_v4f64_passthru(<4 x double>, <4 x double>, <4 x i1>)

declare <8 x double> @vector_compress_v8f64(<8 x double>, <8 x i1>)

declare <8 x double> @vector_compress_v8f64_passthru(<8 x double>, <8 x double>, <8 x i1>)

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <1 x bfloat> @llvm.experimental.vector.compress.v1bf16(<1 x bfloat>, <1 x i1>, <1 x bfloat>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <1 x half> @llvm.experimental.vector.compress.v1f16(<1 x half>, <1 x i1>, <1 x half>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <1 x float> @llvm.experimental.vector.compress.v1f32(<1 x float>, <1 x i1>, <1 x float>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <1 x double> @llvm.experimental.vector.compress.v1f64(<1 x double>, <1 x i1>, <1 x double>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x bfloat> @llvm.experimental.vector.compress.v2bf16(<2 x bfloat>, <2 x i1>, <2 x bfloat>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x half> @llvm.experimental.vector.compress.v2f16(<2 x half>, <2 x i1>, <2 x half>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x float> @llvm.experimental.vector.compress.v2f32(<2 x float>, <2 x i1>, <2 x float>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x double> @llvm.experimental.vector.compress.v2f64(<2 x double>, <2 x i1>, <2 x double>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x bfloat> @llvm.experimental.vector.compress.v4bf16(<4 x bfloat>, <4 x i1>, <4 x bfloat>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x half> @llvm.experimental.vector.compress.v4f16(<4 x half>, <4 x i1>, <4 x half>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.experimental.vector.compress.v4f32(<4 x float>, <4 x i1>, <4 x float>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x double> @llvm.experimental.vector.compress.v4f64(<4 x double>, <4 x i1>, <4 x double>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x bfloat> @llvm.experimental.vector.compress.v8bf16(<8 x bfloat>, <8 x i1>, <8 x bfloat>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x half> @llvm.experimental.vector.compress.v8f16(<8 x half>, <8 x i1>, <8 x half>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x float> @llvm.experimental.vector.compress.v8f32(<8 x float>, <8 x i1>, <8 x float>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x double> @llvm.experimental.vector.compress.v8f64(<8 x double>, <8 x i1>, <8 x double>) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(none) }

; isel-diff-config: -mtriple=riscv32 -mattr=+m,+v,+zvfbfmin -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 -1)
@G.1 = global <8 x i1> splat (i1 true)
@G.2 = global <4 x float> splat (float 4.200000e+01)

declare { <vscale x 16 x i1>, <vscale x 16 x i1> } @vector_deinterleave_nxv16i1_nxv32i1(<vscale x 32 x i1>)

declare { <vscale x 16 x i8>, <vscale x 16 x i8> } @vector_deinterleave_nxv16i8_nxv32i8(<vscale x 32 x i8>)

declare { <vscale x 8 x i16>, <vscale x 8 x i16> } @vector_deinterleave_nxv8i16_nxv16i16(<vscale x 16 x i16>)

declare { <vscale x 4 x i32>, <vscale x 4 x i32> } @vector_deinterleave_nxv4i32_nxvv8i32(<vscale x 8 x i32>)

; Function Attrs: nounwind
declare { <vscale x 5 x i32>, <vscale x 5 x i32>, <vscale x 5 x i32> } @vector_deinterleave3_nxv5i32_nxv15i32(<vscale x 15 x i32>) #0

declare { <vscale x 2 x i64>, <vscale x 2 x i64> } @vector_deinterleave_nxv2i64_nxv4i64(<vscale x 4 x i64>)

declare { <vscale x 4 x i64>, <vscale x 4 x i64> } @vector_deinterleave_nxv4i64_nxv8i64(<vscale x 8 x i64>)

declare { <vscale x 64 x i1>, <vscale x 64 x i1> } @vector_deinterleave_nxv64i1_nxv128i1(<vscale x 128 x i1>)

declare { <vscale x 64 x i8>, <vscale x 64 x i8> } @vector_deinterleave_nxv64i8_nxv128i8(<vscale x 128 x i8>)

declare { <vscale x 32 x i16>, <vscale x 32 x i16> } @vector_deinterleave_nxv32i16_nxv64i16(<vscale x 64 x i16>)

define { <vscale x 16 x i32>, <vscale x 16 x i32> } @vector_deinterleave_nxv16i32_nxvv32i32(<vscale x 32 x i32> %vec) {
  %LGV = load <4 x float>, ptr @G.2, align 16
  %C = fcmp uge <4 x float> %LGV, zeroinitializer
  %retval = call { <vscale x 16 x i32>, <vscale x 16 x i32> } @llvm.vector.deinterleave2.nxv32i32(<vscale x 32 x i32> %vec)
  store <4 x i1> %C, ptr poison, align 1
  ret { <vscale x 16 x i32>, <vscale x 16 x i32> } %retval
}

declare { <vscale x 8 x i64>, <vscale x 8 x i64> } @vector_deinterleave_nxv8i64_nxv16i64(<vscale x 16 x i64>)

; Function Attrs: nounwind
declare { <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1> } @vector_deinterleave_nxv16i1_nxv48i1(<vscale x 48 x i1>) #0

; Function Attrs: nounwind
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @vector_deinterleave_nxv16i8_nxv48i8(<vscale x 48 x i8>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @vector_deinterleave_nxv8i16_nxv24i16(<vscale x 24 x i16>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @vector_deinterleave_nxv4i32_nxv12i32(<vscale x 12 x i32>) #0

; Function Attrs: nounwind
declare { <vscale x 3 x i32>, <vscale x 3 x i32>, <vscale x 3 x i32> } @vector_deinterleave3_nxv3i32_nxv9i32(<vscale x 9 x i32>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @vector_deinterleave_nxv2i64_nxv6i64(<vscale x 6 x i64>) #0

; Function Attrs: nounwind
declare { <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1> } @vector_deinterleave_nxv16i1_nxv64i1(<vscale x 64 x i1>) #0

; Function Attrs: nounwind
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @vector_deinterleave_nxv16i8_nxv64i8(<vscale x 64 x i8>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @vector_deinterleave_nxv8i16_nxv32i16(<vscale x 32 x i16>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @vector_deinterleave_nxv4i32_nxv16i32(<vscale x 16 x i32>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @vector_deinterleave_nxv2i64_nxv8i64(<vscale x 8 x i64>) #0

; Function Attrs: nounwind
declare { <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1> } @vector_deinterleave_nxv16i1_nxv80i1(<vscale x 80 x i1>) #0

; Function Attrs: nounwind
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @vector_deinterleave_nxv16i8_nxv80i8(<vscale x 80 x i8>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @vector_deinterleave_nxv8i16_nxv40i16(<vscale x 40 x i16>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @vector_deinterleave_nxv4i32_nxv20i32(<vscale x 20 x i32>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @vector_deinterleave_nxv2i64_nxv10i64(<vscale x 10 x i64>) #0

; Function Attrs: nounwind
declare { <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1> } @vector_deinterleave_nxv16i1_nxv96i1(<vscale x 96 x i1>) #0

; Function Attrs: nounwind
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @vector_deinterleave_nxv16i8_nxv96i8(<vscale x 96 x i8>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @vector_deinterleave_nxv8i16_nxv48i16(<vscale x 48 x i16>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @vector_deinterleave_nxv4i32_nxv24i32(<vscale x 24 x i32>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @vector_deinterleave_nxv2i64_nxv12i64(<vscale x 12 x i64>) #0

; Function Attrs: nounwind
declare { <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1> } @vector_deinterleave_nxv16i1_nxv112i1(<vscale x 112 x i1>) #0

; Function Attrs: nounwind
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @vector_deinterleave_nxv16i8_nxv112i8(<vscale x 112 x i8>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @vector_deinterleave_nxv8i16_nxv56i16(<vscale x 56 x i16>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @vector_deinterleave_nxv4i32_nxv28i32(<vscale x 28 x i32>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @vector_deinterleave_nxv2i64_nxv14i64(<vscale x 14 x i64>) #0

; Function Attrs: nounwind
declare { <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1> } @vector_deinterleave_nxv16i1_nxv128i1(<vscale x 128 x i1>) #0

; Function Attrs: nounwind
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @vector_deinterleave_nxv16i8_nxv128i8(<vscale x 128 x i8>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @vector_deinterleave_nxv8i16_nxv64i16(<vscale x 64 x i16>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @vector_deinterleave_nxv4i32_nxv32i32(<vscale x 32 x i32>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @vector_deinterleave_nxv2i64_nxv16i64(<vscale x 16 x i64>) #0

define { <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @vector_deinterleave_nxv2bf16_nxv4bf16(<vscale x 4 x bfloat> %vec) {
  %LGV = load <8 x i8>, ptr @G, align 8
  %retval = call { <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @llvm.vector.deinterleave2.nxv4bf16(<vscale x 4 x bfloat> %vec)
  %C = icmp sgt <8 x i8> splat (i8 1), %LGV
  store <8 x i1> %C, ptr @G.1, align 1
  ret { <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } %retval
}

declare { <vscale x 2 x half>, <vscale x 2 x half> } @vector_deinterleave_nxv2f16_nxv4f16(<vscale x 4 x half>)

declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @vector_deinterleave_nxv4bf16_nxv8bf16(<vscale x 8 x bfloat>)

declare { <vscale x 4 x half>, <vscale x 4 x half> } @vector_deinterleave_nxv4f16_nxv8f16(<vscale x 8 x half>)

declare { <vscale x 2 x float>, <vscale x 2 x float> } @vector_deinterleave_nxv2f32_nxv4f32(<vscale x 4 x float>)

declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @vector_deinterleave_nxv8bf16_nxv16bf16(<vscale x 16 x bfloat>)

declare { <vscale x 8 x half>, <vscale x 8 x half> } @vector_deinterleave_nxv8f16_nxv16f16(<vscale x 16 x half>)

declare { <vscale x 4 x float>, <vscale x 4 x float> } @vector_deinterleave_nxv4f32_nxv8f32(<vscale x 8 x float>)

declare { <vscale x 2 x double>, <vscale x 2 x double> } @vector_deinterleave_nxv2f64_nxv4f64(<vscale x 4 x double>)

declare { <vscale x 32 x bfloat>, <vscale x 32 x bfloat> } @vector_deinterleave_nxv32bf16_nxv64bf16(<vscale x 64 x bfloat>)

declare { <vscale x 32 x half>, <vscale x 32 x half> } @vector_deinterleave_nxv32f16_nxv64f16(<vscale x 64 x half>)

declare { <vscale x 16 x float>, <vscale x 16 x float> } @vector_deinterleave_nxv16f32_nxv32f32(<vscale x 32 x float>)

declare { <vscale x 8 x double>, <vscale x 8 x double> } @vector_deinterleave_nxv8f64_nxv16f64(<vscale x 16 x double>)

; Function Attrs: nounwind
declare { <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half> } @vector_deinterleave_nxv2f16_nxv6f16(<vscale x 6 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half> } @vector_deinterleave_nxv4f16_nxv12f16(<vscale x 12 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @vector_deinterleave_nxv8f16_nxv24f16(<vscale x 24 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @vector_deinterleave_nxv2bf16_nxv6bf16(<vscale x 6 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @vector_deinterleave_nxv4bf16_nxv12bf16(<vscale x 12 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @vector_deinterleave_nxv8bf16_nxv24bf16(<vscale x 24 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @vector_deinterleave_nxv1f32_nxv3f32(<vscale x 3 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @vector_deinterleave_nxv2f32_nxv6f32(<vscale x 6 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @vector_deinterleave_nxv4f32_nxv12f32(<vscale x 12 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @vector_deinterleave_nxv1f64_nxv3f64(<vscale x 3 x double>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @vector_deinterleave_nxv2f64_nxv6f64(<vscale x 6 x double>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half> } @vector_deinterleave_nxv2f16_nxv8f16(<vscale x 8 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half> } @vector_deinterleave_nxv4f16_nxv16f16(<vscale x 16 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @vector_deinterleave_nxv8f16_nxv32f16(<vscale x 32 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @vector_deinterleave_nxv2bf16_nxv8bf16(<vscale x 8 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @vector_deinterleave_nxv4bf16_nxv16bf16(<vscale x 16 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @vector_deinterleave_nxv8bf16_nxv32bf16(<vscale x 32 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @vector_deinterleave_nxv1f32_nxv4f32(<vscale x 4 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @vector_deinterleave_nxv2f32_nxv8f32(<vscale x 8 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @vector_deinterleave_nxv4f32_nxv16f32(<vscale x 16 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @vector_deinterleave_nxv1f64_nxv4f64(<vscale x 4 x double>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @vector_deinterleave_nxv2f64_nxv8f64(<vscale x 8 x double>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half> } @vector_deinterleave_nxv2f16_nxv10f16(<vscale x 10 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half> } @vector_deinterleave_nxv4f16_nxv20f16(<vscale x 20 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @vector_deinterleave_nxv8f16_nxv40f16(<vscale x 40 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @vector_deinterleave_nxv2bf16_nxv10bf16(<vscale x 10 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @vector_deinterleave_nxv4bf16_nxv20bf16(<vscale x 20 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @vector_deinterleave_nxv8bf16_nxv40bf16(<vscale x 40 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @vector_deinterleave_nxv1f32_nxv5f32(<vscale x 5 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @vector_deinterleave_nxv2f32_nxv10f32(<vscale x 10 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @vector_deinterleave_nxv4f32_nxv20f32(<vscale x 20 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @vector_deinterleave_nxv1f64_nxv5f64(<vscale x 5 x double>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @vector_deinterleave_nxv2f64_nxv10f64(<vscale x 10 x double>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half> } @vector_deinterleave_nxv2f16_nxv12f16(<vscale x 12 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half> } @vector_deinterleave_nxv4f16_nxv24f16(<vscale x 24 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @vector_deinterleave_nxv8f16_nxv48f16(<vscale x 48 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @vector_deinterleave_nxv2bf16_nxv12bf16(<vscale x 12 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @vector_deinterleave_nxv4bf16_nxv24bf16(<vscale x 24 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @vector_deinterleave_nxv8bf16_nxv48bf16(<vscale x 48 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @vector_deinterleave_nxv1f32_nxv6f32(<vscale x 6 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @vector_deinterleave_nxv2f32_nxv12f32(<vscale x 12 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @vector_deinterleave_nxv4f32_nxv24f32(<vscale x 24 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @vector_deinterleave_nxv1f64_nxv6f64(<vscale x 6 x double>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @vector_deinterleave_nxv2f64_nxv12f64(<vscale x 12 x double>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half> } @vector_deinterleave_nxv2f16_nxv14f16(<vscale x 14 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half> } @vector_deinterleave_nxv4f16_nxv28f16(<vscale x 28 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @vector_deinterleave_nxv8f16_nxv56f16(<vscale x 56 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @vector_deinterleave_nxv2bf16_nxv14bf16(<vscale x 14 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @vector_deinterleave_nxv4bf16_nxv28bf16(<vscale x 28 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @vector_deinterleave_nxv8bf16_nxv56bf16(<vscale x 56 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @vector_deinterleave_nxv1f32_nxv7f32(<vscale x 7 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @vector_deinterleave_nxv2f32_nxv14f32(<vscale x 14 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @vector_deinterleave_nxv4f32_nxv28f32(<vscale x 28 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @vector_deinterleave_nxv1f64_nxv7f64(<vscale x 7 x double>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @vector_deinterleave_nxv2f64_nxv14f64(<vscale x 14 x double>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half> } @vector_deinterleave_nxv2f16_nxv16f16(<vscale x 16 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half> } @vector_deinterleave_nxv4f16_nxv32f16(<vscale x 32 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @vector_deinterleave_nxv8f16_nxv64f16(<vscale x 64 x half>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @vector_deinterleave_nxv2bf16_nxv16bf16(<vscale x 16 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @vector_deinterleave_nxv4bf16_nxv32bf16(<vscale x 32 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @vector_deinterleave_nxv8bf16_nxv64bf16(<vscale x 64 x bfloat>) #0

; Function Attrs: nounwind
declare { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @vector_deinterleave_nxv1f32_nxv8f32(<vscale x 8 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @vector_deinterleave_nxv2f32_nxv16f32(<vscale x 16 x float>) #0

; Function Attrs: nounwind
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @vector_deinterleave_nxv4f32_nxv32f32(<vscale x 32 x float>) #0

; Function Attrs: nounwind
define { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @vector_deinterleave_nxv1f64_nxv8f64(<vscale x 8 x double> %arg) #0 {
  %C = fcmp ult <vscale x 8 x double> %arg, %arg
  %res = call { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @llvm.vector.deinterleave8.nxv8f64(<vscale x 8 x double> %arg)
  store <vscale x 8 x i1> %C, ptr poison, align 1
  ret { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } %res
}

; Function Attrs: nounwind
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @vector_deinterleave_nxv2f64_nxv16f64(<vscale x 16 x double>) #0

declare <vscale x 16 x i8> @vector_deinterleave_nxv16i8_nxv32i8_oneactive(<vscale x 32 x i8>)

; Function Attrs: nounwind
declare <vscale x 1 x float> @vector_deinterleave_nxv1f32_nxv8f32_oneactive(<vscale x 8 x float>) #0

; Function Attrs: nounwind
declare <vscale x 1 x float> @vector_deinterleave_nxv1f32_nxv8f32_oneactive2(<vscale x 8 x float>) #0

declare { <8 x float>, <8 x float> } @interleave_deinterleave2(<8 x float>, <8 x float>)

declare <16 x float> @deinterleave_interleave2(<16 x float>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 64 x i1>, <vscale x 64 x i1> } @llvm.vector.deinterleave2.nxv128i1(<vscale x 128 x i1>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 64 x i8>, <vscale x 64 x i8> } @llvm.vector.deinterleave2.nxv128i8(<vscale x 128 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @llvm.vector.deinterleave2.nxv16bf16(<vscale x 16 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x half>, <vscale x 8 x half> } @llvm.vector.deinterleave2.nxv16f16(<vscale x 16 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x double>, <vscale x 8 x double> } @llvm.vector.deinterleave2.nxv16f64(<vscale x 16 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x i16>, <vscale x 8 x i16> } @llvm.vector.deinterleave2.nxv16i16(<vscale x 16 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x i64>, <vscale x 8 x i64> } @llvm.vector.deinterleave2.nxv16i64(<vscale x 16 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x float>, <vscale x 16 x float> } @llvm.vector.deinterleave2.nxv32f32(<vscale x 32 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i1>, <vscale x 16 x i1> } @llvm.vector.deinterleave2.nxv32i1(<vscale x 32 x i1>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i32>, <vscale x 16 x i32> } @llvm.vector.deinterleave2.nxv32i32(<vscale x 32 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i8>, <vscale x 16 x i8> } @llvm.vector.deinterleave2.nxv32i8(<vscale x 32 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @llvm.vector.deinterleave2.nxv4bf16(<vscale x 4 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x half>, <vscale x 2 x half> } @llvm.vector.deinterleave2.nxv4f16(<vscale x 4 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x float>, <vscale x 2 x float> } @llvm.vector.deinterleave2.nxv4f32(<vscale x 4 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x double>, <vscale x 2 x double> } @llvm.vector.deinterleave2.nxv4f64(<vscale x 4 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x i64>, <vscale x 2 x i64> } @llvm.vector.deinterleave2.nxv4i64(<vscale x 4 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 32 x bfloat>, <vscale x 32 x bfloat> } @llvm.vector.deinterleave2.nxv64bf16(<vscale x 64 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 32 x half>, <vscale x 32 x half> } @llvm.vector.deinterleave2.nxv64f16(<vscale x 64 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 32 x i16>, <vscale x 32 x i16> } @llvm.vector.deinterleave2.nxv64i16(<vscale x 64 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @llvm.vector.deinterleave2.nxv8bf16(<vscale x 8 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x half>, <vscale x 4 x half> } @llvm.vector.deinterleave2.nxv8f16(<vscale x 8 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x float>, <vscale x 4 x float> } @llvm.vector.deinterleave2.nxv8f32(<vscale x 8 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x i32>, <vscale x 4 x i32> } @llvm.vector.deinterleave2.nxv8i32(<vscale x 8 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x i64>, <vscale x 4 x i64> } @llvm.vector.deinterleave2.nxv8i64(<vscale x 8 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <8 x float>, <8 x float> } @llvm.vector.deinterleave2.v16f32(<16 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 3 x i32>, <vscale x 3 x i32>, <vscale x 3 x i32> } @llvm.vector.deinterleave3.nxv9i32(<vscale x 9 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 5 x i32>, <vscale x 5 x i32>, <vscale x 5 x i32> } @llvm.vector.deinterleave3.nxv15i32(<vscale x 15 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @llvm.vector.deinterleave3.nxv12bf16(<vscale x 12 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half> } @llvm.vector.deinterleave3.nxv12f16(<vscale x 12 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @llvm.vector.deinterleave3.nxv12f32(<vscale x 12 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @llvm.vector.deinterleave3.nxv12i32(<vscale x 12 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @llvm.vector.deinterleave3.nxv24bf16(<vscale x 24 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @llvm.vector.deinterleave3.nxv24f16(<vscale x 24 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @llvm.vector.deinterleave3.nxv24i16(<vscale x 24 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @llvm.vector.deinterleave3.nxv3f32(<vscale x 3 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @llvm.vector.deinterleave3.nxv3f64(<vscale x 3 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1> } @llvm.vector.deinterleave3.nxv48i1(<vscale x 48 x i1>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @llvm.vector.deinterleave3.nxv48i8(<vscale x 48 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @llvm.vector.deinterleave3.nxv6bf16(<vscale x 6 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half> } @llvm.vector.deinterleave3.nxv6f16(<vscale x 6 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @llvm.vector.deinterleave3.nxv6f32(<vscale x 6 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @llvm.vector.deinterleave3.nxv6f64(<vscale x 6 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @llvm.vector.deinterleave3.nxv6i64(<vscale x 6 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @llvm.vector.deinterleave4.nxv16bf16(<vscale x 16 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half> } @llvm.vector.deinterleave4.nxv16f16(<vscale x 16 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @llvm.vector.deinterleave4.nxv16f32(<vscale x 16 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @llvm.vector.deinterleave4.nxv16i32(<vscale x 16 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @llvm.vector.deinterleave4.nxv32bf16(<vscale x 32 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @llvm.vector.deinterleave4.nxv32f16(<vscale x 32 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @llvm.vector.deinterleave4.nxv32i16(<vscale x 32 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @llvm.vector.deinterleave4.nxv64i8(<vscale x 64 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @llvm.vector.deinterleave4.nxv4f32(<vscale x 4 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @llvm.vector.deinterleave4.nxv4f64(<vscale x 4 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1> } @llvm.vector.deinterleave4.nxv64i1(<vscale x 64 x i1>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @llvm.vector.deinterleave4.nxv8f32(<vscale x 8 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @llvm.vector.deinterleave4.nxv8bf16(<vscale x 8 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half> } @llvm.vector.deinterleave4.nxv8f16(<vscale x 8 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @llvm.vector.deinterleave4.nxv8f64(<vscale x 8 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @llvm.vector.deinterleave4.nxv8i64(<vscale x 8 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @llvm.vector.deinterleave5.nxv10bf16(<vscale x 10 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half> } @llvm.vector.deinterleave5.nxv10f16(<vscale x 10 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @llvm.vector.deinterleave5.nxv10f32(<vscale x 10 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @llvm.vector.deinterleave5.nxv10f64(<vscale x 10 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @llvm.vector.deinterleave5.nxv10i64(<vscale x 10 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @llvm.vector.deinterleave5.nxv20bf16(<vscale x 20 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half> } @llvm.vector.deinterleave5.nxv20f16(<vscale x 20 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @llvm.vector.deinterleave5.nxv20f32(<vscale x 20 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @llvm.vector.deinterleave5.nxv20i32(<vscale x 20 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @llvm.vector.deinterleave5.nxv40bf16(<vscale x 40 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @llvm.vector.deinterleave5.nxv40f16(<vscale x 40 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @llvm.vector.deinterleave5.nxv40i16(<vscale x 40 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @llvm.vector.deinterleave5.nxv5f32(<vscale x 5 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @llvm.vector.deinterleave5.nxv5f64(<vscale x 5 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1> } @llvm.vector.deinterleave5.nxv80i1(<vscale x 80 x i1>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @llvm.vector.deinterleave5.nxv80i8(<vscale x 80 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @llvm.vector.deinterleave6.nxv12bf16(<vscale x 12 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half> } @llvm.vector.deinterleave6.nxv12f16(<vscale x 12 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @llvm.vector.deinterleave6.nxv12f32(<vscale x 12 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @llvm.vector.deinterleave6.nxv12f64(<vscale x 12 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @llvm.vector.deinterleave6.nxv12i64(<vscale x 12 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @llvm.vector.deinterleave6.nxv24bf16(<vscale x 24 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half> } @llvm.vector.deinterleave6.nxv24f16(<vscale x 24 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @llvm.vector.deinterleave6.nxv24f32(<vscale x 24 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @llvm.vector.deinterleave6.nxv24i32(<vscale x 24 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @llvm.vector.deinterleave6.nxv48bf16(<vscale x 48 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @llvm.vector.deinterleave6.nxv48f16(<vscale x 48 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @llvm.vector.deinterleave6.nxv48i16(<vscale x 48 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @llvm.vector.deinterleave6.nxv6f32(<vscale x 6 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @llvm.vector.deinterleave6.nxv6f64(<vscale x 6 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1> } @llvm.vector.deinterleave6.nxv96i1(<vscale x 96 x i1>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @llvm.vector.deinterleave6.nxv96i8(<vscale x 96 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1> } @llvm.vector.deinterleave7.nxv112i1(<vscale x 112 x i1>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @llvm.vector.deinterleave7.nxv112i8(<vscale x 112 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @llvm.vector.deinterleave7.nxv14bf16(<vscale x 14 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half> } @llvm.vector.deinterleave7.nxv14f16(<vscale x 14 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @llvm.vector.deinterleave7.nxv14f32(<vscale x 14 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @llvm.vector.deinterleave7.nxv14f64(<vscale x 14 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @llvm.vector.deinterleave7.nxv14i64(<vscale x 14 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @llvm.vector.deinterleave7.nxv28bf16(<vscale x 28 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half> } @llvm.vector.deinterleave7.nxv28f16(<vscale x 28 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @llvm.vector.deinterleave7.nxv28f32(<vscale x 28 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @llvm.vector.deinterleave7.nxv28i32(<vscale x 28 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @llvm.vector.deinterleave7.nxv56bf16(<vscale x 56 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @llvm.vector.deinterleave7.nxv56f16(<vscale x 56 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @llvm.vector.deinterleave7.nxv56i16(<vscale x 56 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @llvm.vector.deinterleave7.nxv7f32(<vscale x 7 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @llvm.vector.deinterleave7.nxv7f64(<vscale x 7 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1>, <vscale x 16 x i1> } @llvm.vector.deinterleave8.nxv128i1(<vscale x 128 x i1>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @llvm.vector.deinterleave8.nxv128i8(<vscale x 128 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat>, <vscale x 2 x bfloat> } @llvm.vector.deinterleave8.nxv16bf16(<vscale x 16 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x half> } @llvm.vector.deinterleave8.nxv16f16(<vscale x 16 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float> } @llvm.vector.deinterleave8.nxv16f32(<vscale x 16 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @llvm.vector.deinterleave8.nxv16f64(<vscale x 16 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @llvm.vector.deinterleave8.nxv16i64(<vscale x 16 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat>, <vscale x 4 x bfloat> } @llvm.vector.deinterleave8.nxv32bf16(<vscale x 32 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half> } @llvm.vector.deinterleave8.nxv32f16(<vscale x 32 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @llvm.vector.deinterleave8.nxv32f32(<vscale x 32 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @llvm.vector.deinterleave8.nxv32i32(<vscale x 32 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @llvm.vector.deinterleave8.nxv64bf16(<vscale x 64 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @llvm.vector.deinterleave8.nxv64f16(<vscale x 64 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @llvm.vector.deinterleave8.nxv64i16(<vscale x 64 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x float> } @llvm.vector.deinterleave8.nxv8f32(<vscale x 8 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double> } @llvm.vector.deinterleave8.nxv8f64(<vscale x 8 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.vector.interleave2.v16f32(<8 x float>, <8 x float>) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

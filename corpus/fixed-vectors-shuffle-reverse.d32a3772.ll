; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+f,+d,+zvfh,+zvbb,+c -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

define <2 x i1> @reverse_v2i1(<2 x i1> %a) {
  %res = shufflevector <2 x i1> %a, <2 x i1> poison, <2 x i32> <i32 1, i32 0>
  %C = icmp sgt i128 -1, -170141183460469231731687303715884105728
  store i1 %C, ptr poison, align 1
  ret <2 x i1> %res
}

declare <4 x i1> @reverse_v4i1(<4 x i1>)

declare <8 x i1> @reverse_v8i1(<8 x i1>)

declare <16 x i1> @reverse_v16i1(<16 x i1>)

declare <32 x i1> @reverse_v32i1(<32 x i1>)

declare <64 x i1> @reverse_v64i1(<64 x i1>)

declare <128 x i1> @reverse_v128i1(<128 x i1>)

declare <1 x i8> @reverse_v1i8(<1 x i8>)

declare <2 x i8> @reverse_v2i8(<2 x i8>)

declare <4 x i8> @reverse_v4i8(<4 x i8>)

declare <8 x i8> @reverse_v8i8(<8 x i8>)

define <16 x i8> @reverse_v16i8(<16 x i8> %a) {
  %res = shufflevector <16 x i8> %a, <16 x i8> poison, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %B = sub <16 x i8> %a, %res
  ret <16 x i8> %B
}

declare <32 x i8> @reverse_v32i8(<32 x i8>)

declare <64 x i8> @reverse_v64i8(<64 x i8>)

declare <1 x i16> @reverse_v1i16(<1 x i16>)

declare <2 x i16> @reverse_v2i16(<2 x i16>)

declare <4 x i16> @reverse_v4i16(<4 x i16>)

declare <8 x i16> @reverse_v8i16(<8 x i16>)

declare <16 x i16> @reverse_v16i16(<16 x i16>)

declare <32 x i16> @reverse_v32i16(<32 x i16>)

declare <1 x i32> @reverse_v1i32(<1 x i32>)

declare <2 x i32> @reverse_v2i32(<2 x i32>)

declare <4 x i32> @reverse_v4i32(<4 x i32>)

declare <8 x i32> @reverse_v8i32(<8 x i32>)

declare <16 x i32> @reverse_v16i32(<16 x i32>)

declare <1 x i64> @reverse_v1i64(<1 x i64>)

declare <2 x i64> @reverse_v2i64(<2 x i64>)

declare <4 x i64> @reverse_v4i64(<4 x i64>)

declare <8 x i64> @reverse_v8i64(<8 x i64>)

declare <1 x half> @reverse_v1f16(<1 x half>)

declare <2 x half> @reverse_v2f16(<2 x half>)

declare <4 x half> @reverse_v4f16(<4 x half>)

declare <8 x half> @reverse_v8f16(<8 x half>)

declare <16 x half> @reverse_v16f16(<16 x half>)

declare <32 x half> @reverse_v32f16(<32 x half>)

declare <1 x float> @reverse_v1f32(<1 x float>)

declare <2 x float> @reverse_v2f32(<2 x float>)

declare <4 x float> @reverse_v4f32(<4 x float>)

declare <8 x float> @reverse_v8f32(<8 x float>)

declare <16 x float> @reverse_v16f32(<16 x float>)

declare <1 x double> @reverse_v1f64(<1 x double>)

declare <2 x double> @reverse_v2f64(<2 x double>)

declare <4 x double> @reverse_v4f64(<4 x double>)

declare <8 x double> @reverse_v8f64(<8 x double>)

declare <3 x i64> @reverse_v3i64(<3 x i64>)

declare <6 x i64> @reverse_v6i64(<6 x i64>)

declare <12 x i64> @reverse_v12i64(<12 x i64>)

declare <4 x i8> @reverse_v4i8_2(<2 x i8>, <2 x i8>)

declare <8 x i8> @reverse_v8i8_2(<4 x i8>, <4 x i8>)

declare <16 x i8> @reverse_v16i8_2(<8 x i8>, <8 x i8>)

declare <32 x i8> @reverse_v32i8_2(<16 x i8>, <16 x i8>)

declare <4 x i16> @reverse_v4i16_2(<2 x i16>, <2 x i16>)

declare <8 x i16> @reverse_v8i16_2(<4 x i16>, <4 x i16>)

declare <16 x i16> @reverse_v16i16_2(<8 x i16>, <8 x i16>)

declare <32 x i16> @reverse_v32i16_2(<16 x i16>, <16 x i16>)

declare <4 x i32> @reverse_v4i32_2(<2 x i32>, <2 x i32>)

declare <8 x i32> @reverse_v8i32_2(<4 x i32>, <4 x i32>)

declare <16 x i32> @reverse_v16i32_2(<8 x i32>, <8 x i32>)

declare <32 x i32> @reverse_v32i32_2(<16 x i32>, <16 x i32>)

declare <4 x i64> @reverse_v4i64_2(<2 x i64>, <2 x i64>)

declare <8 x i64> @reverse_v8i64_2(<4 x i64>, <4 x i64>)

declare <4 x half> @reverse_v4f16_2(<2 x half>, <2 x half>)

declare <8 x half> @reverse_v8f16_2(<4 x half>, <4 x half>)

declare <16 x half> @reverse_v16f16_2(<8 x half>, <8 x half>)

declare <32 x half> @reverse_v32f16_2(<16 x half>)

declare <4 x float> @reverse_v4f32_2(<2 x float>, <2 x float>)

declare <8 x float> @reverse_v8f32_2(<4 x float>, <4 x float>)

declare <16 x float> @reverse_v16f32_2(<8 x float>, <8 x float>)

declare <4 x double> @reverse_v4f64_2(<2 x double>, <2 x double>)

declare <8 x double> @reverse_v8f64_2(<4 x double>, <4 x double>)

; Function Attrs: vscale_range(16,1024)
declare <256 x i1> @reverse_v256i1(<256 x i1>) #0

; Function Attrs: vscale_range(2,2)
declare <8 x i32> @reverse_v8i32_exact_vlen_128(<8 x i32>) #1

; Function Attrs: vscale_range(4,4)
declare <16 x i32> @reverse_v16i32_exact_vlen_256(<16 x i32>) #2

declare <8 x i32> @reverse_v8i32_undef_suffix(<8 x i32>)

declare <8 x i32> @reverse_v8i32_undef_prefix(<8 x i32>)

attributes #0 = { vscale_range(16,1024) }
attributes #1 = { vscale_range(2,2) }
attributes #2 = { vscale_range(4,4) }

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <64 x i8> splat (i8 1)
@G.1 = global i64 1
@G.2 = global i64 9223372036854775807
@G.3 = global i1 false
@G.4 = global i64 9223372036854775807
@G.6 = global <8 x i8> splat (i8 127)

declare <4 x i16> @shuffle_v4i16(<4 x i16>, <4 x i16>)

declare <8 x i32> @shuffle_v8i32(<8 x i32>, <8 x i32>)

declare <4 x i16> @shuffle_xv_v4i16(<4 x i16>)

declare <4 x i16> @shuffle_vx_v4i16(<4 x i16>)

declare <4 x i16> @vrgather_permute_shuffle_vu_v4i16(<4 x i16>)

declare <4 x i16> @vrgather_permute_shuffle_uv_v4i16(<4 x i16>)

declare <4 x i16> @vrgather_shuffle_vv_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @vrgather_shuffle_xv_v4i16(<4 x i16>)

declare <4 x i16> @vrgather_shuffle_vx_v4i16(<4 x i16>)

declare <8 x i64> @vrgather_permute_shuffle_vu_v8i64(<8 x i64>)

define <8 x i64> @vrgather_permute_shuffle_uv_v8i64(<8 x i64> %x) {
  %E = extractelement <8 x i64> %x, i16 0
  %s = shufflevector <8 x i64> poison, <8 x i64> %x, <8 x i32> <i32 9, i32 10, i32 8, i32 9, i32 15, i32 8, i32 8, i32 11>
  store i64 %E, ptr @G.4, align 4
  ret <8 x i64> %s
}

declare <8 x i64> @vrgather_shuffle_vv_v8i64(<8 x i64>, <8 x i64>)

declare <8 x i64> @vrgather_shuffle_xv_v8i64(<8 x i64>)

declare <8 x i64> @vrgather_shuffle_vx_v8i64(<8 x i64>)

declare <4 x i16> @shuffle_v8i16_to_vslidedown_1(<8 x i16>)

declare <4 x i16> @shuffle_v8i16_to_vslidedown_3(<8 x i16>)

declare <2 x i32> @shuffle_v4i32_to_vslidedown(<4 x i32>)

declare <4 x i8> @interleave_shuffles(<4 x i8>)

declare <8 x i8> @splat_ve4(<8 x i8>)

declare <8 x i8> @splat_ve4_ins_i0ve2(<8 x i8>)

declare <8 x i8> @splat_ve4_ins_i1ve3(<8 x i8>)

declare <8 x i8> @splat_ve2_we0(<8 x i8>, <8 x i8>)

declare <8 x i8> @splat_ve2_we0_ins_i0ve4(<8 x i8>, <8 x i8>)

declare <8 x i8> @splat_ve2_we0_ins_i0we4(<8 x i8>, <8 x i8>)

declare <8 x i8> @splat_ve2_we0_ins_i2ve4(<8 x i8>, <8 x i8>)

declare <8 x i8> @splat_ve2_we0_ins_i2we4(<8 x i8>, <8 x i8>)

declare <8 x i8> @splat_ve2_we0_ins_i2ve4_i5we6(<8 x i8>, <8 x i8>)

declare <8 x i8> @widen_splat_ve3(<4 x i8>)

declare <4 x i16> @slidedown_v4i16(<4 x i16>)

declare <8 x i32> @slidedown_v8i32(<8 x i32>)

declare <4 x i16> @slideup_v4i16(<4 x i16>)

declare <8 x i32> @slideup_v8i32(<8 x i32>)

declare <8 x i16> @splice_unary(<8 x i16>)

declare <8 x i32> @splice_unary2(<8 x i32>)

declare <8 x i16> @splice_binary(<8 x i16>, <8 x i16>)

declare <8 x i32> @splice_binary2(<8 x i32>, <8 x i32>)

declare <4 x i16> @shuffle_shuffle_vslidedown(<16 x i16>)

declare <8 x i8> @concat_4xi8_start(<8 x i8>, <8 x i8>)

declare <8 x i8> @concat_4xi8_start_undef(<8 x i8>, <8 x i8>)

declare <8 x i8> @concat_4xi8_start_undef_at_start(<8 x i8>, <8 x i8>)

declare <8 x i8> @merge_start_into_end_non_contiguous(<8 x i8>, <8 x i8>)

declare <8 x i8> @merge_end_into_end(<8 x i8>, <8 x i8>)

declare <8 x i8> @merge_start_into_middle(<8 x i8>, <8 x i8>)

declare <8 x i8> @merge_start_into_start(<8 x i8>, <8 x i8>)

declare <8 x i8> @merge_slidedown(<8 x i8>, <8 x i8>)

declare <8 x i8> @merge_non_contiguous_slideup_slidedown(<8 x i8>, <8 x i8>)

declare <8 x i8> @unmergable(<8 x i8>, <8 x i8>)

declare <8 x i32> @shuffle_v8i32_2(<8 x i32>, <8 x i32>)

define <8 x i8> @shuffle_v64i8_v8i8(<64 x i8> %wide.vec) {
  %s = shufflevector <64 x i8> %wide.vec, <64 x i8> poison, <8 x i32> <i32 0, i32 8, i32 16, i32 24, i32 32, i32 40, i32 48, i32 56>
  %B = urem <64 x i8> %wide.vec, %wide.vec
  store <64 x i8> %B, ptr @G, align 64
  ret <8 x i8> %s
}

declare <8 x i8> @shuffle_compress_singlesrc_e8(<8 x i8>)

declare <8 x i16> @shuffle_compress_singlesrc_e16(<8 x i16>)

declare <8 x i32> @shuffle_compress_singlesrc_e32(<8 x i32>)

declare <8 x i64> @shuffle_compress_singlesrc_e64(<8 x i64>)

declare <8 x i32> @shuffle_compress_singlesrc_gaps_e32(<8 x i32>)

declare <8 x i32> @shuffle_spread2_singlesrc_e32(<8 x i32>)

declare <8 x i32> @shuffle_spread2_singlesrc_e32_index1(<8 x i32>)

declare <8 x i32> @shuffle_spread2_singlesrc_e32_index2(<8 x i32>)

declare <8 x i32> @shuffle_spread3_singlesrc_e32(<8 x i32>)

declare <8 x i32> @shuffle_spread4_singlesrc_e32(<8 x i32>)

declare <16 x i8> @shuffle_spread4_singlesrc_e8_idx0(<16 x i8>)

declare <16 x i8> @shuffle_spread4_singlesrc_e8_idx1(<16 x i8>)

declare <16 x i8> @shuffle_spread4_singlesrc_e8_idx2(<16 x i8>)

declare <16 x i8> @shuffle_spread4_singlesrc_e8_idx3(<16 x i8>)

define <16 x i8> @shuffle_spread4_singlesrc_e8_idx4(<16 x i8> %v) {
  %LGV1 = load i64, ptr @G.2, align 4
  %LGV = load i64, ptr @G.1, align 4
  %out = shufflevector <16 x i8> %v, <16 x i8> poison, <16 x i32> <i32 poison, i32 poison, i32 poison, i32 poison, i32 0, i32 poison, i32 poison, i32 poison, i32 1, i32 poison, i32 poison, i32 poison, i32 2, i32 poison, i32 poison, i32 poison>
  %C = icmp uge i64 %LGV, %LGV1
  store i1 %C, ptr @G.3, align 1
  ret <16 x i8> %out
}

declare <32 x i8> @shuffle_spread8_singlesrc_e8(<32 x i8>)

declare <8 x i32> @shuffle_decompress_singlesrc_e32(<8 x i32>)

declare <8 x i8> @shuffle_decompress_singlesrc_e8(<8 x i8>)

declare <8 x i32> @shuffle_repeat2_singlesrc_e32(<8 x i32>)

declare <8 x i32> @shuffle_repeat3_singlesrc_e32(<8 x i32>)

declare <8 x i32> @shuffle_repeat4_singlesrc_e32(<8 x i32>)

declare <16 x i32> @shuffle_disjoint_lanes(<16 x i32>, <16 x i32>)

declare <16 x i32> @shuffle_disjoint_lanes_one_identity(<16 x i32>, <16 x i32>)

declare <16 x i32> @shuffle_disjoint_lanes_one_broadcast(<16 x i32>, <16 x i32>)

declare <16 x i32> @shuffle_disjoint_lanes_one_splat(i32, <16 x i32>)

declare <4 x i128> @shuffle_i128(<4 x i128>)

declare void @shuffle_i128_ldst(ptr)

define void @shuffle_i256_ldst(ptr %p) {
  %A = alloca <4 x i256>, align 128
  store <4 x i256> poison, ptr %A, align 128
  %a = load <4 x i256>, ptr %p, align 128
  %res = shufflevector <4 x i256> %a, <4 x i256> poison, <4 x i32> <i32 0, i32 0, i32 3, i32 2>
  %B = shl <4 x i256> %res, zeroinitializer
  store <4 x i256> %res, ptr %p, align 128
  store <4 x i256> %B, ptr %A, align 128
  ret void
}

; Function Attrs: nounwind
declare void @shuffle_i64_splat(ptr) #0

; Function Attrs: nounwind
declare void @shuffle_i128_splat(ptr) #0

; Function Attrs: nounwind
declare void @shuffle_i256_splat(ptr) #0

declare <16 x i32> @shuffle_m1_prefix(<16 x i32>)

declare <16 x i32> @shuffle_m2_prefix(<16 x i32>)

declare <4 x i16> @vmerge_1(<4 x i16>)

declare <4 x i16> @vmerge_2(<4 x i16>)

declare <4 x i16> @vmerge_3(<4 x i16>)

; Function Attrs: nounwind
declare <8 x i64> @shuffle_v8i164_span_splat(<8 x i64>) #0

; Function Attrs: nounwind
declare <8 x i64> @shuffle_v8i64_span_splat_neg(<8 x i64>) #0

declare <8 x i32> @shuffle_v8i32_locally_repeating_neg(<8 x i32>)

declare <8 x i8> @identity_splat0(<8 x i8>)

declare <8 x i8> @identity_splat2(<8 x i8>)

declare <8 x i8> @vmerge_vxm(<8 x i8>, i8)

declare <8 x i8> @vmerge_vxm2(<8 x i8>, i8)

define <8 x i8> @vmerge_vxm3(<8 x i8> %v, i8 %s) {
  %S = shufflevector <8 x i8> %v, <8 x i8> %v, <8 x i32> poison
  %ins = insertelement <8 x i8> %v, i8 %s, i32 0
  %splat = shufflevector <8 x i8> %ins, <8 x i8> poison, <8 x i32> zeroinitializer
  %shuf = shufflevector <8 x i8> %v, <8 x i8> %splat, <8 x i32> <i32 8, i32 1, i32 2, i32 8, i32 8, i32 5, i32 6, i32 7>
  store <8 x i8> %S, ptr @G.6, align 8
  ret <8 x i8> %shuf
}

declare <4 x i40> @pr190605(<4 x i40>)

attributes #0 = { nounwind }

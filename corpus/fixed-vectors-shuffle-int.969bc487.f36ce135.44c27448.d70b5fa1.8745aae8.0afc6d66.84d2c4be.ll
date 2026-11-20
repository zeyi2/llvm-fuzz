; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zicsr,+zvfh -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 16)
@G.1 = global <4 x i256> splat (i256 -57896044618658097711785492504343953926634992332820282019728792003956564819968)
@G.2 = global i64 0
@G.3 = global <4 x i256> zeroinitializer
@G.4 = global i16 32767
@G.5 = global i8 0
@G.6 = global <8 x i8> zeroinitializer
@G.7 = global <8 x i1> splat (i1 true)
@G.8 = global <8 x i8> splat (i8 127)
@G.9 = global <8 x i1> splat (i1 true)
@G.10 = global i128 42
@G.11 = global <8 x i8> splat (i8 127)
@G.12 = global i1 false
@G.13 = global i32 0
@G.14 = global ptr poison
@G.15 = global i1 false
@G.16 = global <4 x float> splat (float +qnan)

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

declare <8 x i64> @vrgather_permute_shuffle_uv_v8i64(<8 x i64>)

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

declare <8 x i8> @shuffle_v64i8_v8i8(<64 x i8>)

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

declare <16 x i8> @shuffle_spread4_singlesrc_e8_idx4(<16 x i8>)

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
  %A6 = alloca i1, align 1
  %L15 = load i8, ptr %A6, align 1
  store i1 false, ptr %A6, align 1
  %G16 = getelementptr <8 x i8>, ptr %p, i8 %L15
  %A4 = alloca i1, align 1
  store i1 true, ptr %G16, align 1
  %L5 = load i1, ptr %A4, align 1
  br i1 %L5, label %T2, label %F3

BB1:                                              ; preds = %F3, %T2
  %LGV2 = load i1, ptr @G.12, align 1
  %B10 = sub i1 %L5, false
  %LGV1 = load <4 x i256>, ptr @G.3, align 128
  %C = icmp slt i64 4294967296, 0
  store i1 %B10, ptr %A6, align 1
  br i1 %LGV2, label %T, label %F

BB:                                               ; preds = %F, %T
  %A = alloca <4 x i256>, align 128
  %L = load i1, ptr %A, align 1
  store <4 x i256> poison, ptr %A, align 128
  %LGV = load <4 x i256>, ptr @G.1, align 128
  %a = load <4 x i256>, ptr %p, align 128
  %G18 = getelementptr i16, ptr %p, i1 %C
  %res = shufflevector <4 x i256> %a, <4 x i256> poison, <4 x i32> <i32 0, i32 0, i32 3, i32 2>
  store <4 x i256> %res, ptr %p, align 128
  %B = urem <4 x i256> %res, %LGV
  %B2 = and <4 x i256> %B, %LGV1
  %B1 = mul <4 x i256> %res, zeroinitializer
  %B11 = and i1 %L, %LGV2
  %B5 = or i1 %C, %L
  store <4 x i256> %B1, ptr %A, align 128
  store <4 x i256> %B2, ptr poison, align 128
  store i1 %B5, ptr @G.15, align 1
  store i1 %B11, ptr %A6, align 1
  store ptr %G18, ptr %A6, align 8
  ret void

T:                                                ; preds = %BB1
  %LGV4 = load i32, ptr @G.13, align 4
  %G = getelementptr i1, ptr %p, i32 %LGV4
  store ptr %G, ptr @G.14, align 8
  br label %BB

F:                                                ; preds = %BB1
  %G1 = getelementptr ptr, ptr %p, i1 %LGV2
  store ptr %G1, ptr @G.14, align 8
  br label %BB

T2:                                               ; preds = %0
  br label %BB1

F3:                                               ; preds = %F3, %0
  %LGV8 = load <4 x float>, ptr @G.16, align 16
  %C9 = fcmp une <4 x float> %LGV8, splat (float 1.401300e-45)
  %L7 = load i1, ptr %A6, align 1
  store <4 x i1> %C9, ptr poison, align 1
  br i1 %L7, label %F3, label %BB1
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

declare <8 x i8> @vmerge_vxm3(<8 x i8>, i8)

declare <4 x i40> @pr190605(<4 x i40>)

attributes #0 = { nounwind }

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+m,+zbb,+zfinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 -1)
@G.1 = global bfloat 4.200000e+01
@G.2 = global i1 true

declare <4 x i16> @test_padd_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_psub_h(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_padd_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_psub_b(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_and_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_or_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_xor_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_andn_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_orn_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_xnor_h(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_and_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_or_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_xor_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_andn_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_orn_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_xnor_b(<8 x i8>, <8 x i8>)

declare <2 x i32> @test_and_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_or_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_xor_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_andn_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_orn_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_xnor_w(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_not_h(<4 x i16>)

declare <8 x i8> @test_not_b(<8 x i8>)

declare <2 x i32> @test_not_w(<2 x i32>)

declare <4 x i16> @test_psadd_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_psaddu_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pssub_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pssubu_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_psh1add_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pssh1sadd_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pssh1sadd_h_addself(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_psadd_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_psaddu_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_pssub_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_pssubu_b(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_paadd_h(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_paadd_h_ext_no_trunc(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_paaddu_h(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_paaddu_h_ext_no_trunc(<2 x i32>, <2 x i32>)

declare <8 x i8> @test_paadd_b(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_paadd_b_ext_no_trunc(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_paaddu_b(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_paaddu_b_ext_no_trunc(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pabs_w(<2 x i32>)

declare <4 x i16> @test_pabs_h(<4 x i16>)

declare <8 x i8> @test_pabs_b(<8 x i8>)

declare <2 x i32> @test_pdif_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pdifu_w(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_pdif_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pdifu_h(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_pdif_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_pdifu_b(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pasub_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pasubu_h(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_pasub_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_pasubu_b(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pli_h()

define <2 x i32> @test_pli_h_v2i32() {
  %LGV = load bfloat, ptr @G.1, align 2
  %C = fcmp ugt bfloat 1.000000e+00, %LGV
  store i1 %C, ptr @G.2, align 1
  ret <2 x i32> splat (i32 6553700)
}

declare <8 x i8> @test_pli_b()

declare <4 x i16> @test_pli_b_v4i16()

declare <2 x i32> @test_pli_b_v2i32()

declare <2 x i32> @test_pli_w()

declare <4 x i16> @test_plui_h()

declare <4 x i16> @test_plui_h_negative()

declare <2 x i32> @test_plui_h_v2i32()

declare <2 x i32> @test_plui_h_negative_v2i32()

declare <2 x i32> @test_plui_w()

declare <2 x i32> @test_plui_w_negative()

declare <8 x i8> @test_allones_v8i8()

declare <4 x i16> @test_allones_v4i16()

declare <2 x i32> @test_allones_v2i32()

declare i16 @test_extract_vector_16(<4 x i16>)

declare i8 @test_extract_vector_8(<8 x i8>)

declare i32 @test_extract_vector_32(<2 x i32>)

declare i32 @test_extract_vector_32_elem1(<2 x i32>)

declare <4 x i16> @test_insert_vector_16(<4 x i16>, i16)

declare <4 x i16> @test_insert_vector_16_elem2(<4 x i16>, i16)

declare <8 x i8> @test_insert_vector_8(<8 x i8>, i8)

declare <8 x i8> @test_insert_vector_8_elem3(<8 x i8>, i8)

declare <2 x i32> @test_insert_vector_32(<2 x i32>, i32)

declare <2 x i32> @test_insert_vector_32_elem1(<2 x i32>, i32)

declare <2 x i32> @test_padd_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_psub_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_psadd_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_psaddu_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pssub_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pssubu_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_psh1add_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pssh1sadd_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pssh1sadd_w_addself(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_paadd_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_paaddu_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pasub_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pasubu_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_non_const_splat_i32(i32)

declare <8 x i8> @test_padd_bs_splat_lhs(<8 x i8>, i8)

declare <8 x i8> @test_padd_bs_splat_rhs(<8 x i8>, i8)

declare <4 x i16> @test_padd_hs_splat_lhs(<4 x i16>, i16)

declare <4 x i16> @test_padd_hs_splat_rhs(<4 x i16>, i16)

declare <2 x i32> @test_padd_ws_splat_lhs(<2 x i32>, i32)

declare <2 x i32> @test_padd_ws_splat_rhs(<2 x i32>, i32)

declare <8 x i8> @test_build_vector_i8(i8, i8, i8, i8, i8, i8, i8, i8)

declare <4 x i16> @test_build_vector_i16(i16, i16, i16, i16)

declare <2 x i32> @test_build_vector_i32(i32, i32)

declare <4 x i16> @test_pslli_h(<4 x i16>)

declare <8 x i8> @test_pslli_b(<8 x i8>)

declare <2 x i32> @test_pslli_w(<2 x i32>)

declare <2 x i32> @test_psrli_w(<2 x i32>)

declare <4 x i16> @test_psrli_h(<4 x i16>)

declare <8 x i8> @test_psrli_b(<8 x i8>)

declare <2 x i32> @test_psrai_w(<2 x i32>)

declare <4 x i16> @test_psrai_h(<4 x i16>)

declare <8 x i8> @test_psrai_b(<8 x i8>)

declare <2 x i32> @test_psslai_w(<2 x i32>)

declare <4 x i16> @test_psslai_h(<4 x i16>)

declare <8 x i8> @test_psslai_b(<8 x i8>)

declare <4 x i16> @test_pssla_hs(<4 x i16>, i16)

declare <2 x i32> @test_pssla_ws(<2 x i32>, i32)

declare <4 x i16> @test_pssla_h(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pssla_w(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_psll_hs(<4 x i16>, i16)

declare <4 x i16> @test_psll_hs_mask(<4 x i16>, i16)

declare <8 x i8> @test_psll_bs(<8 x i8>, i8)

declare <8 x i8> @test_psll_bs_mask(<8 x i8>, i8)

declare <2 x i32> @test_psll_ws(<2 x i32>, i32)

declare <2 x i32> @test_psll_ws_mask(<2 x i32>, i32)

declare <2 x i32> @test_psll_ws_vec_shamt(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_psrl_hs(<4 x i16>, i16)

declare <4 x i16> @test_psrl_hs_mask(<4 x i16>, i16)

declare <8 x i8> @test_psrl_bs(<8 x i8>, i8)

declare <8 x i8> @test_psrl_bs_mask(<8 x i8>, i8)

declare <2 x i32> @test_psrl_ws(<2 x i32>, i32)

declare <2 x i32> @test_psrl_ws_mask(<2 x i32>, i32)

declare <4 x i16> @test_psra_hs(<4 x i16>, i16)

define <4 x i16> @test_psra_hs_mask(<4 x i16> %a, i16 %shamt) {
  %masked = and i16 %shamt, 15
  %insert = insertelement <4 x i16> poison, i16 %masked, i32 0
  %S = shufflevector <4 x i16> %a, <4 x i16> %insert, <4 x i32> poison
  ret <4 x i16> %S
}

declare <8 x i8> @test_psra_bs(<8 x i8>, i8)

declare <8 x i8> @test_psra_bs_mask(<8 x i8>, i8)

declare <2 x i32> @test_psra_ws(<2 x i32>, i32)

declare <2 x i32> @test_psra_ws_mask(<2 x i32>, i32)

declare <2 x i32> @test_psrl_ws_vec_shamt(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_psra_ws_vec_shamt(<2 x i32>, <2 x i32>)

declare <8 x i8> @test_psll_s_u8x8(<8 x i8>, i32)

declare <4 x i16> @test_psll_s_u16x4(<4 x i16>, i32)

declare <2 x i32> @test_psll_s_u32x2(<2 x i32>, i32)

declare <8 x i8> @test_psrl_s_u8x8(<8 x i8>, i32)

declare <4 x i16> @test_psrl_s_u16x4(<4 x i16>, i32)

declare <2 x i32> @test_psrl_s_u32x2(<2 x i32>, i32)

declare <8 x i8> @test_psra_s_i8x8(<8 x i8>, i32)

declare <4 x i16> @test_psra_s_i16x4(<4 x i16>, i32)

declare <2 x i32> @test_psra_s_i32x2(<2 x i32>, i32)

declare <4 x i16> @test_pssha_s_i16x4(<4 x i16>, i32)

declare <2 x i32> @test_pssha_s_i32x2(<2 x i32>, i32)

declare <4 x i16> @test_psshar_s_i16x4(<4 x i16>, i32)

declare <2 x i32> @test_psshar_s_i32x2(<2 x i32>, i32)

declare <4 x i16> @test_psshl_s_u16x4(<4 x i16>, i32)

declare <2 x i32> @test_psshl_s_u32x2(<2 x i32>, i32)

declare <4 x i16> @test_psshlr_s_u16x4(<4 x i16>, i32)

declare <2 x i32> @test_psshlr_s_u32x2(<2 x i32>, i32)

declare <4 x i16> @test_pssha_s_i16x4_imm(<4 x i16>)

declare <4 x i16> @test_psshar_s_i16x4_imm(<4 x i16>)

declare <4 x i16> @test_pssha_s_i16x4_neg_imm(<4 x i16>)

declare <4 x i16> @test_psshar_s_i16x4_neg_imm(<4 x i16>)

declare <2 x i32> @test_pssha_s_i32x2_imm(<2 x i32>)

declare <2 x i32> @test_psshar_s_i32x2_imm(<2 x i32>)

declare <2 x i32> @test_pssha_s_i32x2_neg_imm(<2 x i32>)

declare <2 x i32> @test_psshar_s_i32x2_neg_imm(<2 x i32>)

declare <2 x i32> @test_pssha_s_i32x2_neg_imm_max(<2 x i32>)

declare <2 x i32> @test_pssha_s_i32x2_neg_imm_too_large(<2 x i32>)

declare <8 x i8> @test_pmulh_b(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pmulh_h(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulh_w(<2 x i32>, <2 x i32>)

declare <8 x i8> @test_pmulhu_b(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pmulhu_h(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulhu_w(<2 x i32>, <2 x i32>)

declare <8 x i8> @test_pmulhsu_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_pmulhsu_b_commuted(<8 x i8>, <8 x i8>)

define <4 x i16> @test_pmulhsu_h(<4 x i16> %a, <4 x i16> %b) {
  %a_ext = sext <4 x i16> %a to <4 x i32>
  %b_ext = zext <4 x i16> %b to <4 x i32>
  %mul = mul <4 x i32> %a_ext, %b_ext
  %shift = lshr <4 x i32> %mul, splat (i32 16)
  %res = trunc <4 x i32> %shift to <4 x i16>
  %B = add <4 x i32> %a_ext, splat (i32 42)
  store <4 x i32> %B, ptr poison, align 16
  ret <4 x i16> %res
}

declare <4 x i16> @test_pmulhsu_h_commuted(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulhsu_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmulhsu_w_commuted(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_pmulhr_h(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulhr_w(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_pmulhru_h(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulhru_w(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_pmulhrsu_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmulhrsu_h_commuted(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulhrsu_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmulhrsu_w_commuted(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_pmul_h(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_pmul_b(<8 x i8>, <8 x i8>)

declare <2 x i32> @test_pmul_w(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_psdiv_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_psdiv_mulhs_h(<4 x i16>)

declare <4 x i16> @test_psdiv_mulhsu_h(<4 x i16>)

declare <8 x i8> @test_psdiv_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_psdiv_mulhs_b(<8 x i8>)

declare <8 x i8> @test_psdiv_mulhsu_b(<8 x i8>)

declare <2 x i32> @test_psdiv_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_psdiv_mulhsu_w(<2 x i32>)

declare <4 x i16> @test_pudiv_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pudiv_mulhu_h(<4 x i16>)

declare <8 x i8> @test_pudiv_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_pudiv_mulhu_b(<8 x i8>)

declare <2 x i32> @test_pudiv_w(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_psrem_h(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_psrem_b(<8 x i8>, <8 x i8>)

declare <2 x i32> @test_psrem_w(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_purem_h(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_purem_b(<8 x i8>, <8 x i8>)

declare <2 x i32> @test_purem_w(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_eq_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_ne_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_nez_h(<4 x i16>)

declare <4 x i16> @test_slt_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_sle_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_sgt_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_sge_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_sgez_h(<4 x i16>)

declare <4 x i16> @test_ult_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_ule_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_ugt_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_uge_h(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_eq_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_ne_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_nez_b(<8 x i8>)

declare <8 x i8> @test_slt_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_sle_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_sgt_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_sge_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_sgez_b(<8 x i8>)

declare <8 x i8> @test_ult_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_ule_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_ugt_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_uge_b(<8 x i8>, <8 x i8>)

declare <2 x i32> @test_eq_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_ne_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_nez_w(<2 x i32>)

declare <2 x i32> @test_slt_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_sle_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_sgt_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_sge_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_sgez_w(<2 x i32>)

declare <2 x i32> @test_ult_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_ule_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_ugt_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_uge_w(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_smin_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_umin_h(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_smin_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_umin_b(<8 x i8>, <8 x i8>)

declare <2 x i32> @test_smin_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_umin_w(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_smax_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_umax_h(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_smax_b(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_umax_b(<8 x i8>, <8 x i8>)

define <2 x i32> @test_smax_w(<2 x i32> %a, <2 x i32> %b) {
  %max = call <2 x i32> @llvm.smax.v2i32(<2 x i32> %a, <2 x i32> %b)
  %B = srem <2 x i32> %max, %a
  ret <2 x i32> %B
}

define <2 x i32> @test_umax_w(<2 x i32> %a, <2 x i32> %b) {
  %LGV = load <2 x i64>, ptr @G, align 16
  %B = urem <2 x i64> %LGV, zeroinitializer
  %max = call <2 x i32> @llvm.umax.v2i32(<2 x i32> %a, <2 x i32> %b)
  store <2 x i64> %B, ptr poison, align 16
  ret <2 x i32> %max
}

declare <4 x i16> @test_select_v4i16(i1, <4 x i16>, <4 x i16>)

declare <8 x i8> @test_select_v8i8(i1, <8 x i8>, <8 x i8>)

declare <2 x i32> @test_select_v2i32(i1, <2 x i32>, <2 x i32>)

declare <4 x i16> @test_vselect_v4i16(<4 x i16>, <4 x i16>, <4 x i16>)

declare <8 x i8> @test_vselect_v8i8(<8 x i8>, <8 x i8>, <8 x i8>)

declare <2 x i32> @test_vselect_v2i32(<2 x i32>, <2 x i32>, <2 x i32>)

declare <4 x i16> @test_bswap_v4i16(<4 x i16>)

declare <2 x i32> @test_bswap_v2i32(<2 x i32>)

declare <8 x i8> @test_bitreverse_v8i8(<8 x i8>)

declare <4 x i16> @test_bitreverse_v4i16(<4 x i16>)

declare <2 x i32> @test_bitreverse_v2i32(<2 x i32>)

declare <4 x i16> @test_zext_v4i8_to_v4i16(<4 x i8>)

declare <2 x i32> @test_zext_v2i16_to_v2i32(<2 x i16>)

declare <4 x i16> @test_sext_v4i8_to_v4i16(<4 x i8>)

declare <2 x i32> @test_sext_v2i16_to_v2i32(<2 x i16>)

declare <8 x i8> @test_paadd_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_paaddu_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_pasub_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_pasubu_v8i8(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_paadd_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_paaddu_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pasub_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pasubu_v4i16(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_paadd_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_paaddu_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pasub_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pasubu_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i16> @test_pnsrai_h(<2 x i32>)

declare <4 x i8> @test_pnsrai_b(<4 x i16>)

declare <4 x i8> @test_pnsrl_bs(<4 x i16>, i16)

declare <4 x i8> @test_pnsrl_bs_mask(<4 x i16>, i16)

declare <2 x i16> @test_pnsrl_hs(<2 x i32>, i32)

declare <2 x i16> @test_pnsrl_hs_mask(<2 x i32>, i32)

declare <4 x i8> @test_pnsra_bs(<4 x i16>, i16)

declare <4 x i8> @test_pnsra_bs_mask(<4 x i16>, i16)

declare <2 x i16> @test_pnsra_hs(<2 x i32>, i32)

declare <2 x i16> @test_pnsra_hs_mask(<2 x i32>, i32)

declare <8 x i8> @test_pabd_v8i8(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pabd_v4i16(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_pabdu_v8i8(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pabdu_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pas_x_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_psa_x_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_psas_x_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pssa_x_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_paas_x_h(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pasa_x_h(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pas_x_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_psa_x_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_psas_x_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pssa_x_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_paas_x_w(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pasa_x_w(<2 x i32>, <2 x i32>)

declare i32 @test_predsum_i8x8_i32(<8 x i8>, i32)

declare i32 @test_predsumu_u8x8_u32(<8 x i8>, i32)

declare i64 @test_predsum_i8x8_i64(<8 x i8>, i64)

declare i64 @test_predsumu_u8x8_u64(<8 x i8>, i64)

declare i32 @test_predsum_i16x4_i32(<4 x i16>, i32)

declare i32 @test_predsumu_u16x4_u32(<4 x i16>, i32)

declare i64 @test_predsum_i16x4_i64(<4 x i16>, i64)

declare i64 @test_predsumu_u16x4_u64(<4 x i16>, i64)

declare i64 @test_predsum_i32x2_i64(<2 x i32>, i64)

declare i64 @test_predsumu_u32x2_u64(<2 x i32>, i64)

declare <8 x i8> @test_pmerge_merge_u8x8(<8 x i8>, <8 x i8>, <8 x i8>)

declare <8 x i8> @test_pmerge_mvm_u8x8(<8 x i8>, <8 x i8>, <8 x i8>)

declare <8 x i8> @test_pmerge_mvmn_u8x8(<8 x i8>, <8 x i8>, <8 x i8>)

declare <8 x i8> @test_pmerge_merge_i8x8(<8 x i8>, <8 x i8>, <8 x i8>)

declare <8 x i8> @test_pmerge_mvm_i8x8(<8 x i8>, <8 x i8>, <8 x i8>)

declare <8 x i8> @test_pmerge_mvmn_i8x8(<8 x i8>, <8 x i8>, <8 x i8>)

declare <4 x i16> @test_pmerge_merge_u16x4(<4 x i16>, <4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmerge_mvm_u16x4(<4 x i16>, <4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmerge_mvmn_u16x4(<4 x i16>, <4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmerge_merge_i16x4(<4 x i16>, <4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmerge_mvm_i16x4(<4 x i16>, <4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmerge_mvmn_i16x4(<4 x i16>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmerge_merge_u32x2(<2 x i32>, <2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmerge_mvm_u32x2(<2 x i32>, <2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmerge_mvmn_u32x2(<2 x i32>, <2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmerge_merge_i32x2(<2 x i32>, <2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmerge_mvm_i32x2(<2 x i32>, <2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmerge_mvmn_i32x2(<2 x i32>, <2 x i32>, <2 x i32>)

declare <4 x i16> @test_psext_b_v4i16(<4 x i16>)

declare <2 x i32> @test_psext_b_v2i32(<2 x i32>)

declare <2 x i32> @test_psext_h_v2i32(<2 x i32>)

declare <4 x i16> @test_pzext_b_v4i16(<4 x i16>)

declare <2 x i32> @test_pzext_h_v2i32(<2 x i32>)

declare <4 x i16> @test_riscv_psext_b_v4i16(<4 x i16>)

declare <2 x i32> @test_riscv_psext_b_v2i32(<2 x i32>)

declare <2 x i32> @test_riscv_psext_h_v2i32(<2 x i32>)

declare <4 x i16> @test_riscv_pzext_b_v4i16(<4 x i16>)

declare <2 x i32> @test_riscv_pzext_h_v2i32(<2 x i32>)

declare <4 x i16> @test_pmulh_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmulhr_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmulhu_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmulhru_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmulhsu_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmulhrsu_v4i16(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulh_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmulhr_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmulhu_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmulhru_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmulhsu_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmulhrsu_v2i32(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_pmhacc_v4i16(<4 x i16>, <4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmhracc_v4i16(<4 x i16>, <4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmhaccu_v4i16(<4 x i16>, <4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmhraccu_v4i16(<4 x i16>, <4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmhaccsu_v4i16(<4 x i16>, <4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmhraccsu_v4i16(<4 x i16>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmhacc_v2i32(<2 x i32>, <2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmhracc_v2i32(<2 x i32>, <2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmhaccu_v2i32(<2 x i32>, <2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmhraccu_v2i32(<2 x i32>, <2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmhaccsu_v2i32(<2 x i32>, <2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmhraccsu_v2i32(<2 x i32>, <2 x i32>, <2 x i32>)

declare i32 @test_pabdsumu_u8x8_u32(<8 x i8>, <8 x i8>)

declare i64 @test_pabdsumu_u8x8_u64(<8 x i8>, <8 x i8>)

declare i32 @test_pabdsumau_u8x8_u32(i32, <8 x i8>, <8 x i8>)

declare i64 @test_pabdsumau_u8x8_u64(i64, <8 x i8>, <8 x i8>)

declare <8 x i8> @test_psabs_v8i8(<8 x i8>)

declare <4 x i16> @test_psabs_v4i16(<4 x i16>)

declare <4 x i16> @test_pmulq_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pmulqr_v4i16(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulq_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pmulqr_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_return_zero()

declare <8 x i8> @test_undef_v8i8()

declare <4 x i16> @test_undef_v4i16()

declare <2 x i32> @test_undef_v2i32()

declare <2 x i32> @test_ppaire_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_ppaireo_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_ppairoe_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_ppairo_v2i32(<2 x i32>, <2 x i32>)

declare <8 x i8> @test_ppaireo_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_ppairoe_v8i8(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_ppaireo_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_ppairoe_v4i16(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_ppaire_swapped_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_ppairo_swapped_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_ppaireo_swapped_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_ppairoe_swapped_v8i8(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_ppaire_swapped_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_ppairo_swapped_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_ppaireo_swapped_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_ppairoe_swapped_v4i16(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_ppair_v1_used_twice_v8i8(<8 x i8>)

declare <8 x i8> @test_ppair_v2_used_twice_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @test_pnclipp_v8i8(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_pnclipup_v8i8(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pnclipp_v4i16(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_pnclipup_v4i16(<2 x i32>, <2 x i32>)

declare i64 @test_pnclipp_v2i32(i64, i64)

declare i64 @test_pnclipup_v2i32(i64, i64)

declare <2 x i32> @test_pmqacc_h00_i32x2(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmqacc_h01_i32x2(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmqacc_h11_i32x2(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmqracc_h00_i32x2(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmqracc_h01_i32x2(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmqracc_h11_i32x2(<2 x i32>, <4 x i16>, <4 x i16>)

declare i64 @test_mqacc_w00_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_mqacc_w01_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_mqacc_w11_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_mqracc_w00_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_mqracc_w01_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_mqracc_w11_i64(i64, <2 x i32>, <2 x i32>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmul.00.v4i16(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmul.01.v4i16(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmul.11.v4i16(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulu.00.v4i16(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulu.01.v4i16(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulu.11.v4i16(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulsu.00.v4i16(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulsu.11.v4i16(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmul.00.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmul.01.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmul.11.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulu.00.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulu.01.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulu.11.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulsu.00.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulsu.11.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mul.00.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mul.01.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mul.11.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mulu.00.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mulu.01.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mulu.11.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mulsu.00.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mulsu.11.i64.v2i32(<2 x i32>, <2 x i32>) #0

declare <4 x i16> @test_pmul_b00_v4i16(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pmul_b01_v4i16(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pmul_b11_v4i16(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pmulu_b00_v4i16(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pmulu_b01_v4i16(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pmulu_b11_v4i16(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pmulsu_b00_v4i16(<8 x i8>, <8 x i8>)

declare <4 x i16> @test_pmulsu_b11_v4i16(<8 x i8>, <8 x i8>)

declare <2 x i32> @test_pmul_h00_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmul_h01_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmul_h11_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulu_h00_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulu_h01_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulu_h11_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulsu_h00_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmulsu_h11_v2i32(<4 x i16>, <4 x i16>)

declare i64 @test_mul_w00_i64(<2 x i32>, <2 x i32>)

declare i64 @test_mul_w01_i64(<2 x i32>, <2 x i32>)

declare i64 @test_mul_w11_i64(<2 x i32>, <2 x i32>)

declare i64 @test_mulu_w00_i64(<2 x i32>, <2 x i32>)

declare i64 @test_mulu_w01_i64(<2 x i32>, <2 x i32>)

declare i64 @test_mulu_w11_i64(<2 x i32>, <2 x i32>)

declare i64 @test_mulsu_w00_i64(<2 x i32>, <2 x i32>)

declare i64 @test_mulsu_w11_i64(<2 x i32>, <2 x i32>)

declare <2 x i32> @test_pm4add_v8i8_v2i32(<8 x i8>, <8 x i8>)

declare <2 x i32> @test_pm2add_v4i16_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pm2add_x_v4i16_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pm4addu_v8i8_v2i32(<8 x i8>, <8 x i8>)

declare <2 x i32> @test_pm2addu_v4i16_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmq2add_v4i16_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmqr2add_v4i16_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pm2sadd_v4i16_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pm2sadd_x_v4i16_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pm2sub_v4i16_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pm2sub_x_v4i16_v2i32(<4 x i16>, <4 x i16>)

declare <2 x i32> @test_pm4addsu_v8i8_v2i32(<8 x i8>, <8 x i8>)

declare <2 x i32> @test_pm2addsu_v4i16_v2i32(<4 x i16>, <4 x i16>)

declare i64 @test_pm2add_v2i32_i64(<2 x i32>, <2 x i32>)

declare i64 @test_pm2add_x_v2i32_i64(<2 x i32>, <2 x i32>)

declare i64 @test_pm2addu_v2i32_i64(<2 x i32>, <2 x i32>)

declare i64 @test_pmq2add_v2i32_i64(<2 x i32>, <2 x i32>)

declare i64 @test_pmqr2add_v2i32_i64(<2 x i32>, <2 x i32>)

declare i64 @test_pm2sub_v2i32_i64(<2 x i32>, <2 x i32>)

declare i64 @test_pm2sub_x_v2i32_i64(<2 x i32>, <2 x i32>)

declare i64 @test_pm2addsu_v2i32_i64(<2 x i32>, <2 x i32>)

declare i64 @test_pm4add_v4i16_i64(<4 x i16>, <4 x i16>)

declare i64 @test_pm4addu_v4i16_i64(<4 x i16>, <4 x i16>)

declare i64 @test_pm4addsu_v4i16_i64(<4 x i16>, <4 x i16>)

declare i64 @test_pm2wadd_v2i16_i64(<2 x i16>, <2 x i16>)

declare i64 @test_pm2wadd_x_v2i16_i64(<2 x i16>, <2 x i16>)

declare i64 @test_pm2waddu_v2i16_i64(<2 x i16>, <2 x i16>)

declare i64 @test_pm2wsub_v2i16_i64(<2 x i16>, <2 x i16>)

declare i64 @test_pm2wsub_x_v2i16_i64(<2 x i16>, <2 x i16>)

declare i64 @test_pm2waddsu_v2i16_i64(<2 x i16>, <2 x i16>)

declare i64 @test_pm2wadda_v2i16_i64(i64, <2 x i16>, <2 x i16>)

declare i64 @test_pm2wadda_x_v2i16_i64(i64, <2 x i16>, <2 x i16>)

declare i64 @test_pm2waddau_v2i16_i64(i64, <2 x i16>, <2 x i16>)

declare i64 @test_pm2wsuba_v2i16_i64(i64, <2 x i16>, <2 x i16>)

declare i64 @test_pm2wsuba_x_v2i16_i64(i64, <2 x i16>, <2 x i16>)

declare i64 @test_pm2waddasu_v2i16_i64(i64, <2 x i16>, <2 x i16>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmacc.00.v2i32(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmacc.01.v2i32(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmacc.11.v2i32(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmaccu.00.v2i32(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmaccu.01.v2i32(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmaccu.11.v2i32(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmaccsu.00.v2i32(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmaccsu.11.v2i32(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.macc.00.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.macc.01.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.macc.11.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.maccu.00.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.maccu.01.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.maccu.11.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.maccsu.00.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.maccsu.11.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmhacc.b0.v4i16(<4 x i16>, <4 x i16>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmhacc.b1.v4i16(<4 x i16>, <4 x i16>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmhaccsu.b0.v4i16(<4 x i16>, <4 x i16>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmhaccsu.b1.v4i16(<4 x i16>, <4 x i16>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmhacc.h0.v2i32(<2 x i32>, <2 x i32>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmhacc.h1.v2i32(<2 x i32>, <2 x i32>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmhaccsu.h0.v2i32(<2 x i32>, <2 x i32>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmhaccsu.h1.v2i32(<2 x i32>, <2 x i32>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmqwacc.i32x2(<2 x i32>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmqrwacc.i32x2(<2 x i32>, <2 x i16>, <2 x i16>) #0

declare <2 x i32> @test_pmqwacc_i32x2(<2 x i32>, <2 x i16>, <2 x i16>)

declare <2 x i32> @test_pmqrwacc_i32x2(<2 x i32>, <2 x i16>, <2 x i16>)

declare <2 x i32> @test_pmacc_h00_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmacc_h01_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmacc_h11_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmaccu_h00_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmaccu_h01_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmaccu_h11_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmaccsu_h00_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmaccsu_h11_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pwmacc_i32x2(<2 x i32>, <2 x i16>, <2 x i16>)

declare <2 x i32> @test_pwmaccu_u32x2(<2 x i32>, <2 x i16>, <2 x i16>)

declare <2 x i32> @test_pwmaccsu_i32x2(<2 x i32>, <2 x i16>, <2 x i16>)

declare i64 @test_macc_w00_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_macc_w01_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_macc_w11_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_maccu_w00_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_maccu_w01_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_maccu_w11_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_maccsu_w00_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_maccsu_w11_i64(i64, <2 x i32>, <2 x i32>)

declare <4 x i16> @test_pmhacc_b0_v4i16(<4 x i16>, <4 x i16>, <8 x i8>)

declare <4 x i16> @test_pmhacc_b1_v4i16(<4 x i16>, <4 x i16>, <8 x i8>)

declare <4 x i16> @test_pmhaccsu_b0_v4i16(<4 x i16>, <4 x i16>, <8 x i8>)

declare <4 x i16> @test_pmhaccsu_b1_v4i16(<4 x i16>, <4 x i16>, <8 x i8>)

declare <2 x i32> @test_pmhacc_h0_v2i32(<2 x i32>, <2 x i32>, <4 x i16>)

declare <2 x i32> @test_pmhacc_h1_v2i32(<2 x i32>, <2 x i32>, <4 x i16>)

declare <2 x i32> @test_pmhaccsu_h0_v2i32(<2 x i32>, <2 x i32>, <4 x i16>)

declare <2 x i32> @test_pmhaccsu_h1_v2i32(<2 x i32>, <2 x i32>, <4 x i16>)

declare <4 x i16> @test_pmulh_b0_v4i16(<4 x i16>, <8 x i8>)

declare <4 x i16> @test_pmulh_b1_v4i16(<4 x i16>, <8 x i8>)

declare <4 x i16> @test_pmulhsu_b0_v4i16(<4 x i16>, <8 x i8>)

declare <4 x i16> @test_pmulhsu_b1_v4i16(<4 x i16>, <8 x i8>)

declare <2 x i32> @test_pmulh_h0_v2i32(<2 x i32>, <4 x i16>)

declare <2 x i32> @test_pmulh_h1_v2i32(<2 x i32>, <4 x i16>)

declare <2 x i32> @test_pmulhsu_h0_v2i32(<2 x i32>, <4 x i16>)

declare <2 x i32> @test_pmulhsu_h1_v2i32(<2 x i32>, <4 x i16>)

declare <4 x i16> @test_psati_i16x4(<4 x i16>)

declare <4 x i16> @test_psati_i16x4_min_width(<4 x i16>)

declare <4 x i16> @test_psati_i16x4_max_width(<4 x i16>)

declare <2 x i32> @test_psati_i32x2(<2 x i32>)

declare <2 x i32> @test_psati_i32x2_max_width(<2 x i32>)

declare <4 x i16> @test_pusati_u16x4(<4 x i16>)

declare <4 x i16> @test_pusati_u16x4_max_width(<4 x i16>)

declare <2 x i32> @test_pusati_u32x2(<2 x i32>)

declare <2 x i32> @test_pusati_u32x2_max_width(<2 x i32>)

declare <8 x i8> @test_pslide1up_v8i8(<8 x i8>, i8)

declare <8 x i8> @test_pslide1down_v8i8(<8 x i8>, i8)

declare <4 x i16> @test_pslide1up_v4i16(<4 x i16>, i16)

declare <4 x i16> @test_pslide1down_v4i16(<4 x i16>, i16)

declare <2 x i32> @test_pslide1up_v2i32(<2 x i32>, i32)

declare <2 x i32> @test_pslide1down_v2i32(<2 x i32>, i32)

declare <8 x i8> @test_pslideupx_v8i8(<8 x i8>, <8 x i8>, i32)

declare <8 x i8> @test_pslidedownx_v8i8(<8 x i8>, <8 x i8>, i32)

declare <4 x i16> @test_pslideupx_v4i16(<4 x i16>, <4 x i16>, i32)

declare <4 x i16> @test_pslidedownx_v4i16(<4 x i16>, <4 x i16>, i32)

declare <2 x i32> @test_pslideupx_v2i32(<2 x i32>, <2 x i32>, i32)

declare <2 x i32> @test_pslidedownx_v2i32(<2 x i32>, <2 x i32>, i32)

declare <2 x i32> @test_pm2adda_v4i16_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pm2adda_x_v4i16_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pm2addau_v4i16_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmq2adda_v4i16_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pmqr2adda_v4i16_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pm2suba_v4i16_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pm2suba_x_v4i16_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @test_pm2addasu_v4i16_v2i32(<2 x i32>, <4 x i16>, <4 x i16>)

declare i64 @test_pm2adda_v2i32_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_pm2adda_x_v2i32_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_pm2addau_v2i32_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_pmq2adda_v2i32_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_pmqr2adda_v2i32_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_pm2suba_v2i32_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_pm2suba_x_v2i32_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_pm2addasu_v2i32_i64(i64, <2 x i32>, <2 x i32>)

declare i64 @test_pm4adda_v4i16_i64(i64, <4 x i16>, <4 x i16>)

declare i64 @test_pm4addau_v4i16_i64(i64, <4 x i16>, <4 x i16>)

declare i64 @test_pm4addasu_v4i16_i64(i64, <4 x i16>, <4 x i16>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.abs.v2i32(<2 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.abs.v4i16(<4 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.abs.v8i8(<8 x i8>, i1 immarg) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.bitreverse.v2i32(<2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.bitreverse.v4i16(<4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.bitreverse.v8i8(<8 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.bswap.v2i32(<2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.bswap.v4i16(<4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshl.i64(i64, i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshr.i64(i64, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mqacc.00.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mqacc.01.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mqacc.11.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mqracc.00.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mqracc.01.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mqracc.11.i64.v2i32(i64, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.paadd.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.paadd.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.paadd.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.paaddu.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.paaddu.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.paaddu.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.paas.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.paas.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pabd.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.pabd.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pabdsumau.i32.v8i8(i32, <8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pabdsumau.i64.v8i8(i64, <8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pabdsumu.i32.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pabdsumu.i64.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pabdu.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.pabdu.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pas.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pas.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pasa.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pasa.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pasub.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pasub.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.pasub.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pasubu.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pasubu.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.pasubu.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2add.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm2add.v2i32.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2add.x.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm2add.x.v2i32.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2addsu.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm2addsu.v2i32.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2addu.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm2addu.v2i32.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm2sadd.v2i32.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm2sadd.x.v2i32.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2sub.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm2sub.v2i32.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2sub.x.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm2sub.x.v2i32.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2wadd.i64.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2wadd.x.i64.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2wadda.i64.v2i16(i64, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2wadda.x.i64.v2i16(i64, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2waddasu.i64.v2i16(i64, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2waddau.i64.v2i16(i64, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2waddsu.i64.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2waddu.i64.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2wsub.i64.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2wsub.x.i64.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2wsuba.i64.v2i16(i64, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm2wsuba.x.i64.v2i16(i64, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm4add.i64.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4add.v2i32.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm4addsu.i64.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4addsu.v2i32.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pm4addu.i64.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4addu.v2i32.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmerge.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmerge.v4i16(<4 x i16>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.pmerge.v8i8(<8 x i8>, <8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmhacc.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmhacc.v4i16(<4 x i16>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmhaccsu.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmhaccsu.v4i16(<4 x i16>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmhaccu.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmhaccu.v4i16(<4 x i16>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmhracc.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmhracc.v4i16(<4 x i16>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmhraccsu.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmhraccsu.v4i16(<4 x i16>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmhraccu.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmhraccu.v4i16(<4 x i16>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pmq2add.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmq2add.v2i32.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmqacc.h00.v2i32.v4i16(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmqacc.h01.v2i32.v4i16(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmqacc.h11.v2i32.v4i16(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.pmqr2add.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmqr2add.v2i32.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmqracc.h00.v2i32.v4i16(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmqracc.h01.v2i32.v4i16(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmqracc.h11.v2i32.v4i16(<2 x i32>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulh.b0.v4i16(<4 x i16>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulh.b1.v4i16(<4 x i16>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulh.h0.v2i32(<2 x i32>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulh.h1.v2i32(<2 x i32>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulhr.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulhr.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulhrsu.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulhrsu.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulhru.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulhru.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulhsu.b0.v4i16(<4 x i16>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulhsu.b1.v4i16(<4 x i16>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulhsu.h0.v2i32(<2 x i32>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulhsu.h1.v2i32(<2 x i32>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulhsu.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulhsu.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulq.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulq.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulqr.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pmulqr.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pnclipp.v2i32.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pnclipp.v4i16.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.pnclipp.v8i8.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pnclipup.v2i32.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pnclipup.v4i16.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.pnclipup.v8i8.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.predsum.i32.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.predsum.i32.v8i8(<8 x i8>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.predsum.i64.v2i32(<2 x i32>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.predsum.i64.v4i16(<4 x i16>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.predsum.i64.v8i8(<8 x i8>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.predsumu.i32.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.predsumu.i32.v8i8(<8 x i8>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.predsumu.i64.v2i32(<2 x i32>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.predsumu.i64.v4i16(<4 x i16>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.predsumu.i64.v8i8(<8 x i8>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.psa.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.psa.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.psabs.v4i16(<4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.psabs.v8i8(<8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.psas.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.psas.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.psati.v2i32(<2 x i32>, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.psati.v4i16(<4 x i16>, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.psext.b.v2i32(<2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.psext.b.v4i16(<4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.psext.h.v2i32(<2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.psll.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.psll.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.psll.v8i8(<8 x i8>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.psra.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.psra.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.psra.v8i8(<8 x i8>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.psrl.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.psrl.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.psrl.v8i8(<8 x i8>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pssa.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pssa.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pssha.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pssha.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.psshar.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.psshar.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.psshl.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.psshl.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.psshlr.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.psshlr.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pusati.v2i32(<2 x i32>, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pusati.v4i16(<4 x i16>, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pwmacc.i32x2.v2i32.v2i16(<2 x i32>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pwmaccsu.i32x2.v2i32.v2i16(<2 x i32>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pwmaccu.u32x2.v2i32.v2i16(<2 x i32>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pzext.b.v4i16(<4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pzext.h.v2i32(<2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.sadd.sat.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.sadd.sat.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.sadd.sat.v8i8(<8 x i8>, <8 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.smax.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.smax.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.smax.v8i8(<8 x i8>, <8 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.smin.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.smin.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.smin.v8i8(<8 x i8>, <8 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.smulh.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.smulh.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.sshl.sat.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.sshl.sat.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.sshl.sat.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.ssub.sat.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.ssub.sat.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.ssub.sat.v8i8(<8 x i8>, <8 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.uadd.sat.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.uadd.sat.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.uadd.sat.v8i8(<8 x i8>, <8 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.umax.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.umax.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.umax.v8i8(<8 x i8>, <8 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.umin.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.umin.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.umin.v8i8(<8 x i8>, <8 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.umulh.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.umulh.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.usub.sat.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.usub.sat.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.usub.sat.v8i8(<8 x i8>, <8 x i8>) #1

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

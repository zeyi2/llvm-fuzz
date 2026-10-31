; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+experimental-p,+m,+zbb,+zhinx,+zvkb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double +inf
@G.1 = global i1 false
@G.2 = global i128 -1
@G.3 = global bfloat 0.000000e+00
@G.4 = global <8 x i8> splat (i8 16)

declare <2 x i16> @test_padd_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_psub_h(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_padd_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_psub_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_and_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_or_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_xor_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_andn_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_orn_h(<2 x i16>, <2 x i16>)

define <2 x i16> @test_xnor_h(<2 x i16> %a, <2 x i16> %b) {
  %LGV1 = load <8 x i8>, ptr @G.4, align 8
  %not = xor <2 x i16> %b, splat (i16 -1)
  %res = xor <2 x i16> %a, %not
  %C = icmp sge <8 x i8> splat (i8 -128), %LGV1
  store <8 x i1> %C, ptr poison, align 1
  ret <2 x i16> %res
}

declare <4 x i8> @test_and_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_or_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_xor_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_andn_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_orn_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_xnor_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_not_h(<2 x i16>)

declare <4 x i8> @test_not_b(<4 x i8>)

declare <2 x i16> @test_psadd_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_psaddu_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pssub_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pssubu_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_psh1add_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pssh1sadd_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pssh1sadd_h_addself(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_psadd_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_psaddu_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_pssub_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_pssubu_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_paadd_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_paaddu_h(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_paadd_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_paaddu_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pabs_h(<2 x i16>)

declare <4 x i8> @test_pabs_b(<4 x i8>)

declare <2 x i16> @test_pdif_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pdifu_h(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_pdif_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_pdifu_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pasub_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pasubu_h(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_pasub_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_pasubu_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pli_h()

define <2 x i16> @test_pli_h_negative() {
  %LGV = load double, ptr @G, align 8
  %C = fcmp true double %LGV, 4.940660e-324
  store i1 %C, ptr @G.1, align 1
  ret <2 x i16> splat (i16 -5)
}

declare <4 x i8> @test_pli_b()

declare <2 x i16> @test_pli_b_v2i16()

declare <4 x i8> @test_pli_b_negative()

declare <2 x i16> @test_pli_b_negative_v2i16()

declare <2 x i16> @test_plui_h()

declare <2 x i16> @test_plui_h_negative()

declare <4 x i8> @test_allones_v4i8()

declare <2 x i16> @test_allones_v2i16()

declare i16 @test_extract_vector_16(<2 x i16>)

declare i16 @test_extract_vector_16_elem1(<2 x i16>)

declare i8 @test_extract_vector_8(<4 x i8>)

declare i8 @test_extract_vector_8_elem1(<4 x i8>)

declare <2 x i16> @test_insert_vector_16(<2 x i16>, i16)

declare <2 x i16> @test_insert_vector_16_elem1(<2 x i16>, i16)

declare <4 x i8> @test_insert_vector_8(<4 x i8>, i8)

declare <4 x i8> @test_insert_vector_8_elem2(<4 x i8>, i8)

declare <4 x i8> @test_non_const_splat_i8(i8)

declare <2 x i16> @test_non_const_splat_i16(i16)

declare <4 x i8> @test_padd_bs_splat_lhs(<4 x i8>, i8)

declare <4 x i8> @test_padd_bs_splat_rhs(<4 x i8>, i8)

declare <2 x i16> @test_padd_hs_splat_lhs(<2 x i16>, i16)

declare <2 x i16> @test_padd_hs_splat_rhs(<2 x i16>, i16)

declare <4 x i8> @test_build_vector_i8(i8, i8, i8, i8)

declare <2 x i16> @test_build_vector_i16(i16, i16)

declare <2 x i16> @test_pslli_h(<2 x i16>)

declare <4 x i8> @test_pslli_b(<4 x i8>)

declare <2 x i16> @test_psslai_h(<2 x i16>)

declare <4 x i8> @test_psslai_b(<4 x i8>)

declare <2 x i16> @test_pssla_hs(<2 x i16>, i16)

declare <2 x i16> @test_pssla_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_psrli_h(<2 x i16>)

declare <4 x i8> @test_psrli_b(<4 x i8>)

declare <2 x i16> @test_psrai_h(<2 x i16>)

declare <4 x i8> @test_psrai_b(<4 x i8>)

declare <2 x i16> @test_psll_hs(<2 x i16>, i16)

declare <2 x i16> @test_psll_hs_mask(<2 x i16>, i16)

declare <4 x i8> @test_psll_bs(<4 x i8>, i8)

declare <4 x i8> @test_psll_bs_mask(<4 x i8>, i8)

declare <2 x i16> @test_psll_hs_vec_shamt(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_psll_bs_vec_shamt(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_psrl_hs(<2 x i16>, i16)

declare <2 x i16> @test_psrl_hs_mask(<2 x i16>, i16)

declare <4 x i8> @test_psrl_bs(<4 x i8>, i8)

declare <4 x i8> @test_psrl_bs_mask(<4 x i8>, i8)

declare <2 x i16> @test_psra_hs(<2 x i16>, i16)

declare <2 x i16> @test_psra_hs_mask(<2 x i16>, i16)

declare <4 x i8> @test_psra_bs(<4 x i8>, i8)

declare <4 x i8> @test_psra_bs_mask(<4 x i8>, i8)

declare <2 x i16> @test_psrl_hs_vec_shamt(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_psrl_bs_vec_shamt(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_psra_hs_vec_shamt(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_psra_bs_vec_shamt(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_psll_s_u8x4(<4 x i8>, i32)

declare <2 x i16> @test_psll_s_u16x2(<2 x i16>, i32)

declare <4 x i8> @test_psrl_s_u8x4(<4 x i8>, i32)

declare <2 x i16> @test_psrl_s_u16x2(<2 x i16>, i32)

declare <4 x i8> @test_psra_s_i8x4(<4 x i8>, i32)

declare <2 x i16> @test_psra_s_i16x2(<2 x i16>, i32)

declare <2 x i16> @test_pssha_s_i16x2(<2 x i16>, i32)

declare <2 x i16> @test_psshar_s_i16x2(<2 x i16>, i32)

declare <2 x i16> @test_psshl_s_u16x2(<2 x i16>, i32)

declare <2 x i16> @test_psshlr_s_u16x2(<2 x i16>, i32)

declare <2 x i16> @test_pssha_s_i16x2_imm(<2 x i16>)

declare <2 x i16> @test_psshar_s_i16x2_imm(<2 x i16>)

declare <2 x i16> @test_pssha_s_i16x2_neg_imm(<2 x i16>)

declare <2 x i16> @test_psshar_s_i16x2_neg_imm(<2 x i16>)

declare <2 x i16> @test_pssha_s_i16x2_neg_imm_max(<2 x i16>)

declare <2 x i16> @test_pssha_s_i16x2_neg_imm_too_large(<2 x i16>)

declare <4 x i16> @test_pwadd_b(<4 x i8>, <4 x i8>)

declare <2 x i32> @test_pwadd_h(<2 x i16>, <2 x i16>)

declare <4 x i16> @test_pwaddu_b(<4 x i8>, <4 x i8>)

declare <2 x i32> @test_pwaddu_h(<2 x i16>, <2 x i16>)

declare <4 x i16> @test_pwsub_b(<4 x i8>, <4 x i8>)

declare <2 x i32> @test_pwsub_h(<2 x i16>, <2 x i16>)

declare <4 x i16> @test_pwsubu_b(<4 x i8>, <4 x i8>)

declare <2 x i32> @test_pwsubu_h(<2 x i16>, <2 x i16>)

declare <4 x i16> @test_pwmul_b(<4 x i8>, <4 x i8>)

declare <2 x i32> @test_pwmul_h(<2 x i16>, <2 x i16>)

declare <4 x i16> @test_pwmulu_b(<4 x i8>, <4 x i8>)

declare <2 x i32> @test_pwmulu_h(<2 x i16>, <2 x i16>)

declare <4 x i16> @test_pwmulsu_b(<4 x i8>, <4 x i8>)

declare <2 x i32> @test_pwmulsu_h(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_pmulh_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_pmulhu_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_pmulhsu_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_pmulhsu_b_commuted(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pmulh_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulhu_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulhsu_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulhsu_h_commuted(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulhr_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulhru_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulhrsu_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulhrsu_h_commuted(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmul_h(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_pmul_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_psdiv_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_psdiv_mulhsu_h(<2 x i16>)

declare <4 x i8> @test_psdiv_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pudiv_h(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_psdiv_mulhsu_b(<4 x i8>)

declare <4 x i8> @test_pudiv_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_pudiv_mulhu_b(<4 x i8>)

declare <2 x i16> @test_psrem_h(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_psrem_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_purem_h(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_purem_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_eq_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_ne_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_nez_h(<2 x i16>)

declare <2 x i16> @test_slt_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_sle_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_sgt_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_sge_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_sgez_h(<2 x i16>)

define <2 x i16> @test_ult_h(<2 x i16> %a, <2 x i16> %b) {
  %B = xor i128 -170141183460469231731687303715884105728, 1
  %cmp = icmp ult <2 x i16> %a, %b
  %res = sext <2 x i1> %cmp to <2 x i16>
  store i128 %B, ptr @G.2, align 4
  ret <2 x i16> %res
}

declare <2 x i16> @test_ule_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_ugt_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_uge_h(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_eq_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_ne_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_nez_b(<4 x i8>)

declare <4 x i8> @test_slt_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_sle_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_sgt_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_sge_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_sgez_b(<4 x i8>)

declare <4 x i8> @test_ult_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_ule_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_ugt_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_uge_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_smin_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_umin_h(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_smin_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_umin_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_smax_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_umax_h(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_smax_b(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_umax_b(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_select_v2i16(i1, <2 x i16>, <2 x i16>)

declare <4 x i8> @test_select_v4i8(i1, <4 x i8>, <4 x i8>)

declare <2 x i16> @test_vselect_v2i16(<2 x i16>, <2 x i16>, <2 x i16>)

declare <4 x i8> @test_vselect_v4i8(<4 x i8>, <4 x i8>, <4 x i8>)

declare <4 x i8> @test_ppaire_v4i8(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_ppaireo_v4i8(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_ppairoe_v4i8(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_ppairo_v4i8(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_ppaire_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_ppaireo_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_ppairoe_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_ppairo_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_bswap_v2i16(<2 x i16>)

declare <4 x i8> @test_bitreverse_v4i8(<4 x i8>)

declare <2 x i16> @test_bitreverse_v2i16(<2 x i16>)

declare <4 x i8> @test_paadd_v4i8(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_paaddu_v4i8(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_pasub_v4i8(<4 x i8>, <4 x i8>)

declare <4 x i8> @test_pasubu_v4i8(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_paadd_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_paaddu_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pasub_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pasubu_v2i16(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_pabd_v4i8(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pabd_v2i16(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_pabdu_v4i8(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pabdu_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pas_x_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_psa_x_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_psas_x_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pssa_x_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_paas_x_h(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pasa_x_h(<2 x i16>, <2 x i16>)

declare i32 @test_predsum_i8x4_i32(<4 x i8>, i32)

declare i32 @test_predsumu_u8x4_u32(<4 x i8>, i32)

declare i32 @test_predsum_i16x2_i32(<2 x i16>, i32)

declare i32 @test_predsumu_u16x2_u32(<2 x i16>, i32)

declare <4 x i8> @test_pmerge_merge_u8x4(<4 x i8>, <4 x i8>, <4 x i8>)

declare <4 x i8> @test_pmerge_mvm_u8x4(<4 x i8>, <4 x i8>, <4 x i8>)

declare <4 x i8> @test_pmerge_mvmn_u8x4(<4 x i8>, <4 x i8>, <4 x i8>)

declare <4 x i8> @test_pmerge_merge_i8x4(<4 x i8>, <4 x i8>, <4 x i8>)

declare <4 x i8> @test_pmerge_mvm_i8x4(<4 x i8>, <4 x i8>, <4 x i8>)

declare <4 x i8> @test_pmerge_mvmn_i8x4(<4 x i8>, <4 x i8>, <4 x i8>)

declare <2 x i16> @test_pmerge_merge_u16x2(<2 x i16>, <2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmerge_mvm_u16x2(<2 x i16>, <2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmerge_mvmn_u16x2(<2 x i16>, <2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmerge_merge_i16x2(<2 x i16>, <2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmerge_mvm_i16x2(<2 x i16>, <2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmerge_mvmn_i16x2(<2 x i16>, <2 x i16>, <2 x i16>)

declare <2 x i16> @test_psext_b_v2i16(<2 x i16>)

declare <2 x i16> @test_pzext_b_v2i16(<2 x i16>)

declare <2 x i16> @test_riscv_psext_b_v2i16(<2 x i16>)

declare <2 x i16> @test_riscv_pzext_b_v2i16(<2 x i16>)

declare <2 x i16> @test_pmulh_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulhr_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulhu_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulhru_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulhsu_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulhrsu_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmhacc_v2i16(<2 x i16>, <2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmhracc_v2i16(<2 x i16>, <2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmhaccu_v2i16(<2 x i16>, <2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmhraccu_v2i16(<2 x i16>, <2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmhaccsu_v2i16(<2 x i16>, <2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmhraccsu_v2i16(<2 x i16>, <2 x i16>, <2 x i16>)

declare i32 @test_pabdsumu_u8x4_u32(<4 x i8>, <4 x i8>)

declare i32 @test_pabdsumau_u8x4_u32(i32, <4 x i8>, <4 x i8>)

declare <4 x i8> @test_psabs_v4i8(<4 x i8>)

define <2 x i16> @test_psabs_v2i16(<2 x i16> %a) {
  %A = alloca <2 x i1>, align 1
  store <2 x i1> poison, ptr %A, align 1
  %C = icmp sle <2 x i16> %a, splat (i16 -32768)
  %res = call <2 x i16> @llvm.riscv.psabs.v2i16(<2 x i16> %a)
  store <2 x i1> %C, ptr %A, align 1
  ret <2 x i16> %res
}

declare <4 x i8> @test_undef_v4i8()

declare <2 x i16> @test_undef_v2i16()

declare <2 x i16> @test_pmulq_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmulqr_v2i16(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_pnclipp_v4i8(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_pnclipup_v4i8(<2 x i16>, <2 x i16>)

declare <2 x i16> @test_pnclipp_v2i16(i32, i32)

declare <2 x i16> @test_pnclipup_v2i16(i32, i32)

declare i32 @test_mqacc_h00_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_mqacc_h01_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_mqacc_h11_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_mqracc_h00_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_mqracc_h01_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_mqracc_h11_i32(i32, <2 x i16>, <2 x i16>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmul.00.v2i16(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmul.01.v2i16(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmul.11.v2i16(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulu.00.v2i16(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulu.01.v2i16(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulu.11.v2i16(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulsu.00.v2i16(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulsu.11.v2i16(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mul.00.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mul.01.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mul.11.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulu.00.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulu.01.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulu.11.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulsu.00.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulsu.11.i32.v2i16(<2 x i16>, <2 x i16>) #0

define <2 x i16> @test_pmul_b00_v2i16(<4 x i8> %a, <4 x i8> %b) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load bfloat, ptr @G.3, align 2
  %C = fcmp olt bfloat 4.200000e+01, %LGV1
  %r = call <2 x i16> @llvm.riscv.pmul.00.v2i16(<4 x i8> %a, <4 x i8> %b)
  store i1 %C, ptr %A, align 1
  ret <2 x i16> %r
}

declare <2 x i16> @test_pmul_b01_v2i16(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pmul_b11_v2i16(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pmulu_b00_v2i16(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pmulu_b01_v2i16(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pmulu_b11_v2i16(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pmulsu_b00_v2i16(<4 x i8>, <4 x i8>)

declare <2 x i16> @test_pmulsu_b11_v2i16(<4 x i8>, <4 x i8>)

declare i32 @test_mul_h00_i32(<2 x i16>, <2 x i16>)

declare i32 @test_mul_h01_i32(<2 x i16>, <2 x i16>)

declare i32 @test_mul_h11_i32(<2 x i16>, <2 x i16>)

declare i32 @test_mulu_h00_i32(<2 x i16>, <2 x i16>)

declare i32 @test_mulu_h01_i32(<2 x i16>, <2 x i16>)

declare i32 @test_mulu_h11_i32(<2 x i16>, <2 x i16>)

declare i32 @test_mulsu_h00_i32(<2 x i16>, <2 x i16>)

declare i32 @test_mulsu_h11_i32(<2 x i16>, <2 x i16>)

define i32 @test_pm4add_v4i8_i32(<4 x i8> %a, <4 x i8> %b) {
  %r = call i32 @llvm.riscv.pm4add.i32.v4i8(<4 x i8> %a, <4 x i8> %b)
  %B = or <4 x i8> %a, %a
  store <4 x i8> %B, ptr poison, align 4
  ret i32 %r
}

declare i32 @test_pm2add_v2i16_i32(<2 x i16>, <2 x i16>)

declare i32 @test_pm2add_x_v2i16_i32(<2 x i16>, <2 x i16>)

declare i32 @test_pm4addu_v4i8_i32(<4 x i8>, <4 x i8>)

declare i32 @test_pm2addu_v2i16_i32(<2 x i16>, <2 x i16>)

declare i32 @test_pmq2add_v2i16_i32(<2 x i16>, <2 x i16>)

declare i32 @test_pmqr2add_v2i16_i32(<2 x i16>, <2 x i16>)

declare i32 @test_pm2sadd_v2i16_i32(<2 x i16>, <2 x i16>)

declare i32 @test_pm2sadd_x_v2i16_i32(<2 x i16>, <2 x i16>)

declare i32 @test_pm2sub_v2i16_i32(<2 x i16>, <2 x i16>)

declare i32 @test_pm2sub_x_v2i16_i32(<2 x i16>, <2 x i16>)

declare i32 @test_pm4addsu_v4i8_i32(<4 x i8>, <4 x i8>)

declare i32 @test_pm2addsu_v2i16_i32(<2 x i16>, <2 x i16>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.macc.00.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.macc.01.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.macc.11.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.maccu.00.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.maccu.01.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.maccu.11.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.maccsu.00.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.maccsu.11.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

declare i32 @test_macc_h00_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_macc_h01_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_macc_h11_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_maccu_h00_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_maccu_h01_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_maccu_h11_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_maccsu_h00_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_maccsu_h11_i32(i32, <2 x i16>, <2 x i16>)

declare <2 x i16> @test_pmhacc_b0_v2i16(<2 x i16>, <2 x i16>, <4 x i8>)

declare <2 x i16> @test_pmhacc_b1_v2i16(<2 x i16>, <2 x i16>, <4 x i8>)

declare <2 x i16> @test_pmhaccsu_b0_v2i16(<2 x i16>, <2 x i16>, <4 x i8>)

declare <2 x i16> @test_pmhaccsu_b1_v2i16(<2 x i16>, <2 x i16>, <4 x i8>)

declare <2 x i16> @test_pmulh_b0_v2i16(<2 x i16>, <4 x i8>)

declare <2 x i16> @test_pmulh_b1_v2i16(<2 x i16>, <4 x i8>)

declare <2 x i16> @test_pmulhsu_b0_v2i16(<2 x i16>, <4 x i8>)

declare <2 x i16> @test_pmulhsu_b1_v2i16(<2 x i16>, <4 x i8>)

declare i32 @test_mulh_h0_i32(i32, <2 x i16>)

declare i32 @test_mulh_h1_i32(i32, <2 x i16>)

declare i32 @test_mulhsu_h0_i32(i32, <2 x i16>)

declare i32 @test_mulhsu_h1_i32(i32, <2 x i16>)

declare <2 x i16> @test_psati_i16x2(<2 x i16>)

declare <2 x i16> @test_psati_i16x2_min_width(<2 x i16>)

declare <2 x i16> @test_psati_i16x2_max_width(<2 x i16>)

declare <2 x i16> @test_pusati_u16x2(<2 x i16>)

declare <2 x i16> @test_pusati_u16x2_max_width(<2 x i16>)

declare <4 x i8> @test_pslide1up_v4i8(<4 x i8>, i8)

declare <4 x i8> @test_pslide1down_v4i8(<4 x i8>, i8)

declare <2 x i16> @test_pslide1up_v2i16(<2 x i16>, i16)

declare <2 x i16> @test_pslide1down_v2i16(<2 x i16>, i16)

declare <4 x i8> @test_pslideupx_v4i8(<4 x i8>, <4 x i8>, i32)

declare <4 x i8> @test_pslidedownx_v4i8(<4 x i8>, <4 x i8>, i32)

declare <2 x i16> @test_pslideupx_v2i16(<2 x i16>, <2 x i16>, i32)

declare <2 x i16> @test_pslidedownx_v2i16(<2 x i16>, <2 x i16>, i32)

declare i32 @test_pm2adda_v2i16_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_pm2adda_x_v2i16_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_pm2addau_v2i16_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_pmq2adda_v2i16_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_pmqr2adda_v2i16_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_pm2suba_v2i16_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_pm2suba_x_v2i16_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_pm2addasu_v2i16_i32(i32, <2 x i16>, <2 x i16>)

declare i32 @test_pm2adda_v2i16_i32_shared(i32, <2 x i16>, <2 x i16>, ptr)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.abs.v2i16(<2 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.abs.v4i8(<4 x i8>, i1 immarg) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.bitreverse.v2i16(<2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.bitreverse.v4i8(<4 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.bswap.v2i16(<2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mqacc.00.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mqacc.01.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mqacc.11.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mqracc.00.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mqracc.01.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mqracc.11.i32.v2i16(i32, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulh.h0.i32.v2i16(i32, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulh.h1.i32.v2i16(i32, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulhsu.h0.i32.v2i16(i32, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulhsu.h1.i32.v2i16(i32, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.paadd.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.paadd.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.paaddu.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.paaddu.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.paas.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pabd.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pabd.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pabdsumau.i32.v4i8(i32, <4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pabdsumu.i32.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pabdu.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pabdu.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pas.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pasa.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pasub.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pasub.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pasubu.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pasubu.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pm2add.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pm2add.x.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pm2addsu.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pm2addu.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pm2sadd.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pm2sadd.x.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pm2sub.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pm2sub.x.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pm4add.i32.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pm4addsu.i32.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pm4addu.i32.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmerge.v2i16(<2 x i16>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pmerge.v4i8(<4 x i8>, <4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmhacc.b0.v2i16(<2 x i16>, <2 x i16>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmhacc.b1.v2i16(<2 x i16>, <2 x i16>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmhacc.v2i16(<2 x i16>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmhaccsu.b0.v2i16(<2 x i16>, <2 x i16>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmhaccsu.b1.v2i16(<2 x i16>, <2 x i16>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmhaccsu.v2i16(<2 x i16>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmhaccu.v2i16(<2 x i16>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmhracc.v2i16(<2 x i16>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmhraccsu.v2i16(<2 x i16>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmhraccu.v2i16(<2 x i16>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pmq2add.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.pmqr2add.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulh.b0.v2i16(<2 x i16>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulh.b1.v2i16(<2 x i16>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulhr.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulhrsu.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulhru.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulhsu.b0.v2i16(<2 x i16>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulhsu.b1.v2i16(<2 x i16>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulhsu.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulq.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pmulqr.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pnclipp.v2i16.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pnclipp.v4i8.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pnclipup.v2i16.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pnclipup.v4i8.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.predsum.i32.v2i16(<2 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.predsum.i32.v4i8(<4 x i8>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.predsumu.i32.v2i16(<2 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.predsumu.i32.v4i8(<4 x i8>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.psa.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.psabs.v2i16(<2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.psabs.v4i8(<4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.psas.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.psati.v2i16(<2 x i16>, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.psext.b.v2i16(<2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.psll.v2i16(<2 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.psll.v4i8(<4 x i8>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.psra.v2i16(<2 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.psra.v4i8(<4 x i8>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.psrl.v2i16(<2 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.psrl.v4i8(<4 x i8>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pssa.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pssha.v2i16(<2 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.psshar.v2i16(<2 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.psshl.v2i16(<2 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.psshlr.v2i16(<2 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pusati.v2i16(<2 x i16>, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pzext.b.v2i16(<2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.sadd.sat.v2i16(<2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.sadd.sat.v4i8(<4 x i8>, <4 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.smax.v2i16(<2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.smax.v4i8(<4 x i8>, <4 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.smin.v2i16(<2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.smin.v4i8(<4 x i8>, <4 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.smulh.v2i16(<2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.sshl.sat.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.sshl.sat.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.ssub.sat.v2i16(<2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.ssub.sat.v4i8(<4 x i8>, <4 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.uadd.sat.v2i16(<2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.uadd.sat.v4i8(<4 x i8>, <4 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.umax.v2i16(<2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.umax.v4i8(<4 x i8>, <4 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.umin.v2i16(<2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.umin.v4i8(<4 x i8>, <4 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.umulh.v2i16(<2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.usub.sat.v2i16(<2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.usub.sat.v4i8(<4 x i8>, <4 x i8>) #1

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

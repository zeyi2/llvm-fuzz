; isel-diff-config: -mtriple=riscv64 -mattr=+experimental-p,+zicond,+zdinx -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> zeroinitializer
@G.1 = global i64 42
@G.2 = global i1 false

declare i32 @abs_i32(i32)

declare i64 @abs_i64(i64)

declare i32 @li_imm()

declare i32 @pli_b_i32(ptr)

declare i32 @pli_h_i32(ptr)

declare void @pli_b_store_i32(ptr)

declare void @pli_b_store_i16(ptr)

declare i32 @plui_h_i32(ptr)

; Function Attrs: nounwind
declare i32 @pack_i32(i32, i32) #0

; Function Attrs: nounwind
declare i32 @pack_i32_2(i16 zeroext, i16 zeroext) #0

declare i32 @pack_i32_3(i16 zeroext, i16 zeroext, i32)

declare i8 @cls_i8(i8)

declare i8 @cls_i8_2(i8)

declare i16 @cls_i16(i16)

declare i16 @cls_i16_2(i16)

declare i32 @cls_i32(i32)

declare i32 @cls_i32_2(i32)

declare i64 @cls_i64(i64)

declare i64 @cls_i64_2(i64)

declare i32 @cls_i32_knownbits(i32)

declare i32 @cls_i32_knownbits_2(i16 signext)

declare i32 @cls_i32_knownbits_3(i8 signext)

declare i32 @cls_i32_knownbits_4(i32 signext)

declare i32 @cls_i32_knownbits_no_overestimate(i32 signext)

declare i64 @sll_i64(i64, i64)

declare i64 @sll_small_i64(i64, i64)

declare i64 @sll_large_i64(i64, i64)

declare i64 @slli_i64(i64)

declare i64 @slli_i64_large(i64)

declare i64 @srl_i64(i64, i64)

declare i64 @srl_small_i64(i64, i64)

declare i64 @srl_large_i64(i64, i64)

declare i64 @srl_mask63_i64(i64, i64)

declare i64 @srli_i64(i64)

declare i64 @srli_i64_large(i64)

declare i64 @sra_i64(i64, i64)

declare i64 @sra_small_i64(i64, i64)

declare i64 @sra_large_i64(i64, i64)

declare i64 @sra_mask63_i64(i64, i64)

declare i64 @srai_i64(i64)

declare i64 @srai_i64_large(i64)

declare i32 @slx_i32(i32, i32, i32)

declare i32 @slxi_i32(i32, i32)

declare i32 @srx_i32(i32, i32, i32)

define i32 @srxi_i32(i32 %a, i32 %b) {
  %C = icmp eq i32 %a, %b
  %1 = tail call i32 @llvm.fshr.i32(i32 %a, i32 %b, i32 25)
  store i1 %C, ptr @G.2, align 1
  ret i32 %1
}

declare i8 @shlsat_i8(i8, i8)

declare i16 @shlsat_i16(i16, i16)

declare i32 @shlsat_i32(i32, i32)

declare i8 @shlsati_i8(i8)

define i16 @shlsati_i16(i16 %a) {
  %sshlsat = tail call i16 @llvm.sshl.sat.i16(i16 %a, i16 10)
  %B = sub i16 %a, 0
  store i16 %B, ptr poison, align 2
  ret i16 %sshlsat
}

declare i32 @shlsati_i32(i32)

declare i8 @ushlsat_i8(i8, i8)

declare i16 @ushlsat_i16(i16, i16)

declare i32 @ushlsat_i32(i32, i32)

declare i8 @ushlsati_i8(i8)

declare i16 @ushlsati_i16(i16)

declare i32 @ushlsati_i32(i32)

declare i8 @sadd_i8(i8, i8)

declare i16 @sadd_i16(i16, i16)

declare i32 @sadd_i32(i32, i32)

declare i32 @ssh1sadd_i32(i32, i32)

declare i32 @ssh1sadd_i32_addself(i32, i32)

declare i8 @ssub_i8(i8, i8)

declare i16 @ssub_i16(i16, i16)

declare i32 @ssub_i32(i32, i32)

declare i8 @uadd_i8(i8, i8)

declare i16 @uadd_i16(i16, i16)

declare i32 @uadd_i32(i32, i32)

declare i8 @usub_i8(i8, i8)

declare i16 @usub_i16(i16, i16)

declare i32 @usub_i32(i32, i32)

declare i32 @aadd_i32(i32, i32)

declare i32 @aadd2_i32(i32, i32)

declare i32 @aaddu_i32(i32, i32)

declare i32 @aaddu2_i32(i32, i32)

declare i32 @asub_i32(i32, i32)

declare i32 @asubu_i32(i32, i32)

declare i32 @test_aadd_i32(i32, i32)

declare i32 @test_aaddu_u32(i32, i32)

declare i32 @test_asub_i32(i32, i32)

declare i32 @test_asubu_u32(i32, i32)

declare i32 @mulhr_i32(i32, i32)

declare i32 @mulhru_i32(i32, i32)

declare i32 @mulhrsu_i32(i32, i32)

declare i32 @mulhrsu_i32_commuted(i32, i32)

declare i64 @wmul_i32(i32, i32)

declare i64 @wmulu_i32(i32, i32)

declare i64 @wmulsu_i32(i32, i32)

define i64 @wsla_i32(i32 %x, i64 %y) {
  %A = alloca <2 x i64>, align 16
  store <2 x i64> poison, ptr %A, align 16
  %LGV = load <2 x i64>, ptr @G, align 16
  %a = sext i32 %x to i64
  %b = shl i64 %a, %y
  %B = add <2 x i64> %LGV, splat (i64 1)
  store <2 x i64> %B, ptr %A, align 16
  ret i64 %b
}

declare i64 @wsll_i32(i32, i64)

declare i64 @wslai_i32(i32)

declare i64 @wslli_i32(i32, i64)

declare i32 @mulh_i32(i32, i32)

declare i32 @mulhu_i32(i32, i32)

declare i32 @mulhsu_i32(i32, i32)

declare i64 @add_i64(i64, i64)

declare i64 @sub_i64(i64, i64)

; Function Attrs: nounwind
declare i64 @wmaccu(i32, i32, i64) #0

; Function Attrs: nounwind
declare i64 @wmaccu_commute(i32, i32, i64) #0

; Function Attrs: nounwind
declare i64 @wmacc(i32, i32, i64) #0

; Function Attrs: nounwind
declare i64 @wmacc_commute(i32, i32, i64) #0

; Function Attrs: nounwind
declare i64 @wmaccsu(i32, i32, i64) #0

; Function Attrs: nounwind
declare i64 @wmaccsu_commute(i32, i32, i64) #0

; Function Attrs: nounwind
declare i32 @macc_h00(i32, i16, i16) #0

; Function Attrs: nounwind
declare i32 @macc_h00_commute(i32, i16, i16) #0

; Function Attrs: nounwind
declare i32 @maccu_h00(i32, i16, i16) #0

; Function Attrs: nounwind
declare i32 @maccu_h00_commute(i32, i16, i16) #0

; Function Attrs: nounwind
declare i32 @maccsu_h00(i32, i16, i16) #0

; Function Attrs: nounwind
declare i32 @maccsu_h00_commute(i32, i16, i16) #0

; Function Attrs: nounwind
declare i32 @maccsu_h00_swap_operands(i32, i16, i16) #0

; Function Attrs: nounwind
declare i32 @maccsu_h00_swap_operands_commute(i32, i16, i16) #0

; Function Attrs: nounwind
declare i32 @macc_h00_multiple_uses(i16, i16, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @macc_h01(i32, i16, i32) #0

; Function Attrs: nounwind
declare i32 @maccu_h01(i32, i16, i32) #0

; Function Attrs: nounwind
declare i32 @macc_h01_commute(i32, i16, i32) #0

; Function Attrs: nounwind
declare i32 @maccu_h01_commute(i32, i16, i32) #0

; Function Attrs: nounwind
declare i32 @macc_h01_swap_operands(i32, i16, i32) #0

; Function Attrs: nounwind
declare i32 @maccu_h01_swap_operands(i32, i16, i32) #0

; Function Attrs: nounwind
declare i32 @macc_h11(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @maccu_h11(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @maccsu_h11(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @macc_h11_commute(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @maccu_h11_commute(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @maccsu_h11_commute(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @macc_h11_multiple_uses(i32, i32, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @maccu_h11_multiple_uses(i32, i32, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @maccsu_h11_multiple_uses(i32, i32, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @macc_h11_wrong_shamt(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @maccu_h11_wrong_shamt(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @maccsu_h11_wrong_shamt(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mhacc(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mhacc_commute(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mhaccu(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mhaccu_commute(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mhaccsu(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mhaccsu_commute(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mhaccsu_swap_operands(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mhaccsu_swap_operands_commute(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mhacc_multiple_uses(i32, i32, i32, ptr) #0

; Function Attrs: nounwind
declare void @wmaccu_multiple_uses(i32, i32, i64, ptr, ptr) #0

; Function Attrs: nounwind
declare i64 @wmacc_first_mul_multiple_uses(i32, i32, i32, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @merge_i32(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @merge_i32_2(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mvm_i32(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mvm_i32_2(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mvmn_i32(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mvmn_i32_2(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @merge_i32_mv(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @merge_xor_i32(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mvm_xor_i32(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @mvmn_xor_i32(i32, i32, i32) #0

; Function Attrs: nounwind
declare i64 @waddau_zext(i64, i32) #0

; Function Attrs: nounwind
declare i64 @waddau_zext_commuted(i64, i32) #0

; Function Attrs: nounwind
declare i64 @waddau_zext_chain(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @wsubau_zext(i64, i32) #0

; Function Attrs: nounwind
declare i64 @wsubau_zext_chain(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @wsubau_zext_chain_rev(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @wadda_sext(i64, i32) #0

; Function Attrs: nounwind
declare i64 @wadda_sext_commuted(i64, i32) #0

; Function Attrs: nounwind
declare i64 @wadda_sext_chain(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @wsuba_sext(i64, i32) #0

; Function Attrs: nounwind
declare i64 @wsuba_sext_chain(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @wsuba_sext_chain_rev(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @waddu(i32, i32) #0

; Function Attrs: nounwind
declare i64 @wsubu(i32, i32) #0

; Function Attrs: nounwind
declare i64 @wadd(i32, i32) #0

; Function Attrs: nounwind
declare i64 @wsub(i32, i32) #0

; Function Attrs: nounwind
declare i64 @wsub_from_neg_const(i32) #0

declare zeroext i1 @smulo_i32(i32, i32, ptr)

declare zeroext i1 @umulo_i32(i32, i32, ptr)

declare i32 @mm_sati_8_i32(i32)

declare signext i32 @mm_sati_16_i32(i32 signext)

declare signext i32 @mm_sati_24_i32(i32 signext)

declare signext i32 @mm_sati_32_i32(i32 signext)

declare signext i32 @mm_sati_1_i32(i32 signext)

declare signext i32 @mm_sati_minallones_i32(i32 signext)

declare signext i32 @mm_sati_minallones2_i32(i32 signext)

declare signext i32 @mm_usati_8_i32(i32 signext)

declare signext i32 @mm_usati_16_i32(i32 signext)

declare signext i32 @mm_usati_1_i32(i32 signext)

declare signext i32 @mm_usati_31_i32(i32 signext)

declare signext i32 @mm_usati_32_i32(i32 signext)

declare i32 @mm_usati_nonconstantinnner_i32(i32, i32)

; Function Attrs: nounwind
declare i32 @mul_h00_sexti16_sext_inreg(i16 signext, i32) #0

; Function Attrs: nounwind
declare i32 @mul_h00_sexti16_sext_inreg_commute(i16 signext, i32) #0

; Function Attrs: nounwind
declare i32 @mul_h01(i16 signext, i32) #0

; Function Attrs: nounwind
declare i32 @mul_h01_commute(i16 signext, i32) #0

; Function Attrs: nounwind
declare i32 @mul_h01_sext_inreg(i32, i32) #0

; Function Attrs: nounwind
declare i32 @mul_h11(i32, i32) #0

; Function Attrs: nounwind
declare i32 @mulu_h00_zexti16_and(i16 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @mulu_h00_zexti16_and_commute(i16 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @mulu_h01(i16 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @mulu_h01_commute(i16 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @mulu_h01_and(i32, i32) #0

; Function Attrs: nounwind
declare i32 @mulu_h11(i32, i32) #0

; Function Attrs: nounwind
declare i32 @mulsu_h00_sexti16_and(i16 signext, i32) #0

; Function Attrs: nounwind
declare i32 @mulsu_h00_sexti16_and_commute(i16 signext, i32) #0

; Function Attrs: nounwind
declare i32 @mulsu_h00_sext_inreg_zexti16(i32, i16 zeroext) #0

; Function Attrs: nounwind
declare i32 @mulsu_h00_sext_inreg_zexti16_commute(i32, i16 zeroext) #0

; Function Attrs: nounwind
declare i32 @mulsu_h11(i32, i32) #0

declare i32 @mm_usati_32_knownbits_i32(i32, i32)

declare i4 @usati_i4_from_i32(i32)

declare i8 @usati_i8_from_i32(i32)

declare i12 @usati_i12_from_i32(i32)

declare i16 @usati_i16_from_i32(i32)

declare i24 @usati_i24_from_i32(i32)

declare i4 @usati_i4_from_i8(i8)

declare i8 @usati_i8_from_i16(i16)

declare i32 @test_sati_i32_w1(i32)

declare i32 @test_sati_i32_w32(i32)

declare signext i32 @test_sati_i32_w32_signext(i32 signext)

declare i32 @test_usati_u32_w0(i32)

declare i32 @test_usati_u32_w31(i32)

declare signext i32 @test_usati_u32_w31_signext(i32 signext)

; Function Attrs: nounwind
declare i32 @test_pli_b_remat(ptr) #0

; Function Attrs: nounwind
declare i32 @test_pli_h_remat(ptr) #0

; Function Attrs: nounwind
declare i32 @test_plui_h_remat(ptr) #0

declare i32 @test_mulh_i32(i32, i32)

define i32 @test_mulhr_i32(i32 %rs1, i32 %rs2) {
  %LGV1 = load i64, ptr @G.1, align 4
  %C = icmp ult i64 -9223372036854775808, %LGV1
  %res = call i32 @llvm.riscv.mulhr.i32(i32 %rs1, i32 %rs2)
  store i1 %C, ptr @G.2, align 1
  ret i32 %res
}

declare i32 @test_mulhu_u32(i32, i32)

declare i32 @test_mulhru_u32(i32, i32)

declare i32 @test_mulhsu_i32(i32, i32)

declare i32 @test_mulhrsu_i32(i32, i32)

declare i32 @test_mhacc_i32(i32, i32, i32)

declare i32 @test_mhracc_i32(i32, i32, i32)

declare i32 @test_mhaccu_u32(i32, i32, i32)

declare i32 @test_mhraccu_u32(i32, i32, i32)

declare i32 @test_mhaccsu_i32(i32, i32, i32)

declare i32 @test_mhraccsu_i32(i32, i32, i32)

declare i32 @test_mulq_i32(i32, i32)

declare i32 @test_mulqr_i32(i32, i32)

declare i64 @test_mqwacc_i64(i64, i32, i32)

declare i64 @test_mqrwacc_i64(i64, i32, i32)

declare i64 @slx_i64(i64, i64, i64)

declare i64 @slxi_i64(i64, i64)

declare i64 @slxi_i64_large(i64, i64)

declare i64 @srx_i64(i64, i64, i64)

declare i64 @srxi_i64(i64, i64)

declare i64 @srxi_i64_large(i64, i64)

declare i64 @slxi_i64_64(i64, i64)

declare i64 @slxi_i64_89(i64, i64)

declare i64 @slxi_i64_103(i64, i64)

declare i64 @srxi_i64_64(i64, i64)

declare i64 @srxi_i64_89(i64, i64)

declare i64 @srxi_i64_103(i64, i64)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.abs.i64(i64, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.ctlz.i16(i16, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctlz.i64(i64, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.ctlz.i8(i8, i1 immarg) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshl.i64(i64, i64, i64) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshr.i32(i32, i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshr.i64(i64, i64, i64) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.aadd.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.aaddu.u32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.asub.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.asubu.u32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mhacc.i32(i32, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mhaccsu.i32(i32, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mhaccu.u32(i32, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mhracc.i32(i32, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mhraccsu.i32(i32, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mhraccu.u32(i32, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mqrwacc.i64(i64, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mqwacc.i64(i64, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulhr.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulhrsu.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulhru.u32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulhsu.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulq.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulqr.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sati.i32(i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.usati.i32(i32, i32 immarg) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.sadd.sat.i16(i16, i16) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.sadd.sat.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.sadd.sat.i8(i8, i8) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.smul.with.overflow.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smulh.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.sshl.sat.i16(i16, i16) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.sshl.sat.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.sshl.sat.i8(i8, i8) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.ssub.sat.i16(i16, i16) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ssub.sat.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.ssub.sat.i8(i8, i8) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.uadd.sat.i16(i16, i16) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.uadd.sat.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.uadd.sat.i8(i8, i8) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.umul.with.overflow.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umulh.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.ushl.sat.i16(i16, i16) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ushl.sat.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.ushl.sat.i8(i8, i8) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.usub.sat.i16(i16, i16) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.usub.sat.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.usub.sat.i8(i8, i8) #2

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

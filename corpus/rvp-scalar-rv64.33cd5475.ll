; isel-diff-config: -mtriple=riscv64 -mattr=+experimental-p,+m,+zfinx -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i1 true

declare signext i32 @abs_i32_sext(i32 signext)

declare i64 @abs_i64(i64)

declare i64 @pack_i64_imm()

declare i64 @li_imm()

declare i64 @pli_b_i64()

declare i64 @pli_h_i64()

declare i64 @pli_h_slli_i64()

declare i64 @pli_h_srli_i64()

declare i64 @pli_w_i64()

declare i64 @pli_w_slli_i64()

declare i64 @pli_w_srli_i64()

declare i64 @plui_h_i64()

declare void @lui_i32(ptr)

declare i64 @plui_w_i64()

; Function Attrs: nounwind
define i64 @pack_i64(i64 %a, i64 %b) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %shl = and i64 %a, 4294967295
  %C = icmp uge i64 %b, %a
  %shl1 = shl i64 %b, 32
  %or = or i64 %shl1, %shl
  store i1 %C, ptr %A, align 1
  ret i64 %or
}

; Function Attrs: nounwind
declare i64 @pack_i64_2(i32 signext, i32 signext) #0

declare i64 @pack_i64_3(ptr, ptr)

declare i64 @cls_i64_not_32(i64)

declare i128 @sll_i128(i128, i128)

declare i128 @sll_small_i128(i128, i128)

declare i128 @sll_large_i128(i128, i128)

declare i128 @slli_i128(i128)

declare i128 @slli_i128_large(i128)

declare i128 @srl_i128(i128, i128)

declare i128 @srl_small_i128(i128, i128)

declare i128 @srl_large_i128(i128, i128)

declare i128 @srli_i128(i128)

declare i128 @srli_i128_large(i128)

declare i128 @sra_i128(i128, i128)

define i128 @sra_small_i128(i128 %x, i128 %y) {
  %B = ashr i128 %y, %x
  %b = ashr i128 %x, %B
  ret i128 %b
}

define i128 @sra_large_i128(i128 %x, i128 %y) {
  %a = or i128 %y, 64
  %B = sub i1 true, true
  %b = ashr i128 %x, %a
  store i1 %B, ptr @G, align 1
  ret i128 %b
}

declare i128 @srai_i128(i128)

declare i128 @srai_i128_large(i128)

define i64 @slx_i64(i64 %a, i64 %b, i64 %shamt) {
  %B = lshr i64 %shamt, %shamt
  ret i64 %B
}

declare i64 @slxi_i64(i64, i64)

declare i64 @srx_i64(i64, i64, i64)

declare i64 @srxi_i64(i64, i64)

; Function Attrs: nounwind
declare i64 @merge_i64(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @merge_i64_2(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @mvm_i64(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @mvm_i64_2(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @mvmn_i64(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @mvmn_i64_2(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @merge_i64_mv(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @merge_xor_i64(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @mvm_xor_i64(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @mvmn_xor_i64(i64, i64, i64) #0

declare i64 @mm_sati_8_i64(i64)

declare i64 @mm_sati_16_i64(i64)

declare i64 @mm_sati_24_i64(i64)

declare i64 @mm_sati_32_i64(i64)

declare i64 @mm_sati_1_i64(i64)

declare i64 @mm_sati_minallones_i64(i64)

declare i64 @mm_sati_minallones2_i64(i64)

declare i64 @mm_usati_8_i64(i64)

declare i64 @mm_usati_16_i64(i64)

declare i64 @mm_usati_1_i64(i64)

declare i64 @mm_usati_31_i64(i64)

declare i64 @mm_usati_32_i64(i64)

declare i64 @mm_usati_55_i64(i64)

declare i64 @mm_usati_64_i64(i64)

declare signext i32 @mm_sati_32_numsignbits_i64(i64, i32)

; Function Attrs: nounwind
declare i64 @mul_w00_sexti32_sext_inreg(i32 signext, i64) #0

; Function Attrs: nounwind
declare i64 @mul_w00_sexti32_sext_inreg_commute(i32 signext, i64) #0

; Function Attrs: nounwind
declare i64 @mul_w01_sexti32_sext_inreg(i32 signext, i64) #0

; Function Attrs: nounwind
declare i64 @mul_w01_sexti32_sext_inreg_commute(i32 signext, i64) #0

; Function Attrs: nounwind
declare i64 @mul_w11_sexti32_sext_inreg(i64, i64) #0

; Function Attrs: nounwind
declare i64 @mul_w11_sexti32_sext_inreg_commute(i64, i64) #0

; Function Attrs: nounwind
declare i64 @mulu_w00_zexti32_and(i32 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @mulu_w00_zexti32_and_commute(i32 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @mulsu_w00_sexti32_and(i32 signext, i64) #0

; Function Attrs: nounwind
declare i64 @mulsu_w11(i64, i64) #0

; Function Attrs: nounwind
declare i64 @mulsu_w00_sexti32_and_commute(i32 signext, i64) #0

; Function Attrs: nounwind
declare i64 @mulsu_w11_commute(i64, i64) #0

; Function Attrs: nounwind
declare i64 @mulsu_w00_sext_inreg_zexti32(i64, i32 zeroext) #0

; Function Attrs: nounwind
declare i64 @mulsu_w00_sext_inreg_zexti32_commute(i64, i32 zeroext) #0

declare i64 @mm_usati_32_knownbits_i64(i64, i64)

declare i3 @usati_i3_from_i64(i64)

declare i5 @usati_i5_from_i64(i64)

declare i7 @usati_i7_from_i64(i64)

declare i8 @usati_i8_from_i64(i64)

declare i10 @usati_i10_from_i64(i64)

declare i16 @usati_i16_from_i64(i64)

declare i20 @usati_i20_from_i64(i64)

declare i32 @usati_i32_from_i64(i64)

declare i40 @usati_i40_from_i64(i64)

declare i48 @usati_i48_from_i64(i64)

declare i56 @usati_i56_from_i64(i64)

declare i63 @usati_i63_from_i64(i64)

declare i16 @usati_i16_from_i48(i48)

declare i32 @usati_i32_from_i48(i48)

; Function Attrs: nounwind
declare i64 @macc_w00(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @macc_w01(i64, i32, i64) #0

; Function Attrs: nounwind
declare i64 @macc_w11(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @macc_w00_commute(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @macc_w01_commute(i64, i32, i64) #0

; Function Attrs: nounwind
declare i64 @macc_w11_commute(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @maccu_w00(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @maccu_w01(i64, i32, i64) #0

; Function Attrs: nounwind
declare i64 @maccu_w11(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @maccu_w00_commute(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @maccu_w01_commute(i64, i32, i64) #0

; Function Attrs: nounwind
declare i64 @maccu_w11_commute(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @maccsu_w00(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @maccsu_w11(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @maccsu_w00_commute(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @maccsu_w11_commute(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @maccsu_w00_swap_operands(i64, i32, i32) #0

; Function Attrs: nounwind
define i64 @maccsu_w11_swap_operands(i64 %rd, i64 %a, i64 %b) #0 {
  %bhi = ashr i64 %b, 32
  %B = shl i64 %bhi, %bhi
  %result = add i64 %rd, %B
  ret i64 %result
}

; Function Attrs: nounwind
declare i64 @maccsu_w00_swap_operands_commute(i64, i32, i32) #0

; Function Attrs: nounwind
declare i64 @maccsu_w11_swap_operands_commute(i64, i64, i64) #0

; Function Attrs: nounwind
declare i64 @macc_w00_multiple_uses(i32, i32, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @macc_w01_multiple_uses(i32, i64, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @macc_w11_multiple_uses(i64, i64, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_pli_b_remat(ptr) #0

; Function Attrs: nounwind
declare i64 @test_pli_h_remat(ptr) #0

; Function Attrs: nounwind
declare i64 @test_plui_h_remat(ptr) #0

; Function Attrs: nounwind
declare i64 @test_pli_w_remat(ptr) #0

; Function Attrs: nounwind
declare i64 @test_plui_w_remat(ptr) #0

declare i64 @and_mul_32bitsplat(i64)

declare i64 @rev16_intrinsic(i64)

declare i64 @test_sati_i64_w1(i64)

declare i64 @test_sati_i64_w64(i64)

declare i64 @test_usati_u64_w0(i64)

declare i64 @test_usati_u64_w63(i64)

; Function Attrs: nounwind
declare void @merge_wusers_v4i16(<4 x i16>, i16, ptr) #0

; Function Attrs: nounwind
declare void @merge_wusers_v8i8(<8 x i8>, i8, ptr) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.ssh1sadd.i32(i32, i32) #1

; Function Attrs: nounwind
declare signext i32 @ssh1sadd_intrinsic_i32(i32 signext, i32 signext) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mhacc.h0.i32.v2i16(i32, i32, <2 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mhacc.h1.i32.v2i16(i32, i32, <2 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mhaccsu.h0.i32.v2i16(i32, i32, <2 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mhaccsu.h1.i32.v2i16(i32, i32, <2 x i16>) #1

; Function Attrs: nounwind
declare signext i32 @mhacc_h0_i32_sext(i32 signext, i32 signext, <2 x i16>) #0

; Function Attrs: nounwind
declare signext i32 @mhacc_h1_i32_sext(i32 signext, i32 signext, <2 x i16>) #0

; Function Attrs: nounwind
declare signext i32 @mhaccsu_h0_i32_sext(i32 signext, i32 signext, <2 x i16>) #0

; Function Attrs: nounwind
define signext i32 @mhaccsu_h1_i32_sext(i32 signext %rd, i32 signext %rs1, <2 x i16> %rs2) #0 {
  %B = lshr <2 x i16> %rs2, %rs2
  %r = call i32 @llvm.riscv.mhaccsu.h1.i32.v2i16(i32 %rd, i32 %rs1, <2 x i16> %rs2)
  store <2 x i16> %B, ptr poison, align 4
  ret i32 %r
}

declare i64 @test_sha_i64(i64, i32)

declare i64 @test_sha_i64_imm(i64)

declare i64 @test_sha_i64_negimm(i64)

declare i64 @test_sha_i64_mask(i64, i32)

declare i64 @test_shar_i64(i64, i32)

declare i64 @test_shar_i64_imm(i64)

declare i64 @test_shar_i64_negimm(i64)

declare i64 @test_shl_u64(i64, i32)

declare i64 @test_shlr_u64(i64, i32)

declare i64 @test_shl_u64_imm(i64)

declare i64 @test_shlr_u64_negimm(i64)

; Function Attrs: nounwind
declare signext i32 @ssha_intrinsic_i32_signext(i32 signext, i32 signext) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mseq.u32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mslt.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.msltu.u32(i32, i32) #1

; Function Attrs: nounwind
declare signext i32 @mseq_i32_sext(i32 signext, i32 signext) #0

; Function Attrs: nounwind
define signext i32 @mslt_i32_sext(i32 signext %a, i32 signext %b) #0 {
  %r = call i32 @llvm.riscv.mslt.i32(i32 %a, i32 %b)
  %C = icmp sgt i32 %r, 1
  store i1 %C, ptr @G.1, align 1
  ret i32 %r
}

; Function Attrs: nounwind
declare signext i32 @msltu_i32_sext(i32 signext, i32 signext) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.abs.i64(i64, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctlz.i64(i64, i1 immarg) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshl.i64(i64, i64, i64) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshr.i64(i64, i64, i64) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.rev16.64(i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.sati.i64(i64, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.sha.i64(i64, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.shar.i64(i64, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.shl.u64(i64, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.shlr.u64(i64, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.ssha.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.usati.i64(i64, i32 immarg) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #2

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

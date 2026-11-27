; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zve32x,+zvl128b,+zfinx,+zba -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half 4.200000e+01
@G.1 = global half 6.550400e+04
@G.2 = global <2 x i64> splat (i64 42)
@G.3 = global <2 x i1> splat (i1 true)
@G.4 = global i1 true

declare void @buildvec_vid_v16i8(ptr)

declare void @buildvec_vid_undefelts_v16i8(ptr)

declare void @buildvec_notquite_vid_v16i8(ptr)

declare void @buildvec_vid_plus_imm_v16i8(ptr)

declare void @buildvec_vid_plus_nonimm_v16i8(ptr)

declare void @buildvec_vid_mpy_imm_v16i8(ptr)

define <4 x i8> @buildvec_vid_step2_add0_v4i8() {
  %LGV1 = load <2 x i64>, ptr @G.2, align 16
  %C = icmp ne <2 x i64> splat (i64 4294967296), %LGV1
  store <2 x i1> %C, ptr @G.3, align 1
  ret <4 x i8> <i8 0, i8 2, i8 4, i8 6>
}

define <4 x i8> @buildvec_vid_step2_add0_v4i8_undef0() {
  %C = icmp ne i32 -2147483648, -1
  store i1 %C, ptr poison, align 1
  ret <4 x i8> <i8 poison, i8 2, i8 4, i8 6>
}

declare <4 x i8> @buildvec_vid_step2_add0_v4i8_undef1()

define <4 x i8> @buildvec_vid_step2_add0_v4i8_undef2() {
  %LGV1 = load half, ptr @G.1, align 2
  %LGV = load half, ptr @G, align 2
  %C = fcmp uno half %LGV, %LGV1
  store i1 %C, ptr poison, align 1
  ret <4 x i8> <i8 0, i8 poison, i8 poison, i8 6>
}

declare <4 x i8> @buildvec_vid_step2_add1_v4i8()

declare <4 x i8> @buildvec_vid_step2_add1_v4i8_undef0()

declare <4 x i8> @buildvec_vid_step2_add1_v4i8_undef1()

declare <4 x i8> @buildvec_vid_step2_add1_v4i8_undef2()

declare <4 x i8> @buildvec_vid_stepn1_add0_v4i8()

declare <4 x i8> @buildvec_vid_stepn1_add0_v4i8_undef0()

declare <4 x i8> @buildvec_vid_stepn1_add0_v4i8_undef1()

declare <4 x i8> @buildvec_vid_stepn1_add0_v4i8_undef2()

declare <4 x i8> @buildvec_vid_stepn2_add0_v4i8()

declare <4 x i8> @buildvec_vid_stepn2_add0_v4i8_undef0()

declare <4 x i8> @buildvec_vid_stepn2_add0_v4i8_undef1()

declare <4 x i8> @buildvec_vid_stepn2_add0_v4i8_undef2()

declare <4 x i8> @buildvec_vid_stepn2_add3_v4i8()

declare <4 x i8> @buildvec_vid_stepn3_add3_v4i8()

declare void @buildvec_vid_stepn3_addn3_v4i32(ptr, ptr, ptr, ptr)

define <4 x i64> @buildvec_vid_step1_add0_v4i64() {
  %LGV = load i1, ptr @G.4, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <4 x i64> <i64 0, i64 1, i64 2, i64 3>

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

declare <4 x i64> @buildvec_vid_step2_add0_v4i64()

declare <4 x i8> @buildvec_no_vid_v4i8_0()

declare <4 x i8> @buildvec_no_vid_v4i8_1()

declare <4 x i8> @buildvec_no_vid_v4i8_2()

declare <4 x i8> @buildvec_no_vid_v4i8_3()

declare <4 x i8> @buildvec_no_vid_v4i8_4()

declare <4 x i8> @buildvec_no_vid_v4i8_5()

declare void @buildvec_dominant0_v8i16(ptr)

declare void @buildvec_dominant0_v8i16_with_end_element(ptr)

declare void @buildvec_dominant0_v8i16_with_tail(ptr)

declare void @buildvec_dominant1_v8i16(ptr)

declare <2 x i8> @buildvec_dominant0_v2i8()

declare <2 x i8> @buildvec_dominant1_v2i8()

declare <2 x i8> @buildvec_dominant2_v2i8()

declare void @buildvec_dominant0_v2i32(ptr)

; Function Attrs: optsize
declare void @buildvec_dominant1_optsize_v2i32(ptr) #0

declare void @buildvec_seq_v8i8_v4i16(ptr)

declare void @buildvec_seq_v8i8_v2i32(ptr)

declare void @buildvec_seq_v16i8_v2i64(ptr)

declare void @buildvec_seq2_v16i8_v2i64(ptr)

declare void @buildvec_seq_v9i8(ptr)

declare void @buildvec_seq_v4i16_v2i32(ptr)

declare void @buildvec_vid_step1o2_v4i32(ptr, ptr, ptr, ptr, ptr, ptr, ptr)

declare void @buildvec_vid_step1o2_add3_v4i16(ptr, ptr, ptr, ptr, ptr, ptr, ptr)

declare void @buildvec_vid_stepn1o4_addn5_v8i8(ptr)

declare void @buildvec_vid_mpy_imm_v8i16(ptr)

declare void @buildvec_vid_shl_imm_v8i16(ptr)

declare <4 x i32> @splat_c3_v4i32(<4 x i32>)

declare <4 x i32> @splat_idx_v4i32(<4 x i32>, i64)

declare <8 x i16> @splat_c4_v8i16(<8 x i16>)

declare <8 x i16> @splat_idx_v8i16(<8 x i16>, i64)

declare <4 x i8> @buildvec_not_vid_v4i8_1()

declare <4 x i8> @buildvec_not_vid_v4i8_2()

declare <16 x i8> @buildvec_not_vid_v16i8()

; Function Attrs: vscale_range(16,1024)
declare <512 x i8> @buildvec_vid_v512i8_indices_overflow() #1

; Function Attrs: vscale_range(16,1024)
declare <512 x i8> @buildvec_not_vid_v512i8_indices_overflow_1() #1

; Function Attrs: vscale_range(16,1024)
declare <512 x i8> @buildvec_not_vid_v512i8_indices_overflow_2() #1

declare <8 x i32> @prefix_overwrite(<8 x i32>, i32, i32, i32, i32)

declare <8 x i32> @suffix_overwrite(<8 x i32>, i32, i32, i32, i32)

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @v4xi64_exact(i64, i64, i64, i64) #2

; Function Attrs: vscale_range(2,2)
declare <8 x i64> @v8xi64_exact(i64, i64, i64, i64, i64, i64, i64, i64) #2

; Function Attrs: vscale_range(2,2)
declare <8 x i64> @v8xi64_exact_equal_halves(i64, i64, i64, i64) #2

; Function Attrs: vscale_range(2,2)
declare <8 x i64> @v8xi64_exact_undef_suffix(i64, i64, i64, i64) #2

; Function Attrs: vscale_range(2,2)
declare <8 x i64> @v8xi64_exact_undef_prefix(i64, i64, i64, i64) #2

declare <16 x i8> @buildvec_v16i8_loads_contigous(ptr)

declare <16 x i8> @buildvec_v16i8_loads_gather(ptr)

declare <16 x i8> @buildvec_v16i8_undef_low_half(ptr)

declare <16 x i8> @buildvec_v16i8_undef_high_half(ptr)

declare <16 x i8> @buildvec_v16i8_undef_edges(ptr)

declare <16 x i8> @buildvec_v16i8_loads_undef_scattered(ptr)

declare <8 x i8> @buildvec_v8i8_pack(i8, i8, i8, i8, i8, i8, i8, i8)

declare <6 x i8> @buildvec_v6i8_pack(i8, i8, i8, i8, i8, i8)

declare <4 x i16> @buildvec_v4i16_pack(i16, i16, i16, i16)

declare <2 x i32> @buildvec_v2i32_pack(i32, i32)

declare <1 x i16> @buildvec_v1i16_pack(i16)

declare <1 x i32> @buildvec_v1i32_pack(i32)

declare <4 x i32> @buildvec_vslide1up(i32, i32)

declare <4 x i1> @buildvec_i1_splat(i1)

; Function Attrs: nounwind
declare <4 x i32> @buildvec_vredsum_slideup(<8 x i32>, <8 x i32>, <8 x i32>, <8 x i32>) #3

; Function Attrs: nounwind
declare <4 x i32> @buildvec_vredmax_slideup(<8 x i32>, <8 x i32>, <8 x i32>, <8 x i32>) #3

declare <16 x i16> @PR159294(<2 x i32>, <2 x i32>, <2 x i32>)

declare <16 x i32> @PR159294_zext(<2 x i16>, <2 x i16>, <2 x i16>)

define <16 x i32> @PR159294_sext(<2 x i16> %a, <2 x i16> %b, <2 x i16> %c) {
entry:
  %vecext3 = extractelement <2 x i16> %a, i32 0
  %conv4 = sext i16 %vecext3 to i32
  %vecinit5 = insertelement <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, i32 %conv4, i32 1
  %vecext7 = extractelement <2 x i16> %b, i32 0
  %conv8 = sext i16 %vecext7 to i32
  %vecinit9 = insertelement <16 x i32> %vecinit5, i32 %conv8, i32 2
  %vecext59 = extractelement <2 x i16> %c, i32 0
  %conv60 = sext i16 %vecext59 to i32
  %vecinit61 = insertelement <16 x i32> %vecinit9, i32 %conv60, i32 0
  %C = icmp ult i1 false, true
  store i1 %C, ptr poison, align 1
  ret <16 x i32> %vecinit61
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #4

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umax.v8i32(<8 x i32>) #4

attributes #0 = { optsize }
attributes #1 = { vscale_range(16,1024) }
attributes #2 = { vscale_range(2,2) }
attributes #3 = { nounwind }
attributes #4 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

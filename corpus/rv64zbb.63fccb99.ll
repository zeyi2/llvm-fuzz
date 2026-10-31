; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zbb,+zvbb,+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i1 true
@G.2 = global i1 false

; Function Attrs: nounwind
declare signext i32 @ctlz_i32(i32 signext) #0

; Function Attrs: nounwind
declare signext i32 @log2_i32(i32 signext) #0

; Function Attrs: nounwind
declare signext i32 @log2_ceil_i32(i32 signext) #0

; Function Attrs: nounwind
declare signext i32 @findLastSet_i32(i32 signext) #0

declare i32 @ctlz_lshr_i32(i32 signext)

; Function Attrs: nounwind
declare i64 @ctlz_i64(i64) #0

; Function Attrs: nounwind
declare signext i32 @cttz_i32(i32 signext) #0

; Function Attrs: nounwind
declare signext i32 @cttz_zero_poison_i32(i32 signext) #0

; Function Attrs: nounwind
declare signext i32 @findFirstSet_i32(i32 signext) #0

; Function Attrs: nounwind
declare signext i32 @ffs_i32(i32 signext) #0

; Function Attrs: nounwind
declare i64 @cttz_i64(i64) #0

; Function Attrs: nounwind
declare signext i32 @ctpop_i32(i32 signext) #0

; Function Attrs: nounwind
declare i1 @ctpop_i32_ult_two(i32 signext) #0

; Function Attrs: nounwind
declare i1 @ctpop_i32_ugt_one(i32 signext) #0

; Function Attrs: nounwind
declare i1 @ctpop_i32_eq_one(i32 signext) #0

; Function Attrs: nounwind
define i1 @ctpop_i32_ne_one(i32 signext %a) #0 {
  %B = shl i32 %a, %a
  %1 = call i32 @llvm.ctpop.i32(i32 %a)
  %2 = icmp ne i32 %1, 1
  store i32 %B, ptr poison, align 4
  ret i1 %2
}

; Function Attrs: nounwind
declare signext i32 @ctpop_i32_load(ptr) #0

; Function Attrs: nounwind
declare <2 x i32> @ctpop_v2i32(<2 x i32>) #0

; Function Attrs: nounwind
declare <2 x i1> @ctpop_v2i32_ult_two(<2 x i32>) #0

; Function Attrs: nounwind
declare <2 x i1> @ctpop_v2i32_ugt_one(<2 x i32>) #0

; Function Attrs: nounwind
declare <2 x i1> @ctpop_v2i32_eq_one(<2 x i32>) #0

; Function Attrs: nounwind
define <2 x i1> @ctpop_v2i32_ne_one(<2 x i32> %a) #0 {
  %1 = call <2 x i32> @llvm.ctpop.v2i32(<2 x i32> %a)
  %B = ashr i16 42, 0
  %2 = icmp ne <2 x i32> %1, splat (i32 1)
  store i16 %B, ptr poison, align 2
  ret <2 x i1> %2
}

; Function Attrs: nounwind
declare i64 @ctpop_i64(i64) #0

; Function Attrs: nounwind
declare i1 @ctpop_i64_ugt_two(i64) #0

; Function Attrs: nounwind
declare i1 @ctpop_i64_ugt_one(i64) #0

; Function Attrs: nounwind
define i1 @ctpop_i64_eq_one(i64 %a) #0 {
  %1 = call i64 @llvm.ctpop.i64(i64 %a)
  %2 = icmp eq i64 %1, 1
  %C = icmp ne i1 %2, false
  store i1 %C, ptr @G, align 1
  ret i1 %2
}

; Function Attrs: nounwind
declare i1 @ctpop_i64_ne_one(i64) #0

; Function Attrs: nounwind
declare <2 x i64> @ctpop_v2i64(<2 x i64>) #0

; Function Attrs: nounwind
declare <2 x i1> @ctpop_v2i64_ult_two(<2 x i64>) #0

; Function Attrs: nounwind
declare <2 x i1> @ctpop_v2i64_ugt_one(<2 x i64>) #0

; Function Attrs: nounwind
declare <2 x i1> @ctpop_v2i64_eq_one(<2 x i64>) #0

; Function Attrs: nounwind
declare <2 x i1> @ctpop_v2i64_ne_one(<2 x i64>) #0

; Function Attrs: nounwind
declare signext i32 @sextb_i32(i32 signext) #0

; Function Attrs: nounwind
declare i64 @sextb_i64(i64) #0

; Function Attrs: nounwind
declare signext i32 @sexth_i32(i32 signext) #0

; Function Attrs: nounwind
declare i64 @sexth_i64(i64) #0

declare i32 @sextb_extract_i32(i32)

declare i64 @sextb_extract_i64(i64)

define i32 @sexth_extract_i32(i32 %x) {
  %LGV = load i1, ptr @G, align 1
  %a = lshr i32 %x, 8
  %b = trunc i32 %a to i16
  %c = sext i16 %b to i32
  %B = or i1 %LGV, true
  store i1 %B, ptr poison, align 1
  ret i32 %c
}

declare i64 @sexth_extract_i64(i64)

; Function Attrs: nounwind
declare signext i32 @min_i32(i32 signext, i32 signext) #0

; Function Attrs: nounwind
declare i64 @min_i64(i64, i64) #0

; Function Attrs: nounwind
declare signext i32 @max_i32(i32 signext, i32 signext) #0

; Function Attrs: nounwind
declare i64 @max_i64(i64, i64) #0

; Function Attrs: nounwind
declare signext i32 @minu_i32(i32 signext, i32 signext) #0

; Function Attrs: nounwind
declare i64 @minu_i64(i64, i64) #0

; Function Attrs: nounwind
declare signext i32 @maxu_i32(i32 signext, i32 signext) #0

; Function Attrs: nounwind
declare i64 @maxu_i64(i64, i64) #0

declare i32 @abs_i32(i32)

declare signext i32 @abs_i32_sext(i32 signext)

declare i64 @abs_i64(i64)

; Function Attrs: nounwind
declare i32 @zexth_i32(i32) #0

; Function Attrs: nounwind
declare i64 @zexth_i64(i64) #0

; Function Attrs: nounwind
declare signext i32 @bswap_i32(i32 signext) #0

; Function Attrs: nounwind
declare void @bswap_i32_nosext(i32 signext, ptr) #0

declare i64 @bswap_i64(i64)

declare i16 @orc_b_i16(i16)

declare i32 @orc_b_i32(i32)

declare i64 @orc_b_i64(i64)

declare i64 @srai_slli(i16 signext)

declare i64 @srai_slli2(i16 signext)

declare signext i32 @func0000000000000001(i32 signext, i8 signext)

declare i1 @ctpop32_eq_one_nonzero(i32)

declare i1 @ctpop32_ne_one_nonzero(i32)

declare i1 @ctpop64_eq_one_nonzero(i64)

declare i1 @ctpop32_eq_one_maybezero(i32)

declare i8 @sub_if_uge_i8(i8, i8)

declare i16 @sub_if_uge_i16(i16, i16)

declare i32 @sub_if_uge_i32(i32, i32)

declare i64 @sub_if_uge_i64(i64, i64)

declare i128 @sub_if_uge_i128(i128, i128)

declare i32 @sub_if_uge_multiuse_select_i32(i32, i32)

define i32 @sub_if_uge_multiuse_cmp_i32(i32 %x, i32 %y) {
  br label %BB

BB:                                               ; preds = %0
  %cmp = icmp ult i32 %x, %y
  %select = select i1 %cmp, i32 0, i32 %y
  %sub = sub nuw i32 %x, %select
  %select2 = select i1 %cmp, i32 2, i32 4
  %shl = shl i32 %sub, %select2
  ret i32 %shl
}

define i32 @sub_if_uge_multiuse_cmp_store_i32(i32 signext %x, i32 signext %y, ptr %z) {
  %LGV = load i1, ptr @G.1, align 1
  %cmp = icmp uge i32 %x, %y
  %conv = zext i1 %cmp to i32
  store i32 %conv, ptr %z, align 4
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  %select = select i1 %cmp, i32 %y, i32 0
  %sub = sub nuw i32 %x, %select
  ret i32 %sub

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

declare i8 @sub_if_uge_C_i8(i8 zeroext)

declare i16 @sub_if_uge_C_i16(i16 zeroext)

declare i32 @sub_if_uge_C_i32(i32 signext)

declare i64 @sub_if_uge_C_i64(i64)

declare i32 @sub_if_uge_C_multiuse_cmp_i32(i32 signext, ptr)

declare i32 @sub_if_uge_C_multiuse_sub_i32(i32 signext, ptr)

declare i32 @sub_if_uge_C_swapped_i32(i32 signext)

declare i7 @sub_if_uge_C_nsw_i7(i7)

declare i7 @sub_if_uge_C_swapped_nsw_i7(i7)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.abs.i64(i64, i1 immarg) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.bswap.i32(i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.bswap.i64(i64) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctlz.i64(i64, i1 immarg) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ctpop.i32(i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.ctpop.v2i32(<2 x i32>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.ctpop.v2i64(<2 x i64>) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.cttz.i32(i32, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.cttz.i64(i64, i1 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

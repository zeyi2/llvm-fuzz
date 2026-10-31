; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 0
@G.1 = global i16 42
@G.2 = global i64 42
@G.3 = global i1 false
@G.4 = global i32 1

; Function Attrs: nounwind
declare i32 @ctlz_i32(i32) #0

; Function Attrs: nounwind
define i64 @ctlz_i64(i64 %a) #0 {
  %1 = call i64 @llvm.ctlz.i64(i64 %a, i1 false)
  store i64 %1, ptr @G.2, align 4
  ret i64 %1
}

; Function Attrs: nounwind
declare i32 @cttz_i32(i32) #0

; Function Attrs: nounwind
declare i64 @cttz_i64(i64) #0

; Function Attrs: nounwind
declare i32 @sexti1_i32(i32) #0

; Function Attrs: nounwind
declare i32 @sexti1_i32_2(i1) #0

define zeroext i8 @sexti1_i32_setcc(i32 signext %a) {
  %icmp = icmp sgt i32 %a, -1
  %B = srem i16 256, -32768
  %sext = sext i1 %icmp to i8
  store i16 %B, ptr @G.1, align 2
  ret i8 %sext
}

declare i32 @sexti1_i32_setcc_2(i32, i32)

declare i32 @sexti1_i32_setcc_3(i32, i32)

; Function Attrs: nounwind
declare i32 @sextb_i32(i32) #0

; Function Attrs: nounwind
declare i64 @sextb_i64(i64) #0

; Function Attrs: nounwind
declare i32 @sexth_i32(i32) #0

; Function Attrs: nounwind
declare i32 @no_sexth_i32(i32) #0

; Function Attrs: nounwind
define i64 @sexth_i64(i64 %a) #0 {
  %shl = shl i64 %a, 48
  %B = ashr i8 -128, -128
  %shr = ashr exact i64 %shl, 48
  store i8 %B, ptr @G, align 1
  ret i64 %shr
}

; Function Attrs: nounwind
declare i64 @no_sexth_i64(i64) #0

; Function Attrs: nounwind
define i32 @sext_sextinreg_sra(i16 %a) #0 {
  %sext = sext i16 %a to i32
  %shr = ashr exact i32 10, %sext
  ret i32 %shr
}

; Function Attrs: nounwind
declare i32 @sext_sextinreg_sra_2(i16) #0

; Function Attrs: nounwind
declare i32 @zexth_i32(i32) #0

; Function Attrs: nounwind
define i64 @zexth_i64(i64 %a) #0 {
  %C = icmp sle i64 %a, %a
  %and = and i64 %a, 65535
  store i1 %C, ptr @G.3, align 1
  ret i64 %and
}

; Function Attrs: nounwind
define i32 @bswap_i32(i32 %a) #0 {
  %1 = tail call i32 @llvm.bswap.i32(i32 %a)
  %B = udiv i32 %1, %1
  store i32 %B, ptr @G.4, align 4
  ret i32 %1
}

declare i64 @bswap_i64(i64)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.bswap.i32(i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.bswap.i64(i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctlz.i64(i64, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.cttz.i32(i32, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.cttz.i64(i64, i1 immarg) #2

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

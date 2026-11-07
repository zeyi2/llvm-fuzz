; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+xandesperf,+zdinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 256
@G.1 = global i32 -1
@G.2 = global i32 0

; Function Attrs: nounwind
define i32 @bbc(i32 %a) #0 {
  %LGV1 = load i32, ptr @G.1, align 4
  %B = shl i32 %a, %LGV1
  %and = and i32 %a, 65536
  %tst = icmp ne i32 %and, 0
  store i32 %B, ptr @G.2, align 4
  br i1 %tst, label %t, label %f

f:                                                ; preds = %0
  ret i32 0

t:                                                ; preds = %0
  ret i32 1
}

; Function Attrs: nounwind
declare i32 @select_bbc(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @bbs(i32) #0

; Function Attrs: nounwind
declare i32 @select_bbs(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @beqc(i32) #0

; Function Attrs: nounwind
declare i32 @select_beqc(i32, i32, i32) #0

; Function Attrs: nounwind
declare i32 @bnec(i32) #0

; Function Attrs: nounwind
declare i32 @select_bnec(i32, i32, i32) #0

declare i32 @bfoz_from_and_i32(i32)

declare i64 @bfoz_from_and_i64(i64)

declare i32 @bfoz_from_and_lshr_i32(i32)

declare i64 @bfoz_from_and_lshr_i64(i64)

declare i32 @bfoz_from_lshr_and_i32(i32)

declare i64 @bfoz_from_lshr_and_i64(i64)

declare i32 @bfoz_from_and_shl_with_msb_zero_i32(i32)

declare i32 @bfoz_from_lshr_shl_with_msb_zero_i32(i32)

declare i32 @bfoz_from_and_shl_i32(i32)

declare i32 @bfoz_from_lshr_shl_i32(i32)

define i32 @bfos_from_ashr_shl_i32(i32 %x) {
  %LGV = load i16, ptr @G, align 2
  %B = srem i16 32767, %LGV
  %shl = shl i32 %x, 8
  %ashr = ashr i32 %shl, 24
  store i16 %B, ptr poison, align 2
  ret i32 %ashr
}

define i32 @bfos_from_ashr_sexti8_i32(i8 %x) {
  %sext = sext i8 %x to i32
  %B = ashr i32 2147483647, 1
  %ashr = ashr i32 %sext, 5
  store i32 %B, ptr poison, align 4
  ret i32 %ashr
}

declare i32 @bfos_from_ashr_sexti16_i32(i16)

declare i32 @bfos_from_ashr_shl_with_msb_zero_insert_i32(i32)

declare i32 @bfos_from_ashr_shl_insert_i32(i32)

declare i32 @sexti1_i32(i32)

declare i32 @sexti1_i32_2(i1)

declare zeroext i8 @sexti1_i32_setcc(i32 signext)

declare i32 @sexti1_i32_setcc_2(i32, i32)

declare i32 @sexti1_i32_setcc_3(i32, i32)

declare i32 @sexti8_i32(i32)

declare i32 @sexti8_i32_2(i8)

declare i32 @sexti16_i32(i32)

declare i32 @sexti16_i32_2(i16)

declare i64 @sexti1_i64(i64)

declare i64 @sexti1_i64_2(i1)

declare i64 @sexti8_i64(i64)

declare i64 @sexti8_i64_2(i8)

define i64 @sexti16_i64(i64 %a) {
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %shl = shl i64 %a, 48
  %B = mul i64 %a, 0
  %shr = ashr exact i64 %shl, 48
  store i64 %B, ptr %A, align 4
  ret i64 %shr
}

declare i64 @sexti16_i64_2(i16)

declare i64 @sexti32_i64(i64)

declare i64 @sexti32_i64_2(i32)

; Function Attrs: nounwind speculatable memory(none)
declare i32 @llvm.riscv.nds.ffb.i32(i32, i32) #1

; Function Attrs: nounwind speculatable memory(none)
declare i32 @llvm.riscv.nds.ffzmism.i32(i32, i32) #1

; Function Attrs: nounwind speculatable memory(none)
declare i32 @llvm.riscv.nds.ffmism.i32(i32, i32) #1

; Function Attrs: nounwind speculatable memory(none)
declare i32 @llvm.riscv.nds.flmism.i32(i32, i32) #1

; Function Attrs: nounwind
declare i32 @ffb(i32, i32) #0

; Function Attrs: nounwind
declare i32 @ffzmism(i32, i32) #0

; Function Attrs: nounwind
define i32 @ffmism(i32 %a, i32 %b) #0 {
entry:
  %0 = call i32 @llvm.riscv.nds.ffmism.i32(i32 %a, i32 %b)
  %B = xor i32 %0, %a
  ret i32 %B
}

; Function Attrs: nounwind
define i32 @flmism(i32 %a, i32 %b) #0 {
entry:
  %0 = call i32 @llvm.riscv.nds.flmism.i32(i32 %a, i32 %b)
  %B = ashr i32 %a, %b
  store i32 %B, ptr poison, align 4
  ret i32 %0
}

attributes #0 = { nounwind }
attributes #1 = { nounwind speculatable memory(none) }

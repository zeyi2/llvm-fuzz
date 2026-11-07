; isel-diff-config: -mtriple=riscv64 -riscv-constant-pool-for-large-ints=0 -verify-machineinstrs -mattr=+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global i1 true
@G.2 = global i128 170141183460469231731687303715884105727
@G.3 = global i1 true
@G.4 = global i32 65536

; Function Attrs: nounwind
declare signext i32 @zero() #0

; Function Attrs: nounwind
declare signext i32 @pos_small() #0

; Function Attrs: nounwind
declare signext i32 @neg_small() #0

; Function Attrs: nounwind
declare signext i32 @pos_i32() #0

; Function Attrs: nounwind
declare signext i32 @neg_i32() #0

; Function Attrs: nounwind
declare signext i32 @pos_i32_hi20_only() #0

; Function Attrs: nounwind
declare signext i32 @neg_i32_hi20_only() #0

; Function Attrs: nounwind
declare signext i32 @imm_left_shifted_addi() #0

; Function Attrs: nounwind
define signext i32 @imm_right_shifted_addi() #0 {
  %LGV = load i32, ptr @G.4, align 4
  switch i32 %LGV, label %SW_D [
    i32 12877965, label %SW_C
  ]

BB:                                               ; preds = %SW_C, %SW_D
  ret i32 2147483647

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare signext i32 @imm_right_shifted_lui() #0

; Function Attrs: nounwind
define i64 @imm64_1() #0 {
  %C = fcmp ogt double f0x7FEFFFFFFFFFFFFF, +inf
  store i1 %C, ptr @G.3, align 1
  ret i64 2147483648
}

; Function Attrs: nounwind
declare i64 @imm64_2() #0

; Function Attrs: nounwind
declare i64 @imm64_3() #0

; Function Attrs: nounwind
declare i64 @imm64_4() #0

; Function Attrs: nounwind
declare i64 @imm64_5() #0

; Function Attrs: nounwind
declare i64 @imm64_6() #0

; Function Attrs: nounwind
declare i64 @imm64_7() #0

; Function Attrs: nounwind
declare i64 @imm64_8() #0

; Function Attrs: nounwind
declare i64 @imm64_9() #0

; Function Attrs: nounwind
declare i64 @imm_left_shifted_lui_1() #0

; Function Attrs: nounwind
declare i64 @imm_left_shifted_lui_2() #0

; Function Attrs: nounwind
declare i64 @imm_left_shifted_lui_3() #0

; Function Attrs: nounwind
define i64 @imm_right_shifted_lui_1() #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i128, ptr @G.2, align 4
  %C = icmp ule i128 0, %LGV
  store i1 %C, ptr %A, align 1
  ret i64 281474976706561
}

; Function Attrs: nounwind
declare i64 @imm_right_shifted_lui_2() #0

; Function Attrs: nounwind
declare i64 @imm_decoupled_lui_addi() #0

; Function Attrs: nounwind
declare i64 @imm_end_xori_1() #0

; Function Attrs: nounwind
declare i64 @imm_end_2addi_1() #0

; Function Attrs: nounwind
declare i64 @imm_2reg_1() #0

; Function Attrs: nounwind
declare void @imm_store_i8_neg1(ptr) #0

; Function Attrs: nounwind
declare void @imm_store_i16_neg1(ptr) #0

; Function Attrs: nounwind
declare void @imm_store_i32_neg1(ptr) #0

declare i64 @imm_5372288229()

declare i64 @imm_neg_5372288229()

declare i64 @imm_8953813715()

declare i64 @imm_neg_8953813715()

define i64 @imm_16116864687() {
  %LGV = load double, ptr @G, align 8
  %C = fcmp ueq double %LGV, 1.000000e+00
  store i1 %C, ptr @G.1, align 1
  ret i64 16116864687
}

declare i64 @imm_neg_16116864687()

declare i64 @imm_2344336315()

declare i64 @imm_70370820078523()

declare i64 @imm_neg_9223372034778874949()

declare i64 @imm_neg_9223301666034697285()

declare i64 @imm_neg_2219066437()

declare i64 @imm_neg_8798043653189()

declare i64 @imm_9223372034904144827()

declare i64 @imm_neg_9223354442718100411()

declare i64 @imm_2863311530()

declare i64 @imm_neg_2863311530()

declare i64 @imm_2147486378()

declare i64 @imm_neg_2147485013()

declare i64 @imm_12900924131259()

declare i64 @imm_50394234880()

declare i64 @imm_12900936431479()

declare i64 @imm_12900918536874()

declare i64 @imm_12900925247761()

declare i64 @imm_7158272001()

declare i64 @imm_12884889601()

declare i64 @imm_neg_3435982847()

declare i64 @imm_neg_5726842879()

declare i64 @imm_neg_10307948543()

declare i64 @li_rori_1()

declare i64 @li_rori_2()

declare i64 @li_rori_3()

declare i64 @PR54812()

; Function Attrs: nounwind
declare signext i32 @pos_2048() #0

; Function Attrs: nounwind
declare i64 @imm64_same_lo_hi() #0

; Function Attrs: nounwind optsize
declare i64 @imm64_same_lo_hi_optsize() #1

; Function Attrs: nounwind
declare i64 @imm64_same_lo_hi_negative() #0

declare i64 @imm64_0x8000080000000()

declare i64 @imm64_0x10000100000000()

declare i64 @imm64_0xFF7FFFFF7FFFFFFE()

declare i64 @imm64_0xFFFFFFFF0()

declare i64 @imm64_0x1FFFFFF08()

declare i64 @imm64_same_lo_hi_negative_demanded(i63 zeroext)

attributes #0 = { nounwind }
attributes #1 = { nounwind optsize }

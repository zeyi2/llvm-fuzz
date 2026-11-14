; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+xtheadbs -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 1
@G.1 = global i1 false
@G.2 = global i64 -1

; Function Attrs: nounwind
declare signext i32 @bittest_7_i32(i32 signext) #0

; Function Attrs: nounwind
declare signext i32 @bittest_10_i32(i32 signext) #0

; Function Attrs: nounwind
declare signext i32 @bittest_11_i32(i32 signext) #0

; Function Attrs: nounwind
declare signext i32 @bittest_31_i32(i32 signext) #0

; Function Attrs: nounwind
declare i64 @bittest_7_i64(i64) #0

; Function Attrs: nounwind
declare i64 @bittest_10_i64(i64) #0

; Function Attrs: nounwind
declare i64 @bittest_11_i64(i64) #0

; Function Attrs: nounwind
declare i64 @bittest_31_i64(i64) #0

; Function Attrs: nounwind
define i64 @bittest_32_i64(i64 %a) #0 {
  %shr = lshr i64 %a, 32
  %B = and i64 0, %a
  %not = xor i64 %shr, -1
  %and = and i64 %not, 1
  store i64 %B, ptr @G.2, align 4
  ret i64 %and
}

; Function Attrs: nounwind
declare i64 @bittest_63_i64(i64) #0

; Function Attrs: nounwind
declare i1 @bittest_constant_by_var_shr_i32(i32 signext) #0

; Function Attrs: nounwind
declare i1 @bittest_constant_by_var_shl_i32(i32 signext) #0

; Function Attrs: nounwind
declare i1 @bittest_constant_by_var_shr_i64(i64) #0

; Function Attrs: nounwind
declare i1 @bittest_constant_by_var_shl_i64(i64) #0

declare void @bittest_switch(i32 signext)

declare void @bar()

declare signext i32 @bit_10_z_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_10_nz_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_11_z_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_11_nz_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_20_z_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_20_nz_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_31_z_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_31_nz_select_i32(i32 signext, i32 signext, i32 signext)

declare i64 @bit_10_z_select_i64(i64, i64, i64)

declare i64 @bit_10_nz_select_i64(i64, i64, i64)

declare i64 @bit_11_z_select_i64(i64, i64, i64)

declare i64 @bit_11_nz_select_i64(i64, i64, i64)

declare i64 @bit_20_z_select_i64(i64, i64, i64)

declare i64 @bit_20_nz_select_i64(i64, i64, i64)

declare i64 @bit_31_z_select_i64(i64, i64, i64)

declare i64 @bit_31_nz_select_i64(i64, i64, i64)

declare i64 @bit_32_z_select_i64(i64, i64, i64)

declare i64 @bit_32_nz_select_i64(i64, i64, i64)

declare i64 @bit_55_z_select_i64(i64, i64, i64)

define i64 @bit_55_nz_select_i64(i64 %a, i64 %b, i64 %c) {
  %LGV = load i64, ptr @G.2, align 4
  %C = icmp sgt i64 %c, %LGV
  %1 = select i1 %C, i64 %b, i64 %c
  ret i64 %1
}

declare i64 @bit_63_z_select_i64(i64, i64, i64)

declare i64 @bit_63_nz_select_i64(i64, i64, i64)

define void @bit_10_z_branch_i32(i32 signext %0) {
  %2 = and i32 %0, 1024
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  %LGV = load i32, ptr @G, align 4
  tail call void @bar()
  %C = icmp sge i32 %0, %LGV
  store i1 %C, ptr @G.1, align 1
  br label %5

5:                                                ; preds = %4, %1
  ret void
}

declare void @bit_10_nz_branch_i32(i32 signext)

declare void @bit_11_z_branch_i32(i32 signext)

define void @bit_11_nz_branch_i32(i32 signext %0) {
  %2 = and i32 %0, 2048
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  tail call void @bar()
  %B = and i32 %0, 1
  store i32 %B, ptr @G, align 4
  br label %5

5:                                                ; preds = %4, %1
  ret void
}

declare void @bit_24_z_branch_i32(i32 signext)

declare void @bit_24_nz_branch_i32(i32 signext)

declare void @bit_31_z_branch_i32(i32 signext)

declare void @bit_31_nz_branch_i32(i32 signext)

declare void @bit_10_z_branch_i64(i64)

declare void @bit_10_nz_branch_i64(i64)

declare void @bit_11_z_branch_i64(i64)

declare void @bit_11_nz_branch_i64(i64)

declare void @bit_24_z_branch_i64(i64)

define void @bit_24_nz_branch_i64(i64 %0) {
  %2 = and i64 %0, 16777216
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  tail call void @bar()
  br label %5

5:                                                ; preds = %4, %1
  ret void
}

declare void @bit_31_z_branch_i64(i64)

declare void @bit_31_nz_branch_i64(i64)

declare void @bit_32_z_branch_i64(i64)

declare void @bit_32_nz_branch_i64(i64)

declare void @bit_62_z_branch_i64(i64)

declare void @bit_62_nz_branch_i64(i64)

declare void @bit_63_z_branch_i64(i64)

declare void @bit_63_nz_branch_i64(i64)

declare signext i32 @bit_10_1_z_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_10_1_nz_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_11_1_z_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_11_1_nz_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_16_1_z_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_16_1_nz_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_20_1_z_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_20_1_nz_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_31_1_z_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_31_1_nz_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_32_1_z_select_i32(i32 signext, i32 signext, i32 signext)

declare signext i32 @bit_32_1_nz_select_i32(i32 signext, i32 signext, i32 signext)

declare i64 @bit_10_1_z_select_i64(i64, i64, i64)

declare i64 @bit_10_1_nz_select_i64(i64, i64, i64)

declare i64 @bit_11_1_z_select_i64(i64, i64, i64)

define i64 @bit_11_1_nz_select_i64(i64 %a, i64 %b, i64 %c) {
  %B = and i64 %c, %b
  %1 = and i64 %a, %B
  %2 = icmp ne i64 %1, 0
  %3 = select i1 %2, i64 %b, i64 %c
  ret i64 %3
}

declare i64 @bit_16_1_z_select_i64(i64, i64, i64)

declare i64 @bit_16_1_nz_select_i64(i64, i64, i64)

declare i64 @bit_20_1_z_select_i64(i64, i64, i64)

declare i64 @bit_20_1_nz_select_i64(i64, i64, i64)

declare i64 @bit_31_1_z_select_i64(i64, i64, i64)

declare i64 @bit_31_1_nz_select_i64(i64, i64, i64)

declare i64 @bit_32_1_z_select_i64(i64, i64, i64)

declare i64 @bit_32_1_nz_select_i64(i64, i64, i64)

declare i64 @bit_55_1_z_select_i64(i64, i64, i64)

declare i64 @bit_55_1_nz_select_i64(i64, i64, i64)

declare i64 @bit_63_1_z_select_i64(i64, i64, i64)

declare i64 @bit_63_1_nz_select_i64(i64, i64, i64)

declare i64 @bit_64_1_z_select_i64(i64, i64, i64)

declare i64 @bit_64_1_nz_select_i64(i64, i64, i64)

declare void @bit_10_1_z_branch_i32(i32 signext)

declare void @bit_10_1_nz_branch_i32(i32 signext)

declare void @bit_11_1_z_branch_i32(i32 signext)

declare void @bit_11_1_nz_branch_i32(i32 signext)

declare void @bit_16_1_z_branch_i32(i32 signext)

declare void @bit_16_1_nz_branch_i32(i32 signext)

declare void @bit_24_1_z_branch_i32(i32 signext)

declare void @bit_24_1_nz_branch_i32(i32 signext)

declare void @bit_31_1_z_branch_i32(i32 signext)

declare void @bit_31_1_nz_branch_i32(i32 signext)

declare void @bit_32_1_z_branch_i32(i32 signext)

declare void @bit_32_1_nz_branch_i32(i32 signext)

declare void @bit_10_1_z_branch_i64(i64)

declare void @bit_10_1_nz_branch_i64(i64)

declare void @bit_11_1_z_branch_i64(i64)

declare void @bit_11_1_nz_branch_i64(i64)

declare void @bit_16_1_z_branch_i64(i64)

declare void @bit_16_1_nz_branch_i64(i64)

declare void @bit_24_1_z_branch_i64(i64)

declare void @bit_24_1_nz_branch_i64(i64)

declare void @bit_31_1_z_branch_i64(i64)

declare void @bit_31_1_nz_branch_i64(i64)

declare void @bit_32_1_z_branch_i64(i64)

declare void @bit_32_1_nz_branch_i64(i64)

declare void @bit_62_1_z_branch_i64(i64)

declare void @bit_62_1_nz_branch_i64(i64)

declare void @bit_63_1_z_branch_i64(i64)

declare void @bit_63_1_nz_branch_i64(i64)

declare void @bit_64_1_z_branch_i64(i64)

declare void @bit_64_1_nz_branch_i64(i64)

declare i32 @bittest_31_andeq0_i64(i64)

declare i32 @bittest_63_andeq0_i64(i64)

declare i32 @bittest_31_slt0_i32(i32, i1)

declare i32 @bittest_63_slt0_i64(i32, i1)

attributes #0 = { nounwind }

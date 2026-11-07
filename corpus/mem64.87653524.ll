; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = dso_local global i64 0
@G.1 = global ptr poison

; Function Attrs: nounwind
declare dso_local i64 @lb(ptr) #0

; Function Attrs: nounwind
declare dso_local i64 @lh(ptr) #0

; Function Attrs: nounwind
define dso_local i64 @lw(ptr %a) #0 {
  %1 = getelementptr i32, ptr %a, i32 3
  %L = load i8, ptr %1, align 1
  %2 = load i32, ptr %1, align 4
  %3 = sext i32 %2 to i64
  %G = getelementptr ptr, ptr %1, i8 %L
  %4 = load volatile i32, ptr %G, align 4
  ret i64 %3
}

; Function Attrs: nounwind
declare dso_local i64 @lbu(ptr) #0

; Function Attrs: nounwind
declare dso_local i64 @lhu(ptr) #0

; Function Attrs: nounwind
declare dso_local i64 @lwu(ptr) #0

; Function Attrs: nounwind
declare dso_local void @sb(ptr, i8) #0

; Function Attrs: nounwind
declare dso_local void @sh(ptr, i16) #0

; Function Attrs: nounwind
declare dso_local void @sw(ptr, i32) #0

; Function Attrs: nounwind
declare dso_local i64 @ld(ptr) #0

; Function Attrs: nounwind
declare dso_local void @sd(ptr, i64) #0

; Function Attrs: nounwind
define dso_local i64 @load_sext_zext_anyext_i1(ptr %a) #0 {
  %1 = getelementptr i1, ptr %a, i32 1
  %L = load i16, ptr %1, align 2
  %G = getelementptr ptr, ptr %a, i16 %L
  %2 = load i1, ptr %1, align 1
  %3 = sext i1 %2 to i64
  %4 = getelementptr i1, ptr %a, i32 2
  %5 = load i1, ptr %4, align 1
  %6 = zext i1 %5 to i64
  %7 = add i64 %3, %6
  %8 = load volatile i1, ptr %a, align 1
  store ptr %G, ptr @G.1, align 8
  ret i64 %7
}

; Function Attrs: nounwind
declare dso_local i16 @load_sext_zext_anyext_i1_i16(ptr) #0

; Function Attrs: nounwind
declare dso_local i64 @ld_sd_global(i64) #0

declare i64 @lw_near_local(ptr)

declare void @st_near_local(ptr, i64)

declare i64 @lw_sw_near_local(ptr, i64)

declare i64 @lw_far_local(ptr)

declare void @st_far_local(ptr, i64)

declare i64 @lw_sw_far_local(ptr, i64)

declare i64 @lw_really_far_local(ptr)

declare void @st_really_far_local(ptr, i64)

declare i64 @lw_sw_really_far_local(ptr, i64)

; Function Attrs: nounwind
declare void @addi_fold_crash(i64) #0

declare void @snork(ptr)

attributes #0 = { nounwind }

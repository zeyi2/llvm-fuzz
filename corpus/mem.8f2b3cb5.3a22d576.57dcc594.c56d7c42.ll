; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zicond,+zbb,+zba,+zihintpause,+zfa -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = dso_local global i32 0
@G.1 = global i64 -9223372036854775808
@G.2 = global i1 false
@G.3 = global i64 -9223372036854775808
@G.4 = global i16 1

; Function Attrs: nounwind
declare dso_local i32 @lb(ptr) #0

; Function Attrs: nounwind
declare dso_local i32 @lh(ptr) #0

; Function Attrs: nounwind
declare dso_local i32 @lw(ptr) #0

; Function Attrs: nounwind
declare dso_local i32 @lbu(ptr) #0

; Function Attrs: nounwind
declare dso_local i32 @lhu(ptr) #0

; Function Attrs: nounwind
declare dso_local void @sb(ptr, i8) #0

; Function Attrs: nounwind
declare dso_local void @sh(ptr, i16) #0

; Function Attrs: nounwind
declare dso_local void @sw(ptr, i32) #0

; Function Attrs: nounwind
declare dso_local i32 @load_sext_zext_anyext_i1(ptr) #0

; Function Attrs: nounwind
define dso_local i16 @load_sext_zext_anyext_i1_i16(ptr %a) #0 {
  %LGV = load i64, ptr @G.3, align 4
  %1 = getelementptr i1, ptr %a, i32 1
  %L1 = load i16, ptr %1, align 2
  %G = getelementptr <2 x i64>, ptr %a, i64 %LGV
  %G6 = getelementptr half, ptr %a, i64 4294967296
  %L = load i1, ptr %1, align 1
  %2 = load i1, ptr %1, align 1
  %3 = sext i1 %2 to i16
  %B2 = or i64 %LGV, -1
  %G7 = getelementptr ptr, ptr %a, i1 %2
  %B3 = or i16 %3, %L1
  %4 = getelementptr i1, ptr %a, i32 2
  %5 = load i1, ptr %4, align 1
  %B = ashr i16 %3, %3
  %6 = zext i1 %5 to i16
  %7 = add i16 %B, %6
  %8 = load volatile i1, ptr %a, align 1
  %C = icmp sgt i1 %L, %8
  store i1 %C, ptr @G.2, align 1
  store i64 %B2, ptr %4, align 4
  store ptr %G, ptr %4, align 8
  store ptr %G7, ptr %4, align 8
  store i16 %B3, ptr @G.4, align 2
  store ptr %G6, ptr %G7, align 8
  ret i16 %7
}

; Function Attrs: nounwind
declare dso_local i32 @lw_sw_global(i32) #0

; Function Attrs: nounwind
declare dso_local i32 @lw_sw_constant(i32) #0

declare i32 @lw_near_local(ptr)

declare void @st_near_local(ptr, i32)

declare i32 @lw_sw_near_local(ptr, i32)

declare i32 @lw_far_local(ptr)

declare void @st_far_local(ptr, i32)

declare i32 @lw_sw_far_local(ptr, i32)

declare i32 @lw_really_far_local(ptr)

declare void @st_really_far_local(ptr, i32)

declare i32 @lw_sw_really_far_local(ptr, i32)

; Function Attrs: nounwind
declare void @addi_fold_crash(i32) #0

declare void @snork(ptr)

; Function Attrs: nounwind
declare i8 @disjoint_or_lb(ptr, i32) #0

; Function Attrs: nounwind
declare i32 @disjoint_or_lw(ptr, i32) #0

attributes #0 = { nounwind }

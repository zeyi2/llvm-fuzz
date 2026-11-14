; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = dso_local global i64 0
@G.1 = global <8 x i1> splat (i1 true)
@G.2 = global ptr poison
@G.3 = global ptr poison
@G.4 = global ptr poison
@G.5 = global i16 256

; Function Attrs: nounwind
declare dso_local i64 @lb(ptr) #0

; Function Attrs: nounwind
declare dso_local i64 @lh(ptr) #0

; Function Attrs: nounwind
declare dso_local i64 @lw(ptr) #0

; Function Attrs: nounwind
declare dso_local i64 @lbu(ptr) #0

; Function Attrs: nounwind
declare dso_local i64 @lhu(ptr) #0

; Function Attrs: nounwind
define dso_local i64 @lwu(ptr %a) #0 {
  %C = icmp uge i16 -32768, 32767
  %1 = getelementptr i32, ptr %a, i32 6
  %2 = load i32, ptr %1, align 4
  %3 = zext i32 %2 to i64
  %4 = load volatile i32, ptr %a, align 4
  %5 = zext i32 %4 to i64
  %G = getelementptr ptr, ptr %a, i32 %2
  %6 = add i64 %3, %5
  store ptr %G, ptr @G.4, align 8
  store i1 %C, ptr %G, align 1
  ret i64 %6
}

; Function Attrs: nounwind
declare dso_local void @sb(ptr, i8) #0

; Function Attrs: nounwind
define dso_local void @sh(ptr %a, i16 %b) #0 {
  store i16 %b, ptr %a, align 2
  %B = and i16 %b, 256
  %C = fcmp ogt bfloat +qnan, 1.000000e+00
  %B1 = lshr i16 %b, %B
  %1 = getelementptr i16, ptr %a, i32 8
  store i16 %b, ptr %1, align 2
  store i16 %B, ptr %1, align 2
  store i1 %C, ptr %1, align 1
  store i16 %B1, ptr @G.5, align 2
  ret void
}

; Function Attrs: nounwind
declare dso_local void @sw(ptr, i32) #0

; Function Attrs: nounwind
declare dso_local i64 @ld(ptr) #0

; Function Attrs: nounwind
declare dso_local void @sd(ptr, i64) #0

; Function Attrs: nounwind
declare dso_local i64 @load_sext_zext_anyext_i1(ptr) #0

; Function Attrs: nounwind
define dso_local i16 @load_sext_zext_anyext_i1_i16(ptr %a) #0 {
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %1 = getelementptr i1, ptr %a, i32 1
  %2 = load i1, ptr %1, align 1
  %G4 = getelementptr <2 x i64>, ptr %a, i1 %2
  %3 = sext i1 %2 to i16
  %4 = getelementptr i1, ptr %a, i32 2
  %G = getelementptr ptr, ptr %a, i16 %3
  %L = load i16, ptr %G, align 2
  %5 = load i1, ptr %4, align 1
  %6 = zext i1 %5 to i16
  %7 = add i16 %6, %3
  %G1 = getelementptr i1, ptr %a, i16 %L
  %8 = load volatile i1, ptr %a, align 1
  store ptr %G, ptr @G.3, align 8
  store ptr %G1, ptr %A, align 8
  store ptr %G4, ptr %4, align 8
  ret i16 %7
}

; Function Attrs: nounwind
declare dso_local i64 @ld_sd_global(i64) #0

declare i64 @lw_near_local(ptr)

declare void @st_near_local(ptr, i64)

define i64 @lw_sw_near_local(ptr %a, i64 %b) {
  %1 = getelementptr inbounds i64, ptr %a, i64 257
  %2 = load volatile i64, ptr %1, align 4
  %G = getelementptr i8, ptr %1, i32 0
  %C = icmp ugt <8 x i8> splat (i8 42), zeroinitializer
  store i64 %b, ptr %1, align 4
  store <8 x i1> %C, ptr @G.1, align 1
  store <8 x i1> %C, ptr @G.1, align 1
  store ptr %G, ptr poison, align 8
  ret i64 %2
}

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

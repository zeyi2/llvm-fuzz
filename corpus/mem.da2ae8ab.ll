; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zbs -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = dso_local global i32 0
@G.1 = global i16 0
@G.2 = global i32 65536
@G.3 = global <4 x i32> splat (i32 42)

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
define dso_local i32 @load_sext_zext_anyext_i1(ptr %a) #0 {
  %LGV1 = load i32, ptr @G.2, align 4
  %1 = getelementptr i1, ptr %a, i32 1
  %2 = load i1, ptr %1, align 1
  %3 = sext i1 %2 to i32
  %C = icmp ugt i32 %3, %LGV1
  %4 = zext i1 %C to i32
  %5 = add i32 %3, %4
  %6 = load volatile i1, ptr %a, align 1
  ret i32 %5
}

; Function Attrs: nounwind
declare dso_local i16 @load_sext_zext_anyext_i1_i16(ptr) #0

; Function Attrs: nounwind
declare dso_local i32 @lw_sw_global(i32) #0

; Function Attrs: nounwind
define dso_local i32 @lw_sw_constant(i32 %a) #0 {
  %1 = inttoptr i32 -559038737 to ptr
  %L = load <4 x i32>, ptr %1, align 16
  %2 = load volatile i32, ptr %1, align 4
  store i32 %a, ptr %1, align 4
  %B = xor <4 x i32> %L, splat (i32 2147483647)
  store <4 x i32> %B, ptr @G.3, align 16
  ret i32 %2
}

declare i32 @lw_near_local(ptr)

declare void @st_near_local(ptr, i32)

define i32 @lw_sw_near_local(ptr %a, i32 %b) {
  %1 = getelementptr inbounds i32, ptr %a, i64 513
  %2 = load volatile i32, ptr %1, align 4
  store i32 %b, ptr %1, align 4
  %C = icmp ule i32 %b, %b
  store i1 %C, ptr poison, align 1
  ret i32 %2
}

declare i32 @lw_far_local(ptr)

declare void @st_far_local(ptr, i32)

declare i32 @lw_sw_far_local(ptr, i32)

define i32 @lw_really_far_local(ptr %a) {
  %LGV = load i16, ptr @G.1, align 2
  %B = ashr i16 -32768, %LGV
  %1 = getelementptr inbounds i32, ptr %a, i32 536870400
  %2 = load volatile i32, ptr %1, align 4
  store i16 %B, ptr %1, align 2
  ret i32 %2
}

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

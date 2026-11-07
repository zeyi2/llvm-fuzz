; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zihintpause -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = dso_local global i32 0
@G.1 = global ptr poison
@G.2 = global i16 1
@G.3 = global ptr poison
@G.4 = global i8 0

; Function Attrs: nounwind
declare dso_local i32 @lb(ptr) #0

; Function Attrs: nounwind
declare dso_local i32 @lh(ptr) #0

; Function Attrs: nounwind
define dso_local i32 @lw(ptr %a) #0 {
  %1 = getelementptr i32, ptr %a, i32 3
  %L = load i1, ptr %1, align 1
  %2 = load i32, ptr %1, align 4
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %3 = load volatile i32, ptr %a, align 4
  ret i32 %2

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare dso_local i32 @lbu(ptr) #0

; Function Attrs: nounwind
declare dso_local i32 @lhu(ptr) #0

; Function Attrs: nounwind
declare dso_local void @sb(ptr, i8) #0

; Function Attrs: nounwind
declare dso_local void @sh(ptr, i16) #0

; Function Attrs: nounwind
define dso_local void @sw(ptr %a, i32 %b) #0 {
  store i32 %b, ptr %a, align 4
  %1 = getelementptr i32, ptr %a, i32 8
  %L = load i1, ptr %1, align 1
  store i32 %b, ptr %1, align 4
  %G = getelementptr ptr, ptr %1, i1 %L
  store ptr %G, ptr @G.1, align 8
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @load_sext_zext_anyext_i1(ptr) #0

; Function Attrs: nounwind
define dso_local i16 @load_sext_zext_anyext_i1_i16(ptr %a) #0 {
  %LGV1 = load i8, ptr @G.4, align 1
  %1 = getelementptr i1, ptr %a, i32 1
  %L = load i8, ptr %1, align 1
  %2 = load i1, ptr %1, align 1
  %3 = sext i1 %2 to i16
  %C = icmp uge i8 %L, %LGV1
  %4 = zext i1 %C to i16
  %5 = add i16 %3, %4
  %6 = load volatile i1, ptr %a, align 1
  ret i16 %5
}

; Function Attrs: nounwind
declare dso_local i32 @lw_sw_global(i32) #0

; Function Attrs: nounwind
declare dso_local i32 @lw_sw_constant(i32) #0

declare i32 @lw_near_local(ptr)

define void @st_near_local(ptr %a, i32 %b) {
  %LGV = load i16, ptr @G.2, align 2
  %1 = getelementptr inbounds i32, ptr %a, i64 513
  store i32 %b, ptr %1, align 4
  %G = getelementptr double, ptr %1, i16 %LGV
  store ptr %G, ptr @G.3, align 8
  ret void
}

declare i32 @lw_sw_near_local(ptr, i32)

declare i32 @lw_far_local(ptr)

declare void @st_far_local(ptr, i32)

declare i32 @lw_sw_far_local(ptr, i32)

declare i32 @lw_really_far_local(ptr)

define void @st_really_far_local(ptr %a, i32 %b) {
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %1 = getelementptr inbounds i32, ptr %a, i32 536870400
  %G = getelementptr ptr, ptr %1, i64 9223372036854775807
  store i32 %b, ptr %1, align 4
  store ptr %G, ptr %A, align 8
  ret void
}

declare i32 @lw_sw_really_far_local(ptr, i32)

; Function Attrs: nounwind
declare void @addi_fold_crash(i32) #0

declare void @snork(ptr)

; Function Attrs: nounwind
declare i8 @disjoint_or_lb(ptr, i32) #0

; Function Attrs: nounwind
declare i32 @disjoint_or_lw(ptr, i32) #0

attributes #0 = { nounwind }

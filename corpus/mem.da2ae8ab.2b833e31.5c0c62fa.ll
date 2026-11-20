; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zbs -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = dso_local global i32 0
@G.1 = global i16 0
@G.2 = global i32 65536
@G.3 = global <4 x i32> splat (i32 42)
@G.4 = global i32 1
@G.5 = global i1 true
@G.6 = global ptr poison
@G.7 = global i16 -1
@G.8 = global i1 false
@G.9 = global ptr poison

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
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load i32, ptr @G.2, align 4
  %1 = getelementptr i1, ptr %a, i32 1
  %G1 = getelementptr ptr, ptr %1, i32 %LGV1
  %2 = load i1, ptr %1, align 1
  %3 = sext i1 %2 to i32
  %C = icmp ugt i32 %3, %LGV1
  %4 = zext i1 %C to i32
  %5 = add i32 %3, %4
  %6 = load volatile i1, ptr %a, align 1
  store ptr %G1, ptr @G.6, align 8
  store i1 %2, ptr %A, align 1
  ret i32 %5
}

; Function Attrs: nounwind
declare dso_local i16 @load_sext_zext_anyext_i1_i16(ptr) #0

; Function Attrs: nounwind
declare dso_local i32 @lw_sw_global(i32) #0

; Function Attrs: nounwind
define dso_local i32 @lw_sw_constant(i32 %a) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %L11 = load i1, ptr %A, align 1
  br i1 %L11, label %T, label %F

BB9:                                              ; preds = %F, %T
  %LGV = load i32, ptr @G.4, align 4
  %1 = inttoptr i32 -559038737 to ptr
  switch i32 %LGV, label %SW_D [
    i32 1234350291, label %SW_C
    i32 -191819463, label %SW_C1
    i32 -718930482, label %SW_C2
    i32 669481188, label %SW_C3
    i32 -448403443, label %SW_C4
    i32 2026247887, label %SW_C5
    i32 -420586763, label %SW_C6
  ]

BB:                                               ; preds = %SW_C3, %SW_C2, %SW_C, %SW_D
  %L = load <4 x i32>, ptr %1, align 16
  %2 = load volatile i32, ptr %1, align 4
  store i32 %a, ptr %1, align 4
  %B = xor <4 x i32> %L, splat (i32 2147483647)
  store <4 x i32> %B, ptr @G.3, align 16
  ret i32 %2

SW_D:                                             ; preds = %BB9
  %LGV8 = load i16, ptr @G.7, align 2
  %C = icmp sge i16 %LGV8, 0
  store i1 %C, ptr @G.8, align 1
  br label %BB

SW_C:                                             ; preds = %SW_C, %BB9
  %LGV7 = load i1, ptr @G.5, align 1
  br i1 %LGV7, label %SW_C, label %BB

SW_C1:                                            ; preds = %BB9
  %C3 = icmp ugt i32 %a, -1
  store i1 %C3, ptr %A, align 1
  ret i32 %LGV

SW_C2:                                            ; preds = %BB9
  br label %BB

SW_C3:                                            ; preds = %BB9
  br label %BB

SW_C4:                                            ; preds = %BB9
  ret i32 -2147483648

SW_C5:                                            ; preds = %BB9
  ret i32 %a

SW_C6:                                            ; preds = %BB9
  ret i32 1

T:                                                ; preds = %T, %0
  %B2 = xor <2 x i64> splat (i64 9223372036854775807), splat (i64 4294967296)
  store <2 x i64> %B2, ptr %A, align 16
  br i1 %L11, label %T, label %BB9

F:                                                ; preds = %0
  br label %BB9
}

declare i32 @lw_near_local(ptr)

declare void @st_near_local(ptr, i32)

declare i32 @lw_sw_near_local(ptr, i32)

declare i32 @lw_far_local(ptr)

declare void @st_far_local(ptr, i32)

declare i32 @lw_sw_far_local(ptr, i32)

define i32 @lw_really_far_local(ptr %a) {
  %LGV = load i16, ptr @G.1, align 2
  %B = ashr i16 -32768, %LGV
  %1 = getelementptr inbounds i32, ptr %a, i32 536870400
  %G3 = getelementptr i16, ptr %a, i16 %LGV
  %G2 = getelementptr ptr, ptr %a, i1 false
  %L4 = load i64, ptr %G2, align 4
  %2 = load volatile i32, ptr %1, align 4
  store i16 %B, ptr %G2, align 2
  %B5 = lshr i64 0, %L4
  store ptr %G3, ptr @G.9, align 8
  store i64 %B5, ptr poison, align 4
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

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zicsr,+zihintpause -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

%struct.quux = type { i32, [0 x i8] }

@G = dso_local global i32 0
@G.1 = global <2 x i64> splat (i64 4294967296)
@G.2 = global i128 18446744073709551616
@G.3 = global i1 false
@G.4 = global <2 x i64> zeroinitializer
@G.5 = global i1 false

; Function Attrs: nounwind
declare dso_local i32 @lb(ptr) #0

; Function Attrs: nounwind
define dso_local i32 @lh(ptr %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i128, ptr @G.2, align 4
  %1 = getelementptr i16, ptr %a, i32 2
  %2 = load i16, ptr %1, align 2
  %C = icmp ugt i128 1, %LGV
  %3 = sext i16 %2 to i32
  %4 = load volatile i16, ptr %a, align 2
  store i1 %C, ptr %A, align 1
  ret i32 %3
}

; Function Attrs: nounwind
define dso_local i32 @lw(ptr %a) #0 {
  %1 = getelementptr i32, ptr %a, i32 3
  %2 = load i32, ptr %1, align 4
  %3 = load volatile i32, ptr %a, align 4
  %B = add <2 x i64> splat (i64 42), zeroinitializer
  store <2 x i64> %B, ptr @G.4, align 16
  ret i32 %2
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
declare dso_local void @sw(ptr, i32) #0

; Function Attrs: nounwind
declare dso_local i32 @load_sext_zext_anyext_i1(ptr) #0

; Function Attrs: nounwind
define dso_local i16 @load_sext_zext_anyext_i1_i16(ptr %a) #0 {
  %1 = getelementptr i1, ptr %a, i32 1
  %L1 = load i1, ptr %1, align 1
  %2 = load i1, ptr %1, align 1
  %3 = sext i1 %2 to i16
  %B = sdiv i1 true, %L1
  %4 = zext i1 %B to i16
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
  %A5 = alloca i1, align 1
  store i1 true, ptr %A5, align 1
  %A = alloca i16, align 2
  store i16 32767, ptr %A, align 2
  %1 = getelementptr inbounds i32, ptr %a, i64 513
  %L = load i16, ptr %1, align 2
  store i32 %b, ptr %1, align 4
  %L1 = load i16, ptr %A, align 2
  switch i16 %L1, label %SW_D [
    i16 10774, label %SW_C
    i16 -19824, label %SW_C2
    i16 -5784, label %SW_C3
  ]

BB:                                               ; preds = %SW_C2, %SW_C, %SW_D
  ret void

SW_D:                                             ; preds = %SW_D, %0
  %LGV = load i1, ptr @G.5, align 1
  br i1 %LGV, label %SW_D, label %BB

SW_C:                                             ; preds = %SW_C, %0
  %LGV4 = load i1, ptr @G.5, align 1
  %L6 = load i1, ptr %A5, align 1
  br i1 %L6, label %BB, label %SW_C

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  ret void
}

declare i32 @lw_sw_near_local(ptr, i32)

define i32 @lw_far_local(ptr %a) {
  %1 = getelementptr inbounds i32, ptr %a, i64 4095
  %C = fcmp ugt float 0.000000e+00, +qnan
  %2 = load volatile i32, ptr %1, align 4
  store i1 %C, ptr @G.3, align 1
  ret i32 %2
}

declare void @st_far_local(ptr, i32)

declare i32 @lw_sw_far_local(ptr, i32)

declare i32 @lw_really_far_local(ptr)

declare void @st_really_far_local(ptr, i32)

declare i32 @lw_sw_really_far_local(ptr, i32)

; Function Attrs: nounwind
define void @addi_fold_crash(i32 %arg) #0 {
bb:
  %tmp = alloca %struct.quux, align 4
  %tmp1 = getelementptr inbounds %struct.quux, ptr %tmp, i32 0, i32 1
  %tmp2 = getelementptr inbounds %struct.quux, ptr %tmp, i32 0, i32 1, i32 %arg
  %L1 = load <2 x i64>, ptr %tmp2, align 16
  store i8 0, ptr %tmp2, align 1
  %B = udiv <2 x i64> zeroinitializer, %L1
  call void @snork(ptr %tmp1)
  store <2 x i64> %B, ptr @G.1, align 16
  ret void
}

declare void @snork(ptr)

; Function Attrs: nounwind
declare i8 @disjoint_or_lb(ptr, i32) #0

; Function Attrs: nounwind
declare i32 @disjoint_or_lw(ptr, i32) #0

attributes #0 = { nounwind }

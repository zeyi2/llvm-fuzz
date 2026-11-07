; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zbs -O3 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global ptr poison
@G.2 = global i1 false
@G.3 = global i1 true

declare i64 @lwd(ptr)

declare i64 @lwud(ptr)

declare i64 @ldd(ptr)

declare i64 @lwd_0(ptr)

declare i64 @lwud_0(ptr)

declare i64 @ldd_0(ptr)

define void @swd(ptr %a, i32 %b, i32 %c) {
  %LGV = load i1, ptr @G.2, align 1
  %1 = getelementptr inbounds i32, ptr %a, i64 4
  store i32 %b, ptr %1, align 4
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  %2 = getelementptr i32, ptr %a, i64 5
  store i32 %c, ptr %2, align 4
  ret void

T:                                                ; preds = %T, %0
  %LGV1 = load i1, ptr @G.3, align 1
  br i1 %LGV1, label %BB, label %T

F:                                                ; preds = %0
  br label %BB
}

declare void @sdd(ptr, i64, i64)

declare void @swd_0(ptr, i32, i32)

declare void @sdd_0(ptr, i64, i64)

declare i64 @ld64(ptr)

declare i128 @ld128(ptr)

declare void @sd64(ptr, i64)

declare void @sd128(ptr, i128)

define i32 @lh(ptr %a) {
  %1 = getelementptr i16, ptr %a, i64 0
  %L = load i1, ptr %1, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %T
  %2 = load i16, ptr %1, align 4
  %3 = getelementptr i16, ptr %a, i64 1
  %4 = load i16, ptr %3, align 4
  %5 = sext i16 %2 to i32
  %6 = sext i16 %4 to i32
  %7 = add i32 %5, %6
  ret i32 %7

T:                                                ; preds = %0
  %B = frem double 4.940660e-324, +inf
  store double %B, ptr @G, align 8
  br label %BB

F:                                                ; preds = %0
  ret i32 1
}

define i32 @lb(ptr %a) {
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %1 = getelementptr i8, ptr %a, i64 0
  %G = getelementptr ptr, ptr %a, i128 1
  %2 = load i8, ptr %1, align 4
  %3 = getelementptr i8, ptr %a, i64 1
  %4 = load i8, ptr %3, align 4
  %5 = sext i8 %2 to i32
  %G1 = getelementptr <4 x float>, ptr %a, i32 %5
  %6 = sext i8 %4 to i32
  %7 = add i32 %5, %6
  store ptr %G, ptr @G.1, align 8
  store ptr %G1, ptr %A, align 8
  ret i32 %7
}

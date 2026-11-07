; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zbs -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global ptr poison
@G.2 = global i1 false
@G.3 = global i1 true
@G.4 = global i128 0

declare i64 @lwd(ptr)

declare i64 @lwud(ptr)

declare i64 @ldd(ptr)

declare i64 @lwd_0(ptr)

declare i64 @lwud_0(ptr)

declare i64 @ldd_0(ptr)

declare void @swd(ptr, i32, i32)

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
  %B1 = sdiv i128 18446744073709551616, -1
  store i128 %B1, ptr @G.4, align 4
  ret i32 1
}

declare i32 @lb(ptr)

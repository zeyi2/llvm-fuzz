; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zcb,+d -O2 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global ptr poison
@G.2 = global i1 false
@G.3 = global i1 true
@G.4 = global ptr poison
@G.5 = global i128 0
@G.6 = global i64 -1
@G.7 = global i8 127
@G.8 = global ptr poison

declare i64 @lwd(ptr)

declare i64 @lwud(ptr)

declare i64 @ldd(ptr)

declare i64 @lwd_0(ptr)

declare i64 @lwud_0(ptr)

declare i64 @ldd_0(ptr)

define void @swd(ptr %a, i32 %b, i32 %c) {
  %A5 = alloca i1, align 1
  store i1 poison, ptr %A5, align 1
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i1, ptr @G.2, align 1
  %1 = getelementptr inbounds i32, ptr %a, i64 4
  store i32 %b, ptr %1, align 4
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %BB1
  %LGV2 = load i8, ptr @G.7, align 1
  %2 = getelementptr i32, ptr %a, i64 5
  %G5 = getelementptr float, ptr %A5, i8 %LGV2
  store i32 %c, ptr %2, align 4
  %G = getelementptr <2 x i64>, ptr %2, i64 0
  %G3 = getelementptr ptr, ptr %1, i8 %LGV2
  store ptr %G, ptr @G.4, align 8
  store ptr %G3, ptr @G.8, align 8
  store ptr %G5, ptr %G, align 8
  ret void

T:                                                ; preds = %BB1, %0
  %LGV1 = load i1, ptr @G.3, align 1
  br i1 %LGV1, label %T2, label %F3

BB1:                                              ; preds = %F3, %T2
  br i1 %LGV1, label %BB, label %T

F:                                                ; preds = %0
  br label %BB

T2:                                               ; preds = %T
  %E = extractelement <2 x i64> splat (i64 9223372036854775807), i64 42
  store i64 %E, ptr poison, align 4
  br label %BB1

F3:                                               ; preds = %F3, %T
  %L = load i1, ptr %A, align 1
  %B = and i1 %L, false
  store i1 %B, ptr %A5, align 1
  br i1 %L, label %F3, label %BB1
}

declare void @sdd(ptr, i64, i64)

declare void @swd_0(ptr, i32, i32)

declare void @sdd_0(ptr, i64, i64)

declare i64 @ld64(ptr)

declare i128 @ld128(ptr)

declare void @sd64(ptr, i64)

declare void @sd128(ptr, i128)

define i32 @lh(ptr %a) {
  %G = getelementptr i16, ptr %a, i128 170141183460469231731687303715884105727
  %LGV = load i128, ptr @G.5, align 4
  %C = icmp sle i128 -1, %LGV
  %1 = getelementptr i16, ptr %G, i64 0
  %L = load i1, ptr %1, align 1
  store i1 %C, ptr %1, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %T
  %LGV2 = load i64, ptr @G.6, align 4
  %2 = load i16, ptr %1, align 4
  %3 = getelementptr i16, ptr %a, i64 1
  %4 = load i16, ptr %3, align 4
  %5 = sext i16 %2 to i32
  %6 = sext i16 %4 to i32
  %7 = add i32 %5, %6
  switch i64 %LGV2, label %SW_D [
    i64 1364752992285230527, label %SW_C
  ]

BB1:                                              ; preds = %SW_D
  ret i32 %7

T:                                                ; preds = %0
  %B = frem double 4.940660e-324, +inf
  store double %B, ptr @G, align 8
  br label %BB

F:                                                ; preds = %0
  ret i32 1

SW_D:                                             ; preds = %BB
  %C4 = fcmp une double +qnan, %B
  %B5 = and i1 %C4, %C4
  store i1 %B5, ptr @G.3, align 1
  br label %BB1

SW_C:                                             ; preds = %BB
  %G7 = getelementptr i1, ptr %a, i128 %LGV
  store ptr %G7, ptr @G.8, align 8
  ret i32 42
}

declare i32 @lb(ptr)

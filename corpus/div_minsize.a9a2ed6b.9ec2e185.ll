; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zhinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 65536
@G.1 = global i128 -1
@G.2 = global i256 1
@G.3 = global i32 0
@G.4 = global i32 -1
@G.5 = global i1 false
@G.6 = global i1 false
@G.7 = global i64 -9223372036854775808

; Function Attrs: minsize nounwind
define i32 @testsize1(i32 %x) #0 {
entry:
  %A5 = alloca i32, align 4
  store i32 poison, ptr %A5, align 4
  %LGV1 = load i1, ptr @G.5, align 1
  %A = alloca i32, align 4
  %L = load i32, ptr %A, align 4
  store i32 poison, ptr %A, align 4
  %LGV = load i32, ptr @G.3, align 4
  %B4 = sdiv i32 %x, %L
  %B1 = sub i32 %x, %x
  %div = sdiv i32 %x, 32
  %B = or i32 %div, %LGV
  store i32 %B, ptr @G, align 4
  store i32 %B4, ptr %A5, align 4
  br i1 %LGV1, label %T, label %F

BB:                                               ; preds = %F, %T
  store i32 %B1, ptr @G.4, align 4
  %B3 = or i32 %x, 0
  store i32 %B3, ptr %A, align 4
  ret i32 %div

T:                                                ; preds = %entry
  br label %BB

F:                                                ; preds = %entry
  br label %BB
}

; Function Attrs: minsize nounwind
define i32 @testsize2(i32 %x) #0 {
entry:
  %A10 = alloca i1, align 1
  store i1 false, ptr %A10, align 1
  %A8 = alloca i1, align 1
  store i1 true, ptr %A8, align 1
  %A1 = alloca i64, align 8
  store i64 4294967296, ptr %A1, align 4
  %A = alloca i32, align 4
  %L = load i64, ptr %A, align 4
  store i32 poison, ptr %A, align 4
  %C = icmp ne i32 %x, 0
  %L2 = load i64, ptr %A1, align 4
  switch i64 %L2, label %SW_D [
    i64 -2103925413841688276, label %SW_C
    i64 -8679507631513520330, label %SW_C3
    i64 6199813119389872069, label %SW_C4
    i64 3097257026486358760, label %SW_C5
    i64 -6668281971698262875, label %SW_C6
    i64 -9020526457315225868, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C6, %SW_C5, %SW_C4, %SW_C
  %div = sdiv i32 %x, 33
  %B = shl i32 %div, %div
  store i32 %B, ptr %A, align 4
  store i1 %C, ptr @G.6, align 1
  ret i32 %div

SW_D:                                             ; preds = %entry
  ret i32 1

SW_C:                                             ; preds = %entry
  br label %BB

SW_C3:                                            ; preds = %entry
  ret i32 %x

SW_C4:                                            ; preds = %SW_C4, %entry
  %L9 = load i1, ptr %A8, align 1
  br i1 %L9, label %SW_C4, label %BB

SW_C5:                                            ; preds = %entry
  br label %BB

SW_C6:                                            ; preds = %SW_C6, %entry
  %L11 = load i1, ptr %A10, align 1
  br i1 %L11, label %BB, label %SW_C6

SW_C7:                                            ; preds = %entry
  br label %BB
}

; Function Attrs: minsize nounwind
declare i32 @testsize3(i32) #0

; Function Attrs: minsize nounwind
declare i32 @testsize4(i32) #0

; Function Attrs: minsize nounwind
define i128 @i128_sdiv(i128 %arg0) #0 {
  %A11 = alloca i1, align 1
  store i1 false, ptr %A11, align 1
  %A8 = alloca i1, align 1
  store i1 true, ptr %A8, align 1
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV2 = load i64, ptr @G.7, align 4
  %LGV = load i32, ptr @G, align 4
  %div = sdiv i128 %arg0, 4
  %B = srem i64 0, %LGV2
  store i64 %B, ptr @G.7, align 4
  switch i32 %LGV, label %SW_D [
    i32 -1106861593, label %SW_C
  ]

BB:                                               ; preds = %SW_D
  ret i128 %div

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %LGV1 = load i128, ptr @G.1, align 4
  switch i128 %arg0, label %SW_D4 [
    i128 10954546683147358981, label %SW_C5
    i128 16949535107963193441, label %SW_C6
    i128 12343235796502925986, label %SW_C7
  ]

BB3:                                              ; preds = %SW_C7, %SW_C6, %SW_C5, %SW_D4
  ret i128 %LGV1

SW_D4:                                            ; preds = %SW_D4, %SW_C
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB3, label %SW_D4

SW_C5:                                            ; preds = %SW_C
  br label %BB3

SW_C6:                                            ; preds = %SW_C6, %SW_C
  %L9 = load i1, ptr %A8, align 1
  br i1 %L9, label %BB3, label %SW_C6

SW_C7:                                            ; preds = %SW_C7, %SW_C
  %LGV10 = load i1, ptr @G.5, align 1
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %BB3, label %SW_C7
}

; Function Attrs: minsize nounwind
define i256 @i256_sdiv(i256 %arg0) #0 {
  %C1 = icmp uge i256 %arg0, 0
  %A = alloca <8 x i1>, align 1
  store <8 x i1> poison, ptr %A, align 1
  %C = icmp sle <8 x i8> splat (i8 127), zeroinitializer
  %B = srem i256 %arg0, 340282366920938463463374607431768211456
  %div = sdiv i256 %arg0, 4
  store i256 %B, ptr @G.2, align 4
  store <8 x i1> %C, ptr %A, align 1
  store i1 %C1, ptr @G.6, align 1
  ret i256 %div
}

attributes #0 = { minsize nounwind }

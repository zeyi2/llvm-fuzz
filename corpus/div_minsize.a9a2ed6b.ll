; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zhinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 65536
@G.1 = global i128 -1
@G.2 = global i256 1
@G.3 = global i32 0
@G.4 = global i32 -1

; Function Attrs: minsize nounwind
define i32 @testsize1(i32 %x) #0 {
entry:
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV = load i32, ptr @G.3, align 4
  %B1 = sub i32 %x, %x
  %div = sdiv i32 %x, 32
  %B = or i32 %div, %LGV
  store i32 %B, ptr @G, align 4
  store i32 %B1, ptr @G.4, align 4
  %B3 = or i32 %x, 0
  store i32 %B3, ptr %A, align 4
  ret i32 %div
}

; Function Attrs: minsize nounwind
define i32 @testsize2(i32 %x) #0 {
entry:
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %div = sdiv i32 %x, 33
  %B = shl i32 %div, %div
  store i32 %B, ptr %A, align 4
  ret i32 %div
}

; Function Attrs: minsize nounwind
declare i32 @testsize3(i32) #0

; Function Attrs: minsize nounwind
declare i32 @testsize4(i32) #0

; Function Attrs: minsize nounwind
define i128 @i128_sdiv(i128 %arg0) #0 {
  %LGV = load i32, ptr @G, align 4
  %div = sdiv i128 %arg0, 4
  switch i32 %LGV, label %SW_D [
    i32 -1106861593, label %SW_C
  ]

BB:                                               ; preds = %SW_D
  ret i128 %div

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %LGV1 = load i128, ptr @G.1, align 4
  ret i128 %LGV1
}

; Function Attrs: minsize nounwind
define i256 @i256_sdiv(i256 %arg0) #0 {
  %B = srem i256 %arg0, 340282366920938463463374607431768211456
  %div = sdiv i256 %arg0, 4
  store i256 %B, ptr @G.2, align 4
  ret i256 %div
}

attributes #0 = { minsize nounwind }

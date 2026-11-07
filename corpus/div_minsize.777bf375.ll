; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m,+zdinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i256 0
@G.2 = global i32 65536
@G.3 = global i16 42
@G.4 = global i16 32767

; Function Attrs: minsize nounwind
define i32 @testsize1(i32 %x) #0 {
entry:
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %div = sdiv i32 %x, 32
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %T
  ret i32 %div

T:                                                ; preds = %entry
  br label %BB

F:                                                ; preds = %entry
  ret i32 %x
}

; Function Attrs: minsize nounwind
declare i32 @testsize2(i32) #0

; Function Attrs: minsize nounwind
define i32 @testsize3(i32 %x) #0 {
entry:
  %LGV = load i16, ptr @G.3, align 2
  %B1 = or i16 1, %LGV
  %div = udiv i32 %x, 32
  %C = icmp sge i32 %div, 0
  %B = udiv i32 %x, %x
  store i1 %C, ptr @G, align 1
  store i32 %B, ptr @G.2, align 4
  store i16 %B1, ptr @G.4, align 2
  ret i32 %div
}

; Function Attrs: minsize nounwind
declare i32 @testsize4(i32) #0

; Function Attrs: minsize nounwind
define i128 @i128_sdiv(i128 %arg0) #0 {
  %A = alloca i128, align 8
  store i128 poison, ptr %A, align 4
  %B = srem i128 %arg0, 42
  %div = sdiv i128 %arg0, 4
  store i128 %B, ptr %A, align 4
  ret i128 %div
}

; Function Attrs: minsize nounwind
define i256 @i256_sdiv(i256 %arg0) #0 {
  %B = xor i256 %arg0, %arg0
  %div = sdiv i256 %arg0, 4
  store i256 %B, ptr @G.1, align 4
  ret i256 %div
}

attributes #0 = { minsize nounwind }

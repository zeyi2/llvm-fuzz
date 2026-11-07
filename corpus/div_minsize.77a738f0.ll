; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m,+zdinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 1

; Function Attrs: minsize nounwind
declare i32 @testsize1(i32) #0

; Function Attrs: minsize nounwind
declare i32 @testsize2(i32) #0

; Function Attrs: minsize nounwind
declare i32 @testsize3(i32) #0

; Function Attrs: minsize nounwind
define i32 @testsize4(i32 %x) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i32, ptr @G, align 4
  %div = udiv i32 %x, 33
  %C = icmp sle i32 %div, %LGV
  store i1 %C, ptr %A, align 1
  ret i32 %div
}

; Function Attrs: minsize nounwind
declare i128 @i128_sdiv(i128) #0

; Function Attrs: minsize nounwind
define i256 @i256_sdiv(i256 %arg0) #0 {
  %div = sdiv i256 %arg0, 4
  %B = or i8 127, 1
  store i8 %B, ptr poison, align 1
  ret i256 %div
}

attributes #0 = { minsize nounwind }

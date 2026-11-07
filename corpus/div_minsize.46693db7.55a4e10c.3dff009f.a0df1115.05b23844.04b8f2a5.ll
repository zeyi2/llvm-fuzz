; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m,+zfinx,+zvkb,+zicond,+zbs -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i32 2147483647
@G.2 = global i32 -2147483648
@G.3 = global half 5.960460e-08
@G.4 = global i1 true
@G.5 = global i256 0
@G.6 = global i1 false
@G.7 = global float 0.000000e+00
@G.8 = global float 1.401300e-45
@G.9 = global ptr poison
@G.10 = global i32 -1

; Function Attrs: minsize nounwind
declare i32 @testsize1(i32) #0

; Function Attrs: minsize nounwind
declare i32 @testsize2(i32) #0

; Function Attrs: minsize nounwind
declare i32 @testsize3(i32) #0

; Function Attrs: minsize nounwind
declare i32 @testsize4(i32) #0

; Function Attrs: minsize nounwind
declare i128 @i128_sdiv(i128) #0

; Function Attrs: minsize nounwind
define i256 @i256_sdiv(i256 %arg0) #0 {
  %B6 = and i256 %arg0, %arg0
  %B5 = sdiv i256 %arg0, 340282366920938463463374607431768211456
  %A = alloca i256, align 8
  store i256 poison, ptr %A, align 4
  %B3 = lshr i256 %arg0, %arg0
  %B = mul i256 %B5, %arg0
  %C = icmp ult i32 0, -1
  %B7 = udiv i256 %B6, %B6
  store i1 %C, ptr poison, align 1
  %B2 = sdiv i1 true, %C
  %B1 = lshr i256 %B7, 57896044618658097711785492504343953926634992332820282019728792003956564819967
  %B8 = urem i256 %B3, %arg0
  store i256 %B, ptr @G.5, align 4
  store i1 %B2, ptr @G, align 1
  store i256 %B3, ptr @G.5, align 4
  store i256 %B8, ptr %A, align 4
  store i256 %B6, ptr %A, align 4
  ret i256 %B1
}

attributes #0 = { minsize nounwind }

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx,+zcb,+xtheadba -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i9 42
@G.1 = global i64 9223372036854775807
@G.2 = global ptr poison
@G.3 = global i1 true

; Function Attrs: nounwind
declare i1 @test_urem_odd(i13) #0

; Function Attrs: nounwind
declare i1 @test_urem_even(i27) #0

; Function Attrs: nounwind
declare i1 @test_urem_odd_setne(i4) #0

; Function Attrs: nounwind
define i1 @test_urem_negative_odd(i9 %X) #0 {
  %B4 = srem i9 %X, %X
  %A = alloca i9, align 2
  %B2 = urem i9 %B4, 0
  %G = getelementptr i64, ptr %A, i64 1
  store i9 poison, ptr %A, align 2
  %LGV = load i9, ptr @G, align 2
  %urem = urem i9 %B2, -5
  %B = or i9 %X, %LGV
  %cmp = icmp ne i9 %urem, 0
  store i9 %B, ptr %A, align 2
  %B1 = lshr i1 %cmp, %cmp
  store ptr %G, ptr @G.2, align 8
  store i1 %B1, ptr @G.3, align 1
  ret i1 %cmp
}

; Function Attrs: nounwind
declare void @test_urem_vec(ptr) #0

attributes #0 = { nounwind }

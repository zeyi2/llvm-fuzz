; isel-diff-config: -mtriple=riscv32 -mattr=+zfinx -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 170141183460469231731687303715884105727
@G.1 = global i128 -170141183460469231731687303715884105728
@G.2 = global i1 false
@G.3 = global i13 -1

; Function Attrs: nounwind
define i1 @test_urem_odd(i13 %X) #0 {
  %B = sdiv i13 %X, %X
  %urem = urem i13 %X, 5
  %cmp = icmp eq i13 %urem, 0
  store i13 %B, ptr @G.3, align 2
  ret i1 %cmp
}

; Function Attrs: nounwind
declare i1 @test_urem_even(i27) #0

; Function Attrs: nounwind
define i1 @test_urem_odd_setne(i4 %X) #0 {
  %LGV = load i128, ptr @G, align 4
  %B = lshr i128 18446744073709551616, %LGV
  %urem = urem i4 %X, 5
  %cmp = icmp ne i4 %urem, 0
  store i128 %B, ptr @G.1, align 4
  ret i1 %cmp
}

; Function Attrs: nounwind
define i1 @test_urem_negative_odd(i9 %X) #0 {
  %urem = urem i9 %X, -5
  %B = sub i9 %X, 0
  %cmp = icmp ne i9 %urem, 0
  %C = icmp ult i9 %urem, %B
  store i1 %C, ptr @G.2, align 1
  ret i1 %cmp
}

; Function Attrs: nounwind
declare void @test_urem_vec(ptr) #0

attributes #0 = { nounwind }

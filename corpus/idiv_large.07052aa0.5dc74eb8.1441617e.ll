; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i128 0
@G.2 = global i64 -9223372036854775808
@G.3 = global <4 x i32> splat (i32 -1)
@G.4 = global <4 x i32> splat (i32 -1)
@G.5 = global i32 2147483647
@G.6 = global i32 -2147483648
@G.7 = global i1 true
@G.8 = global i64 9223372036854775807

; Function Attrs: nounwind
define i64 @udiv_i64(i64 %x, i64 %y) #0 {
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %res = udiv i64 %x, %y
  %B1 = xor i64 %x, %x
  %C = icmp sgt i64 %y, %y
  store i1 %C, ptr @G, align 1
  %B = udiv i64 %x, -1
  store i64 %B, ptr %A, align 4
  store i64 %B1, ptr @G.8, align 4
  ret i64 %res
}

; Function Attrs: nounwind
declare i65 @udiv_i65(i65, i65) #0

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %B = lshr i129 %y, 0
  %C = icmp uge i129 %x, %y
  %res = udiv i129 %B, %y
  store i1 %C, ptr @G, align 1
  store i1 %C, ptr @G, align 1
  ret i129 %res
}

attributes #0 = { nounwind }

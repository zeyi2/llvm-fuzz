; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx,+zbkb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i128 0
@G.2 = global i129 42

; Function Attrs: nounwind
declare i64 @udiv_i64(i64, i64) #0

; Function Attrs: nounwind
declare i65 @udiv_i65(i65, i65) #0

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %C1 = icmp ne i129 %x, %x
  %C = icmp uge i129 %x, %y
  %B1 = udiv exact i129 %x, 0
  %res = udiv i129 %x, %y
  %B = lshr i129 %x, %B1
  store i1 %C, ptr @G, align 1
  store i129 %B, ptr @G.2, align 4
  store i1 %C1, ptr poison, align 1
  ret i129 %res
}

attributes #0 = { nounwind }

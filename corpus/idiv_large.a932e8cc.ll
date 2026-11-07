; isel-diff-config: -mtriple=riscv32 -mattr=+zhinx -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i129 0
@G.1 = global i128 0
@G.2 = global i64 42

; Function Attrs: nounwind
define i64 @udiv_i64(i64 %x, i64 %y) #0 {
  %B = xor i64 %y, %x
  %res = udiv i64 %x, %y
  store i64 %B, ptr @G.2, align 4
  ret i64 %res
}

; Function Attrs: nounwind
declare i65 @udiv_i65(i65, i65) #0

; Function Attrs: nounwind
define i128 @udiv_i128(i128 %x, i128 %y) #0 {
  %LGV = load i128, ptr @G.1, align 4
  %C = icmp ugt i128 %y, %LGV
  %res = udiv i128 %x, %y
  store i1 %C, ptr poison, align 1
  ret i128 %res
}

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %LGV = load i129, ptr @G, align 4
  %C = icmp ule i129 %y, %LGV
  %res = udiv i129 %x, %y
  store i1 %C, ptr poison, align 1
  ret i129 %res
}

attributes #0 = { nounwind }

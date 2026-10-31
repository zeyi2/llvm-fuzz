; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx,+zicsr -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i129 -340282366920938463463374607431768211456
@G.2 = global i64 0
@G.3 = global i1 false

; Function Attrs: nounwind
declare i64 @udiv_i64(i64, i64) #0

; Function Attrs: nounwind
define i65 @udiv_i65(i65 %x, i65 %y) #0 {
  %LGV1 = load i64, ptr @G.2, align 4
  %C = icmp slt i64 -9223372036854775808, %LGV1
  %B = srem i65 %x, %y
  %res = udiv i65 %x, %B
  store i1 %C, ptr @G.3, align 1
  ret i65 %res
}

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %LGV = load i129, ptr @G.1, align 4
  %C2 = fcmp ule double 1.000000e+00, 4.200000e+01
  %res = udiv exact i129 %x, %y
  store i1 %C2, ptr @G, align 1
  %B1 = srem i129 %res, %LGV
  ret i129 %B1
}

attributes #0 = { nounwind }

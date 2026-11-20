; isel-diff-config: -mtriple=riscv32 -mattr=+zvbb,+zhinx -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global double 4.200000e+01
@G.2 = global i65 0
@G.3 = global i1 false
@G.4 = global i1 false

; Function Attrs: nounwind
declare i64 @udiv_i64(i64, i64) #0

; Function Attrs: nounwind
define i65 @udiv_i65(i65 %x, i65 %y) #0 {
  %LGV = load i65, ptr @G.2, align 4
  %C = icmp sgt i65 %y, %LGV
  %B = srem i1 %C, false
  %res = udiv i65 %x, %y
  store i1 %C, ptr @G.3, align 1
  store i1 %B, ptr @G.4, align 1
  ret i65 %res
}

; Function Attrs: nounwind
define i128 @udiv_i128(i128 %x, i128 %y) #0 {
  %A = alloca double, align 8
  store double poison, ptr %A, align 8
  %LGV = load double, ptr @G.1, align 8
  %res = udiv i128 %x, %y
  %B = fsub double %LGV, +qnan
  store double %B, ptr %A, align 8
  ret i128 %res
}

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %res = udiv i129 %x, %y
  %C = icmp uge i129 %res, %res
  store i1 %C, ptr @G, align 1
  ret i129 %res
}

attributes #0 = { nounwind }

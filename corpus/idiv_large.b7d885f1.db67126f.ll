; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx,+zicsr,+zba -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i65 1
@G.2 = global i129 -340282366920938463463374607431768211456

; Function Attrs: nounwind
define i64 @udiv_i64(i64 %x, i64 %y) #0 {
  %A = alloca i1, align 1
  %L = load i64, ptr %A, align 4
  %B = sub i64 %x, %L
  store i1 poison, ptr %A, align 1
  %res = udiv i64 %x, %y
  %G = getelementptr <4 x i32>, ptr %A, i64 %res
  %C = icmp ugt i64 %res, 9223372036854775807
  store i1 %C, ptr %A, align 1
  store ptr %G, ptr poison, align 8
  store i64 %B, ptr %G, align 4
  ret i64 %res
}

; Function Attrs: nounwind
define i65 @udiv_i65(i65 %x, i65 %y) #0 {
  %B1 = or i65 %y, 42
  %LGV = load i65, ptr @G.1, align 4
  %B = srem i65 %x, %y
  %res = udiv i65 %x, %B
  %C = icmp sle i65 %B, %LGV
  store i1 %C, ptr poison, align 1
  store i65 %B1, ptr @G.1, align 4
  ret i65 %res
}

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %LGV = load i129, ptr @G.2, align 4
  %B = ashr i129 %x, %x
  %B1 = xor i129 %x, %B
  %C = icmp uge i129 %x, %B
  store i1 %C, ptr @G, align 1
  store i129 %B1, ptr poison, align 4
  %B2 = srem i129 %B1, %LGV
  ret i129 %B2
}

attributes #0 = { nounwind }

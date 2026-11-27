; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx,+zbkb,+zba -O0 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 -9223372036854775808
@G.1 = global i64 1
@G.2 = global <2 x i64> splat (i64 4294967296)
@G.3 = global i65 42
@G.4 = global i1 false
@G.5 = global i128 18446744073709551616
@G.6 = global i64 4294967296
@G.7 = global i129 340282366920938463463374607431768211455
@G.8 = global half +qnan
@G.9 = global i129 -340282366920938463463374607431768211456
@G.10 = global i128 1
@G.11 = global <8 x i8> splat (i8 1)

; Function Attrs: nounwind
declare i64 @udiv_i64(i64, i64) #0

; Function Attrs: nounwind
declare i65 @udiv_i65(i65, i65) #0

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %B = or i129 %x, %y
  store i129 %B, ptr poison, align 4
  %B1 = srem i129 %y, %x
  %A = alloca i1, align 1
  %B3 = mul i129 %y, %y
  store i129 %B1, ptr poison, align 4
  store i1 poison, ptr %A, align 1
  %LGV4 = load i128, ptr @G.10, align 4
  store i129 %B3, ptr @G.9, align 4
  %LGV = load half, ptr @G.8, align 2
  %B5 = urem i128 0, %LGV4
  %A6 = alloca i128, align 8
  %C = fcmp uno half 1.000000e+00, %LGV
  %res = udiv i129 %x, %y
  %L = load <8 x i8>, ptr %A6, align 8
  %B10 = urem i129 %B1, 42
  %B2 = mul i129 %y, %res
  store i128 %B5, ptr %A6, align 4
  store i128 poison, ptr %A6, align 4
  store i129 %B2, ptr @G.7, align 4
  store i1 %C, ptr %A, align 1
  %B8 = xor <8 x i8> %L, splat (i8 42)
  store <8 x i8> %B8, ptr @G.11, align 8
  store i129 %B10, ptr @G.9, align 4
  ret i129 %res
}

attributes #0 = { nounwind }

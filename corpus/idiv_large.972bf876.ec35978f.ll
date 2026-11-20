; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half 1.000000e+00
@G.1 = global half 1.000000e+00
@G.2 = global i129 0
@G.3 = global i129 -340282366920938463463374607431768211456
@G.4 = global i64 42
@G.5 = global <4 x i32> splat (i32 -2147483648)

; Function Attrs: nounwind
define i64 @udiv_i64(i64 %x, i64 %y) #0 {
  %A7 = alloca i64, align 8
  store i64 poison, ptr %A7, align 4
  %LGV2 = load i64, ptr @G.4, align 4
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load half, ptr @G.1, align 2
  %B5 = or i64 %y, %x
  %LGV = load half, ptr @G, align 2
  %B = ashr i64 %x, %LGV2
  %B6 = urem i64 %B, %B5
  %res = udiv i64 %x, %y
  %C = fcmp olt half %LGV, %LGV1
  store i1 %C, ptr %A, align 1
  %B3 = udiv i64 %B, 42
  store i64 %B, ptr @G.4, align 4
  store i64 %B3, ptr poison, align 4
  store i64 %B5, ptr @G.4, align 4
  store i64 %B6, ptr %A7, align 4
  ret i64 %res
}

; Function Attrs: nounwind
define i65 @udiv_i65(i65 %x, i65 %y) #0 {
  %res = udiv i65 %x, %y
  %B = shl i65 %res, -1
  %B1 = sub <4 x i32> splat (i32 2147483647), zeroinitializer
  store <4 x i32> %B1, ptr @G.5, align 16
  ret i65 %B
}

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %B2 = add i129 %x, 0
  %B = or i129 %y, %y
  %res = udiv i129 %x, %y
  store i129 %B, ptr @G.2, align 4
  %B3 = mul i129 %x, -340282366920938463463374607431768211456
  store i129 %B2, ptr @G.3, align 4
  store i129 %B3, ptr poison, align 4
  ret i129 %res
}

attributes #0 = { nounwind }

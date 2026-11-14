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
@G.8 = global i128 -170141183460469231731687303715884105728
@G.9 = global i129 340282366920938463463374607431768211455

; Function Attrs: nounwind
define i64 @udiv_i64(i64 %x, i64 %y) #0 {
  %C = icmp sgt i64 %y, %y
  %A = alloca i64, align 8
  %B = udiv i64 %x, -1
  %res = udiv i64 %x, %y
  store i1 %C, ptr @G, align 1
  store i64 poison, ptr %A, align 4
  %G = getelementptr i64, ptr %A, i64 0
  store i64 %B, ptr %G, align 4
  ret i64 %res
}

; Function Attrs: nounwind
declare i65 @udiv_i65(i65, i65) #0

; Function Attrs: nounwind
define i128 @udiv_i128(i128 %x, i128 %y) #0 {
  %LGV1 = load i128, ptr @G.8, align 4
  %LGV2 = load i32, ptr @G.5, align 4
  %LGV = load <4 x i32>, ptr @G.3, align 16
  %B3 = and i32 0, %LGV2
  %C = icmp ugt i32 %LGV2, %LGV2
  %B1 = or <4 x i32> splat (i32 -1), %LGV
  %E = extractelement <2 x i64> zeroinitializer, i16 0
  %B = urem i128 %x, %x
  %C2 = icmp uge i128 %x, %LGV1
  %res = udiv i128 %x, %y
  store i128 %B, ptr @G.1, align 4
  store i64 %E, ptr @G.2, align 4
  store <4 x i32> %B1, ptr @G.4, align 16
  store i32 %B3, ptr @G.6, align 4
  store i1 %C, ptr @G.7, align 1
  store i1 %C2, ptr poison, align 1
  ret i128 %res
}

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %B4 = or i129 %y, 18446744073709551616
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load i129, ptr @G.9, align 4
  %C = icmp uge i129 %x, %y
  %res = udiv i129 %x, %y
  %C3 = icmp ne i129 %x, %LGV1
  store i1 %C, ptr @G, align 1
  %B2 = and i129 %y, %LGV1
  %B = sub i129 %res, 1
  store i1 %C, ptr @G, align 1
  store i129 %B2, ptr poison, align 4
  store i1 %C3, ptr %A, align 1
  store i129 %B4, ptr @G.9, align 4
  ret i129 %B
}

attributes #0 = { nounwind }

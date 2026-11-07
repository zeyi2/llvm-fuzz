; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx,+zicsr,+zba -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i65 1
@G.2 = global i129 -340282366920938463463374607431768211456
@G.3 = global i16 32767
@G.4 = global i129 1
@G.5 = global i64 -9223372036854775808
@G.6 = global i129 340282366920938463463374607431768211455

; Function Attrs: nounwind
define i64 @udiv_i64(i64 %x, i64 %y) #0 {
  %A8 = alloca i1, align 1
  store i1 false, ptr %A8, align 1
  %A6 = alloca i128, align 8
  store i128 18446744073709551616, ptr %A6, align 4
  %A4 = alloca i1, align 1
  %L1 = load i64, ptr %A4, align 4
  %C2 = icmp ule i64 %x, %L1
  store i1 poison, ptr %A4, align 1
  %LGV = load i16, ptr @G.3, align 2
  %A = alloca i1, align 1
  %L = load i64, ptr %A, align 4
  %B = sub i64 %x, %L
  store i1 poison, ptr %A, align 1
  %res = udiv i64 %x, %y
  %G = getelementptr <4 x i32>, ptr %A, i64 %res
  %L2 = load i16, ptr %G, align 2
  %C = icmp ugt i64 %res, 9223372036854775807
  %B4 = srem i64 %y, 9223372036854775807
  store i1 %C, ptr %A, align 1
  %C3 = icmp sgt i16 %LGV, %L2
  store ptr %G, ptr poison, align 8
  store i64 %B, ptr %G, align 4
  %L7 = load i128, ptr %A6, align 4
  switch i128 %L7, label %SW_D [
    i128 13436816834908381174, label %SW_C
  ]

BB:                                               ; preds = %SW_C, %SW_D
  %B1 = sdiv i64 %B, %y
  store i1 %C3, ptr %A4, align 1
  store i1 %C2, ptr @G, align 1
  store i64 %B4, ptr @G.5, align 4
  store i64 %B1, ptr %A8, align 4
  ret i64 %res

SW_D:                                             ; preds = %SW_D, %0
  %L9 = load i1, ptr %A8, align 1
  br i1 %L9, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare i65 @udiv_i65(i65, i65) #0

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %B5 = add i129 %y, 0
  %LGV = load i129, ptr @G.2, align 4
  %A4 = alloca i129, align 8
  %B3 = lshr i129 %y, %y
  %B = ashr i129 %x, %x
  %LGV6 = load i129, ptr @G.6, align 4
  store i129 poison, ptr %A4, align 4
  %B1 = xor i129 %x, %B
  %B4 = udiv i129 %LGV, %B3
  store i129 %B4, ptr @G.4, align 4
  store i129 %B1, ptr poison, align 4
  %A = alloca i129, align 8
  store i129 %B5, ptr %A, align 4
  %C = icmp uge i129 %x, %B
  %B2 = srem i129 %B1, %LGV
  store i129 poison, ptr %A, align 4
  %B7 = mul i129 %y, %LGV6
  store i129 %LGV, ptr %A4, align 4
  store i1 %C, ptr @G, align 1
  store i129 %B7, ptr %A, align 4
  ret i129 %B2
}

attributes #0 = { nounwind }

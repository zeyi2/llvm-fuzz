; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx,+zicsr,+zba -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i16 0
@G.2 = global i65 18446744073709551615
@G.3 = global i129 1
@G.4 = global i8 0

; Function Attrs: nounwind
define i64 @udiv_i64(i64 %x, i64 %y) #0 {
  %B = and i8 1, 16
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %res = udiv i64 %x, %y
  %C = icmp ugt i64 %res, 9223372036854775807
  store i1 %C, ptr %A, align 1
  %G = getelementptr <4 x i32>, ptr %A, i64 %res
  store ptr %G, ptr poison, align 8
  store i8 %B, ptr %G, align 1
  ret i64 %res
}

; Function Attrs: nounwind
define i65 @udiv_i65(i65 %x, i65 %y) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i16, ptr @G.1, align 2
  switch i16 %LGV, label %SW_D [
    i16 -8879, label %SW_C
    i16 17013, label %SW_C1
    i16 -12062, label %SW_C2
    i16 22962, label %SW_C3
  ]

BB:                                               ; preds = %SW_C3, %SW_C1, %SW_C, %SW_D
  %B = srem i65 %x, %y
  %res = udiv i65 %x, %B
  ret i65 %res

SW_D:                                             ; preds = %SW_D, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  %C = icmp eq i16 %LGV, -1
  store i1 %C, ptr poison, align 1
  br label %BB

SW_C1:                                            ; preds = %0
  %LGV7 = load i8, ptr @G.4, align 1
  %B8 = or i8 -1, %LGV7
  store i8 %B8, ptr %A, align 1
  br label %BB

SW_C2:                                            ; preds = %0
  %B5 = fmul bfloat +qnan, 0.000000e+00
  %LGV4 = load i65, ptr @G.2, align 4
  store bfloat %B5, ptr poison, align 2
  ret i65 %LGV4

SW_C3:                                            ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %B1 = xor i129 %y, -1
  %B = ashr i129 %x, %x
  %C = icmp uge i129 %x, %B
  %res = udiv exact i129 %x, %y
  store i1 %C, ptr @G, align 1
  store i129 %B1, ptr @G.3, align 4
  ret i129 %res
}

attributes #0 = { nounwind }

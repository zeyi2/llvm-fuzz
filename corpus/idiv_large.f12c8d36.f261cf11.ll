; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zdinx -O1 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i65 18446744073709551615
@G.1 = global <2 x i64> splat (i64 4294967296)
@G.2 = global i1 true
@G.3 = global i64 4294967296
@G.4 = global i1 false
@G.5 = global i8 -1
@G.6 = global i8 0

; Function Attrs: nounwind
define i64 @udiv_i64(i64 %x, i64 %y) #0 {
  %LGV = load i1, ptr @G.2, align 1
  %B3 = udiv i64 %y, %x
  %B = lshr <2 x i64> splat (i64 1), splat (i64 4294967296)
  %B4 = xor i8 127, 1
  store <2 x i64> %B, ptr @G.1, align 16
  store i8 %B4, ptr @G.5, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %T
  %C = icmp eq i64 %B3, -1
  store i1 %C, ptr poison, align 1
  ret i64 %B3

T:                                                ; preds = %0
  %LGV5 = load i8, ptr @G.6, align 1
  %B6 = add i8 42, %LGV5
  store i8 %B6, ptr poison, align 1
  br label %BB

F:                                                ; preds = %0
  %LGV1 = load i64, ptr @G.3, align 4
  ret i64 %LGV1
}

; Function Attrs: nounwind
define i65 @udiv_i65(i65 %x, i65 %y) #0 {
  %LGV = load i65, ptr @G, align 4
  %B = sdiv i65 %y, %LGV
  %C = icmp ule i65 %B, %x
  store i1 %C, ptr @G.2, align 1
  %B1 = lshr i1 %C, true
  store i1 %B1, ptr @G.4, align 1
  ret i65 %B
}

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %B1 = shl i129 %x, 1
  %A = alloca i129, align 8
  store i129 poison, ptr %A, align 4
  %res = udiv i129 %x, %y
  store i129 %B1, ptr %A, align 4
  ret i129 %res
}

attributes #0 = { nounwind }

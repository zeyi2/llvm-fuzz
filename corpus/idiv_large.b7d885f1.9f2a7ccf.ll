; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx,+zicsr -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i1 true
@G.2 = global <2 x i64> splat (i64 1)
@G.3 = global i64 9223372036854775807

; Function Attrs: nounwind
define i64 @udiv_i64(i64 %x, i64 %y) #0 {
  %LGV = load i64, ptr @G.3, align 4
  %A = alloca i1, align 1
  %B = shl i64 %y, %LGV
  store i1 poison, ptr %A, align 1
  %res = udiv i64 %x, %y
  %C = icmp ugt i64 %res, 9223372036854775807
  %C1 = icmp sge i64 %x, %res
  %G = getelementptr <4 x i32>, ptr %A, i64 %res
  store i64 %B, ptr %G, align 4
  store i1 %C, ptr %A, align 1
  store i1 %C1, ptr @G.1, align 1
  store ptr %G, ptr poison, align 8
  ret i64 %res
}

; Function Attrs: nounwind
define i65 @udiv_i65(i65 %x, i65 %y) #0 {
  %LGV = load <2 x i64>, ptr @G.2, align 16
  %B1 = sdiv <2 x i64> %LGV, splat (i64 -1)
  %B = srem i65 %x, %y
  %res = udiv i65 %x, %B
  store <2 x i64> %B1, ptr @G.2, align 16
  %C = fcmp uge float f0x7F7FFFFF, 0.000000e+00
  store i1 %C, ptr @G, align 1
  ret i65 %res
}

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %B = ashr i129 %x, %x
  %C = icmp uge i129 %x, %B
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %res = udiv exact i129 %x, %y
  store i1 %C, ptr @G, align 1
  ret i129 %res

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

attributes #0 = { nounwind }

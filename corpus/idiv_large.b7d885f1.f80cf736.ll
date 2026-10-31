; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx,+zicsr -O0 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i64 0
@G.2 = global i1 false
@G.3 = global <4 x i32> splat (i32 42)

; Function Attrs: nounwind
define i64 @udiv_i64(i64 %x, i64 %y) #0 {
  %LGV = load i64, ptr @G.1, align 4
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %res = udiv i64 %x, %y
  %G = getelementptr <4 x i32>, ptr %A, i64 %res
  %C = icmp ule i64 %res, 9223372036854775807
  store i1 %C, ptr %A, align 1
  store ptr %G, ptr poison, align 8
  %C1 = icmp ult i64 %y, %LGV
  store i1 %C1, ptr @G.2, align 1
  ret i64 %res
}

; Function Attrs: nounwind
define i65 @udiv_i65(i65 %x, i65 %y) #0 {
  %B1 = ashr i65 %x, 0
  ret i65 %B1
}

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %LGV = load <4 x i32>, ptr @G.3, align 16
  %S = shufflevector <4 x i32> splat (i32 -1), <4 x i32> %LGV, <4 x i32> poison
  %B = ashr i129 %x, %x
  %C = icmp uge i129 %x, %B
  %res = udiv exact i129 %x, %y
  store i1 %C, ptr @G, align 1
  store <4 x i32> %S, ptr poison, align 16
  ret i129 %res
}

attributes #0 = { nounwind }

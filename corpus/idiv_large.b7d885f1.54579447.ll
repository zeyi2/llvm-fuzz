; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx,+zicsr -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i128 0
@G.2 = global i128 18446744073709551616
@G.3 = global i128 -1
@G.4 = global float +inf
@G.5 = global float 0.000000e+00
@G.6 = global float f0x7F7FFFFF
@G.7 = global i129 -340282366920938463463374607431768211456

; Function Attrs: nounwind
define i64 @udiv_i64(i64 %x, i64 %y) #0 {
  %A = alloca i1, align 1
  %L = load i1, ptr %A, align 1
  %L1 = load i8, ptr %A, align 1
  store i1 poison, ptr %A, align 1
  %C2 = icmp sgt i8 1, %L1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %res = udiv i64 %x, %y
  %G = getelementptr <4 x i32>, ptr %A, i64 %res
  store i1 %C2, ptr %A, align 1
  store ptr %G, ptr poison, align 8
  ret i64 %res

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  br i1 %C2, label %F, label %BB
}

; Function Attrs: nounwind
define i65 @udiv_i65(i65 %x, i65 %y) #0 {
  %B1 = and i65 %y, 4294967296
  %B = srem i65 %x, %y
  %res = udiv i65 %x, %B
  store i65 %B1, ptr poison, align 4
  %B2 = ashr i128 1, 18446744073709551616
  store i128 %B2, ptr @G.3, align 4
  ret i65 %res
}

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %LGV6 = load i129, ptr @G.7, align 4
  %C7 = icmp sge i129 %y, %LGV6
  %I = insertelement <2 x i64> zeroinitializer, i64 -1, i129 %y
  %LGV3 = load float, ptr @G.5, align 4
  %LGV2 = load float, ptr @G.4, align 4
  %LGV = load i128, ptr @G.1, align 4
  %B1 = sdiv i128 %LGV, 0
  %B4 = fadd float %LGV2, %LGV3
  %B = ashr i129 %x, %x
  %C = icmp uge i129 %x, %B
  %res = udiv exact i129 %x, %y
  store i1 %C, ptr @G, align 1
  store i128 %B1, ptr @G.2, align 4
  store float %B4, ptr @G.6, align 4
  store <2 x i64> %I, ptr poison, align 16
  store i1 %C7, ptr poison, align 1
  ret i129 %res
}

attributes #0 = { nounwind }

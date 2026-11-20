; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx,+zhinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half 1.000000e+00
@G.1 = global half 1.000000e+00
@G.2 = global i129 0
@G.3 = global i64 1
@G.4 = global i1 false
@G.5 = global i64 0
@G.6 = global <4 x i32> zeroinitializer
@G.7 = global <4 x i32> splat (i32 1)

; Function Attrs: nounwind
define i64 @udiv_i64(i64 %x, i64 %y) #0 {
  %LGV2 = load i64, ptr @G.3, align 4
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load half, ptr @G.1, align 2
  %LGV = load half, ptr @G, align 2
  %res = udiv i64 %x, %y
  %B = urem i64 %y, %LGV2
  %C = fcmp olt half %LGV, %LGV1
  %C3 = icmp ugt i64 %x, %LGV2
  store i1 %C, ptr %A, align 1
  store i1 %C3, ptr @G.4, align 1
  store i64 %B, ptr @G.5, align 4
  ret i64 %res
}

; Function Attrs: nounwind
define i65 @udiv_i65(i65 %x, i65 %y) #0 {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV1 = load <4 x i32>, ptr @G.7, align 16
  %B2 = ashr i65 %y, %x
  %LGV = load <4 x i32>, ptr @G.6, align 16
  %C = icmp ne <4 x i32> %LGV, %LGV1
  %B = shl i65 %B2, -1
  store <4 x i1> %C, ptr %A, align 1
  ret i65 %B
}

; Function Attrs: nounwind
declare i128 @udiv_i128(i128, i128) #0

; Function Attrs: nounwind
define i129 @udiv_i129(i129 %x, i129 %y) #0 {
  %B = or i129 %y, %y
  %res = udiv exact i129 %x, %y
  store i129 %B, ptr @G.2, align 4
  %B1 = srem i129 %y, 42
  store i129 %B1, ptr @G.2, align 4
  ret i129 %res
}

attributes #0 = { nounwind }

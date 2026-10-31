; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -M no-aliases -mattr=+zhinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global double +inf
@G.2 = global i32 0
@G.3 = global i32 65536
@G.4 = global i64 -9223372036854775808

; Function Attrs: nounwind
declare signext i32 @add_small_const(i32 signext) #0

; Function Attrs: nounwind
define signext i32 @add_large_const(i32 signext %a) #0 {
  %LGV1 = load double, ptr @G.1, align 8
  %B = fmul double 4.200000e+01, %LGV1
  %1 = add i32 %a, 4095
  %2 = shl i32 %1, 16
  %B1 = sdiv i64 -1, -1
  %3 = ashr i32 %2, 16
  %I = insertelement <8 x i8> zeroinitializer, i8 -1, i8 0
  store double %B, ptr poison, align 8
  store i64 %B1, ptr @G.4, align 4
  store <8 x i8> %I, ptr poison, align 8
  ret i32 %3
}

; Function Attrs: nounwind
declare signext i32 @add_huge_const(i32 signext) #0

; Function Attrs: nounwind
define signext i24 @add_non_machine_type(i24 signext %a) #0 {
  %B1 = lshr i24 %a, 1
  ret i24 %B1
}

; Function Attrs: nounwind
define i128 @add_wide_operand(i128 %a) #0 {
  %A3 = alloca i1, align 1
  store i1 poison, ptr %A3, align 1
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %1 = add i128 %a, 5192296858534827628530496329220096
  %C = icmp ule <4 x i32> splat (i32 -2147483648), splat (i32 -1)
  %C2 = fcmp uge bfloat 1.000000e+00, 0.000000e+00
  %2 = shl i128 %1, 3
  store <4 x i1> %C, ptr %A, align 1
  store i1 %C2, ptr %A3, align 1
  ret i128 %2
}

attributes #0 = { nounwind }

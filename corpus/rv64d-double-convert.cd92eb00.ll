; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+zcb,+zbb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> zeroinitializer
@G.1 = global i1 false
@G.2 = global i16 0
@G.3 = global i32 2147483647
@G.4 = global i1 true

; Function Attrs: nounwind
declare i32 @aext_fptosi(double) #0

; Function Attrs: nounwind
declare signext i32 @sext_fptosi(double) #0

; Function Attrs: nounwind
define zeroext i32 @zext_fptosi(double %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %1 = fptosi double %a to i32
  %C = fcmp true double %a, 4.940660e-324
  store i1 %C, ptr %A, align 1
  ret i32 %1
}

; Function Attrs: nounwind
define i32 @aext_fptoui(double %a) #0 {
  %LGV = load i16, ptr @G.2, align 2
  %B = add i16 %LGV, 256
  %C = icmp ne i32 1, 1
  %1 = fptoui double %a to i32
  store i1 %C, ptr @G.1, align 1
  store i16 %B, ptr poison, align 2
  ret i32 %1
}

; Function Attrs: nounwind
declare signext i32 @sext_fptoui(double) #0

; Function Attrs: nounwind
define zeroext i32 @zext_fptoui(double %a) #0 {
  %LGV = load i32, ptr @G.3, align 4
  %1 = fptoui double %a to i32
  %C = icmp sle i32 %1, %LGV
  store i1 %C, ptr @G.4, align 1
  ret i32 %1
}

; Function Attrs: nounwind
define double @uitofp_aext_i32_to_f64(i32 %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %1 = uitofp i32 %a to double
  %C = icmp sge i128 18446744073709551616, 170141183460469231731687303715884105727
  store i1 %C, ptr %A, align 1
  ret double %1
}

; Function Attrs: nounwind
define double @uitofp_sext_i32_to_f64(i32 signext %a) #0 {
  %B = frem double +inf, f0x7FEFFFFFFFFFFFFF
  ret double %B
}

; Function Attrs: nounwind
declare double @uitofp_zext_i32_to_f64(i32 zeroext) #0

; Function Attrs: nounwind
define double @sitofp_aext_i32_to_f64(i32 %a) #0 {
  %1 = sitofp i32 %a to double
  %C = fcmp uge double %1, 0.000000e+00
  store i1 %C, ptr poison, align 1
  ret double %1
}

; Function Attrs: nounwind
define double @sitofp_sext_i32_to_f64(i32 signext %a) #0 {
  %LGV = load <4 x i32>, ptr @G, align 16
  %B = or <4 x i32> %LGV, splat (i32 65536)
  %1 = sitofp i32 %a to double
  store <4 x i32> %B, ptr poison, align 16
  ret double %1
}

; Function Attrs: nounwind
declare double @sitofp_zext_i32_to_f64(i32 zeroext) #0

attributes #0 = { nounwind }

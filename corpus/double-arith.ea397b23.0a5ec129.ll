; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+c -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 1.000000e+00
@G.1 = global i1 true
@G.2 = global i32 2147483647
@G.3 = global i32 -2147483648

; Function Attrs: nounwind
declare double @fadd_d(double, double) #0

; Function Attrs: nounwind
declare double @fsub_d(double, double) #0

; Function Attrs: nounwind
declare double @fmul_d(double, double) #0

; Function Attrs: nounwind
define double @fdiv_d(double %a, double %b) #0 {
  %LGV1 = load i32, ptr @G.2, align 4
  %B = srem <2 x i64> zeroinitializer, splat (i64 -9223372036854775808)
  %1 = fdiv double %a, %b
  store <2 x i64> %B, ptr poison, align 16
  %B2 = sub i32 65536, %LGV1
  store i32 %B2, ptr @G.3, align 4
  ret double %1
}

; Function Attrs: nounwind
declare double @fsqrt_d(double) #0

; Function Attrs: nounwind
declare double @fsgnj_d(double, double) #0

; Function Attrs: nounwind
declare i32 @fneg_d(double, double) #0

; Function Attrs: nounwind
define double @fsgnjn_d(double %a, double %b) #0 {
  %LGV = load double, ptr @G, align 8
  %1 = fsub double -0.000000e+00, %b
  %2 = call double @llvm.copysign.f64(double %a, double %1)
  %C2 = fcmp ole double %LGV, %LGV
  %C = fcmp olt double %a, %LGV
  store i1 %C, ptr @G.1, align 1
  store i1 %C2, ptr @G.1, align 1
  ret double %2
}

; Function Attrs: nounwind
declare double @fabs_d(double, double) #0

; Function Attrs: nounwind
declare double @fmin_d(double, double) #0

; Function Attrs: nounwind
declare double @fmax_d(double, double) #0

; Function Attrs: nounwind
declare double @fmadd_d(double, double, double) #0

; Function Attrs: nounwind
declare double @fmsub_d(double, double, double) #0

; Function Attrs: nounwind
declare double @fmsub_d_fmul_fneg(double, double, double, double) #0

; Function Attrs: nounwind
declare double @fnmadd_d(double, double, double) #0

; Function Attrs: nounwind
declare double @fnmadd_d_2(double, double, double) #0

; Function Attrs: nounwind
declare double @fnmadd_d_3(double, double, double) #0

; Function Attrs: nounwind
declare double @fnmadd_d_fmul_fneg(double, double, double, double) #0

; Function Attrs: nounwind
define double @fnmadd_nsz(double %a, double %b, double %c) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp false double %a, +inf
  %1 = call nsz double @llvm.fma.f64(double %a, double %b, double %c)
  %C1 = fcmp uge double %1, 4.940660e-324
  %neg = fneg nsz double %1
  store i1 %C, ptr poison, align 1
  store i1 %C1, ptr %A, align 1
  ret double %neg
}

; Function Attrs: nounwind
declare double @fnmsub_d(double, double, double) #0

; Function Attrs: nounwind
declare double @fnmsub_d_2(double, double, double) #0

; Function Attrs: nounwind
declare double @fmadd_d_contract(double, double, double) #0

; Function Attrs: nounwind
declare double @fmsub_d_contract(double, double, double) #0

; Function Attrs: nounwind
declare double @fnmadd_d_contract(double, double, double) #0

; Function Attrs: nounwind
declare double @fnmsub_d_contract(double, double, double) #0

; Function Attrs: nounwind
declare double @fsgnjx_f64(double, double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.maxnum.f64(double, double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.minnum.f64(double, double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sqrt.f64(double) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

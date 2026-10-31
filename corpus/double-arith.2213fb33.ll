; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d -O0 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <4 x i32> zeroinitializer
@G.2 = global double +inf
@G.3 = global double 1.000000e+00

; Function Attrs: nounwind
define double @fadd_d(double %a, double %b) #0 {
  %A = alloca <2 x i64>, align 16
  store <2 x i64> poison, ptr %A, align 16
  %LGV = load double, ptr @G.2, align 8
  %C = fcmp oeq double %a, %LGV
  %1 = fadd double %a, %b
  %B = xor <2 x i64> splat (i64 42), zeroinitializer
  store i1 %C, ptr poison, align 1
  store <2 x i64> %B, ptr %A, align 16
  ret double %1
}

; Function Attrs: nounwind
declare double @fsub_d(double, double) #0

; Function Attrs: nounwind
declare double @fmul_d(double, double) #0

; Function Attrs: nounwind
declare double @fdiv_d(double, double) #0

; Function Attrs: nounwind
define double @fsqrt_d(double %a) #0 {
  %1 = call double @llvm.sqrt.f64(double %a)
  %C = fcmp une double %1, %1
  store i1 %C, ptr poison, align 1
  ret double %1
}

; Function Attrs: nounwind
declare double @fsgnj_d(double, double) #0

; Function Attrs: nounwind
declare i32 @fneg_d(double, double) #0

; Function Attrs: nounwind
define double @fsgnjn_d(double %a, double %b) #0 {
  %LGV = load i1, ptr @G, align 1
  %1 = fsub double -0.000000e+00, %b
  %2 = call double @llvm.copysign.f64(double %a, double %1)
  %C = icmp ule i1 %LGV, true
  store i1 %C, ptr @G, align 1
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
define double @fnmadd_d(double %a, double %b, double %c) #0 {
  %A = alloca double, align 8
  store double poison, ptr %A, align 8
  %LGV = load double, ptr @G.3, align 8
  %a_ = fadd double 0.000000e+00, %a
  %B = fadd double %a_, %LGV
  %c_ = fadd double 0.000000e+00, %c
  %nega = fsub double -0.000000e+00, %a_
  %negc = fsub double -0.000000e+00, %c_
  %1 = call double @llvm.fma.f64(double %nega, double %b, double %negc)
  store double %B, ptr %A, align 8
  ret double %1
}

; Function Attrs: nounwind
declare double @fnmadd_d_2(double, double, double) #0

; Function Attrs: nounwind
declare double @fnmadd_d_3(double, double, double) #0

; Function Attrs: nounwind
declare double @fnmadd_d_fmul_fneg(double, double, double, double) #0

; Function Attrs: nounwind
declare double @fnmadd_nsz(double, double, double) #0

; Function Attrs: nounwind
declare double @fnmsub_d(double, double, double) #0

; Function Attrs: nounwind
declare double @fnmsub_d_2(double, double, double) #0

; Function Attrs: nounwind
declare double @fmadd_d_contract(double, double, double) #0

; Function Attrs: nounwind
define double @fmsub_d_contract(double %a, double %b, double %c) #0 {
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %LGV = load <4 x i32>, ptr @G.1, align 16
  %c_ = fadd double 0.000000e+00, %c
  %B = ashr <4 x i32> splat (i32 2147483647), %LGV
  %1 = fmul contract double %a, %b
  %2 = fsub contract double %1, %c_
  store <4 x i32> %B, ptr %A, align 16
  ret double %2
}

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

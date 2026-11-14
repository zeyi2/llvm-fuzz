; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+v -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 -1)
@G.1 = global i1 true
@G.2 = global double 4.940660e-324

; Function Attrs: nounwind
declare double @fadd_d(double, double) #0

; Function Attrs: nounwind
declare double @fsub_d(double, double) #0

; Function Attrs: nounwind
declare double @fmul_d(double, double) #0

; Function Attrs: nounwind
declare double @fdiv_d(double, double) #0

; Function Attrs: nounwind
declare double @fsqrt_d(double) #0

; Function Attrs: nounwind
declare double @fsgnj_d(double, double) #0

; Function Attrs: nounwind
declare i32 @fneg_d(double, double) #0

; Function Attrs: nounwind
define double @fsgnjn_d(double %a, double %b) #0 {
  %LGV1 = load double, ptr @G.2, align 8
  %1 = fsub double -0.000000e+00, %b
  %C = fcmp ult double %1, %LGV1
  %2 = call double @llvm.copysign.f64(double %a, double %1)
  store i1 %C, ptr @G.1, align 1
  ret double %2
}

; Function Attrs: nounwind
define double @fabs_d(double %a, double %b) #0 {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %1 = fadd double %a, %b
  %2 = call double @llvm.fabs.f64(double %1)
  %3 = fadd double %2, %1
  ret double %3

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %LGV = load i1, ptr @G.1, align 1
  br i1 %LGV, label %F, label %BB
}

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
declare double @fnmadd_nsz(double, double, double) #0

; Function Attrs: nounwind
declare double @fnmsub_d(double, double, double) #0

; Function Attrs: nounwind
declare double @fnmsub_d_2(double, double, double) #0

; Function Attrs: nounwind
define double @fmadd_d_contract(double %a, double %b, double %c) #0 {
  %A = alloca <2 x i1>, align 1
  store <2 x i1> poison, ptr %A, align 1
  %LGV = load <2 x i64>, ptr @G, align 16
  %C = icmp sle <2 x i64> %LGV, splat (i64 9223372036854775807)
  %1 = fmul contract double %a, %b
  %2 = fadd contract double %1, %c
  store <2 x i1> %C, ptr %A, align 1
  ret double %2
}

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

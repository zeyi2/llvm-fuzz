; isel-diff-config: -mtriple=riscv64 -target-abi=lp64 -verify-machineinstrs -mattr=+d -O1 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

; Function Attrs: nounwind
declare double @fneg(double) #0

; Function Attrs: nounwind
declare double @fabs(double) #0

; Function Attrs: nounwind
define double @fcopysign_fneg(double %a, double %b) #0 {
  %1 = fneg double %b
  %B = fmul double %b, %1
  %2 = call double @llvm.copysign.f64(double %a, double %B)
  ret double %2
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

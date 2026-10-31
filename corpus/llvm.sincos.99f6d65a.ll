; isel-diff-config: -mtriple=riscv32-linux-gnu -mattr=+zdinx -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.401300e-45
@G.1 = global double +inf
@G.3 = global { double, double } poison

; Function Attrs: nounwind
define { float, float } @test_sincos_f32(float %a) #0 {
  %LGV = load float, ptr @G, align 4
  %B = fdiv float %a, %LGV
  %result = call { float, float } @llvm.sincos.f32(float %B)
  ret { float, float } %result
}

; Function Attrs: nounwind
define { double, double } @test_sincos_f64(double %a) #0 {
  %result = call { double, double } @llvm.sincos.f64(double %a)
  %I = insertvalue { double, double } %result, double +inf, 0
  %I2 = insertvalue { double, double } %I, double 0.000000e+00, 1
  store { double, double } %I, ptr @G.3, align 8
  store { double, double } %I2, ptr poison, align 8
  ret { double, double } %result
}

; Function Attrs: nounwind
define { fp128, fp128 } @test_sincos_f128(fp128 %a) #0 {
  %LGV = load double, ptr @G.1, align 8
  %result = call { fp128, fp128 } @llvm.sincos.f128(fp128 %a)
  %B = frem double f0x7FEFFFFFFFFFFFFF, %LGV
  %C = icmp eq i1 true, false
  store double %B, ptr @G.1, align 8
  store i1 %C, ptr poison, align 1
  ret { fp128, fp128 } %result
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { fp128, fp128 } @llvm.sincos.f128(fp128) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { float, float } @llvm.sincos.f32(float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { double, double } @llvm.sincos.f64(double) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

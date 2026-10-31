; isel-diff-config: -mtriple=riscv64 -mattr=+zfinx -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <4 x i32> splat (i32 42)
@G.2 = global <4 x i1> splat (i1 true)
@G.3 = global <4 x i1> splat (i1 true)
@G.4 = global i1 false

; Function Attrs: nounwind
define double @sqrt_f64(double %a) #0 {
  %LGV = load i1, ptr @G.4, align 1
  %1 = call double @llvm.sqrt.f64(double %a)
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %T
  ret double %1

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  ret double 0.000000e+00
}

; Function Attrs: nounwind
declare double @powi_f64(double, i32) #0

; Function Attrs: nounwind
declare double @sin_f64(double) #0

; Function Attrs: nounwind
declare double @cos_f64(double) #0

; Function Attrs: nounwind
declare double @sincos_f64(double) #0

; Function Attrs: nounwind
declare double @pow_f64(double, double) #0

; Function Attrs: nounwind
declare double @exp_f64(double) #0

; Function Attrs: nounwind
declare double @exp2_f64(double) #0

; Function Attrs: nounwind
declare double @exp10_f64(double) #0

; Function Attrs: nounwind
declare double @log_f64(double) #0

; Function Attrs: nounwind
declare double @log10_f64(double) #0

; Function Attrs: nounwind
declare double @log2_f64(double) #0

; Function Attrs: nounwind
declare double @fma_f64(double, double, double) #0

; Function Attrs: nounwind
declare double @fmuladd_f64(double, double, double) #0

; Function Attrs: nounwind
declare double @fabs_f64(double) #0

; Function Attrs: nounwind
define double @minnum_f64(double %a, double %b) #0 {
  %LGV = load <4 x i32>, ptr @G.1, align 16
  %C = icmp sle <4 x i32> %LGV, splat (i32 65536)
  %1 = call double @llvm.minnum.f64(double %a, double %b)
  store <4 x i1> %C, ptr @G.2, align 1
  ret double %1
}

; Function Attrs: nounwind
declare double @maxnum_f64(double, double) #0

; Function Attrs: nounwind
declare double @copysign_f64(double, double) #0

; Function Attrs: nounwind
declare double @floor_f64(double) #0

; Function Attrs: nounwind
declare double @ceil_f64(double) #0

; Function Attrs: nounwind
declare double @trunc_f64(double) #0

; Function Attrs: nounwind
declare double @rint_f64(double) #0

; Function Attrs: nounwind
declare double @nearbyint_f64(double) #0

; Function Attrs: nounwind
define double @round_f64(double %a) #0 {
  %C = fcmp ugt double %a, 0.000000e+00
  %1 = call double @llvm.round.f64(double %a)
  store i1 %C, ptr @G, align 1
  ret double %1
}

; Function Attrs: nounwind
declare double @roundeven_f64(double) #0

declare i1 @isnan_d_fpclass(double)

declare i1 @isnan_q_fpclass(fp128)

declare i1 @iszero_q_fpclass(fp128)

define i1 @isinf_q_fpclass(fp128 %x) {
  %1 = call i1 @llvm.is.fpclass.f128(fp128 %x, /* (pnorm) */ i32 256)
  %C = fcmp ole <4 x float> splat (float 4.200000e+01), splat (float 1.401300e-45)
  store <4 x i1> %C, ptr @G.3, align 1
  ret i1 %1
}

declare i1 @isinf_or_zero_q_fpclass(fp128)

; Function Attrs: nounwind
declare double @tan_f64(double) #0

; Function Attrs: nounwind
declare double @ldexp_double(double, i32) #0

; Function Attrs: nounwind
declare double @asin_f64(double) #0

; Function Attrs: nounwind
declare double @acos_f64(double) #0

; Function Attrs: nounwind
declare double @atan_f64(double) #0

; Function Attrs: nounwind
declare double @atan2_f64(double, double) #0

; Function Attrs: nounwind
declare double @sinh_f64(double) #0

; Function Attrs: nounwind
declare double @cosh_f64(double) #0

; Function Attrs: nounwind
declare double @tanh_f64(double) #0

; Function Attrs: nounwind
declare { double, double } @test_modf_f64(double) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.acos.f64(double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.asin.f64(double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.atan.f64(double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.atan2.f64(double, double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.ceil.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.copysign.f64(double, double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.cos.f64(double) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.cosh.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.exp.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.exp10.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.exp2.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.floor.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.is.fpclass.f128(fp128, i32 immarg) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.is.fpclass.f64(double, i32 immarg) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.ldexp.f64.i32(double, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.log.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.log10.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.log2.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.maxnum.f64(double, double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.minnum.f64(double, double) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { double, double } @llvm.modf.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nearbyint.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.pow.f64(double, double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.powi.f64.i32(double, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.rint.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.round.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.roundeven.f64(double) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sin.f64(double) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sinh.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sqrt.f64(double) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.tan.f64(double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.tanh.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.trunc.f64(double) #2

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

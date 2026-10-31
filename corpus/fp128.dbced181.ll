; isel-diff-config: -mtriple=riscv32 -mattr=+zbkb,+zdinx -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global fp128 0.000000e+00
@G.1 = global i1 true
@G.2 = global <2 x i1> zeroinitializer

; Function Attrs: nounwind
declare fp128 @fadd(fp128, fp128) #0

; Function Attrs: nounwind
declare fp128 @fsub(fp128, fp128) #0

; Function Attrs: nounwind
declare fp128 @fmul(fp128, fp128) #0

; Function Attrs: nounwind
declare fp128 @fdiv(fp128, fp128) #0

; Function Attrs: nounwind
declare fp128 @frem(fp128, fp128) #0

; Function Attrs: nounwind
declare fp128 @fma(fp128, fp128, fp128) #0

declare fp128 @fneg(fp128)

declare fp128 @fabs(fp128)

define fp128 @fcopysign(fp128 %x, fp128 %y) {
  %a = call fp128 @llvm.copysign.f128(fp128 %x, fp128 %y)
  %C = icmp sle <2 x i64> splat (i64 9223372036854775807), zeroinitializer
  store <2 x i1> %C, ptr @G.2, align 1
  ret fp128 %a
}

; Function Attrs: nounwind
declare i1 @fcmp(fp128, fp128) #0

; Function Attrs: nounwind
declare fp128 @constant(fp128) #0

; Function Attrs: nounwind
declare fp128 @fpext_f32(float, float) #0

; Function Attrs: nounwind
declare fp128 @fpext_f64(double, double) #0

; Function Attrs: nounwind
define float @fptrunc_f32(fp128 %x, float %y) #0 {
  %A = alloca float, align 4
  store float poison, ptr %A, align 4
  %B = frem float %y, %y
  %a = fptrunc fp128 %x to float
  %b = fadd float %a, %y
  store float %B, ptr %A, align 4
  ret float %b
}

; Function Attrs: nounwind
declare double @fptrunc_f64(fp128, double) #0

; Function Attrs: nounwind
declare i8 @fptosi_i8(fp128) #0

; Function Attrs: nounwind
declare i16 @fptosi_i16(fp128) #0

; Function Attrs: nounwind
declare i32 @fptosi_i32(fp128) #0

; Function Attrs: nounwind
declare i64 @fptosi_i64(fp128) #0

; Function Attrs: nounwind
declare i128 @fptosi_i128(fp128) #0

; Function Attrs: nounwind
declare i8 @fptoui_i8(fp128) #0

; Function Attrs: nounwind
declare i16 @fptoui_i16(fp128) #0

; Function Attrs: nounwind
declare i32 @fptoui_i32(fp128) #0

; Function Attrs: nounwind
define i64 @fptoui_i64(fp128 %x) #0 {
  %C = fcmp ogt fp128 %x, 1.000000e+00
  %a = fptoui fp128 %x to i64
  store i1 %C, ptr @G.1, align 1
  ret i64 %a
}

; Function Attrs: nounwind
declare i128 @fptoui_i128(fp128) #0

; Function Attrs: nounwind
define fp128 @sitofp_i8(i8 %x) #0 {
  %LGV = load fp128, ptr @G, align 16
  %a = sitofp i8 %x to fp128
  %C = fcmp ule fp128 %a, %LGV
  store i1 %C, ptr @G.1, align 1
  ret fp128 %a
}

; Function Attrs: nounwind
declare fp128 @sitofp_i16(i16) #0

; Function Attrs: nounwind
declare fp128 @sitofp_i32(i32) #0

; Function Attrs: nounwind
declare fp128 @sitofp_i64(i64) #0

; Function Attrs: nounwind
declare fp128 @sitofp_i128(i128) #0

; Function Attrs: nounwind
declare fp128 @uitofp_i8(i8) #0

; Function Attrs: nounwind
declare fp128 @uitofp_i16(i16) #0

; Function Attrs: nounwind
declare fp128 @uitofp_i32(i32) #0

; Function Attrs: nounwind
declare fp128 @uitofp_i64(i64) #0

; Function Attrs: nounwind
declare fp128 @uitofp_i128(i128) #0

; Function Attrs: nounwind
declare fp128 @sqrt(fp128) #0

; Function Attrs: nounwind
declare fp128 @powi(fp128, i32) #0

; Function Attrs: nounwind
declare fp128 @sin(fp128) #0

; Function Attrs: nounwind
declare fp128 @cos(fp128) #0

; Function Attrs: nounwind
declare fp128 @pow(fp128, fp128) #0

; Function Attrs: nounwind
declare fp128 @exp(fp128) #0

; Function Attrs: nounwind
declare fp128 @exp2(fp128) #0

; Function Attrs: nounwind
declare fp128 @exp10(fp128) #0

; Function Attrs: nounwind
declare fp128 @log(fp128) #0

; Function Attrs: nounwind
declare fp128 @log10(fp128) #0

; Function Attrs: nounwind
declare fp128 @log2(fp128) #0

; Function Attrs: nounwind
declare fp128 @minnum(fp128, fp128) #0

; Function Attrs: nounwind
declare fp128 @maxnum(fp128, fp128) #0

; Function Attrs: nounwind
declare fp128 @floor(fp128) #0

; Function Attrs: nounwind
declare fp128 @ceil(fp128) #0

; Function Attrs: nounwind
declare fp128 @trunc(fp128) #0

; Function Attrs: nounwind
declare fp128 @rint(fp128) #0

; Function Attrs: nounwind
declare fp128 @nearbyint(fp128) #0

; Function Attrs: nounwind
declare fp128 @round(fp128) #0

; Function Attrs: nounwind
declare fp128 @roundeven(fp128) #0

; Function Attrs: nounwind
declare fp128 @tan(fp128) #0

; Function Attrs: nounwind
declare fp128 @ldexp_fp128(fp128, i32) #0

; Function Attrs: nounwind
declare fp128 @asin(fp128) #0

; Function Attrs: nounwind
declare fp128 @acos(fp128) #0

; Function Attrs: nounwind
declare fp128 @atan(fp128) #0

; Function Attrs: nounwind
declare fp128 @atan2(fp128, fp128) #0

; Function Attrs: nounwind
declare fp128 @sinh(fp128) #0

; Function Attrs: nounwind
declare fp128 @cosh(fp128) #0

; Function Attrs: nounwind
declare fp128 @tanh(fp128) #0

; Function Attrs: nounwind
declare { fp128, fp128 } @modf(fp128) #0

; Function Attrs: nounwind
declare fp128 @test_fcos(fp128) #0

; Function Attrs: nounwind
declare fp128 @test_fsin(fp128) #0

; Function Attrs: nounwind
define fp128 @test_ftan(fp128 %a) #0 {
entry:
  %C = fcmp false half +inf, +qnan
  %r = call fp128 @llvm.tan.f128(fp128 %a)
  store i1 %C, ptr poison, align 1
  ret fp128 %r
}

; Function Attrs: nounwind
declare fp128 @test_fpow(fp128, fp128) #0

; Function Attrs: nounwind
declare fp128 @test_flog(fp128) #0

; Function Attrs: nounwind
declare fp128 @test_flog2(fp128) #0

; Function Attrs: nounwind
declare fp128 @test_flog10(fp128) #0

; Function Attrs: nounwind
define fp128 @test_fexp(fp128 %a) #0 {
entry:
  %A = alloca fp128, align 16
  store fp128 poison, ptr %A, align 16
  %r = call fp128 @llvm.exp.f128(fp128 %a)
  %B = fmul fp128 %r, %r
  store fp128 %B, ptr %A, align 16
  ret fp128 %r
}

; Function Attrs: nounwind
declare fp128 @test_fexp2(fp128) #0

; Function Attrs: nounwind
declare fp128 @test_fexp10(fp128) #0

; Function Attrs: nounwind
declare fp128 @test_facos(fp128) #0

; Function Attrs: nounwind
declare fp128 @test_fasin(fp128) #0

; Function Attrs: nounwind
declare fp128 @test_fatan(fp128) #0

; Function Attrs: nounwind
declare fp128 @test_fatan2(fp128, fp128) #0

; Function Attrs: nounwind
declare fp128 @test_fcosh(fp128) #0

; Function Attrs: nounwind
declare fp128 @test_fsinh(fp128) #0

; Function Attrs: nounwind
declare fp128 @test_ftanh(fp128) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.acos.f128(fp128) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.asin.f128(fp128) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.atan.f128(fp128) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.atan2.f128(fp128, fp128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.ceil.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.copysign.f128(fp128, fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.cos.f128(fp128) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.cosh.f128(fp128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.exp.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.exp10.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.exp2.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.fabs.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.floor.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.fma.f128(fp128, fp128, fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.ldexp.f128.i32(fp128, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.log.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.log10.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.log2.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.maxnum.f128(fp128, fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.minnum.f128(fp128, fp128) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { fp128, fp128 } @llvm.modf.f128(fp128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.nearbyint.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.pow.f128(fp128, fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.powi.f128.i32(fp128, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.rint.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.round.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.roundeven.f128(fp128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.sin.f128(fp128) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.sinh.f128(fp128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.sqrt.f128(fp128) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.tan.f128(fp128) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.tanh.f128(fp128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.trunc.f128(fp128) #2

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

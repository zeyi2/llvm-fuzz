; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zfinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 9223372036854775807)
@G.1 = global i1 false
@G.2 = global i1 false
@G.3 = global ptr poison

declare half @fcanonicalize_f16(half)

declare <2 x half> @fcanonicalize_v2f16(<2 x half>)

define <2 x half> @fcanonicalize_v2f16_nnan(<2 x half> %x) {
  %LGV1 = load i1, ptr @G.2, align 1
  %z = call nnan <2 x half> @llvm.canonicalize.v2f16(<2 x half> %x)
  %C = icmp ne i1 true, %LGV1
  store i1 %C, ptr poison, align 1
  ret <2 x half> %z
}

declare <4 x half> @fcanonicalize_v4f16(<4 x half>)

define <4 x half> @fcanonicalize_v4f16_nnan(<4 x half> %x) {
  %A = alloca <2 x i64>, align 16
  store <2 x i64> poison, ptr %A, align 16
  %LGV = load <2 x i64>, ptr @G, align 16
  %G = getelementptr <4 x half>, ptr %A, i128 -1
  %B = mul <2 x i64> %LGV, splat (i64 4294967296)
  %z = call nnan <4 x half> @llvm.canonicalize.v4f16(<4 x half> %x)
  store <2 x i64> %B, ptr %A, align 16
  store ptr %G, ptr @G.3, align 8
  ret <4 x half> %z
}

declare <8 x half> @fcanonicalize_v8f16(<8 x half>)

define <8 x half> @fcanonicalize_v8f16_nnan(<8 x half> %x) {
  %B = frem <8 x half> %x, splat (half +inf)
  %z = call nnan <8 x half> @llvm.canonicalize.v8f16(<8 x half> %B)
  ret <8 x half> %z
}

define float @fcanonicalize_f32(float %x) {
  %C = fcmp ugt float %x, 1.401300e-45
  %z = call nnan float @llvm.canonicalize.f32(float %x)
  store i1 %C, ptr @G.1, align 1
  ret float %z
}

declare <2 x float> @fcanonicalize_v2f32(<2 x float>)

declare <2 x float> @fcanonicalize_v2f32_nnan(<2 x float>)

define <4 x float> @fcanonicalize_v4f32(<4 x float> %x) {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i1, ptr @G.2, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %z = call nnan <4 x float> @llvm.canonicalize.v4f32(<4 x float> %x)
  ret <4 x float> %z

T:                                                ; preds = %T, %0
  br i1 %L, label %T, label %BB

F:                                                ; preds = %0
  br label %BB
}

declare double @fcanonicalize_f64(double)

declare double @fcanonicalize_f64_nnan(double)

declare <2 x double> @fcanonicalize_v2f64(<2 x double>)

declare <2 x double> @fcanonicalize_v2f64_nnan(<2 x double>)

define double @fcanonicalize_softfloat(double %0, double %1) unnamed_addr {
start:
  %2 = fcmp olt double %0, %1
  %3 = fcmp uno double %0, 0.000000e+00
  %or.cond.i.i = or i1 %3, %2
  %B = add i1 %2, false
  %4 = select i1 %or.cond.i.i, double %1, double %0
  %5 = tail call double @llvm.canonicalize.f64(double %4)
  store i1 %B, ptr @G.1, align 1
  ret double %5
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.canonicalize.f16(half) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.canonicalize.f32(float) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.canonicalize.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x half> @llvm.canonicalize.v2f16(<2 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.canonicalize.v2f32(<2 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.canonicalize.v2f64(<2 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x half> @llvm.canonicalize.v4f16(<4 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.canonicalize.v4f32(<4 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x half> @llvm.canonicalize.v8f16(<8 x half>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

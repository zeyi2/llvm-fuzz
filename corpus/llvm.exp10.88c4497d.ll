; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 -32768
@G.1 = global i1 true
@G.2 = global float 4.200000e+01

declare <1 x half> @exp10_v1f16(<1 x half>)

define <2 x half> @exp10_v2f16(<2 x half> %x) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %r = call <2 x half> @llvm.exp10.v2f16(<2 x half> %x)
  %B = sdiv i1 true, true
  store i1 %B, ptr %A, align 1
  ret <2 x half> %r
}

declare <3 x half> @exp10_v3f16(<3 x half>)

declare <4 x half> @exp10_v4f16(<4 x half>)

declare <1 x float> @exp10_v1f32(<1 x float>)

define <2 x float> @exp10_v2f32(<2 x float> %x) {
  %C = icmp sle <8 x i8> splat (i8 42), splat (i8 1)
  %LGV = load i1, ptr @G.1, align 1
  %r = call <2 x float> @llvm.exp10.v2f32(<2 x float> %x)
  store <8 x i1> %C, ptr poison, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <2 x float> %r

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

declare <3 x float> @exp10_v3f32(<3 x float>)

declare <4 x float> @exp10_v4f32(<4 x float>)

define <2 x double> @exp10_v2f64(<2 x double> %x) {
  %LGV = load float, ptr @G.2, align 4
  %r = call <2 x double> @llvm.exp10.v2f64(<2 x double> %x)
  %C = fcmp olt float 4.200000e+01, %LGV
  store i1 %C, ptr poison, align 1
  ret <2 x double> %r
}

declare <3 x double> @exp10_v3f64(<3 x double>)

define <4 x double> @exp10_v4f64(<4 x double> %x) {
  %r = call <4 x double> @llvm.exp10.v4f64(<4 x double> %x)
  %B = shl i16 1, 0
  store i16 %B, ptr @G, align 2
  ret <4 x double> %r
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x half> @llvm.exp10.v1f16(<1 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x float> @llvm.exp10.v1f32(<1 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x half> @llvm.exp10.v2f16(<2 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.exp10.v2f32(<2 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.exp10.v2f64(<2 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x half> @llvm.exp10.v3f16(<3 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x float> @llvm.exp10.v3f32(<3 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x double> @llvm.exp10.v3f64(<3 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x half> @llvm.exp10.v4f16(<4 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.exp10.v4f32(<4 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @llvm.exp10.v4f64(<4 x double>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

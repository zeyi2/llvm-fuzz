; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+zdinx -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <3 x i1> zeroinitializer
@G.1 = global <4 x half> zeroinitializer

declare <1 x half> @exp10_v1f16(<1 x half>)

define <2 x half> @exp10_v2f16(<2 x half> %x) {
  %r = call <2 x half> @llvm.exp10.v2f16(<2 x half> %x)
  %C = fcmp ogt <2 x half> %r, %r
  store <2 x i1> %C, ptr poison, align 1
  ret <2 x half> %r
}

declare <3 x half> @exp10_v3f16(<3 x half>)

define <4 x half> @exp10_v4f16(<4 x half> %x) {
  %B = frem <4 x half> %x, splat (half 5.960460e-08)
  %r = call <4 x half> @llvm.exp10.v4f16(<4 x half> %x)
  store <4 x half> %B, ptr @G.1, align 8
  ret <4 x half> %r
}

declare <1 x float> @exp10_v1f32(<1 x float>)

declare <2 x float> @exp10_v2f32(<2 x float>)

define <3 x float> @exp10_v3f32(<3 x float> %x) {
  %r = call <3 x float> @llvm.exp10.v3f32(<3 x float> %x)
  %C = fcmp false <3 x float> %r, splat (float 4.200000e+01)
  store <3 x i1> %C, ptr @G, align 1
  ret <3 x float> %r
}

declare <4 x float> @exp10_v4f32(<4 x float>)

declare <2 x double> @exp10_v2f64(<2 x double>)

declare <3 x double> @exp10_v3f64(<3 x double>)

declare <4 x double> @exp10_v4f64(<4 x double>)

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

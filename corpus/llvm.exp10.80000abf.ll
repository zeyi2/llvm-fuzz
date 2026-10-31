; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32d -mattr=+zhinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x float> zeroinitializer
@G.1 = global <4 x i1> splat (i1 true)
@G.2 = global i1 false

declare <1 x half> @exp10_v1f16(<1 x half>)

declare <2 x half> @exp10_v2f16(<2 x half>)

declare <3 x half> @exp10_v3f16(<3 x half>)

define <4 x half> @exp10_v4f16(<4 x half> %x) {
  %r = call <4 x half> @llvm.exp10.v4f16(<4 x half> %x)
  %C = fcmp one <4 x half> %x, zeroinitializer
  store <4 x i1> %C, ptr @G.1, align 1
  ret <4 x half> %r
}

define <1 x float> @exp10_v1f32(<1 x float> %x) {
  %r = call <1 x float> @llvm.exp10.v1f32(<1 x float> %x)
  %C = fcmp olt <1 x float> %r, %x
  store <1 x i1> %C, ptr poison, align 1
  ret <1 x float> %r
}

define <2 x float> @exp10_v2f32(<2 x float> %x) {
  %r = call <2 x float> @llvm.exp10.v2f32(<2 x float> %x)
  store <2 x float> %r, ptr @G, align 8
  ret <2 x float> %r
}

declare <3 x float> @exp10_v3f32(<3 x float>)

declare <4 x float> @exp10_v4f32(<4 x float>)

declare <2 x double> @exp10_v2f64(<2 x double>)

define <3 x double> @exp10_v3f64(<3 x double> %x) {
  %LGV = load i1, ptr @G.2, align 1
  %B = xor i1 true, %LGV
  %r = call <3 x double> @llvm.exp10.v3f64(<3 x double> %x)
  store i1 %B, ptr @G.2, align 1
  ret <3 x double> %r
}

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

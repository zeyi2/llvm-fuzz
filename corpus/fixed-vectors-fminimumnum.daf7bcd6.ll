; isel-diff-config: --mtriple=riscv64-linux-gnu -mattr=+v,+zvfbfmin -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <2 x double> splat (double +inf)
@G.2 = global <4 x bfloat> splat (bfloat 1.000000e+00)

define <2 x double> @min_v2f64(<2 x double> %a, <2 x double> %b) {
entry:
  %LGV = load <2 x double>, ptr @G.1, align 16
  %B = fmul <2 x double> %a, %LGV
  ret <2 x double> %B
}

declare <3 x double> @min_v3f64(<3 x double>, <3 x double>)

declare <4 x double> @min_v4f64(<4 x double>, <4 x double>)

declare <2 x float> @min_v2f32(<2 x float>, <2 x float>)

define <3 x float> @min_v3f32(<3 x float> %a, <3 x float> %b) {
entry:
  %LGV = load i1, ptr @G, align 1
  %c = call <3 x float> @llvm.minimumnum.v3f32(<3 x float> %a, <3 x float> %b)
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %T
  ret <3 x float> %c

T:                                                ; preds = %entry
  br label %BB

F:                                                ; preds = %entry
  ret <3 x float> splat (float +inf)
}

declare <4 x float> @min_v4f32(<4 x float>, <4 x float>)

declare <5 x float> @min_v5f32(<5 x float>, <5 x float>)

declare <8 x float> @min_v8f32(<8 x float>, <8 x float>)

declare <2 x half> @min_v2f16(<2 x half>, <2 x half>)

declare <4 x half> @min_v4f16(<4 x half>, <4 x half>)

declare <8 x half> @min_v8f16(<8 x half>, <8 x half>)

declare <9 x half> @min_v9f16(<9 x half>, <9 x half>)

define <16 x half> @min_v16f16(<16 x half> %a, <16 x half> %b) {
entry:
  %C = icmp sle i16 42, -1
  %c = call <16 x half> @llvm.minimumnum.v16f16(<16 x half> %a, <16 x half> %b)
  store i1 %C, ptr @G, align 1
  ret <16 x half> %c
}

declare <2 x bfloat> @min_v2bf16(<2 x bfloat>, <2 x bfloat>)

define <4 x bfloat> @min_v4bf16(<4 x bfloat> %a, <4 x bfloat> %b) {
entry:
  %c = call <4 x bfloat> @llvm.minimumnum.v4bf16(<4 x bfloat> %a, <4 x bfloat> %b)
  %B = fsub <4 x bfloat> %c, %c
  store <4 x bfloat> %B, ptr @G.2, align 8
  ret <4 x bfloat> %c
}

declare <8 x bfloat> @min_v8bf16(<8 x bfloat>, <8 x bfloat>)

declare <9 x bfloat> @min_v9bf16(<9 x bfloat>, <9 x bfloat>)

declare <16 x bfloat> @min_v16bf16(<16 x bfloat>, <16 x bfloat>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x bfloat> @llvm.minimumnum.v16bf16(<16 x bfloat>, <16 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x half> @llvm.minimumnum.v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x bfloat> @llvm.minimumnum.v2bf16(<2 x bfloat>, <2 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x half> @llvm.minimumnum.v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.minimumnum.v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.minimumnum.v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x float> @llvm.minimumnum.v3f32(<3 x float>, <3 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x double> @llvm.minimumnum.v3f64(<3 x double>, <3 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x bfloat> @llvm.minimumnum.v4bf16(<4 x bfloat>, <4 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x half> @llvm.minimumnum.v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.minimumnum.v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @llvm.minimumnum.v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <5 x float> @llvm.minimumnum.v5f32(<5 x float>, <5 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x bfloat> @llvm.minimumnum.v8bf16(<8 x bfloat>, <8 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x half> @llvm.minimumnum.v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.minimumnum.v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <9 x bfloat> @llvm.minimumnum.v9bf16(<9 x bfloat>, <9 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <9 x half> @llvm.minimumnum.v9f16(<9 x half>, <9 x half>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

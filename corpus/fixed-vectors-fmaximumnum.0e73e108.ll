; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+d,+v -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> zeroinitializer
@G.1 = global <2 x i64> splat (i64 1)
@G.2 = global i1 true
@G.3 = global bfloat 0.000000e+00
@G.4 = global bfloat +inf

declare <2 x double> @max_v2f64(<2 x double>, <2 x double>)

declare <3 x double> @max_v3f64(<3 x double>, <3 x double>)

declare <4 x double> @max_v4f64(<4 x double>, <4 x double>)

declare <2 x float> @max_v2f32(<2 x float>, <2 x float>)

declare <3 x float> @max_v3f32(<3 x float>, <3 x float>)

declare <4 x float> @max_v4f32(<4 x float>, <4 x float>)

declare <5 x float> @max_v5f32(<5 x float>, <5 x float>)

define <8 x float> @max_v8f32(<8 x float> %a, <8 x float> %b) {
entry:
  %c = call <8 x float> @llvm.maximumnum.v8f32(<8 x float> %a, <8 x float> %b)
  %C = icmp slt i8 1, 42
  store i1 %C, ptr @G.2, align 1
  ret <8 x float> %c
}

define <2 x half> @max_v2f16(<2 x half> %a, <2 x half> %b) {
entry:
  %LGV1 = load bfloat, ptr @G.4, align 2
  %LGV = load bfloat, ptr @G.3, align 2
  %c = call <2 x half> @llvm.maximumnum.v2f16(<2 x half> %a, <2 x half> %b)
  %B = fmul bfloat %LGV, %LGV1
  store bfloat %B, ptr @G.3, align 2
  ret <2 x half> %c
}

declare <4 x half> @max_v4f16(<4 x half>, <4 x half>)

declare <8 x half> @max_v8f16(<8 x half>, <8 x half>)

declare <9 x half> @max_v9f16(<9 x half>, <9 x half>)

declare <16 x half> @max_v16f16(<16 x half>, <16 x half>)

define <2 x bfloat> @max_v2bf16(<2 x bfloat> %a, <2 x bfloat> %b) {
entry:
  %LGV = load <2 x i64>, ptr @G, align 16
  %B = ashr <2 x i64> %LGV, splat (i64 -1)
  %c = call <2 x bfloat> @llvm.maximumnum.v2bf16(<2 x bfloat> %a, <2 x bfloat> %b)
  store <2 x i64> %B, ptr @G.1, align 16
  ret <2 x bfloat> %c
}

declare <4 x bfloat> @max_v4bf16(<4 x bfloat>, <4 x bfloat>)

declare <8 x bfloat> @max_v8bf16(<8 x bfloat>, <8 x bfloat>)

declare <9 x bfloat> @max_v9bf16(<9 x bfloat>, <9 x bfloat>)

declare <16 x bfloat> @max_v16bf16(<16 x bfloat>, <16 x bfloat>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x bfloat> @llvm.maximumnum.v16bf16(<16 x bfloat>, <16 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x half> @llvm.maximumnum.v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x bfloat> @llvm.maximumnum.v2bf16(<2 x bfloat>, <2 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x half> @llvm.maximumnum.v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.maximumnum.v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.maximumnum.v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x float> @llvm.maximumnum.v3f32(<3 x float>, <3 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x double> @llvm.maximumnum.v3f64(<3 x double>, <3 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x bfloat> @llvm.maximumnum.v4bf16(<4 x bfloat>, <4 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x half> @llvm.maximumnum.v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.maximumnum.v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @llvm.maximumnum.v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <5 x float> @llvm.maximumnum.v5f32(<5 x float>, <5 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x bfloat> @llvm.maximumnum.v8bf16(<8 x bfloat>, <8 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x half> @llvm.maximumnum.v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.maximumnum.v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <9 x bfloat> @llvm.maximumnum.v9bf16(<9 x bfloat>, <9 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <9 x half> @llvm.maximumnum.v9f16(<9 x half>, <9 x half>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

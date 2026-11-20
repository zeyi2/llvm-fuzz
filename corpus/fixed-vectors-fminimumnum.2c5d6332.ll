; isel-diff-config: --mtriple=riscv64-linux-gnu -mattr=+zvfh,+zvfbfmin -O1 -code-model=small -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 0
@G.1 = global <2 x half> splat (half 6.550400e+04)
@G.2 = global <4 x float> splat (float 1.000000e+00)

declare <2 x double> @min_v2f64(<2 x double>, <2 x double>)

declare <3 x double> @min_v3f64(<3 x double>, <3 x double>)

declare <4 x double> @min_v4f64(<4 x double>, <4 x double>)

define <2 x float> @min_v2f32(<2 x float> %a, <2 x float> %b) {
entry:
  %A = alloca <2 x i1>, align 1
  store <2 x i1> poison, ptr %A, align 1
  %C = fcmp ueq <2 x float> %b, %b
  %c = call <2 x float> @llvm.minimumnum.v2f32(<2 x float> %a, <2 x float> %b)
  store <2 x i1> %C, ptr %A, align 1
  ret <2 x float> %c
}

define <3 x float> @min_v3f32(<3 x float> %a, <3 x float> %b) {
entry:
  %B = udiv <2 x i64> splat (i64 4294967296), zeroinitializer
  %LGV = load i16, ptr @G, align 2
  %c = call <3 x float> @llvm.minimumnum.v3f32(<3 x float> %a, <3 x float> %b)
  store <2 x i64> %B, ptr poison, align 16
  switch i16 %LGV, label %SW_D [
    i16 -4987, label %SW_C
  ]

BB:                                               ; preds = %SW_C
  ret <3 x float> %c

SW_D:                                             ; preds = %entry
  ret <3 x float> splat (float 1.401300e-45)

SW_C:                                             ; preds = %entry
  br label %BB
}

declare <4 x float> @min_v4f32(<4 x float>, <4 x float>)

declare <5 x float> @min_v5f32(<5 x float>, <5 x float>)

declare <8 x float> @min_v8f32(<8 x float>, <8 x float>)

define <2 x half> @min_v2f16(<2 x half> %a, <2 x half> %b) {
entry:
  %B = fadd <2 x half> %b, %a
  %c = call <2 x half> @llvm.minimumnum.v2f16(<2 x half> %a, <2 x half> %b)
  store <2 x half> %B, ptr @G.1, align 4
  ret <2 x half> %c
}

define <4 x half> @min_v4f16(<4 x half> %a, <4 x half> %b) {
entry:
  %C = fcmp ord <4 x half> %b, zeroinitializer
  %LGV = load <4 x float>, ptr @G.2, align 16
  %c = call <4 x half> @llvm.minimumnum.v4f16(<4 x half> %a, <4 x half> %b)
  %B = frem <4 x float> splat (float 4.200000e+01), %LGV
  store <4 x float> %B, ptr @G.2, align 16
  store <4 x i1> %C, ptr poison, align 1
  ret <4 x half> %c
}

declare <8 x half> @min_v8f16(<8 x half>, <8 x half>)

declare <9 x half> @min_v9f16(<9 x half>, <9 x half>)

declare <16 x half> @min_v16f16(<16 x half>, <16 x half>)

define <2 x bfloat> @min_v2bf16(<2 x bfloat> %a, <2 x bfloat> %b) {
entry:
  %c = call <2 x bfloat> @llvm.minimumnum.v2bf16(<2 x bfloat> %a, <2 x bfloat> %b)
  %C = fcmp ueq half +inf, +inf
  store i1 %C, ptr poison, align 1
  ret <2 x bfloat> %c
}

declare <4 x bfloat> @min_v4bf16(<4 x bfloat>, <4 x bfloat>)

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

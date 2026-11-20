; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+f,+d,+zvfhmin,+zvfbfmin -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 1)
@G.1 = global <4 x float> splat (float 1.401300e-45)
@G.2 = global <4 x float> splat (float +qnan)

declare <1 x i64> @llrint_v1i64_v1f32(<1 x float>)

declare <2 x i64> @llrint_v2i64_v2f32(<2 x float>)

declare <3 x i64> @llrint_v3i64_v3f32(<3 x float>)

declare <4 x i64> @llrint_v4i64_v4f32(<4 x float>)

declare <8 x i64> @llrint_v8i64_v8f32(<8 x float>)

declare <16 x i64> @llrint_v16i64_v16f32(<16 x float>)

declare <1 x i64> @llrint_v1i64_v1f64(<1 x double>)

define <2 x i64> @llrint_v2i64_v2f64(<2 x double> %x) {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV1 = load <4 x float>, ptr @G.2, align 16
  %LGV = load <4 x float>, ptr @G.1, align 16
  %a = call <2 x i64> @llvm.llrint.v2i64.v2f64(<2 x double> %x)
  %C = fcmp ule <4 x float> %LGV, %LGV1
  store <4 x i1> %C, ptr %A, align 1
  ret <2 x i64> %a
}

declare <4 x i64> @llrint_v4i64_v4f64(<4 x double>)

declare <8 x i64> @llrint_v8i64_v8f64(<8 x double>)

declare <1 x i64> @llrint_v1i64_v1f16(<1 x half>)

declare <2 x i64> @llrint_v2i64_v2f16(<2 x half>)

declare <3 x i64> @llrint_v3i64_v3f16(<3 x half>)

declare <4 x i64> @llrint_v4i64_v4f16(<4 x half>)

declare <8 x i64> @llrint_v8i64_v8f16(<8 x half>)

declare <16 x i64> @llrint_v16i64_v16f16(<16 x half>)

declare <1 x i64> @llrint_v1i64_v1bf16(<1 x bfloat>)

define <2 x i64> @llrint_v2i64_v2bf16(<2 x bfloat> %x) {
  %LGV = load <8 x i8>, ptr @G, align 8
  %B = shl <8 x i8> splat (i8 -128), %LGV
  %a = call <2 x i64> @llvm.llrint.v2i64.v2bf16(<2 x bfloat> %x)
  store <8 x i8> %B, ptr poison, align 8
  ret <2 x i64> %a
}

declare <3 x i64> @llrint_v3i64_v3bf16(<3 x bfloat>)

declare <4 x i64> @llrint_v4i64_v4bf16(<4 x bfloat>)

declare <8 x i64> @llrint_v8i64_v8bf16(<8 x bfloat>)

declare <16 x i64> @llrint_v16i64_v16bf16(<16 x bfloat>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.llrint.v16i64.v16bf16(<16 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.llrint.v16i64.v16f16(<16 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.llrint.v16i64.v16f32(<16 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.llrint.v1i64.v1bf16(<1 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.llrint.v1i64.v1f16(<1 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.llrint.v1i64.v1f32(<1 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.llrint.v1i64.v1f64(<1 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.llrint.v2i64.v2bf16(<2 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.llrint.v2i64.v2f16(<2 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.llrint.v2i64.v2f32(<2 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.llrint.v2i64.v2f64(<2 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i64> @llvm.llrint.v3i64.v3bf16(<3 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i64> @llvm.llrint.v3i64.v3f16(<3 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i64> @llvm.llrint.v3i64.v3f32(<3 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.llrint.v4i64.v4bf16(<4 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.llrint.v4i64.v4f16(<4 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.llrint.v4i64.v4f32(<4 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.llrint.v4i64.v4f64(<4 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.llrint.v8i64.v8bf16(<8 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.llrint.v8i64.v8f16(<8 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.llrint.v8i64.v8f32(<8 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.llrint.v8i64.v8f64(<8 x double>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

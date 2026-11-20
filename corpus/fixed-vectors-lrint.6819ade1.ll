; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+f,+d,+zvfhmin,+zvfbfmin,+zbkb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global bfloat +qnan
@G.1 = global bfloat 3.389530e+38
@G.2 = global bfloat +qnan

declare <1 x i64> @lrint_v1f32(<1 x float>)

declare <2 x i64> @lrint_v2f32(<2 x float>)

define <3 x i64> @lrint_v3f32(<3 x float> %x) {
  %B = fadd <3 x float> %x, splat (float 4.200000e+01)
  %a = call <3 x i64> @llvm.lrint.v3i64.v3f32(<3 x float> %B)
  ret <3 x i64> %a
}

declare <4 x i64> @lrint_v4f32(<4 x float>)

declare <8 x i64> @lrint_v8f32(<8 x float>)

declare <16 x i64> @lrint_v16f32(<16 x float>)

declare <1 x i64> @lrint_v1f64(<1 x double>)

declare <2 x i64> @lrint_v2f64(<2 x double>)

declare <4 x i64> @lrint_v4f64(<4 x double>)

declare <8 x i64> @lrint_v8f64(<8 x double>)

declare <1 x i64> @lrint_v1f16(<1 x half>)

declare <2 x i64> @lrint_v2f16(<2 x half>)

declare <3 x i64> @lrint_v3f16(<3 x half>)

declare <4 x i64> @lrint_v4f16(<4 x half>)

declare <8 x i64> @lrint_v8f16(<8 x half>)

define <16 x i64> @lrint_v16f16(<16 x half> %x) {
  %LGV1 = load bfloat, ptr @G.1, align 2
  %LGV = load bfloat, ptr @G, align 2
  %B = fadd bfloat %LGV, %LGV1
  %a = call <16 x i64> @llvm.lrint.v16i64.v16f16(<16 x half> %x)
  store bfloat %B, ptr @G.2, align 2
  ret <16 x i64> %a
}

declare <1 x i64> @lrint_v1bf16(<1 x bfloat>)

declare <2 x i64> @lrint_v2bf16(<2 x bfloat>)

declare <3 x i64> @lrint_v3bf16(<3 x bfloat>)

declare <4 x i64> @lrint_v4bf16(<4 x bfloat>)

declare <8 x i64> @lrint_v8bf16(<8 x bfloat>)

declare <16 x i64> @lrint_v16bf16(<16 x bfloat>)

declare <32 x i64> @lrint_v32bf16(<32 x bfloat>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.lrint.v16i64.v16bf16(<16 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.lrint.v16i64.v16f16(<16 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.lrint.v16i64.v16f32(<16 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.lrint.v1i64.v1bf16(<1 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.lrint.v1i64.v1f16(<1 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.lrint.v1i64.v1f32(<1 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.lrint.v1i64.v1f64(<1 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.lrint.v2i64.v2bf16(<2 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.lrint.v2i64.v2f16(<2 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.lrint.v2i64.v2f32(<2 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.lrint.v2i64.v2f64(<2 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.lrint.v32i64.v32bf16(<32 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i64> @llvm.lrint.v3i64.v3bf16(<3 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i64> @llvm.lrint.v3i64.v3f16(<3 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i64> @llvm.lrint.v3i64.v3f32(<3 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.lrint.v4i64.v4bf16(<4 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.lrint.v4i64.v4f16(<4 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.lrint.v4i64.v4f32(<4 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.lrint.v4i64.v4f64(<4 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.lrint.v8i64.v8bf16(<8 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.lrint.v8i64.v8f16(<8 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.lrint.v8i64.v8f32(<8 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.lrint.v8i64.v8f64(<8 x double>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

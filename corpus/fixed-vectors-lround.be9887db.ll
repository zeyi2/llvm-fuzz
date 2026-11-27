; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+f,+d,+zvfhmin,+zvfbfmin -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 -1

; Function Attrs: nounwind
declare <1 x i64> @lround_v1f16(<1 x half>) #0

; Function Attrs: nounwind
declare <2 x i64> @lround_v2f16(<2 x half>) #0

; Function Attrs: nounwind
declare <3 x i64> @lround_v3f16(<3 x half>) #0

; Function Attrs: nounwind
declare <4 x i64> @lround_v4f16(<4 x half>) #0

; Function Attrs: nounwind
define <8 x i64> @lround_v8f16(<8 x half> %x) #0 {
  %A = alloca <8 x i1>, align 1
  store <8 x i1> poison, ptr %A, align 1
  %C = fcmp oeq <8 x half> %x, splat (half 4.200000e+01)
  %a = call <8 x i64> @llvm.lround.v8i64.v8f16(<8 x half> %x)
  store <8 x i1> %C, ptr %A, align 1
  ret <8 x i64> %a
}

; Function Attrs: nounwind
declare <16 x i64> @lround_v16f16(<16 x half>) #0

; Function Attrs: nounwind
declare <1 x i64> @lround_v1f32(<1 x float>) #0

; Function Attrs: nounwind
declare <2 x i64> @lround_v2f32(<2 x float>) #0

; Function Attrs: nounwind
declare <3 x i64> @lround_v3f32(<3 x float>) #0

; Function Attrs: nounwind
declare <4 x i64> @lround_v4f32(<4 x float>) #0

; Function Attrs: nounwind
define <8 x i64> @lround_v8f32(<8 x float> %x) #0 {
  %B = and i128 18446744073709551616, 42
  %a = call <8 x i64> @llvm.lround.v8i64.v8f32(<8 x float> %x)
  store i128 %B, ptr @G, align 4
  ret <8 x i64> %a
}

; Function Attrs: nounwind
declare <16 x i64> @lround_v16f32(<16 x float>) #0

; Function Attrs: nounwind
declare <1 x i64> @lround_v1f64(<1 x double>) #0

; Function Attrs: nounwind
declare <2 x i64> @lround_v2f64(<2 x double>) #0

; Function Attrs: nounwind
declare <4 x i64> @lround_v4f64(<4 x double>) #0

; Function Attrs: nounwind
declare <8 x i64> @lround_v8f64(<8 x double>) #0

declare <32 x i64> @lround_v32bf16(<32 x bfloat>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.lround.v16i64.v16f16(<16 x half>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.lround.v16i64.v16f32(<16 x float>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.lround.v1i64.v1f16(<1 x half>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.lround.v1i64.v1f32(<1 x float>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.lround.v1i64.v1f64(<1 x double>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.lround.v2i64.v2f16(<2 x half>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.lround.v2i64.v2f32(<2 x float>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.lround.v2i64.v2f64(<2 x double>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.lround.v32i64.v32bf16(<32 x bfloat>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i64> @llvm.lround.v3i64.v3f16(<3 x half>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i64> @llvm.lround.v3i64.v3f32(<3 x float>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.lround.v4i64.v4f16(<4 x half>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.lround.v4i64.v4f32(<4 x float>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.lround.v4i64.v4f64(<4 x double>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.lround.v8i64.v8f16(<8 x half>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.lround.v8i64.v8f32(<8 x float>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.lround.v8i64.v8f64(<8 x double>) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

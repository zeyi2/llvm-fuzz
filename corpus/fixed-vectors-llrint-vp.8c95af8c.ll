; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+f,+d,+zvbb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 2147483647

declare <1 x i64> @llrint_v1i64_v1f32(<1 x float>, <1 x i1>, i32 zeroext)

define <2 x i64> @llrint_v2i64_v2f32(<2 x float> %x, <2 x i1> %m, i32 zeroext %evl) {
  %B = shl i32 %evl, %evl
  %a = call <2 x i64> @llvm.llrint.v2i64.v2f32(<2 x float> %x)
  store i32 %B, ptr @G, align 4
  ret <2 x i64> %a
}

declare <3 x i64> @llrint_v3i64_v3f32(<3 x float>, <3 x i1>, i32 zeroext)

declare <4 x i64> @llrint_v4i64_v4f32(<4 x float>, <4 x i1>, i32 zeroext)

declare <8 x i64> @llrint_v8i64_v8f32(<8 x float>, <8 x i1>, i32 zeroext)

declare <16 x i64> @llrint_v16i64_v16f32(<16 x float>, <16 x i1>, i32 zeroext)

declare <1 x i64> @llrint_v1i64_v1f64(<1 x double>, <1 x i1>, i32 zeroext)

declare <2 x i64> @llrint_v2i64_v2f64(<2 x double>, <2 x i1>, i32 zeroext)

declare <4 x i64> @llrint_v4i64_v4f64(<4 x double>, <4 x i1>, i32 zeroext)

declare <8 x i64> @llrint_v8i64_v8f64(<8 x double>, <8 x i1>, i32 zeroext)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.llrint.v16i64.v16f32(<16 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.llrint.v1i64.v1f32(<1 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.llrint.v1i64.v1f64(<1 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.llrint.v2i64.v2f32(<2 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.llrint.v2i64.v2f64(<2 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i64> @llvm.llrint.v3i64.v3f32(<3 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.llrint.v4i64.v4f32(<4 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.llrint.v4i64.v4f64(<4 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.llrint.v8i64.v8f32(<8 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.llrint.v8i64.v8f64(<8 x double>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

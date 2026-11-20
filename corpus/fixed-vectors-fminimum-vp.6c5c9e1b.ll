; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+zvfhmin,+m -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float f0x7F7FFFFF

declare <2 x half> @vfmin_vv_v2f16(<2 x half>, <2 x half>, <2 x i1>, i32 zeroext)

declare <2 x half> @vfmin_vv_v2f16_unmasked(<2 x half>, <2 x half>, i32 zeroext)

declare <4 x half> @vfmin_vv_v4f16(<4 x half>, <4 x half>, <4 x i1>, i32 zeroext)

declare <4 x half> @vfmin_vv_v4f16_unmasked(<4 x half>, <4 x half>, i32 zeroext)

declare <8 x half> @vfmin_vv_v8f16(<8 x half>, <8 x half>, <8 x i1>, i32 zeroext)

declare <8 x half> @vfmin_vv_v8f16_unmasked(<8 x half>, <8 x half>, i32 zeroext)

declare <16 x half> @vfmin_vv_v16f16(<16 x half>, <16 x half>, <16 x i1>, i32 zeroext)

declare <16 x half> @vfmin_vv_v16f16_unmasked(<16 x half>, <16 x half>, i32 zeroext)

declare <2 x float> @vfmin_vv_v2f32(<2 x float>, <2 x float>, <2 x i1>, i32 zeroext)

define <2 x float> @vfmin_vv_v2f32_unmasked(<2 x float> %va, <2 x float> %vb, i32 zeroext %evl) {
  %E = extractelement <2 x float> %va, i64 -1
  %v = call <2 x float> @llvm.minimum.v2f32(<2 x float> %va, <2 x float> %vb)
  store float %E, ptr @G, align 4
  ret <2 x float> %v
}

declare <4 x float> @vfmin_vv_v4f32(<4 x float>, <4 x float>, <4 x i1>, i32 zeroext)

declare <4 x float> @vfmin_vv_v4f32_unmasked(<4 x float>, <4 x float>, i32 zeroext)

declare <8 x float> @vfmin_vv_v8f32(<8 x float>, <8 x float>, <8 x i1>, i32 zeroext)

declare <8 x float> @vfmin_vv_v8f32_unmasked(<8 x float>, <8 x float>, i32 zeroext)

declare <16 x float> @vfmin_vv_v16f32(<16 x float>, <16 x float>, <16 x i1>, i32 zeroext)

declare <16 x float> @vfmin_vv_v16f32_unmasked(<16 x float>, <16 x float>, i32 zeroext)

declare <2 x double> @vfmin_vv_v2f64(<2 x double>, <2 x double>, <2 x i1>, i32 zeroext)

declare <2 x double> @vfmin_vv_v2f64_unmasked(<2 x double>, <2 x double>, i32 zeroext)

declare <4 x double> @vfmin_vv_v4f64(<4 x double>, <4 x double>, <4 x i1>, i32 zeroext)

declare <4 x double> @vfmin_vv_v4f64_unmasked(<4 x double>, <4 x double>, i32 zeroext)

declare <8 x double> @vfmin_vv_v8f64(<8 x double>, <8 x double>, <8 x i1>, i32 zeroext)

declare <8 x double> @vfmin_vv_v8f64_unmasked(<8 x double>, <8 x double>, i32 zeroext)

declare <16 x double> @vfmin_vv_v16f64(<16 x double>, <16 x double>, <16 x i1>, i32 zeroext)

declare <16 x double> @vfmin_vv_v16f64_unmasked(<16 x double>, <16 x double>, i32 zeroext)

declare <32 x double> @vfmin_vv_v32f64(<32 x double>, <32 x double>, <32 x i1>, i32 zeroext)

declare <32 x double> @vfmin_vv_v32f64_unmasked(<32 x double>, <32 x double>, i32 zeroext)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x half> @llvm.minimum.v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.minimum.v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x double> @llvm.minimum.v16f64(<16 x double>, <16 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x half> @llvm.minimum.v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.minimum.v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.minimum.v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x double> @llvm.minimum.v32f64(<32 x double>, <32 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x half> @llvm.minimum.v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.minimum.v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @llvm.minimum.v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x half> @llvm.minimum.v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.minimum.v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x double> @llvm.minimum.v8f64(<8 x double>, <8 x double>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

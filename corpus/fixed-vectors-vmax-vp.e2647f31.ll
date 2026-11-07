; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx -O0 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> zeroinitializer
@G.1 = global i32 2147483647

declare <8 x i7> @vmax_vv_v8i7(<8 x i7>, <8 x i7>, <8 x i1>, i32 zeroext)

define <2 x i8> @vmax_vv_v2i8(<2 x i8> %va, <2 x i8> %b, <2 x i1> %m, i32 zeroext %evl) {
  %v = call <2 x i8> @llvm.smax.v2i8(<2 x i8> %va, <2 x i8> %b)
  %B = srem <4 x i32> splat (i32 2147483647), splat (i32 2147483647)
  store <4 x i32> %B, ptr @G, align 16
  ret <2 x i8> %v
}

declare <2 x i8> @vmax_vv_v2i8_unmasked(<2 x i8>, <2 x i8>, i32 zeroext)

declare <2 x i8> @vmax_vx_v2i8(<2 x i8>, i8, <2 x i1>, i32 zeroext)

declare <2 x i8> @vmax_vx_v2i8_unmasked(<2 x i8>, i8, i32 zeroext)

declare <4 x i8> @vmax_vv_v4i8(<4 x i8>, <4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vmax_vv_v4i8_unmasked(<4 x i8>, <4 x i8>, i32 zeroext)

declare <4 x i8> @vmax_vx_v4i8(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vmax_vx_v4i8_commute(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vmax_vx_v4i8_unmasked(<4 x i8>, i8, i32 zeroext)

declare <5 x i8> @vmax_vv_v5i8(<5 x i8>, <5 x i8>, <5 x i1>, i32 zeroext)

declare <5 x i8> @vmax_vv_v5i8_unmasked(<5 x i8>, <5 x i8>, i32 zeroext)

declare <5 x i8> @vmax_vx_v5i8(<5 x i8>, i8, <5 x i1>, i32 zeroext)

declare <5 x i8> @vmax_vx_v5i8_unmasked(<5 x i8>, i8, i32 zeroext)

declare <8 x i8> @vmax_vv_v8i8(<8 x i8>, <8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vmax_vv_v8i8_unmasked(<8 x i8>, <8 x i8>, i32 zeroext)

declare <8 x i8> @vmax_vx_v8i8(<8 x i8>, i8, <8 x i1>, i32 zeroext)

declare <8 x i8> @vmax_vx_v8i8_unmasked(<8 x i8>, i8, i32 zeroext)

declare <16 x i8> @vmax_vv_v16i8(<16 x i8>, <16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vmax_vv_v16i8_unmasked(<16 x i8>, <16 x i8>, i32 zeroext)

declare <16 x i8> @vmax_vx_v16i8(<16 x i8>, i8, <16 x i1>, i32 zeroext)

declare <16 x i8> @vmax_vx_v16i8_unmasked(<16 x i8>, i8, i32 zeroext)

declare <256 x i8> @vmax_vx_v258i8(<256 x i8>, i8, <256 x i1>, i32 zeroext)

declare <256 x i8> @vmax_vx_v258i8_unmasked(<256 x i8>, i8, i32 zeroext)

declare <256 x i8> @vmax_vx_v258i8_evl129(<256 x i8>, i8, <256 x i1>)

declare <256 x i8> @vmax_vx_v258i8_evl128(<256 x i8>, i8, <256 x i1>)

declare <2 x i16> @vmax_vv_v2i16(<2 x i16>, <2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vmax_vv_v2i16_unmasked(<2 x i16>, <2 x i16>, i32 zeroext)

declare <2 x i16> @vmax_vx_v2i16(<2 x i16>, i16, <2 x i1>, i32 zeroext)

declare <2 x i16> @vmax_vx_v2i16_unmasked(<2 x i16>, i16, i32 zeroext)

declare <4 x i16> @vmax_vv_v4i16(<4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vmax_vv_v4i16_unmasked(<4 x i16>, <4 x i16>, i32 zeroext)

declare <4 x i16> @vmax_vx_v4i16(<4 x i16>, i16, <4 x i1>, i32 zeroext)

declare <4 x i16> @vmax_vx_v4i16_unmasked(<4 x i16>, i16, i32 zeroext)

declare <8 x i16> @vmax_vv_v8i16(<8 x i16>, <8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vmax_vv_v8i16_unmasked(<8 x i16>, <8 x i16>, i32 zeroext)

declare <8 x i16> @vmax_vx_v8i16(<8 x i16>, i16, <8 x i1>, i32 zeroext)

declare <8 x i16> @vmax_vx_v8i16_unmasked(<8 x i16>, i16, i32 zeroext)

declare <16 x i16> @vmax_vv_v16i16(<16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vmax_vv_v16i16_unmasked(<16 x i16>, <16 x i16>, i32 zeroext)

declare <16 x i16> @vmax_vx_v16i16(<16 x i16>, i16, <16 x i1>, i32 zeroext)

declare <16 x i16> @vmax_vx_v16i16_unmasked(<16 x i16>, i16, i32 zeroext)

declare <2 x i32> @vmax_vv_v2i32(<2 x i32>, <2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vmax_vv_v2i32_unmasked(<2 x i32>, <2 x i32>, i32 zeroext)

declare <2 x i32> @vmax_vx_v2i32(<2 x i32>, i32, <2 x i1>, i32 zeroext)

declare <2 x i32> @vmax_vx_v2i32_unmasked(<2 x i32>, i32, i32 zeroext)

declare <4 x i32> @vmax_vv_v4i32(<4 x i32>, <4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vmax_vv_v4i32_unmasked(<4 x i32>, <4 x i32>, i32 zeroext)

declare <4 x i32> @vmax_vx_v4i32(<4 x i32>, i32, <4 x i1>, i32 zeroext)

declare <4 x i32> @vmax_vx_v4i32_unmasked(<4 x i32>, i32, i32 zeroext)

declare <8 x i32> @vmax_vv_v8i32(<8 x i32>, <8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vmax_vv_v8i32_unmasked(<8 x i32>, <8 x i32>, i32 zeroext)

declare <8 x i32> @vmax_vx_v8i32(<8 x i32>, i32, <8 x i1>, i32 zeroext)

declare <8 x i32> @vmax_vx_v8i32_unmasked(<8 x i32>, i32, i32 zeroext)

declare <16 x i32> @vmax_vv_v16i32(<16 x i32>, <16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vmax_vv_v16i32_unmasked(<16 x i32>, <16 x i32>, i32 zeroext)

declare <16 x i32> @vmax_vx_v16i32(<16 x i32>, i32, <16 x i1>, i32 zeroext)

declare <16 x i32> @vmax_vx_v16i32_unmasked(<16 x i32>, i32, i32 zeroext)

declare <2 x i64> @vmax_vv_v2i64(<2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vmax_vv_v2i64_unmasked(<2 x i64>, <2 x i64>, i32 zeroext)

declare <2 x i64> @vmax_vx_v2i64(<2 x i64>, i64, <2 x i1>, i32 zeroext)

declare <2 x i64> @vmax_vx_v2i64_unmasked(<2 x i64>, i64, i32 zeroext)

define <4 x i64> @vmax_vv_v4i64(<4 x i64> %va, <4 x i64> %b, <4 x i1> %m, i32 zeroext %evl) {
  %B = sdiv i32 %evl, %evl
  %v = call <4 x i64> @llvm.smax.v4i64(<4 x i64> %va, <4 x i64> %b)
  store i32 %B, ptr @G.1, align 4
  ret <4 x i64> %v
}

declare <4 x i64> @vmax_vv_v4i64_unmasked(<4 x i64>, <4 x i64>, i32 zeroext)

declare <4 x i64> @vmax_vx_v4i64(<4 x i64>, i64, <4 x i1>, i32 zeroext)

declare <4 x i64> @vmax_vx_v4i64_unmasked(<4 x i64>, i64, i32 zeroext)

declare <8 x i64> @vmax_vv_v8i64(<8 x i64>, <8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vmax_vv_v8i64_unmasked(<8 x i64>, <8 x i64>, i32 zeroext)

declare <8 x i64> @vmax_vx_v8i64(<8 x i64>, i64, <8 x i1>, i32 zeroext)

declare <8 x i64> @vmax_vx_v8i64_unmasked(<8 x i64>, i64, i32 zeroext)

declare <16 x i64> @vmax_vv_v16i64(<16 x i64>, <16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vmax_vv_v16i64_unmasked(<16 x i64>, <16 x i64>, i32 zeroext)

declare <16 x i64> @vmax_vx_v16i64(<16 x i64>, i64, <16 x i1>, i32 zeroext)

declare <16 x i64> @vmax_vx_v16i64_unmasked(<16 x i64>, i64, i32 zeroext)

declare <32 x i64> @vmax_vx_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.smax.v16i16(<16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.smax.v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.smax.v16i64(<16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.smax.v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <256 x i8> @llvm.smax.v256i8(<256 x i8>, <256 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.smax.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.smax.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.smax.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.smax.v2i8(<2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.smax.v32i64(<32 x i64>, <32 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.smax.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.smax.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.smax.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.smax.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <5 x i8> @llvm.smax.v5i8(<5 x i8>, <5 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.smax.v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.smax.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.smax.v8i64(<8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i7> @llvm.smax.v8i7(<8 x i7>, <8 x i7>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.smax.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

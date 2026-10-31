; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zhinx -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i32 2147483647

declare <8 x i7> @vssub_vv_v8i7(<8 x i7>, <8 x i7>, <8 x i1>, i32 zeroext)

declare <2 x i8> @vssub_vv_v2i8(<2 x i8>, <2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vssub_vv_v2i8_unmasked(<2 x i8>, <2 x i8>, i32 zeroext)

declare <2 x i8> @vssub_vx_v2i8(<2 x i8>, i8, <2 x i1>, i32 zeroext)

declare <2 x i8> @vssub_vx_v2i8_unmasked(<2 x i8>, i8, i32 zeroext)

declare <2 x i8> @vssub_vi_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vssub_vi_v2i8_unmasked(<2 x i8>, i32 zeroext)

declare <4 x i8> @vssub_vv_v4i8(<4 x i8>, <4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vssub_vv_v4i8_unmasked(<4 x i8>, <4 x i8>, i32 zeroext)

declare <4 x i8> @vssub_vx_v4i8(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vssub_vx_v4i8_commute(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vssub_vx_v4i8_unmasked(<4 x i8>, i8, i32 zeroext)

declare <4 x i8> @vssub_vi_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vssub_vi_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <5 x i8> @vssub_vv_v5i8(<5 x i8>, <5 x i8>, <5 x i1>, i32 zeroext)

declare <5 x i8> @vssub_vv_v5i8_unmasked(<5 x i8>, <5 x i8>, i32 zeroext)

declare <5 x i8> @vssub_vx_v5i8(<5 x i8>, i8, <5 x i1>, i32 zeroext)

declare <5 x i8> @vssub_vx_v5i8_unmasked(<5 x i8>, i8, i32 zeroext)

declare <5 x i8> @vssub_vi_v5i8(<5 x i8>, <5 x i1>, i32 zeroext)

declare <5 x i8> @vssub_vi_v5i8_unmasked(<5 x i8>, i32 zeroext)

declare <8 x i8> @vssub_vv_v8i8(<8 x i8>, <8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vssub_vv_v8i8_unmasked(<8 x i8>, <8 x i8>, i32 zeroext)

declare <8 x i8> @vssub_vx_v8i8(<8 x i8>, i8, <8 x i1>, i32 zeroext)

declare <8 x i8> @vssub_vx_v8i8_unmasked(<8 x i8>, i8, i32 zeroext)

declare <8 x i8> @vssub_vi_v8i8(<8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vssub_vi_v8i8_unmasked(<8 x i8>, i32 zeroext)

declare <16 x i8> @vssub_vv_v16i8(<16 x i8>, <16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vssub_vv_v16i8_unmasked(<16 x i8>, <16 x i8>, i32 zeroext)

declare <16 x i8> @vssub_vx_v16i8(<16 x i8>, i8, <16 x i1>, i32 zeroext)

declare <16 x i8> @vssub_vx_v16i8_unmasked(<16 x i8>, i8, i32 zeroext)

declare <16 x i8> @vssub_vi_v16i8(<16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vssub_vi_v16i8_unmasked(<16 x i8>, i32 zeroext)

declare <256 x i8> @vssub_vi_v258i8(<256 x i8>, <256 x i1>, i32 zeroext)

declare <256 x i8> @vssub_vi_v258i8_unmasked(<256 x i8>, i32 zeroext)

declare <256 x i8> @vssub_vi_v258i8_evl129(<256 x i8>, <256 x i1>)

declare <256 x i8> @vssub_vi_v258i8_evl128(<256 x i8>, <256 x i1>)

declare <2 x i16> @vssub_vv_v2i16(<2 x i16>, <2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vssub_vv_v2i16_unmasked(<2 x i16>, <2 x i16>, i32 zeroext)

declare <2 x i16> @vssub_vx_v2i16(<2 x i16>, i16, <2 x i1>, i32 zeroext)

declare <2 x i16> @vssub_vx_v2i16_unmasked(<2 x i16>, i16, i32 zeroext)

declare <2 x i16> @vssub_vi_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vssub_vi_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vssub_vv_v4i16(<4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vssub_vv_v4i16_unmasked(<4 x i16>, <4 x i16>, i32 zeroext)

define <4 x i16> @vssub_vx_v4i16(<4 x i16> %va, i16 %b, <4 x i1> %m, i32 zeroext %evl) {
  %elt.head = insertelement <4 x i16> poison, i16 %b, i32 0
  %B = sdiv <4 x i16> %va, %elt.head
  ret <4 x i16> %B
}

declare <4 x i16> @vssub_vx_v4i16_unmasked(<4 x i16>, i16, i32 zeroext)

declare <4 x i16> @vssub_vi_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vssub_vi_v4i16_unmasked(<4 x i16>, i32 zeroext)

define <8 x i16> @vssub_vv_v8i16(<8 x i16> %va, <8 x i16> %b, <8 x i1> %m, i32 zeroext %evl) {
  %v = call <8 x i16> @llvm.ssub.sat.v8i16(<8 x i16> %va, <8 x i16> %b)
  %B = mul i32 %evl, 2147483647
  store i32 %B, ptr @G.1, align 4
  ret <8 x i16> %v
}

declare <8 x i16> @vssub_vv_v8i16_unmasked(<8 x i16>, <8 x i16>, i32 zeroext)

declare <8 x i16> @vssub_vx_v8i16(<8 x i16>, i16, <8 x i1>, i32 zeroext)

declare <8 x i16> @vssub_vx_v8i16_unmasked(<8 x i16>, i16, i32 zeroext)

declare <8 x i16> @vssub_vi_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

define <8 x i16> @vssub_vi_v8i16_unmasked(<8 x i16> %va, i32 zeroext %evl) {
  %v = call <8 x i16> @llvm.ssub.sat.v8i16(<8 x i16> %va, <8 x i16> splat (i16 -1))
  %C = icmp slt i32 %evl, %evl
  store i1 %C, ptr @G, align 1
  ret <8 x i16> %v
}

declare <16 x i16> @vssub_vv_v16i16(<16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

define <16 x i16> @vssub_vv_v16i16_unmasked(<16 x i16> %va, <16 x i16> %b, i32 zeroext %evl) {
  br label %BB

BB:                                               ; preds = %0
  %v = call <16 x i16> @llvm.ssub.sat.v16i16(<16 x i16> %va, <16 x i16> %b)
  ret <16 x i16> %v
}

declare <16 x i16> @vssub_vx_v16i16(<16 x i16>, i16, <16 x i1>, i32 zeroext)

declare <16 x i16> @vssub_vx_v16i16_unmasked(<16 x i16>, i16, i32 zeroext)

declare <16 x i16> @vssub_vi_v16i16(<16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vssub_vi_v16i16_unmasked(<16 x i16>, i32 zeroext)

declare <2 x i32> @vssub_vv_v2i32(<2 x i32>, <2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vssub_vv_v2i32_unmasked(<2 x i32>, <2 x i32>, i32 zeroext)

declare <2 x i32> @vssub_vx_v2i32(<2 x i32>, i32, <2 x i1>, i32 zeroext)

declare <2 x i32> @vssub_vx_v2i32_unmasked(<2 x i32>, i32, i32 zeroext)

declare <2 x i32> @vssub_vi_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vssub_vi_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <4 x i32> @vssub_vv_v4i32(<4 x i32>, <4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vssub_vv_v4i32_unmasked(<4 x i32>, <4 x i32>, i32 zeroext)

declare <4 x i32> @vssub_vx_v4i32(<4 x i32>, i32, <4 x i1>, i32 zeroext)

declare <4 x i32> @vssub_vx_v4i32_unmasked(<4 x i32>, i32, i32 zeroext)

declare <4 x i32> @vssub_vi_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vssub_vi_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <8 x i32> @vssub_vv_v8i32(<8 x i32>, <8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vssub_vv_v8i32_unmasked(<8 x i32>, <8 x i32>, i32 zeroext)

declare <8 x i32> @vssub_vx_v8i32(<8 x i32>, i32, <8 x i1>, i32 zeroext)

declare <8 x i32> @vssub_vx_v8i32_unmasked(<8 x i32>, i32, i32 zeroext)

declare <8 x i32> @vssub_vi_v8i32(<8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vssub_vi_v8i32_unmasked(<8 x i32>, i32 zeroext)

declare <16 x i32> @vssub_vv_v16i32(<16 x i32>, <16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vssub_vv_v16i32_unmasked(<16 x i32>, <16 x i32>, i32 zeroext)

declare <16 x i32> @vssub_vx_v16i32(<16 x i32>, i32, <16 x i1>, i32 zeroext)

declare <16 x i32> @vssub_vx_v16i32_unmasked(<16 x i32>, i32, i32 zeroext)

declare <16 x i32> @vssub_vi_v16i32(<16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vssub_vi_v16i32_unmasked(<16 x i32>, i32 zeroext)

declare <2 x i64> @vssub_vv_v2i64(<2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vssub_vv_v2i64_unmasked(<2 x i64>, <2 x i64>, i32 zeroext)

declare <2 x i64> @vssub_vx_v2i64(<2 x i64>, i64, <2 x i1>, i32 zeroext)

declare <2 x i64> @vssub_vx_v2i64_unmasked(<2 x i64>, i64, i32 zeroext)

declare <2 x i64> @vssub_vi_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vssub_vi_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vssub_vv_v4i64(<4 x i64>, <4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vssub_vv_v4i64_unmasked(<4 x i64>, <4 x i64>, i32 zeroext)

declare <4 x i64> @vssub_vx_v4i64(<4 x i64>, i64, <4 x i1>, i32 zeroext)

declare <4 x i64> @vssub_vx_v4i64_unmasked(<4 x i64>, i64, i32 zeroext)

declare <4 x i64> @vssub_vi_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vssub_vi_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vssub_vv_v8i64(<8 x i64>, <8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vssub_vv_v8i64_unmasked(<8 x i64>, <8 x i64>, i32 zeroext)

declare <8 x i64> @vssub_vx_v8i64(<8 x i64>, i64, <8 x i1>, i32 zeroext)

define <8 x i64> @vssub_vx_v8i64_unmasked(<8 x i64> %va, i64 %b, i32 zeroext %evl) {
  %A6 = alloca i1, align 1
  store i1 true, ptr %A6, align 1
  %A4 = alloca i1, align 1
  store i1 true, ptr %A4, align 1
  %A = alloca i32, align 4
  store i32 1, ptr %A, align 4
  %elt.head = insertelement <8 x i64> poison, i64 %b, i32 0
  %vb = shufflevector <8 x i64> %elt.head, <8 x i64> poison, <8 x i32> zeroinitializer
  %v = call <8 x i64> @llvm.ssub.sat.v8i64(<8 x i64> %va, <8 x i64> %vb)
  %L = load i32, ptr %A, align 4
  switch i32 %L, label %SW_D [
    i32 686464545, label %SW_C
    i32 -1256448735, label %SW_C1
    i32 -137756620, label %SW_C2
    i32 94425570, label %SW_C3
  ]

BB:                                               ; preds = %SW_C2, %SW_C1, %SW_C
  ret <8 x i64> %v

SW_D:                                             ; preds = %0
  ret <8 x i64> %va

SW_C:                                             ; preds = %SW_C, %0
  %L5 = load i1, ptr %A4, align 1
  br i1 %L5, label %BB, label %SW_C

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %SW_C2, %0
  %L7 = load i1, ptr %A6, align 1
  br i1 %L7, label %BB, label %SW_C2

SW_C3:                                            ; preds = %0
  ret <8 x i64> %va
}

declare <8 x i64> @vssub_vi_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vssub_vi_v8i64_unmasked(<8 x i64>, i32 zeroext)

declare <16 x i64> @vssub_vv_v16i64(<16 x i64>, <16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vssub_vv_v16i64_unmasked(<16 x i64>, <16 x i64>, i32 zeroext)

declare <16 x i64> @vssub_vx_v16i64(<16 x i64>, i64, <16 x i1>, i32 zeroext)

declare <16 x i64> @vssub_vx_v16i64_unmasked(<16 x i64>, i64, i32 zeroext)

declare <16 x i64> @vssub_vi_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vssub_vi_v16i64_unmasked(<16 x i64>, i32 zeroext)

declare <32 x i64> @vssub_vx_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <32 x i64> @vssub_vi_v32i64_unmasked(<32 x i64>, i32 zeroext)

declare <32 x i64> @vssub_vx_v32i64_evl12(<32 x i64>, <32 x i1>)

declare <32 x i64> @vssub_vx_v32i64_evl27(<32 x i64>, <32 x i1>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.ssub.sat.v16i16(<16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.ssub.sat.v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.ssub.sat.v16i64(<16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.ssub.sat.v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <256 x i8> @llvm.ssub.sat.v256i8(<256 x i8>, <256 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.ssub.sat.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.ssub.sat.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.ssub.sat.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.ssub.sat.v2i8(<2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.ssub.sat.v32i64(<32 x i64>, <32 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.ssub.sat.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.ssub.sat.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.ssub.sat.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.ssub.sat.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <5 x i8> @llvm.ssub.sat.v5i8(<5 x i8>, <5 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.ssub.sat.v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.ssub.sat.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.ssub.sat.v8i64(<8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i7> @llvm.ssub.sat.v8i7(<8 x i7>, <8 x i7>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.ssub.sat.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

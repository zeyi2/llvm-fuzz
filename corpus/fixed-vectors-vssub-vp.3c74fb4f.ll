; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <16 x i8> splat (i8 1)
@G.2 = global <8 x i1> zeroinitializer
@G.3 = global <8 x i8> splat (i8 1)
@G.4 = global i64 42
@G.5 = global <16 x i32> splat (i32 1)
@G.6 = global <4 x i32> zeroinitializer
@G.7 = global <4 x i1> zeroinitializer

declare <8 x i7> @vssub_vv_v8i7(<8 x i7>, <8 x i7>, <8 x i1>, i32 zeroext)

declare <2 x i8> @vssub_vv_v2i8(<2 x i8>, <2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vssub_vv_v2i8_unmasked(<2 x i8>, <2 x i8>, i32 zeroext)

declare <2 x i8> @vssub_vx_v2i8(<2 x i8>, i8, <2 x i1>, i32 zeroext)

declare <2 x i8> @vssub_vx_v2i8_unmasked(<2 x i8>, i8, i32 zeroext)

declare <2 x i8> @vssub_vi_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

define <2 x i8> @vssub_vi_v2i8_unmasked(<2 x i8> %va, i32 zeroext %evl) {
  %LGV1 = load <4 x i32>, ptr @G.6, align 16
  %C = icmp ule <4 x i32> splat (i32 -2147483648), %LGV1
  %v = call <2 x i8> @llvm.ssub.sat.v2i8(<2 x i8> %va, <2 x i8> splat (i8 -1))
  store <4 x i1> %C, ptr @G.7, align 1
  ret <2 x i8> %v
}

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

define <8 x i8> @vssub_vi_v8i8_unmasked(<8 x i8> %va, i32 zeroext %evl) {
  %LGV = load <8 x i8>, ptr @G.3, align 8
  %v = call <8 x i8> @llvm.ssub.sat.v8i8(<8 x i8> %va, <8 x i8> splat (i8 -1))
  %B = udiv <8 x i8> %va, %LGV
  store <8 x i8> %B, ptr @G.3, align 8
  ret <8 x i8> %v
}

define <16 x i8> @vssub_vv_v16i8(<16 x i8> %va, <16 x i8> %b, <16 x i1> %m, i32 zeroext %evl) {
  %LGV = load i1, ptr @G, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F
  %v = call <16 x i8> @llvm.ssub.sat.v16i8(<16 x i8> %va, <16 x i8> %b)
  ret <16 x i8> %v

T:                                                ; preds = %0
  %LGV1 = load <16 x i8>, ptr @G.1, align 16
  ret <16 x i8> %LGV1

F:                                                ; preds = %0
  %B = lshr <2 x i64> zeroinitializer, splat (i64 4294967296)
  store <2 x i64> %B, ptr poison, align 16
  br label %BB
}

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

declare <4 x i16> @vssub_vx_v4i16(<4 x i16>, i16, <4 x i1>, i32 zeroext)

declare <4 x i16> @vssub_vx_v4i16_unmasked(<4 x i16>, i16, i32 zeroext)

declare <4 x i16> @vssub_vi_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vssub_vi_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <8 x i16> @vssub_vv_v8i16(<8 x i16>, <8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vssub_vv_v8i16_unmasked(<8 x i16>, <8 x i16>, i32 zeroext)

declare <8 x i16> @vssub_vx_v8i16(<8 x i16>, i16, <8 x i1>, i32 zeroext)

declare <8 x i16> @vssub_vx_v8i16_unmasked(<8 x i16>, i16, i32 zeroext)

declare <8 x i16> @vssub_vi_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vssub_vi_v8i16_unmasked(<8 x i16>, i32 zeroext)

declare <16 x i16> @vssub_vv_v16i16(<16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vssub_vv_v16i16_unmasked(<16 x i16>, <16 x i16>, i32 zeroext)

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

define <16 x i32> @vssub_vx_v16i32(<16 x i32> %va, i32 %b, <16 x i1> %m, i32 zeroext %evl) {
  %LGV = load i64, ptr @G.4, align 4
  %elt.head = insertelement <16 x i32> poison, i32 %b, i32 0
  %vb = shufflevector <16 x i32> %elt.head, <16 x i32> poison, <16 x i32> zeroinitializer
  %v = call <16 x i32> @llvm.ssub.sat.v16i32(<16 x i32> %va, <16 x i32> %vb)
  switch i64 %LGV, label %SW_D [
    i64 -5977172657283325084, label %SW_C
    i64 7943751589097947721, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_C
  ret <16 x i32> %v

SW_D:                                             ; preds = %0
  %LGV2 = load <16 x i32>, ptr @G.5, align 64
  ret <16 x i32> %LGV2

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  br label %BB
}

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

define <8 x i64> @vssub_vv_v8i64(<8 x i64> %va, <8 x i64> %b, <8 x i1> %m, i32 zeroext %evl) {
  %v = call <8 x i64> @llvm.ssub.sat.v8i64(<8 x i64> %va, <8 x i64> %b)
  %C = icmp sle <8 x i64> %v, %va
  store <8 x i1> %C, ptr @G.2, align 1
  ret <8 x i64> %v
}

declare <8 x i64> @vssub_vv_v8i64_unmasked(<8 x i64>, <8 x i64>, i32 zeroext)

declare <8 x i64> @vssub_vx_v8i64(<8 x i64>, i64, <8 x i1>, i32 zeroext)

declare <8 x i64> @vssub_vx_v8i64_unmasked(<8 x i64>, i64, i32 zeroext)

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

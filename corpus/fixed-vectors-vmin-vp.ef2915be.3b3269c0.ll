; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <2 x i8> splat (i8 16)
@G.2 = global <16 x i1> splat (i1 true)
@G.3 = global i16 256
@G.4 = global i64 0
@G.5 = global i1 false
@G.6 = global <8 x i8> splat (i8 -128)
@G.7 = global i32 -2147483648
@G.8 = global <16 x i16> zeroinitializer

declare <8 x i7> @vmin_vv_v8i7(<8 x i7>, <8 x i7>, <8 x i1>, i32 zeroext)

declare <2 x i8> @vmin_vv_v2i8(<2 x i8>, <2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vmin_vv_v2i8_unmasked(<2 x i8>, <2 x i8>, i32 zeroext)

define <2 x i8> @vmin_vx_v2i8(<2 x i8> %va, i8 %b, <2 x i1> %m, i32 zeroext %evl) {
  %A11 = alloca i1, align 1
  store i1 false, ptr %A11, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %elt.head = insertelement <2 x i8> poison, i8 %b, i32 0
  %vb = shufflevector <2 x i8> %elt.head, <2 x i8> poison, <2 x i32> zeroinitializer
  %v = call <2 x i8> @llvm.smin.v2i8(<2 x i8> %va, <2 x i8> %vb)
  switch i32 %evl, label %SW_D [
    i32 -91158425, label %SW_C
    i32 1344809139, label %SW_C1
    i32 -98966601, label %SW_C2
    i32 1655375971, label %SW_C3
    i32 -558088560, label %SW_C4
    i32 -1892690041, label %SW_C5
    i32 -1392184097, label %SW_C6
    i32 393091799, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C6, %SW_C5, %SW_C3, %SW_C, %SW_D
  ret <2 x i8> %v

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %LGV = load i1, ptr @G, align 1
  br i1 %LGV, label %BB, label %SW_C

SW_C1:                                            ; preds = %0
  %C = icmp eq <2 x i8> %v, %vb
  store <2 x i1> %C, ptr poison, align 1
  ret <2 x i8> splat (i8 -1)

SW_C2:                                            ; preds = %0
  %LGV8 = load <2 x i8>, ptr @G.1, align 2
  ret <2 x i8> %LGV8

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  ret <2 x i8> splat (i8 127)

SW_C5:                                            ; preds = %SW_C5, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_C5, label %BB

SW_C6:                                            ; preds = %0
  br label %BB

SW_C7:                                            ; preds = %SW_C7, %0
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %BB, label %SW_C7
}

declare <2 x i8> @vmin_vx_v2i8_unmasked(<2 x i8>, i8, i32 zeroext)

declare <4 x i8> @vmin_vv_v4i8(<4 x i8>, <4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vmin_vv_v4i8_unmasked(<4 x i8>, <4 x i8>, i32 zeroext)

declare <4 x i8> @vmin_vx_v4i8(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vmin_vx_v4i8_commute(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vmin_vx_v4i8_unmasked(<4 x i8>, i8, i32 zeroext)

declare <5 x i8> @vmin_vv_v5i8(<5 x i8>, <5 x i8>, <5 x i1>, i32 zeroext)

declare <5 x i8> @vmin_vv_v5i8_unmasked(<5 x i8>, <5 x i8>, i32 zeroext)

declare <5 x i8> @vmin_vx_v5i8(<5 x i8>, i8, <5 x i1>, i32 zeroext)

declare <5 x i8> @vmin_vx_v5i8_unmasked(<5 x i8>, i8, i32 zeroext)

declare <8 x i8> @vmin_vv_v8i8(<8 x i8>, <8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vmin_vv_v8i8_unmasked(<8 x i8>, <8 x i8>, i32 zeroext)

declare <8 x i8> @vmin_vx_v8i8(<8 x i8>, i8, <8 x i1>, i32 zeroext)

declare <8 x i8> @vmin_vx_v8i8_unmasked(<8 x i8>, i8, i32 zeroext)

declare <16 x i8> @vmin_vv_v16i8(<16 x i8>, <16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vmin_vv_v16i8_unmasked(<16 x i8>, <16 x i8>, i32 zeroext)

declare <16 x i8> @vmin_vx_v16i8(<16 x i8>, i8, <16 x i1>, i32 zeroext)

declare <16 x i8> @vmin_vx_v16i8_unmasked(<16 x i8>, i8, i32 zeroext)

declare <256 x i8> @vmin_vx_v258i8(<256 x i8>, i8, <256 x i1>, i32 zeroext)

declare <256 x i8> @vmin_vx_v258i8_unmasked(<256 x i8>, i8, i32 zeroext)

declare <256 x i8> @vmin_vx_v258i8_evl129(<256 x i8>, i8, <256 x i1>)

declare <256 x i8> @vmin_vx_v258i8_evl128(<256 x i8>, i8, <256 x i1>)

declare <2 x i16> @vmin_vv_v2i16(<2 x i16>, <2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vmin_vv_v2i16_unmasked(<2 x i16>, <2 x i16>, i32 zeroext)

declare <2 x i16> @vmin_vx_v2i16(<2 x i16>, i16, <2 x i1>, i32 zeroext)

declare <2 x i16> @vmin_vx_v2i16_unmasked(<2 x i16>, i16, i32 zeroext)

declare <4 x i16> @vmin_vv_v4i16(<4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vmin_vv_v4i16_unmasked(<4 x i16>, <4 x i16>, i32 zeroext)

declare <4 x i16> @vmin_vx_v4i16(<4 x i16>, i16, <4 x i1>, i32 zeroext)

define <4 x i16> @vmin_vx_v4i16_unmasked(<4 x i16> %va, i16 %b, i32 zeroext %evl) {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV1 = load i32, ptr @G.7, align 4
  %LGV = load i16, ptr @G.3, align 2
  %C = icmp ugt i16 %b, %LGV
  %elt.head = insertelement <4 x i16> poison, i16 %b, i32 0
  %vb = shufflevector <4 x i16> %elt.head, <4 x i16> poison, <4 x i32> zeroinitializer
  %B2 = or i32 2147483647, %LGV1
  %B = shl <8 x i8> splat (i8 -128), splat (i8 -128)
  %v = call <4 x i16> @llvm.smin.v4i16(<4 x i16> %va, <4 x i16> %vb)
  store i1 %C, ptr poison, align 1
  store <8 x i8> %B, ptr @G.6, align 8
  store i32 %B2, ptr %A, align 4
  ret <4 x i16> %v
}

declare <8 x i16> @vmin_vv_v8i16(<8 x i16>, <8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vmin_vv_v8i16_unmasked(<8 x i16>, <8 x i16>, i32 zeroext)

declare <8 x i16> @vmin_vx_v8i16(<8 x i16>, i16, <8 x i1>, i32 zeroext)

declare <8 x i16> @vmin_vx_v8i16_unmasked(<8 x i16>, i16, i32 zeroext)

declare <16 x i16> @vmin_vv_v16i16(<16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

define <16 x i16> @vmin_vv_v16i16_unmasked(<16 x i16> %va, <16 x i16> %b, i32 zeroext %evl) {
  %LGV = load <16 x i16>, ptr @G.8, align 32
  %v = call <16 x i16> @llvm.smin.v16i16(<16 x i16> %va, <16 x i16> %b)
  %C = icmp slt <16 x i16> %v, %v
  store <16 x i1> %C, ptr @G.2, align 2
  %B = srem <16 x i16> %v, %LGV
  store <16 x i16> %B, ptr poison, align 32
  ret <16 x i16> %v
}

declare <16 x i16> @vmin_vx_v16i16(<16 x i16>, i16, <16 x i1>, i32 zeroext)

declare <16 x i16> @vmin_vx_v16i16_unmasked(<16 x i16>, i16, i32 zeroext)

declare <2 x i32> @vmin_vv_v2i32(<2 x i32>, <2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vmin_vv_v2i32_unmasked(<2 x i32>, <2 x i32>, i32 zeroext)

declare <2 x i32> @vmin_vx_v2i32(<2 x i32>, i32, <2 x i1>, i32 zeroext)

declare <2 x i32> @vmin_vx_v2i32_unmasked(<2 x i32>, i32, i32 zeroext)

declare <4 x i32> @vmin_vv_v4i32(<4 x i32>, <4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vmin_vv_v4i32_unmasked(<4 x i32>, <4 x i32>, i32 zeroext)

declare <4 x i32> @vmin_vx_v4i32(<4 x i32>, i32, <4 x i1>, i32 zeroext)

declare <4 x i32> @vmin_vx_v4i32_unmasked(<4 x i32>, i32, i32 zeroext)

declare <8 x i32> @vmin_vv_v8i32(<8 x i32>, <8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vmin_vv_v8i32_unmasked(<8 x i32>, <8 x i32>, i32 zeroext)

declare <8 x i32> @vmin_vx_v8i32(<8 x i32>, i32, <8 x i1>, i32 zeroext)

declare <8 x i32> @vmin_vx_v8i32_unmasked(<8 x i32>, i32, i32 zeroext)

declare <16 x i32> @vmin_vv_v16i32(<16 x i32>, <16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vmin_vv_v16i32_unmasked(<16 x i32>, <16 x i32>, i32 zeroext)

declare <16 x i32> @vmin_vx_v16i32(<16 x i32>, i32, <16 x i1>, i32 zeroext)

declare <16 x i32> @vmin_vx_v16i32_unmasked(<16 x i32>, i32, i32 zeroext)

declare <2 x i64> @vmin_vv_v2i64(<2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vmin_vv_v2i64_unmasked(<2 x i64>, <2 x i64>, i32 zeroext)

declare <2 x i64> @vmin_vx_v2i64(<2 x i64>, i64, <2 x i1>, i32 zeroext)

declare <2 x i64> @vmin_vx_v2i64_unmasked(<2 x i64>, i64, i32 zeroext)

declare <4 x i64> @vmin_vv_v4i64(<4 x i64>, <4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vmin_vv_v4i64_unmasked(<4 x i64>, <4 x i64>, i32 zeroext)

declare <4 x i64> @vmin_vx_v4i64(<4 x i64>, i64, <4 x i1>, i32 zeroext)

declare <4 x i64> @vmin_vx_v4i64_unmasked(<4 x i64>, i64, i32 zeroext)

declare <8 x i64> @vmin_vv_v8i64(<8 x i64>, <8 x i64>, <8 x i1>, i32 zeroext)

define <8 x i64> @vmin_vv_v8i64_unmasked(<8 x i64> %va, <8 x i64> %b, i32 zeroext %evl) {
  %v = call <8 x i64> @llvm.smin.v8i64(<8 x i64> %va, <8 x i64> %b)
  %C1 = fcmp ule half 0.000000e+00, +inf
  store i1 %C1, ptr @G.5, align 1
  ret <8 x i64> %v
}

declare <8 x i64> @vmin_vx_v8i64(<8 x i64>, i64, <8 x i1>, i32 zeroext)

declare <8 x i64> @vmin_vx_v8i64_unmasked(<8 x i64>, i64, i32 zeroext)

declare <16 x i64> @vmin_vv_v16i64(<16 x i64>, <16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vmin_vv_v16i64_unmasked(<16 x i64>, <16 x i64>, i32 zeroext)

declare <16 x i64> @vmin_vx_v16i64(<16 x i64>, i64, <16 x i1>, i32 zeroext)

declare <16 x i64> @vmin_vx_v16i64_unmasked(<16 x i64>, i64, i32 zeroext)

declare <32 x i64> @vmin_vx_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.smin.v16i16(<16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.smin.v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.smin.v16i64(<16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.smin.v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <256 x i8> @llvm.smin.v256i8(<256 x i8>, <256 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.smin.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.smin.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.smin.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.smin.v2i8(<2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.smin.v32i64(<32 x i64>, <32 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.smin.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.smin.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.smin.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.smin.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <5 x i8> @llvm.smin.v5i8(<5 x i8>, <5 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.smin.v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.smin.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.smin.v8i64(<8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i7> @llvm.smin.v8i7(<8 x i7>, <8 x i7>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.smin.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

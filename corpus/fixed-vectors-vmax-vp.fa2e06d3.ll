; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> zeroinitializer
@G.1 = global i16 -32768
@G.2 = global i1 true
@G.3 = global <2 x i8> splat (i8 1)
@G.4 = global i1 false
@G.5 = global <2 x i8> zeroinitializer
@G.6 = global <2 x i1> splat (i1 true)
@G.7 = global i128 170141183460469231731687303715884105727
@G.8 = global i32 -2147483648
@G.9 = global i32 -2147483648

declare <8 x i7> @vmax_vv_v8i7(<8 x i7>, <8 x i7>, <8 x i1>, i32 zeroext)

define <2 x i8> @vmax_vv_v2i8(<2 x i8> %va, <2 x i8> %b, <2 x i1> %m, i32 zeroext %evl) {
  %A7 = alloca i1, align 1
  store i1 true, ptr %A7, align 1
  %A = alloca i16, align 2
  store i16 256, ptr %A, align 2
  %LGV = load i16, ptr @G.1, align 2
  %L = load i16, ptr %A, align 2
  switch i16 %L, label %SW_D [
    i16 12972, label %SW_C
    i16 10649, label %SW_C1
    i16 -29262, label %SW_C2
    i16 27035, label %SW_C3
    i16 2324, label %SW_C4
  ]

BB:                                               ; preds = %SW_C3, %SW_C2, %SW_C1, %SW_D
  %v = call <2 x i8> @llvm.smax.v2i8(<2 x i8> %va, <2 x i8> %b)
  ret <2 x i8> %v

SW_D:                                             ; preds = %SW_D, %0
  %LGV5 = load i1, ptr @G.2, align 1
  br i1 %LGV5, label %BB, label %SW_D

SW_C:                                             ; preds = %0
  %LGV6 = load <2 x i8>, ptr @G.3, align 2
  ret <2 x i8> %LGV6

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %SW_C2, %0
  %L8 = load i1, ptr %A7, align 1
  br i1 %L8, label %SW_C2, label %BB

SW_C3:                                            ; preds = %SW_C3, %0
  %LGV9 = load i1, ptr @G.4, align 1
  br i1 %LGV9, label %BB, label %SW_C3

SW_C4:                                            ; preds = %0
  %LGV10 = load <2 x i8>, ptr @G.5, align 2
  ret <2 x i8> %LGV10
}

declare <2 x i8> @vmax_vv_v2i8_unmasked(<2 x i8>, <2 x i8>, i32 zeroext)

declare <2 x i8> @vmax_vx_v2i8(<2 x i8>, i8, <2 x i1>, i32 zeroext)

declare <2 x i8> @vmax_vx_v2i8_unmasked(<2 x i8>, i8, i32 zeroext)

declare <4 x i8> @vmax_vv_v4i8(<4 x i8>, <4 x i8>, <4 x i1>, i32 zeroext)

define <4 x i8> @vmax_vv_v4i8_unmasked(<4 x i8> %va, <4 x i8> %b, i32 zeroext %evl) {
  %v = call <4 x i8> @llvm.smax.v4i8(<4 x i8> %va, <4 x i8> %b)
  %B = and i64 1, 0
  store i64 %B, ptr poison, align 4
  ret <4 x i8> %v
}

define <4 x i8> @vmax_vx_v4i8(<4 x i8> %va, i8 %b, <4 x i1> %m, i32 zeroext %evl) {
  %LGV = load <2 x i64>, ptr @G, align 16
  %C = icmp ne <2 x i64> %LGV, splat (i64 9223372036854775807)
  %elt.head = insertelement <4 x i8> poison, i8 %b, i32 0
  %vb = shufflevector <4 x i8> %elt.head, <4 x i8> poison, <4 x i32> zeroinitializer
  %v = call <4 x i8> @llvm.smax.v4i8(<4 x i8> %va, <4 x i8> %vb)
  store <2 x i1> %C, ptr poison, align 1
  ret <4 x i8> %v
}

declare <4 x i8> @vmax_vx_v4i8_commute(<4 x i8>, i8, <4 x i1>, i32 zeroext)

define <4 x i8> @vmax_vx_v4i8_unmasked(<4 x i8> %va, i8 %b, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i16, ptr @G.1, align 2
  %elt.head = insertelement <4 x i8> poison, i8 %b, i32 0
  %vb = shufflevector <4 x i8> %elt.head, <4 x i8> poison, <4 x i32> zeroinitializer
  %C = icmp ugt i16 %LGV, 32767
  %v = call <4 x i8> @llvm.smax.v4i8(<4 x i8> %va, <4 x i8> %vb)
  store i1 %C, ptr %A, align 1
  ret <4 x i8> %v
}

declare <5 x i8> @vmax_vv_v5i8(<5 x i8>, <5 x i8>, <5 x i1>, i32 zeroext)

declare <5 x i8> @vmax_vv_v5i8_unmasked(<5 x i8>, <5 x i8>, i32 zeroext)

declare <5 x i8> @vmax_vx_v5i8(<5 x i8>, i8, <5 x i1>, i32 zeroext)

declare <5 x i8> @vmax_vx_v5i8_unmasked(<5 x i8>, i8, i32 zeroext)

declare <8 x i8> @vmax_vv_v8i8(<8 x i8>, <8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vmax_vv_v8i8_unmasked(<8 x i8>, <8 x i8>, i32 zeroext)

declare <8 x i8> @vmax_vx_v8i8(<8 x i8>, i8, <8 x i1>, i32 zeroext)

declare <8 x i8> @vmax_vx_v8i8_unmasked(<8 x i8>, i8, i32 zeroext)

declare <16 x i8> @vmax_vv_v16i8(<16 x i8>, <16 x i8>, <16 x i1>, i32 zeroext)

define <16 x i8> @vmax_vv_v16i8_unmasked(<16 x i8> %va, <16 x i8> %b, i32 zeroext %evl) {
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %B = urem i8 127, 0
  %v = call <16 x i8> @llvm.smax.v16i8(<16 x i8> %va, <16 x i8> %b)
  store i8 %B, ptr %A, align 1
  ret <16 x i8> %v
}

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

define <2 x i32> @vmax_vv_v2i32(<2 x i32> %va, <2 x i32> %b, <2 x i1> %m, i32 zeroext %evl) {
  %v = call <2 x i32> @llvm.smax.v2i32(<2 x i32> %va, <2 x i32> %b)
  %B = shl <2 x i1> %m, %m
  store <2 x i1> %B, ptr @G.6, align 1
  ret <2 x i32> %v
}

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

define <16 x i32> @vmax_vx_v16i32_unmasked(<16 x i32> %va, i32 %b, i32 zeroext %evl) {
  %LGV = load i128, ptr @G.7, align 4
  switch i128 %LGV, label %SW_D [
    i128 3273339907853137832, label %SW_C
    i128 14903162888678732021, label %SW_C1
    i128 15100253091297057384, label %SW_C2
  ]

BB:                                               ; preds = %SW_C2, %SW_C, %SW_D
  %elt.head = insertelement <16 x i32> poison, i32 %b, i32 0
  %vb = shufflevector <16 x i32> %elt.head, <16 x i32> poison, <16 x i32> zeroinitializer
  %v = call <16 x i32> @llvm.smax.v16i32(<16 x i32> %va, <16 x i32> %vb)
  ret <16 x i32> %v

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  ret <16 x i32> %va

SW_C2:                                            ; preds = %0
  br label %BB
}

declare <2 x i64> @vmax_vv_v2i64(<2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vmax_vv_v2i64_unmasked(<2 x i64>, <2 x i64>, i32 zeroext)

declare <2 x i64> @vmax_vx_v2i64(<2 x i64>, i64, <2 x i1>, i32 zeroext)

declare <2 x i64> @vmax_vx_v2i64_unmasked(<2 x i64>, i64, i32 zeroext)

declare <4 x i64> @vmax_vv_v4i64(<4 x i64>, <4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vmax_vv_v4i64_unmasked(<4 x i64>, <4 x i64>, i32 zeroext)

declare <4 x i64> @vmax_vx_v4i64(<4 x i64>, i64, <4 x i1>, i32 zeroext)

declare <4 x i64> @vmax_vx_v4i64_unmasked(<4 x i64>, i64, i32 zeroext)

declare <8 x i64> @vmax_vv_v8i64(<8 x i64>, <8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vmax_vv_v8i64_unmasked(<8 x i64>, <8 x i64>, i32 zeroext)

declare <8 x i64> @vmax_vx_v8i64(<8 x i64>, i64, <8 x i1>, i32 zeroext)

declare <8 x i64> @vmax_vx_v8i64_unmasked(<8 x i64>, i64, i32 zeroext)

declare <16 x i64> @vmax_vv_v16i64(<16 x i64>, <16 x i64>, <16 x i1>, i32 zeroext)

define <16 x i64> @vmax_vv_v16i64_unmasked(<16 x i64> %va, <16 x i64> %b, i32 zeroext %evl) {
  %LGV = load i32, ptr @G.8, align 4
  %B = shl i32 %evl, %LGV
  %v = call <16 x i64> @llvm.smax.v16i64(<16 x i64> %va, <16 x i64> %b)
  store i32 %B, ptr @G.9, align 4
  ret <16 x i64> %v
}

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

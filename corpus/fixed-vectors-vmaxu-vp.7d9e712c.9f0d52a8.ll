; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx -O0 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i1 false
@G.2 = global double +qnan
@G.3 = global double 4.200000e+01
@G.4 = global i64 -1
@G.5 = global <8 x i1> zeroinitializer
@G.6 = global <2 x i64> zeroinitializer
@G.7 = global <4 x i32> splat (i32 2147483647)
@G.8 = global <4 x i1> zeroinitializer
@G.9 = global i32 -2147483648
@G.10 = global i16 0

declare <8 x i7> @vmaxu_vv_v8i7(<8 x i7>, <8 x i7>, <8 x i1>, i32 zeroext)

declare <2 x i8> @vmaxu_vv_v2i8(<2 x i8>, <2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vmaxu_vv_v2i8_unmasked(<2 x i8>, <2 x i8>, i32 zeroext)

declare <2 x i8> @vmaxu_vx_v2i8(<2 x i8>, i8, <2 x i1>, i32 zeroext)

declare <2 x i8> @vmaxu_vx_v2i8_unmasked(<2 x i8>, i8, i32 zeroext)

declare <4 x i8> @vmaxu_vv_v4i8(<4 x i8>, <4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vmaxu_vv_v4i8_unmasked(<4 x i8>, <4 x i8>, i32 zeroext)

declare <4 x i8> @vmaxu_vx_v4i8(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vmaxu_vx_v4i8_commute(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vmaxu_vx_v4i8_unmasked(<4 x i8>, i8, i32 zeroext)

declare <5 x i8> @vmaxu_vv_v5i8(<5 x i8>, <5 x i8>, <5 x i1>, i32 zeroext)

declare <5 x i8> @vmaxu_vv_v5i8_unmasked(<5 x i8>, <5 x i8>, i32 zeroext)

declare <5 x i8> @vmaxu_vx_v5i8(<5 x i8>, i8, <5 x i1>, i32 zeroext)

declare <5 x i8> @vmaxu_vx_v5i8_unmasked(<5 x i8>, i8, i32 zeroext)

declare <8 x i8> @vmaxu_vv_v8i8(<8 x i8>, <8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vmaxu_vv_v8i8_unmasked(<8 x i8>, <8 x i8>, i32 zeroext)

declare <8 x i8> @vmaxu_vx_v8i8(<8 x i8>, i8, <8 x i1>, i32 zeroext)

declare <8 x i8> @vmaxu_vx_v8i8_unmasked(<8 x i8>, i8, i32 zeroext)

declare <16 x i8> @vmaxu_vv_v16i8(<16 x i8>, <16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vmaxu_vv_v16i8_unmasked(<16 x i8>, <16 x i8>, i32 zeroext)

declare <16 x i8> @vmaxu_vx_v16i8(<16 x i8>, i8, <16 x i1>, i32 zeroext)

declare <16 x i8> @vmaxu_vx_v16i8_unmasked(<16 x i8>, i8, i32 zeroext)

declare <256 x i8> @vmaxu_vx_v258i8(<256 x i8>, i8, <256 x i1>, i32 zeroext)

declare <256 x i8> @vmaxu_vx_v258i8_unmasked(<256 x i8>, i8, i32 zeroext)

declare <256 x i8> @vmaxu_vx_v258i8_evl129(<256 x i8>, i8, <256 x i1>)

declare <256 x i8> @vmaxu_vx_v258i8_evl128(<256 x i8>, i8, <256 x i1>)

declare <2 x i16> @vmaxu_vv_v2i16(<2 x i16>, <2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vmaxu_vv_v2i16_unmasked(<2 x i16>, <2 x i16>, i32 zeroext)

declare <2 x i16> @vmaxu_vx_v2i16(<2 x i16>, i16, <2 x i1>, i32 zeroext)

declare <2 x i16> @vmaxu_vx_v2i16_unmasked(<2 x i16>, i16, i32 zeroext)

declare <4 x i16> @vmaxu_vv_v4i16(<4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

define <4 x i16> @vmaxu_vv_v4i16_unmasked(<4 x i16> %va, <4 x i16> %b, i32 zeroext %evl) {
  %A12 = alloca i1, align 1
  store i1 false, ptr %A12, align 1
  %A9 = alloca i1, align 1
  store i1 false, ptr %A9, align 1
  %A6 = alloca i1, align 1
  store i1 false, ptr %A6, align 1
  %A = alloca i64, align 8
  store i64 4294967296, ptr %A, align 4
  %LGV = load i64, ptr @G.4, align 4
  %LGV1 = load <2 x i64>, ptr @G.6, align 16
  %C = icmp uge <2 x i64> splat (i64 1), %LGV1
  %v = call <4 x i16> @llvm.umax.v4i16(<4 x i16> %va, <4 x i16> %b)
  store <2 x i1> %C, ptr poison, align 1
  %L = load i64, ptr %A, align 4
  switch i64 %L, label %SW_D [
    i64 -8579664055972400464, label %SW_C
    i64 -7404280053047126768, label %SW_C1
    i64 -150545511688300828, label %SW_C2
    i64 -2122572280798578033, label %SW_C3
    i64 -3620780663620561401, label %SW_C4
    i64 -21461203212083579, label %SW_C5
  ]

BB:                                               ; preds = %SW_C5, %SW_C4, %SW_C3, %SW_C2, %SW_C1, %SW_C, %SW_D
  ret <4 x i16> %v

SW_D:                                             ; preds = %SW_D, %0
  %L7 = load i1, ptr %A6, align 1
  br i1 %L7, label %SW_D, label %BB

SW_C:                                             ; preds = %SW_C, %0
  %LGV8 = load i1, ptr @G, align 1
  %L10 = load i1, ptr %A9, align 1
  br i1 %L10, label %SW_C, label %BB

SW_C1:                                            ; preds = %SW_C1, %0
  %LGV11 = load i1, ptr @G.1, align 1
  %L13 = load i1, ptr %A12, align 1
  br i1 %L13, label %BB, label %SW_C1

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %0
  br label %BB
}

declare <4 x i16> @vmaxu_vx_v4i16(<4 x i16>, i16, <4 x i1>, i32 zeroext)

declare <4 x i16> @vmaxu_vx_v4i16_unmasked(<4 x i16>, i16, i32 zeroext)

declare <8 x i16> @vmaxu_vv_v8i16(<8 x i16>, <8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vmaxu_vv_v8i16_unmasked(<8 x i16>, <8 x i16>, i32 zeroext)

declare <8 x i16> @vmaxu_vx_v8i16(<8 x i16>, i16, <8 x i1>, i32 zeroext)

declare <8 x i16> @vmaxu_vx_v8i16_unmasked(<8 x i16>, i16, i32 zeroext)

declare <16 x i16> @vmaxu_vv_v16i16(<16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vmaxu_vv_v16i16_unmasked(<16 x i16>, <16 x i16>, i32 zeroext)

define <16 x i16> @vmaxu_vx_v16i16(<16 x i16> %va, i16 %b, <16 x i1> %m, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV2 = load i16, ptr @G.10, align 2
  %LGV1 = load <4 x i32>, ptr @G.7, align 16
  %C3 = icmp sle i16 %b, %LGV2
  %C = icmp sle <4 x i32> splat (i32 1), %LGV1
  %elt.head = insertelement <16 x i16> poison, i16 %b, i32 0
  %vb = shufflevector <16 x i16> %elt.head, <16 x i16> poison, <16 x i32> zeroinitializer
  %v = call <16 x i16> @llvm.umax.v16i16(<16 x i16> %va, <16 x i16> %vb)
  store <4 x i1> %C, ptr @G.8, align 1
  store i1 %C3, ptr %A, align 1
  ret <16 x i16> %v
}

declare <16 x i16> @vmaxu_vx_v16i16_unmasked(<16 x i16>, i16, i32 zeroext)

declare <2 x i32> @vmaxu_vv_v2i32(<2 x i32>, <2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vmaxu_vv_v2i32_unmasked(<2 x i32>, <2 x i32>, i32 zeroext)

declare <2 x i32> @vmaxu_vx_v2i32(<2 x i32>, i32, <2 x i1>, i32 zeroext)

declare <2 x i32> @vmaxu_vx_v2i32_unmasked(<2 x i32>, i32, i32 zeroext)

declare <4 x i32> @vmaxu_vv_v4i32(<4 x i32>, <4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vmaxu_vv_v4i32_unmasked(<4 x i32>, <4 x i32>, i32 zeroext)

declare <4 x i32> @vmaxu_vx_v4i32(<4 x i32>, i32, <4 x i1>, i32 zeroext)

declare <4 x i32> @vmaxu_vx_v4i32_unmasked(<4 x i32>, i32, i32 zeroext)

declare <8 x i32> @vmaxu_vv_v8i32(<8 x i32>, <8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vmaxu_vv_v8i32_unmasked(<8 x i32>, <8 x i32>, i32 zeroext)

declare <8 x i32> @vmaxu_vx_v8i32(<8 x i32>, i32, <8 x i1>, i32 zeroext)

declare <8 x i32> @vmaxu_vx_v8i32_unmasked(<8 x i32>, i32, i32 zeroext)

declare <16 x i32> @vmaxu_vv_v16i32(<16 x i32>, <16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vmaxu_vv_v16i32_unmasked(<16 x i32>, <16 x i32>, i32 zeroext)

declare <16 x i32> @vmaxu_vx_v16i32(<16 x i32>, i32, <16 x i1>, i32 zeroext)

declare <16 x i32> @vmaxu_vx_v16i32_unmasked(<16 x i32>, i32, i32 zeroext)

declare <2 x i64> @vmaxu_vv_v2i64(<2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vmaxu_vv_v2i64_unmasked(<2 x i64>, <2 x i64>, i32 zeroext)

declare <2 x i64> @vmaxu_vx_v2i64(<2 x i64>, i64, <2 x i1>, i32 zeroext)

declare <2 x i64> @vmaxu_vx_v2i64_unmasked(<2 x i64>, i64, i32 zeroext)

define <4 x i64> @vmaxu_vv_v4i64(<4 x i64> %va, <4 x i64> %b, <4 x i1> %m, i32 zeroext %evl) {
  %v = call <4 x i64> @llvm.umax.v4i64(<4 x i64> %va, <4 x i64> %b)
  %LGV = load i1, ptr @G.1, align 1
  %C = icmp sge i1 %LGV, false
  store i1 %C, ptr poison, align 1
  ret <4 x i64> %v
}

declare <4 x i64> @vmaxu_vv_v4i64_unmasked(<4 x i64>, <4 x i64>, i32 zeroext)

declare <4 x i64> @vmaxu_vx_v4i64(<4 x i64>, i64, <4 x i1>, i32 zeroext)

define <4 x i64> @vmaxu_vx_v4i64_unmasked(<4 x i64> %va, i64 %b, i32 zeroext %evl) {
  %B1 = sdiv i32 %evl, 2147483647
  %LGV = load double, ptr @G.2, align 8
  %elt.head = insertelement <4 x i64> poison, i64 %b, i32 0
  %B = fmul double 1.000000e+00, %LGV
  %vb = shufflevector <4 x i64> %elt.head, <4 x i64> poison, <4 x i32> zeroinitializer
  %v = call <4 x i64> @llvm.umax.v4i64(<4 x i64> %va, <4 x i64> %vb)
  store double %B, ptr @G.3, align 8
  store i32 %B1, ptr @G.9, align 4
  ret <4 x i64> %v
}

declare <8 x i64> @vmaxu_vv_v8i64(<8 x i64>, <8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vmaxu_vv_v8i64_unmasked(<8 x i64>, <8 x i64>, i32 zeroext)

declare <8 x i64> @vmaxu_vx_v8i64(<8 x i64>, i64, <8 x i1>, i32 zeroext)

declare <8 x i64> @vmaxu_vx_v8i64_unmasked(<8 x i64>, i64, i32 zeroext)

declare <16 x i64> @vmaxu_vv_v16i64(<16 x i64>, <16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vmaxu_vv_v16i64_unmasked(<16 x i64>, <16 x i64>, i32 zeroext)

declare <16 x i64> @vmaxu_vx_v16i64(<16 x i64>, i64, <16 x i1>, i32 zeroext)

declare <16 x i64> @vmaxu_vx_v16i64_unmasked(<16 x i64>, i64, i32 zeroext)

declare <32 x i64> @vmaxu_vx_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.umax.v16i16(<16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.umax.v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.umax.v16i64(<16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.umax.v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <256 x i8> @llvm.umax.v256i8(<256 x i8>, <256 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.umax.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.umax.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.umax.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.umax.v2i8(<2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.umax.v32i64(<32 x i64>, <32 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.umax.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.umax.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.umax.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.umax.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <5 x i8> @llvm.umax.v5i8(<5 x i8>, <5 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.umax.v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.umax.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.umax.v8i64(<8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i7> @llvm.umax.v8i7(<8 x i7>, <8 x i7>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.umax.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

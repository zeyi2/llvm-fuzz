; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zdinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i1> zeroinitializer
@G.1 = global <4 x i32> splat (i32 -1)
@G.2 = global <4 x i32> splat (i32 2147483647)
@G.3 = global <16 x i16> splat (i16 -32768)
@G.4 = global i32 -2147483648
@G.5 = global <2 x i1> zeroinitializer
@G.6 = global <16 x i32> zeroinitializer
@G.7 = global <16 x i1> zeroinitializer

declare <8 x i7> @vmaxu_vv_v8i7(<8 x i7>, <8 x i7>, <8 x i1>, i32 zeroext)

declare <2 x i8> @vmaxu_vv_v2i8(<2 x i8>, <2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vmaxu_vv_v2i8_unmasked(<2 x i8>, <2 x i8>, i32 zeroext)

define <2 x i8> @vmaxu_vx_v2i8(<2 x i8> %va, i8 %b, <2 x i1> %m, i32 zeroext %evl) {
  %LGV = load i32, ptr @G.4, align 4
  %elt.head = insertelement <2 x i8> poison, i8 %b, i32 0
  %vb = shufflevector <2 x i8> %elt.head, <2 x i8> poison, <2 x i32> zeroinitializer
  %I = insertelement <2 x i1> %m, i1 false, i32 %LGV
  %v = call <2 x i8> @llvm.umax.v2i8(<2 x i8> %va, <2 x i8> %vb)
  store <2 x i1> %I, ptr @G.5, align 1
  ret <2 x i8> %v
}

declare <2 x i8> @vmaxu_vx_v2i8_unmasked(<2 x i8>, i8, i32 zeroext)

declare <4 x i8> @vmaxu_vv_v4i8(<4 x i8>, <4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vmaxu_vv_v4i8_unmasked(<4 x i8>, <4 x i8>, i32 zeroext)

declare <4 x i8> @vmaxu_vx_v4i8(<4 x i8>, i8, <4 x i1>, i32 zeroext)

define <4 x i8> @vmaxu_vx_v4i8_commute(<4 x i8> %va, i8 %b, <4 x i1> %m, i32 zeroext %evl) {
  %B = or <4 x i8> %va, zeroinitializer
  %elt.head = insertelement <4 x i8> poison, i8 %b, i32 0
  %vb = shufflevector <4 x i8> %elt.head, <4 x i8> poison, <4 x i32> zeroinitializer
  %v = call <4 x i8> @llvm.umax.v4i8(<4 x i8> %vb, <4 x i8> %B)
  ret <4 x i8> %v
}

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

define <16 x i8> @vmaxu_vx_v16i8_unmasked(<16 x i8> %va, i8 %b, i32 zeroext %evl) {
  %LGV = load <4 x i32>, ptr @G.1, align 16
  %B = lshr <4 x i32> %LGV, splat (i32 65536)
  %elt.head = insertelement <16 x i8> poison, i8 %b, i32 0
  %vb = shufflevector <16 x i8> %elt.head, <16 x i8> poison, <16 x i32> zeroinitializer
  %v = call <16 x i8> @llvm.umax.v16i8(<16 x i8> %va, <16 x i8> %vb)
  store <4 x i32> %B, ptr @G.2, align 16
  ret <16 x i8> %v
}

declare <256 x i8> @vmaxu_vx_v258i8(<256 x i8>, i8, <256 x i1>, i32 zeroext)

declare <256 x i8> @vmaxu_vx_v258i8_unmasked(<256 x i8>, i8, i32 zeroext)

declare <256 x i8> @vmaxu_vx_v258i8_evl129(<256 x i8>, i8, <256 x i1>)

declare <256 x i8> @vmaxu_vx_v258i8_evl128(<256 x i8>, i8, <256 x i1>)

declare <2 x i16> @vmaxu_vv_v2i16(<2 x i16>, <2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vmaxu_vv_v2i16_unmasked(<2 x i16>, <2 x i16>, i32 zeroext)

declare <2 x i16> @vmaxu_vx_v2i16(<2 x i16>, i16, <2 x i1>, i32 zeroext)

declare <2 x i16> @vmaxu_vx_v2i16_unmasked(<2 x i16>, i16, i32 zeroext)

declare <4 x i16> @vmaxu_vv_v4i16(<4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vmaxu_vv_v4i16_unmasked(<4 x i16>, <4 x i16>, i32 zeroext)

declare <4 x i16> @vmaxu_vx_v4i16(<4 x i16>, i16, <4 x i1>, i32 zeroext)

declare <4 x i16> @vmaxu_vx_v4i16_unmasked(<4 x i16>, i16, i32 zeroext)

declare <8 x i16> @vmaxu_vv_v8i16(<8 x i16>, <8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vmaxu_vv_v8i16_unmasked(<8 x i16>, <8 x i16>, i32 zeroext)

declare <8 x i16> @vmaxu_vx_v8i16(<8 x i16>, i16, <8 x i1>, i32 zeroext)

declare <8 x i16> @vmaxu_vx_v8i16_unmasked(<8 x i16>, i16, i32 zeroext)

declare <16 x i16> @vmaxu_vv_v16i16(<16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

define <16 x i16> @vmaxu_vv_v16i16_unmasked(<16 x i16> %va, <16 x i16> %b, i32 zeroext %evl) {
  %v = call <16 x i16> @llvm.umax.v16i16(<16 x i16> %va, <16 x i16> %b)
  store <16 x i16> %v, ptr @G.3, align 32
  ret <16 x i16> %v
}

declare <16 x i16> @vmaxu_vx_v16i16(<16 x i16>, i16, <16 x i1>, i32 zeroext)

declare <16 x i16> @vmaxu_vx_v16i16_unmasked(<16 x i16>, i16, i32 zeroext)

define <2 x i32> @vmaxu_vv_v2i32(<2 x i32> %va, <2 x i32> %b, <2 x i1> %m, i32 zeroext %evl) {
  %v = call <2 x i32> @llvm.umax.v2i32(<2 x i32> %va, <2 x i32> %b)
  %C = icmp ult <2 x i32> %b, %b
  store <2 x i1> %C, ptr @G, align 1
  ret <2 x i32> %v
}

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

define <16 x i32> @vmaxu_vv_v16i32(<16 x i32> %va, <16 x i32> %b, <16 x i1> %m, i32 zeroext %evl) {
  %LGV = load <16 x i32>, ptr @G.6, align 64
  %v = call <16 x i32> @llvm.umax.v16i32(<16 x i32> %va, <16 x i32> %b)
  %C = icmp ne <16 x i32> %b, %LGV
  store <16 x i1> %C, ptr @G.7, align 2
  ret <16 x i32> %v
}

declare <16 x i32> @vmaxu_vv_v16i32_unmasked(<16 x i32>, <16 x i32>, i32 zeroext)

declare <16 x i32> @vmaxu_vx_v16i32(<16 x i32>, i32, <16 x i1>, i32 zeroext)

declare <16 x i32> @vmaxu_vx_v16i32_unmasked(<16 x i32>, i32, i32 zeroext)

declare <2 x i64> @vmaxu_vv_v2i64(<2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vmaxu_vv_v2i64_unmasked(<2 x i64>, <2 x i64>, i32 zeroext)

declare <2 x i64> @vmaxu_vx_v2i64(<2 x i64>, i64, <2 x i1>, i32 zeroext)

declare <2 x i64> @vmaxu_vx_v2i64_unmasked(<2 x i64>, i64, i32 zeroext)

declare <4 x i64> @vmaxu_vv_v4i64(<4 x i64>, <4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vmaxu_vv_v4i64_unmasked(<4 x i64>, <4 x i64>, i32 zeroext)

declare <4 x i64> @vmaxu_vx_v4i64(<4 x i64>, i64, <4 x i1>, i32 zeroext)

declare <4 x i64> @vmaxu_vx_v4i64_unmasked(<4 x i64>, i64, i32 zeroext)

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

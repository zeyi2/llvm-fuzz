; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zdinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global <2 x i1> splat (i1 true)

declare <8 x i7> @vminu_vv_v8i7(<8 x i7>, <8 x i7>, <8 x i1>, i32 zeroext)

declare <2 x i8> @vminu_vv_v2i8(<2 x i8>, <2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vminu_vv_v2i8_unmasked(<2 x i8>, <2 x i8>, i32 zeroext)

declare <2 x i8> @vminu_vx_v2i8(<2 x i8>, i8, <2 x i1>, i32 zeroext)

declare <2 x i8> @vminu_vx_v2i8_unmasked(<2 x i8>, i8, i32 zeroext)

declare <4 x i8> @vminu_vv_v4i8(<4 x i8>, <4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vminu_vv_v4i8_unmasked(<4 x i8>, <4 x i8>, i32 zeroext)

declare <4 x i8> @vminu_vx_v4i8(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vminu_vx_v4i8_commute(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vminu_vx_v4i8_unmasked(<4 x i8>, i8, i32 zeroext)

declare <5 x i8> @vminu_vv_v5i8(<5 x i8>, <5 x i8>, <5 x i1>, i32 zeroext)

declare <5 x i8> @vminu_vv_v5i8_unmasked(<5 x i8>, <5 x i8>, i32 zeroext)

declare <5 x i8> @vminu_vx_v5i8(<5 x i8>, i8, <5 x i1>, i32 zeroext)

declare <5 x i8> @vminu_vx_v5i8_unmasked(<5 x i8>, i8, i32 zeroext)

declare <8 x i8> @vminu_vv_v8i8(<8 x i8>, <8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vminu_vv_v8i8_unmasked(<8 x i8>, <8 x i8>, i32 zeroext)

declare <8 x i8> @vminu_vx_v8i8(<8 x i8>, i8, <8 x i1>, i32 zeroext)

declare <8 x i8> @vminu_vx_v8i8_unmasked(<8 x i8>, i8, i32 zeroext)

declare <16 x i8> @vminu_vv_v16i8(<16 x i8>, <16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vminu_vv_v16i8_unmasked(<16 x i8>, <16 x i8>, i32 zeroext)

declare <16 x i8> @vminu_vx_v16i8(<16 x i8>, i8, <16 x i1>, i32 zeroext)

define <16 x i8> @vminu_vx_v16i8_unmasked(<16 x i8> %va, i8 %b, i32 zeroext %evl) {
  %C = icmp ne i8 %b, 1
  %elt.head = insertelement <16 x i8> poison, i8 %b, i32 0
  %vb = shufflevector <16 x i8> %elt.head, <16 x i8> poison, <16 x i32> zeroinitializer
  %v = call <16 x i8> @llvm.umin.v16i8(<16 x i8> %va, <16 x i8> %vb)
  store i1 %C, ptr poison, align 1
  ret <16 x i8> %v
}

declare <256 x i8> @vminu_vx_v258i8(<256 x i8>, i8, <256 x i1>, i32 zeroext)

declare <256 x i8> @vminu_vx_v258i8_unmasked(<256 x i8>, i8, i32 zeroext)

declare <256 x i8> @vminu_vx_v258i8_evl129(<256 x i8>, i8, <256 x i1>)

declare <256 x i8> @vminu_vx_v258i8_evl128(<256 x i8>, i8, <256 x i1>)

declare <2 x i16> @vminu_vv_v2i16(<2 x i16>, <2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vminu_vv_v2i16_unmasked(<2 x i16>, <2 x i16>, i32 zeroext)

declare <2 x i16> @vminu_vx_v2i16(<2 x i16>, i16, <2 x i1>, i32 zeroext)

define <2 x i16> @vminu_vx_v2i16_unmasked(<2 x i16> %va, i16 %b, i32 zeroext %evl) {
  %A = alloca <2 x i16>, align 4
  store <2 x i16> poison, ptr %A, align 4
  %elt.head = insertelement <2 x i16> poison, i16 %b, i32 0
  %vb = shufflevector <2 x i16> %elt.head, <2 x i16> poison, <2 x i32> zeroinitializer
  %v = call <2 x i16> @llvm.umin.v2i16(<2 x i16> %va, <2 x i16> %vb)
  %B = mul <2 x i16> %va, splat (i16 42)
  store <2 x i16> %B, ptr %A, align 4
  ret <2 x i16> %v
}

declare <4 x i16> @vminu_vv_v4i16(<4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vminu_vv_v4i16_unmasked(<4 x i16>, <4 x i16>, i32 zeroext)

declare <4 x i16> @vminu_vx_v4i16(<4 x i16>, i16, <4 x i1>, i32 zeroext)

declare <4 x i16> @vminu_vx_v4i16_unmasked(<4 x i16>, i16, i32 zeroext)

declare <8 x i16> @vminu_vv_v8i16(<8 x i16>, <8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vminu_vv_v8i16_unmasked(<8 x i16>, <8 x i16>, i32 zeroext)

declare <8 x i16> @vminu_vx_v8i16(<8 x i16>, i16, <8 x i1>, i32 zeroext)

declare <8 x i16> @vminu_vx_v8i16_unmasked(<8 x i16>, i16, i32 zeroext)

declare <16 x i16> @vminu_vv_v16i16(<16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vminu_vv_v16i16_unmasked(<16 x i16>, <16 x i16>, i32 zeroext)

declare <16 x i16> @vminu_vx_v16i16(<16 x i16>, i16, <16 x i1>, i32 zeroext)

declare <16 x i16> @vminu_vx_v16i16_unmasked(<16 x i16>, i16, i32 zeroext)

declare <2 x i32> @vminu_vv_v2i32(<2 x i32>, <2 x i32>, <2 x i1>, i32 zeroext)

define <2 x i32> @vminu_vv_v2i32_unmasked(<2 x i32> %va, <2 x i32> %b, i32 zeroext %evl) {
  %v = call <2 x i32> @llvm.umin.v2i32(<2 x i32> %va, <2 x i32> %b)
  %C = icmp sge <2 x i32> %b, %v
  store <2 x i1> %C, ptr @G.1, align 1
  ret <2 x i32> %v
}

declare <2 x i32> @vminu_vx_v2i32(<2 x i32>, i32, <2 x i1>, i32 zeroext)

define <2 x i32> @vminu_vx_v2i32_unmasked(<2 x i32> %va, i32 %b, i32 zeroext %evl) {
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %elt.head = insertelement <2 x i32> poison, i32 %b, i32 0
  %B = add i64 -1, 0
  %vb = shufflevector <2 x i32> %elt.head, <2 x i32> poison, <2 x i32> zeroinitializer
  %v = call <2 x i32> @llvm.umin.v2i32(<2 x i32> %va, <2 x i32> %vb)
  store i64 %B, ptr %A, align 4
  ret <2 x i32> %v
}

declare <4 x i32> @vminu_vv_v4i32(<4 x i32>, <4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vminu_vv_v4i32_unmasked(<4 x i32>, <4 x i32>, i32 zeroext)

define <4 x i32> @vminu_vx_v4i32(<4 x i32> %va, i32 %b, <4 x i1> %m, i32 zeroext %evl) {
  %elt.head = insertelement <4 x i32> poison, i32 %b, i32 0
  %C = icmp ugt i32 %b, 2147483647
  %vb = shufflevector <4 x i32> %elt.head, <4 x i32> poison, <4 x i32> zeroinitializer
  %v = call <4 x i32> @llvm.umin.v4i32(<4 x i32> %va, <4 x i32> %vb)
  store i1 %C, ptr @G, align 1
  ret <4 x i32> %v
}

declare <4 x i32> @vminu_vx_v4i32_unmasked(<4 x i32>, i32, i32 zeroext)

define <8 x i32> @vminu_vv_v8i32(<8 x i32> %va, <8 x i32> %b, <8 x i1> %m, i32 zeroext %evl) {
  %B = srem <8 x i1> %m, splat (i1 true)
  %v = call <8 x i32> @llvm.umin.v8i32(<8 x i32> %va, <8 x i32> %b)
  store <8 x i1> %B, ptr poison, align 1
  ret <8 x i32> %v
}

declare <8 x i32> @vminu_vv_v8i32_unmasked(<8 x i32>, <8 x i32>, i32 zeroext)

declare <8 x i32> @vminu_vx_v8i32(<8 x i32>, i32, <8 x i1>, i32 zeroext)

declare <8 x i32> @vminu_vx_v8i32_unmasked(<8 x i32>, i32, i32 zeroext)

declare <16 x i32> @vminu_vv_v16i32(<16 x i32>, <16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vminu_vv_v16i32_unmasked(<16 x i32>, <16 x i32>, i32 zeroext)

declare <16 x i32> @vminu_vx_v16i32(<16 x i32>, i32, <16 x i1>, i32 zeroext)

declare <16 x i32> @vminu_vx_v16i32_unmasked(<16 x i32>, i32, i32 zeroext)

declare <2 x i64> @vminu_vv_v2i64(<2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vminu_vv_v2i64_unmasked(<2 x i64>, <2 x i64>, i32 zeroext)

declare <2 x i64> @vminu_vx_v2i64(<2 x i64>, i64, <2 x i1>, i32 zeroext)

declare <2 x i64> @vminu_vx_v2i64_unmasked(<2 x i64>, i64, i32 zeroext)

declare <4 x i64> @vminu_vv_v4i64(<4 x i64>, <4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vminu_vv_v4i64_unmasked(<4 x i64>, <4 x i64>, i32 zeroext)

declare <4 x i64> @vminu_vx_v4i64(<4 x i64>, i64, <4 x i1>, i32 zeroext)

declare <4 x i64> @vminu_vx_v4i64_unmasked(<4 x i64>, i64, i32 zeroext)

declare <8 x i64> @vminu_vv_v8i64(<8 x i64>, <8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vminu_vv_v8i64_unmasked(<8 x i64>, <8 x i64>, i32 zeroext)

declare <8 x i64> @vminu_vx_v8i64(<8 x i64>, i64, <8 x i1>, i32 zeroext)

declare <8 x i64> @vminu_vx_v8i64_unmasked(<8 x i64>, i64, i32 zeroext)

declare <16 x i64> @vminu_vv_v16i64(<16 x i64>, <16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vminu_vv_v16i64_unmasked(<16 x i64>, <16 x i64>, i32 zeroext)

declare <16 x i64> @vminu_vx_v16i64(<16 x i64>, i64, <16 x i1>, i32 zeroext)

declare <16 x i64> @vminu_vx_v16i64_unmasked(<16 x i64>, i64, i32 zeroext)

declare <32 x i64> @vminu_vx_v32i64(<32 x i64>, <32 x i1>, i64, i32 zeroext)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.umin.v16i16(<16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.umin.v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.umin.v16i64(<16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.umin.v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <256 x i8> @llvm.umin.v256i8(<256 x i8>, <256 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.umin.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.umin.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.umin.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.umin.v2i8(<2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.umin.v32i64(<32 x i64>, <32 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.umin.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.umin.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.umin.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.umin.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <5 x i8> @llvm.umin.v5i8(<5 x i8>, <5 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.umin.v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.umin.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.umin.v8i64(<8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i7> @llvm.umin.v8i7(<8 x i7>, <8 x i7>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.umin.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

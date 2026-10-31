; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i1 false
@G.2 = global <4 x i1> zeroinitializer

declare <8 x i7> @vsadd_vv_v8i7(<8 x i7>, <8 x i7>, <8 x i1>, i32 zeroext)

declare <2 x i8> @vsadd_vv_v2i8(<2 x i8>, <2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vsadd_vv_v2i8_unmasked(<2 x i8>, <2 x i8>, i32 zeroext)

declare <2 x i8> @vsadd_vx_v2i8(<2 x i8>, i8, <2 x i1>, i32 zeroext)

declare <2 x i8> @vsadd_vx_v2i8_unmasked(<2 x i8>, i8, i32 zeroext)

declare <2 x i8> @vsadd_vi_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vsadd_vi_v2i8_unmasked(<2 x i8>, i32 zeroext)

declare <4 x i8> @vsadd_vv_v4i8(<4 x i8>, <4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vsadd_vv_v4i8_unmasked(<4 x i8>, <4 x i8>, i32 zeroext)

declare <4 x i8> @vsadd_vx_v4i8(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vsadd_vx_v4i8_commute(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vsadd_vx_v4i8_unmasked(<4 x i8>, i8, i32 zeroext)

declare <4 x i8> @vsadd_vi_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vsadd_vi_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <5 x i8> @vsadd_vv_v5i8(<5 x i8>, <5 x i8>, <5 x i1>, i32 zeroext)

declare <5 x i8> @vsadd_vv_v5i8_unmasked(<5 x i8>, <5 x i8>, i32 zeroext)

declare <5 x i8> @vsadd_vx_v5i8(<5 x i8>, i8, <5 x i1>, i32 zeroext)

declare <5 x i8> @vsadd_vx_v5i8_unmasked(<5 x i8>, i8, i32 zeroext)

declare <5 x i8> @vsadd_vi_v5i8(<5 x i8>, <5 x i1>, i32 zeroext)

declare <5 x i8> @vsadd_vi_v5i8_unmasked(<5 x i8>, i32 zeroext)

declare <8 x i8> @vsadd_vv_v8i8(<8 x i8>, <8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vsadd_vv_v8i8_unmasked(<8 x i8>, <8 x i8>, i32 zeroext)

declare <8 x i8> @vsadd_vx_v8i8(<8 x i8>, i8, <8 x i1>, i32 zeroext)

declare <8 x i8> @vsadd_vx_v8i8_unmasked(<8 x i8>, i8, i32 zeroext)

define <8 x i8> @vsadd_vi_v8i8(<8 x i8> %va, <8 x i1> %m, i32 zeroext %evl) {
  %LGV = load i1, ptr @G.1, align 1
  %v = call <8 x i8> @llvm.sadd.sat.v8i8(<8 x i8> %va, <8 x i8> splat (i8 -1))
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <8 x i8> %v

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

declare <8 x i8> @vsadd_vi_v8i8_unmasked(<8 x i8>, i32 zeroext)

declare <16 x i8> @vsadd_vv_v16i8(<16 x i8>, <16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vsadd_vv_v16i8_unmasked(<16 x i8>, <16 x i8>, i32 zeroext)

declare <16 x i8> @vsadd_vx_v16i8(<16 x i8>, i8, <16 x i1>, i32 zeroext)

declare <16 x i8> @vsadd_vx_v16i8_unmasked(<16 x i8>, i8, i32 zeroext)

declare <16 x i8> @vsadd_vi_v16i8(<16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vsadd_vi_v16i8_unmasked(<16 x i8>, i32 zeroext)

declare <256 x i8> @vsadd_vi_v258i8(<256 x i8>, <256 x i1>, i32 zeroext)

declare <256 x i8> @vsadd_vi_v258i8_unmasked(<256 x i8>, i32 zeroext)

declare <256 x i8> @vsadd_vi_v258i8_evl129(<256 x i8>, <256 x i1>)

declare <256 x i8> @vsadd_vi_v258i8_evl128(<256 x i8>, <256 x i1>)

declare <2 x i16> @vsadd_vv_v2i16(<2 x i16>, <2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vsadd_vv_v2i16_unmasked(<2 x i16>, <2 x i16>, i32 zeroext)

declare <2 x i16> @vsadd_vx_v2i16(<2 x i16>, i16, <2 x i1>, i32 zeroext)

declare <2 x i16> @vsadd_vx_v2i16_unmasked(<2 x i16>, i16, i32 zeroext)

declare <2 x i16> @vsadd_vi_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vsadd_vi_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vsadd_vv_v4i16(<4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vsadd_vv_v4i16_unmasked(<4 x i16>, <4 x i16>, i32 zeroext)

declare <4 x i16> @vsadd_vx_v4i16(<4 x i16>, i16, <4 x i1>, i32 zeroext)

declare <4 x i16> @vsadd_vx_v4i16_unmasked(<4 x i16>, i16, i32 zeroext)

declare <4 x i16> @vsadd_vi_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vsadd_vi_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <8 x i16> @vsadd_vv_v8i16(<8 x i16>, <8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vsadd_vv_v8i16_unmasked(<8 x i16>, <8 x i16>, i32 zeroext)

declare <8 x i16> @vsadd_vx_v8i16(<8 x i16>, i16, <8 x i1>, i32 zeroext)

declare <8 x i16> @vsadd_vx_v8i16_unmasked(<8 x i16>, i16, i32 zeroext)

declare <8 x i16> @vsadd_vi_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vsadd_vi_v8i16_unmasked(<8 x i16>, i32 zeroext)

declare <16 x i16> @vsadd_vv_v16i16(<16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vsadd_vv_v16i16_unmasked(<16 x i16>, <16 x i16>, i32 zeroext)

declare <16 x i16> @vsadd_vx_v16i16(<16 x i16>, i16, <16 x i1>, i32 zeroext)

declare <16 x i16> @vsadd_vx_v16i16_unmasked(<16 x i16>, i16, i32 zeroext)

declare <16 x i16> @vsadd_vi_v16i16(<16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vsadd_vi_v16i16_unmasked(<16 x i16>, i32 zeroext)

declare <2 x i32> @vsadd_vv_v2i32(<2 x i32>, <2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vsadd_vv_v2i32_unmasked(<2 x i32>, <2 x i32>, i32 zeroext)

declare <2 x i32> @vsadd_vx_v2i32(<2 x i32>, i32, <2 x i1>, i32 zeroext)

declare <2 x i32> @vsadd_vx_v2i32_unmasked(<2 x i32>, i32, i32 zeroext)

declare <2 x i32> @vsadd_vi_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vsadd_vi_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <4 x i32> @vsadd_vv_v4i32(<4 x i32>, <4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vsadd_vv_v4i32_unmasked(<4 x i32>, <4 x i32>, i32 zeroext)

define <4 x i32> @vsadd_vx_v4i32(<4 x i32> %va, i32 %b, <4 x i1> %m, i32 zeroext %evl) {
  %elt.head = insertelement <4 x i32> poison, i32 %b, i32 0
  %vb = shufflevector <4 x i32> %elt.head, <4 x i32> poison, <4 x i32> zeroinitializer
  %C = icmp ne <4 x i1> %m, %m
  %v = call <4 x i32> @llvm.sadd.sat.v4i32(<4 x i32> %va, <4 x i32> %vb)
  store <4 x i1> %C, ptr @G.2, align 1
  ret <4 x i32> %v
}

declare <4 x i32> @vsadd_vx_v4i32_unmasked(<4 x i32>, i32, i32 zeroext)

declare <4 x i32> @vsadd_vi_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vsadd_vi_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <8 x i32> @vsadd_vv_v8i32(<8 x i32>, <8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vsadd_vv_v8i32_unmasked(<8 x i32>, <8 x i32>, i32 zeroext)

declare <8 x i32> @vsadd_vx_v8i32(<8 x i32>, i32, <8 x i1>, i32 zeroext)

declare <8 x i32> @vsadd_vx_v8i32_unmasked(<8 x i32>, i32, i32 zeroext)

declare <8 x i32> @vsadd_vi_v8i32(<8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vsadd_vi_v8i32_unmasked(<8 x i32>, i32 zeroext)

declare <16 x i32> @vsadd_vv_v16i32(<16 x i32>, <16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vsadd_vv_v16i32_unmasked(<16 x i32>, <16 x i32>, i32 zeroext)

declare <16 x i32> @vsadd_vx_v16i32(<16 x i32>, i32, <16 x i1>, i32 zeroext)

define <16 x i32> @vsadd_vx_v16i32_unmasked(<16 x i32> %va, i32 %b, i32 zeroext %evl) {
  %elt.head = insertelement <16 x i32> poison, i32 %b, i32 0
  %vb = shufflevector <16 x i32> %elt.head, <16 x i32> poison, <16 x i32> zeroinitializer
  %C = icmp uge i16 1, -32768
  %v = call <16 x i32> @llvm.sadd.sat.v16i32(<16 x i32> %va, <16 x i32> %vb)
  store i1 %C, ptr @G, align 1
  ret <16 x i32> %v
}

declare <16 x i32> @vsadd_vi_v16i32(<16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vsadd_vi_v16i32_unmasked(<16 x i32>, i32 zeroext)

declare <2 x i64> @vsadd_vv_v2i64(<2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vsadd_vv_v2i64_unmasked(<2 x i64>, <2 x i64>, i32 zeroext)

declare <2 x i64> @vsadd_vx_v2i64(<2 x i64>, i64, <2 x i1>, i32 zeroext)

declare <2 x i64> @vsadd_vx_v2i64_unmasked(<2 x i64>, i64, i32 zeroext)

declare <2 x i64> @vsadd_vi_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vsadd_vi_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vsadd_vv_v4i64(<4 x i64>, <4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vsadd_vv_v4i64_unmasked(<4 x i64>, <4 x i64>, i32 zeroext)

declare <4 x i64> @vsadd_vx_v4i64(<4 x i64>, i64, <4 x i1>, i32 zeroext)

declare <4 x i64> @vsadd_vx_v4i64_unmasked(<4 x i64>, i64, i32 zeroext)

declare <4 x i64> @vsadd_vi_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vsadd_vi_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vsadd_vv_v8i64(<8 x i64>, <8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vsadd_vv_v8i64_unmasked(<8 x i64>, <8 x i64>, i32 zeroext)

declare <8 x i64> @vsadd_vx_v8i64(<8 x i64>, i64, <8 x i1>, i32 zeroext)

declare <8 x i64> @vsadd_vx_v8i64_unmasked(<8 x i64>, i64, i32 zeroext)

declare <8 x i64> @vsadd_vi_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vsadd_vi_v8i64_unmasked(<8 x i64>, i32 zeroext)

declare <16 x i64> @vsadd_vv_v16i64(<16 x i64>, <16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vsadd_vv_v16i64_unmasked(<16 x i64>, <16 x i64>, i32 zeroext)

declare <16 x i64> @vsadd_vx_v16i64(<16 x i64>, i64, <16 x i1>, i32 zeroext)

declare <16 x i64> @vsadd_vx_v16i64_unmasked(<16 x i64>, i64, i32 zeroext)

declare <16 x i64> @vsadd_vi_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vsadd_vi_v16i64_unmasked(<16 x i64>, i32 zeroext)

declare <32 x i64> @vsadd_vx_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <32 x i64> @vsadd_vi_v32i64_unmasked(<32 x i64>, i32 zeroext)

declare <32 x i64> @vsadd_vx_v32i64_evl12(<32 x i64>, <32 x i1>)

declare <32 x i64> @vsadd_vx_v32i64_evl27(<32 x i64>, <32 x i1>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.sadd.sat.v16i16(<16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.sadd.sat.v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.sadd.sat.v16i64(<16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.sadd.sat.v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <256 x i8> @llvm.sadd.sat.v256i8(<256 x i8>, <256 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.sadd.sat.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.sadd.sat.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.sadd.sat.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.sadd.sat.v2i8(<2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.sadd.sat.v32i64(<32 x i64>, <32 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.sadd.sat.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.sadd.sat.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.sadd.sat.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.sadd.sat.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <5 x i8> @llvm.sadd.sat.v5i8(<5 x i8>, <5 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.sadd.sat.v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.sadd.sat.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.sadd.sat.v8i64(<8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i7> @llvm.sadd.sat.v8i7(<8 x i7>, <8 x i7>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.sadd.sat.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

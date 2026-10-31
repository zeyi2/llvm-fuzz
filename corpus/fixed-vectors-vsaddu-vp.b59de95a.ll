; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i1> zeroinitializer
@G.1 = global <4 x i8> splat (i8 -1)
@G.2 = global double 0.000000e+00
@G.3 = global <16 x i1> zeroinitializer
@G.4 = global float 1.401300e-45

declare <8 x i7> @vsaddu_vv_v8i7(<8 x i7>, <8 x i7>, <8 x i1>, i32 zeroext)

declare <2 x i8> @vsaddu_vv_v2i8(<2 x i8>, <2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vsaddu_vv_v2i8_unmasked(<2 x i8>, <2 x i8>, i32 zeroext)

declare <2 x i8> @vsaddu_vx_v2i8(<2 x i8>, i8, <2 x i1>, i32 zeroext)

declare <2 x i8> @vsaddu_vx_v2i8_unmasked(<2 x i8>, i8, i32 zeroext)

declare <2 x i8> @vsaddu_vi_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vsaddu_vi_v2i8_unmasked(<2 x i8>, i32 zeroext)

declare <4 x i8> @vsaddu_vv_v4i8(<4 x i8>, <4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vsaddu_vv_v4i8_unmasked(<4 x i8>, <4 x i8>, i32 zeroext)

declare <4 x i8> @vsaddu_vx_v4i8(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vsaddu_vx_v4i8_commute(<4 x i8>, i8, <4 x i1>, i32 zeroext)

declare <4 x i8> @vsaddu_vx_v4i8_unmasked(<4 x i8>, i8, i32 zeroext)

declare <4 x i8> @vsaddu_vi_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

define <4 x i8> @vsaddu_vi_v4i8_unmasked(<4 x i8> %va, i32 zeroext %evl) {
  %LGV1 = load <4 x i8>, ptr @G.1, align 4
  %C = icmp ult <4 x i8> %va, %LGV1
  %v = call <4 x i8> @llvm.uadd.sat.v4i8(<4 x i8> %va, <4 x i8> splat (i8 -1))
  store <4 x i1> %C, ptr @G, align 1
  ret <4 x i8> %v
}

define <5 x i8> @vsaddu_vv_v5i8(<5 x i8> %va, <5 x i8> %b, <5 x i1> %m, i32 zeroext %evl) {
  %B = ashr <5 x i8> %b, zeroinitializer
  %v = call <5 x i8> @llvm.uadd.sat.v5i8(<5 x i8> %va, <5 x i8> %b)
  store <5 x i8> %B, ptr poison, align 8
  ret <5 x i8> %v
}

declare <5 x i8> @vsaddu_vv_v5i8_unmasked(<5 x i8>, <5 x i8>, i32 zeroext)

declare <5 x i8> @vsaddu_vx_v5i8(<5 x i8>, i8, <5 x i1>, i32 zeroext)

declare <5 x i8> @vsaddu_vx_v5i8_unmasked(<5 x i8>, i8, i32 zeroext)

declare <5 x i8> @vsaddu_vi_v5i8(<5 x i8>, <5 x i1>, i32 zeroext)

declare <5 x i8> @vsaddu_vi_v5i8_unmasked(<5 x i8>, i32 zeroext)

declare <8 x i8> @vsaddu_vv_v8i8(<8 x i8>, <8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vsaddu_vv_v8i8_unmasked(<8 x i8>, <8 x i8>, i32 zeroext)

declare <8 x i8> @vsaddu_vx_v8i8(<8 x i8>, i8, <8 x i1>, i32 zeroext)

declare <8 x i8> @vsaddu_vx_v8i8_unmasked(<8 x i8>, i8, i32 zeroext)

declare <8 x i8> @vsaddu_vi_v8i8(<8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vsaddu_vi_v8i8_unmasked(<8 x i8>, i32 zeroext)

declare <16 x i8> @vsaddu_vv_v16i8(<16 x i8>, <16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vsaddu_vv_v16i8_unmasked(<16 x i8>, <16 x i8>, i32 zeroext)

declare <16 x i8> @vsaddu_vx_v16i8(<16 x i8>, i8, <16 x i1>, i32 zeroext)

declare <16 x i8> @vsaddu_vx_v16i8_unmasked(<16 x i8>, i8, i32 zeroext)

declare <16 x i8> @vsaddu_vi_v16i8(<16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vsaddu_vi_v16i8_unmasked(<16 x i8>, i32 zeroext)

declare <256 x i8> @vsaddu_vi_v258i8(<256 x i8>, <256 x i1>, i32 zeroext)

declare <256 x i8> @vsaddu_vi_v258i8_unmasked(<256 x i8>, i32 zeroext)

declare <256 x i8> @vsaddu_vi_v258i8_evl129(<256 x i8>, <256 x i1>)

declare <256 x i8> @vsaddu_vi_v258i8_evl128(<256 x i8>, <256 x i1>)

define <2 x i16> @vsaddu_vv_v2i16(<2 x i16> %va, <2 x i16> %b, <2 x i1> %m, i32 zeroext %evl) {
  %LGV = load double, ptr @G.2, align 8
  %v = call <2 x i16> @llvm.uadd.sat.v2i16(<2 x i16> %va, <2 x i16> %b)
  %B = fadd double 0.000000e+00, %LGV
  store double %B, ptr @G.2, align 8
  ret <2 x i16> %v
}

declare <2 x i16> @vsaddu_vv_v2i16_unmasked(<2 x i16>, <2 x i16>, i32 zeroext)

declare <2 x i16> @vsaddu_vx_v2i16(<2 x i16>, i16, <2 x i1>, i32 zeroext)

declare <2 x i16> @vsaddu_vx_v2i16_unmasked(<2 x i16>, i16, i32 zeroext)

declare <2 x i16> @vsaddu_vi_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vsaddu_vi_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vsaddu_vv_v4i16(<4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vsaddu_vv_v4i16_unmasked(<4 x i16>, <4 x i16>, i32 zeroext)

declare <4 x i16> @vsaddu_vx_v4i16(<4 x i16>, i16, <4 x i1>, i32 zeroext)

declare <4 x i16> @vsaddu_vx_v4i16_unmasked(<4 x i16>, i16, i32 zeroext)

declare <4 x i16> @vsaddu_vi_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vsaddu_vi_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <8 x i16> @vsaddu_vv_v8i16(<8 x i16>, <8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vsaddu_vv_v8i16_unmasked(<8 x i16>, <8 x i16>, i32 zeroext)

declare <8 x i16> @vsaddu_vx_v8i16(<8 x i16>, i16, <8 x i1>, i32 zeroext)

declare <8 x i16> @vsaddu_vx_v8i16_unmasked(<8 x i16>, i16, i32 zeroext)

declare <8 x i16> @vsaddu_vi_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vsaddu_vi_v8i16_unmasked(<8 x i16>, i32 zeroext)

declare <16 x i16> @vsaddu_vv_v16i16(<16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vsaddu_vv_v16i16_unmasked(<16 x i16>, <16 x i16>, i32 zeroext)

declare <16 x i16> @vsaddu_vx_v16i16(<16 x i16>, i16, <16 x i1>, i32 zeroext)

declare <16 x i16> @vsaddu_vx_v16i16_unmasked(<16 x i16>, i16, i32 zeroext)

declare <16 x i16> @vsaddu_vi_v16i16(<16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vsaddu_vi_v16i16_unmasked(<16 x i16>, i32 zeroext)

declare <2 x i32> @vsaddu_vv_v2i32(<2 x i32>, <2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vsaddu_vv_v2i32_unmasked(<2 x i32>, <2 x i32>, i32 zeroext)

declare <2 x i32> @vsaddu_vx_v2i32(<2 x i32>, i32, <2 x i1>, i32 zeroext)

declare <2 x i32> @vsaddu_vx_v2i32_unmasked(<2 x i32>, i32, i32 zeroext)

declare <2 x i32> @vsaddu_vi_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vsaddu_vi_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <4 x i32> @vsaddu_vv_v4i32(<4 x i32>, <4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vsaddu_vv_v4i32_unmasked(<4 x i32>, <4 x i32>, i32 zeroext)

declare <4 x i32> @vsaddu_vx_v4i32(<4 x i32>, i32, <4 x i1>, i32 zeroext)

declare <4 x i32> @vsaddu_vx_v4i32_unmasked(<4 x i32>, i32, i32 zeroext)

declare <4 x i32> @vsaddu_vi_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

define <4 x i32> @vsaddu_vi_v4i32_unmasked(<4 x i32> %va, i32 zeroext %evl) {
  %C = icmp eq <4 x i32> %va, splat (i32 65536)
  %v = call <4 x i32> @llvm.uadd.sat.v4i32(<4 x i32> %va, <4 x i32> splat (i32 -1))
  store <4 x i1> %C, ptr @G, align 1
  ret <4 x i32> %v
}

declare <8 x i32> @vsaddu_vv_v8i32(<8 x i32>, <8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vsaddu_vv_v8i32_unmasked(<8 x i32>, <8 x i32>, i32 zeroext)

declare <8 x i32> @vsaddu_vx_v8i32(<8 x i32>, i32, <8 x i1>, i32 zeroext)

define <8 x i32> @vsaddu_vx_v8i32_unmasked(<8 x i32> %va, i32 %b, i32 zeroext %evl) {
  %elt.head = insertelement <8 x i32> poison, i32 %b, i32 0
  %vb = shufflevector <8 x i32> %elt.head, <8 x i32> poison, <8 x i32> zeroinitializer
  %v = call <8 x i32> @llvm.uadd.sat.v8i32(<8 x i32> %va, <8 x i32> %vb)
  %C = fcmp ole half 5.960460e-08, +qnan
  store i1 %C, ptr poison, align 1
  ret <8 x i32> %v
}

declare <8 x i32> @vsaddu_vi_v8i32(<8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vsaddu_vi_v8i32_unmasked(<8 x i32>, i32 zeroext)

declare <16 x i32> @vsaddu_vv_v16i32(<16 x i32>, <16 x i32>, <16 x i1>, i32 zeroext)

define <16 x i32> @vsaddu_vv_v16i32_unmasked(<16 x i32> %va, <16 x i32> %b, i32 zeroext %evl) {
  %v = call <16 x i32> @llvm.uadd.sat.v16i32(<16 x i32> %va, <16 x i32> %b)
  %C = icmp sle <16 x i32> %v, %va
  store <16 x i1> %C, ptr @G.3, align 2
  ret <16 x i32> %v
}

declare <16 x i32> @vsaddu_vx_v16i32(<16 x i32>, i32, <16 x i1>, i32 zeroext)

declare <16 x i32> @vsaddu_vx_v16i32_unmasked(<16 x i32>, i32, i32 zeroext)

define <16 x i32> @vsaddu_vi_v16i32(<16 x i32> %va, <16 x i1> %m, i32 zeroext %evl) {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %B = sub i32 %evl, %evl
  %v = call <16 x i32> @llvm.uadd.sat.v16i32(<16 x i32> %va, <16 x i32> splat (i32 -1))
  store i32 %B, ptr %A, align 4
  ret <16 x i32> %v
}

declare <16 x i32> @vsaddu_vi_v16i32_unmasked(<16 x i32>, i32 zeroext)

declare <2 x i64> @vsaddu_vv_v2i64(<2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vsaddu_vv_v2i64_unmasked(<2 x i64>, <2 x i64>, i32 zeroext)

declare <2 x i64> @vsaddu_vx_v2i64(<2 x i64>, i64, <2 x i1>, i32 zeroext)

declare <2 x i64> @vsaddu_vx_v2i64_unmasked(<2 x i64>, i64, i32 zeroext)

declare <2 x i64> @vsaddu_vi_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vsaddu_vi_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vsaddu_vv_v4i64(<4 x i64>, <4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vsaddu_vv_v4i64_unmasked(<4 x i64>, <4 x i64>, i32 zeroext)

declare <4 x i64> @vsaddu_vx_v4i64(<4 x i64>, i64, <4 x i1>, i32 zeroext)

declare <4 x i64> @vsaddu_vx_v4i64_unmasked(<4 x i64>, i64, i32 zeroext)

declare <4 x i64> @vsaddu_vi_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vsaddu_vi_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vsaddu_vv_v8i64(<8 x i64>, <8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vsaddu_vv_v8i64_unmasked(<8 x i64>, <8 x i64>, i32 zeroext)

declare <8 x i64> @vsaddu_vx_v8i64(<8 x i64>, i64, <8 x i1>, i32 zeroext)

declare <8 x i64> @vsaddu_vx_v8i64_unmasked(<8 x i64>, i64, i32 zeroext)

declare <8 x i64> @vsaddu_vi_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vsaddu_vi_v8i64_unmasked(<8 x i64>, i32 zeroext)

declare <16 x i64> @vsaddu_vv_v16i64(<16 x i64>, <16 x i64>, <16 x i1>, i32 zeroext)

define <16 x i64> @vsaddu_vv_v16i64_unmasked(<16 x i64> %va, <16 x i64> %b, i32 zeroext %evl) {
  %v = call <16 x i64> @llvm.uadd.sat.v16i64(<16 x i64> %va, <16 x i64> %b)
  %E = extractelement <4 x float> splat (float +inf), i32 %evl
  store float %E, ptr @G.4, align 4
  ret <16 x i64> %v
}

declare <16 x i64> @vsaddu_vx_v16i64(<16 x i64>, i64, <16 x i1>, i32 zeroext)

declare <16 x i64> @vsaddu_vx_v16i64_unmasked(<16 x i64>, i64, i32 zeroext)

declare <16 x i64> @vsaddu_vi_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vsaddu_vi_v16i64_unmasked(<16 x i64>, i32 zeroext)

declare <32 x i64> @vsaddu_vx_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <32 x i64> @vsaddu_vi_v32i64_unmasked(<32 x i64>, i32 zeroext)

declare <32 x i64> @vsaddu_vx_v32i64_evl12(<32 x i64>, <32 x i1>)

declare <32 x i64> @vsaddu_vx_v32i64_evl27(<32 x i64>, <32 x i1>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.uadd.sat.v16i16(<16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.uadd.sat.v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.uadd.sat.v16i64(<16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.uadd.sat.v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <256 x i8> @llvm.uadd.sat.v256i8(<256 x i8>, <256 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.uadd.sat.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.uadd.sat.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.uadd.sat.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.uadd.sat.v2i8(<2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.uadd.sat.v32i64(<32 x i64>, <32 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.uadd.sat.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.uadd.sat.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.uadd.sat.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.uadd.sat.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <5 x i8> @llvm.uadd.sat.v5i8(<5 x i8>, <5 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.uadd.sat.v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.uadd.sat.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.uadd.sat.v8i64(<8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i7> @llvm.uadd.sat.v8i7(<8 x i7>, <8 x i7>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.uadd.sat.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

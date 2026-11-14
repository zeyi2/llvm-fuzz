; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx -O3 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 -32768
@G.1 = global i16 0
@G.2 = global <2 x i16> splat (i16 1)
@G.3 = global <4 x i32> splat (i32 42)
@G.4 = global <16 x i1> zeroinitializer

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

define <5 x i8> @vssub_vv_v5i8(<5 x i8> %va, <5 x i8> %b, <5 x i1> %m, i32 zeroext %evl) {
  %v = call <5 x i8> @llvm.ssub.sat.v5i8(<5 x i8> %va, <5 x i8> %b)
  %C = icmp uge <5 x i8> %v, %v
  store <5 x i1> %C, ptr poison, align 1
  ret <5 x i8> %v
}

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
  %LGV = load <4 x i32>, ptr @G.3, align 16
  %v = call <8 x i8> @llvm.ssub.sat.v8i8(<8 x i8> %va, <8 x i8> splat (i8 -1))
  %C = icmp ugt <4 x i32> %LGV, splat (i32 65536)
  store <4 x i1> %C, ptr poison, align 1
  ret <8 x i8> %v
}

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

define <2 x i16> @vssub_vi_v2i16(<2 x i16> %va, <2 x i1> %m, i32 zeroext %evl) {
  %LGV1 = load i16, ptr @G.1, align 2
  %LGV = load i16, ptr @G, align 2
  %I = insertelement <2 x i16> %va, i16 %LGV, i16 %LGV1
  %v = call <2 x i16> @llvm.ssub.sat.v2i16(<2 x i16> %va, <2 x i16> splat (i16 -1))
  store <2 x i16> %I, ptr @G.2, align 4
  ret <2 x i16> %v
}

declare <2 x i16> @vssub_vi_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vssub_vv_v4i16(<4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vssub_vv_v4i16_unmasked(<4 x i16>, <4 x i16>, i32 zeroext)

define <4 x i16> @vssub_vx_v4i16(<4 x i16> %va, i16 %b, <4 x i1> %m, i32 zeroext %evl) {
  %elt.head = insertelement <4 x i16> poison, i16 %b, i32 0
  %B = lshr i16 %b, 256
  %vb = shufflevector <4 x i16> %elt.head, <4 x i16> poison, <4 x i32> zeroinitializer
  %v = call <4 x i16> @llvm.ssub.sat.v4i16(<4 x i16> %va, <4 x i16> %vb)
  store i16 %B, ptr @G.1, align 2
  ret <4 x i16> %v
}

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

define <16 x i16> @vssub_vv_v16i16_unmasked(<16 x i16> %va, <16 x i16> %b, i32 zeroext %evl) {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %C = fcmp ule <4 x float> splat (float 4.200000e+01), splat (float +inf)
  %v = call <16 x i16> @llvm.ssub.sat.v16i16(<16 x i16> %va, <16 x i16> %b)
  store <4 x i1> %C, ptr %A, align 1
  %C1 = icmp ugt <16 x i16> %v, splat (i16 256)
  store <16 x i1> %C1, ptr @G.4, align 2
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

define <16 x i32> @vssub_vv_v16i32_unmasked(<16 x i32> %va, <16 x i32> %b, i32 zeroext %evl) {
  %v = call <16 x i32> @llvm.ssub.sat.v16i32(<16 x i32> %va, <16 x i32> %b)
  %B = udiv <16 x i32> %v, splat (i32 42)
  ret <16 x i32> %B
}

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

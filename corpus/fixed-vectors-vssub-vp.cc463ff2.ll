; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 42
@G.1 = global i128 170141183460469231731687303715884105727
@G.2 = global i1 true

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

define <16 x i8> @vssub_vv_v16i8(<16 x i8> %va, <16 x i8> %b, <16 x i1> %m, i32 zeroext %evl) {
  %B = and i64 42, -9223372036854775808
  %v = call <16 x i8> @llvm.ssub.sat.v16i8(<16 x i8> %va, <16 x i8> %b)
  store i64 %B, ptr poison, align 4
  ret <16 x i8> %v
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

define <4 x i16> @vssub_vx_v4i16(<4 x i16> %va, i16 %b, <4 x i1> %m, i32 zeroext %evl) {
  %A = alloca <4 x i16>, align 8
  store <4 x i16> poison, ptr %A, align 8
  %elt.head = insertelement <4 x i16> poison, i16 %b, i32 0
  %vb = shufflevector <4 x i16> %elt.head, <4 x i16> poison, <4 x i32> zeroinitializer
  %v = call <4 x i16> @llvm.ssub.sat.v4i16(<4 x i16> %va, <4 x i16> %vb)
  %B = mul <4 x i16> %va, %va
  store <4 x i16> %B, ptr %A, align 8
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

define <4 x i32> @vssub_vv_v4i32_unmasked(<4 x i32> %va, <4 x i32> %b, i32 zeroext %evl) {
  %LGV = load i128, ptr @G, align 4
  %C = icmp ult i128 -1, %LGV
  %v = call <4 x i32> @llvm.ssub.sat.v4i32(<4 x i32> %va, <4 x i32> %b)
  store i1 %C, ptr poison, align 1
  ret <4 x i32> %v
}

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

define <4 x i64> @vssub_vv_v4i64(<4 x i64> %va, <4 x i64> %b, <4 x i1> %m, i32 zeroext %evl) {
  %v = call <4 x i64> @llvm.ssub.sat.v4i64(<4 x i64> %va, <4 x i64> %b)
  %B = xor i32 42, 1
  store i32 %B, ptr poison, align 4
  ret <4 x i64> %v
}

declare <4 x i64> @vssub_vv_v4i64_unmasked(<4 x i64>, <4 x i64>, i32 zeroext)

declare <4 x i64> @vssub_vx_v4i64(<4 x i64>, i64, <4 x i1>, i32 zeroext)

define <4 x i64> @vssub_vx_v4i64_unmasked(<4 x i64> %va, i64 %b, i32 zeroext %evl) {
  %LGV = load i128, ptr @G.1, align 4
  %elt.head = insertelement <4 x i64> poison, i64 %b, i32 0
  %vb = shufflevector <4 x i64> %elt.head, <4 x i64> poison, <4 x i32> zeroinitializer
  %v = call <4 x i64> @llvm.ssub.sat.v4i64(<4 x i64> %va, <4 x i64> %vb)
  %C = icmp ule i128 42, %LGV
  store i1 %C, ptr @G.2, align 1
  ret <4 x i64> %v
}

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

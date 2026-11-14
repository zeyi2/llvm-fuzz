; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+m,+zhinx -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global bfloat +inf
@G.1 = global i1 false
@G.2 = global i16 42
@G.3 = global i8 1
@G.4 = global i32 1

declare <2 x i16> @vp_bswap_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vp_bswap_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vp_bswap_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

define <4 x i16> @vp_bswap_v4i16_unmasked(<4 x i16> %va, i32 zeroext %evl) {
  %C = fcmp ord float 1.000000e+00, 4.200000e+01
  %v = call <4 x i16> @llvm.bswap.v4i16(<4 x i16> %va)
  store i1 %C, ptr poison, align 1
  ret <4 x i16> %v
}

define <8 x i16> @vp_bswap_v8i16(<8 x i16> %va, <8 x i1> %m, i32 zeroext %evl) {
  %LGV = load bfloat, ptr @G, align 2
  %C = fcmp olt bfloat +inf, %LGV
  %v = call <8 x i16> @llvm.bswap.v8i16(<8 x i16> %va)
  store i1 %C, ptr @G.1, align 1
  ret <8 x i16> %v
}

declare <8 x i16> @vp_bswap_v8i16_unmasked(<8 x i16>, i32 zeroext)

define <16 x i16> @vp_bswap_v16i16(<16 x i16> %va, <16 x i1> %m, i32 zeroext %evl) {
  %v = call <16 x i16> @llvm.bswap.v16i16(<16 x i16> %va)
  %E = extractelement <16 x i16> %va, i32 %evl
  store i16 %E, ptr @G.2, align 2
  ret <16 x i16> %v
}

declare <16 x i16> @vp_bswap_v16i16_unmasked(<16 x i16>, i32 zeroext)

declare <2 x i32> @vp_bswap_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vp_bswap_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <4 x i32> @vp_bswap_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vp_bswap_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <8 x i32> @vp_bswap_v8i32(<8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vp_bswap_v8i32_unmasked(<8 x i32>, i32 zeroext)

declare <16 x i32> @vp_bswap_v16i32(<16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vp_bswap_v16i32_unmasked(<16 x i32>, i32 zeroext)

declare <2 x i64> @vp_bswap_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vp_bswap_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vp_bswap_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

define <4 x i64> @vp_bswap_v4i64_unmasked(<4 x i64> %va, i32 zeroext %evl) {
  %LGV = load i32, ptr @G.4, align 4
  %C = icmp uge i32 %evl, %LGV
  %v = call <4 x i64> @llvm.bswap.v4i64(<4 x i64> %va)
  store i1 %C, ptr poison, align 1
  ret <4 x i64> %v
}

define <8 x i64> @vp_bswap_v8i64(<8 x i64> %va, <8 x i1> %m, i32 zeroext %evl) {
  %v = call <8 x i64> @llvm.bswap.v8i64(<8 x i64> %va)
  %B = and i8 127, 1
  store i8 %B, ptr @G.3, align 1
  ret <8 x i64> %v
}

declare <8 x i64> @vp_bswap_v8i64_unmasked(<8 x i64>, i32 zeroext)

declare <15 x i64> @vp_bswap_v15i64(<15 x i64>, <15 x i1>, i32 zeroext)

declare <15 x i64> @vp_bswap_v15i64_unmasked(<15 x i64>, i32 zeroext)

declare <16 x i64> @vp_bswap_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vp_bswap_v16i64_unmasked(<16 x i64>, i32 zeroext)

declare <128 x i16> @vp_bswap_v128i16(<128 x i16>, <128 x i1>, i32 zeroext)

define <128 x i16> @vp_bswap_v128i16_unmasked(<128 x i16> %va, i32 zeroext %evl) {
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %B = srem i8 0, 0
  %v = call <128 x i16> @llvm.bswap.v128i16(<128 x i16> %va)
  store i8 %B, ptr %A, align 1
  ret <128 x i16> %v
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <128 x i16> @llvm.bswap.v128i16(<128 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <15 x i64> @llvm.bswap.v15i64(<15 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.bswap.v16i16(<16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.bswap.v16i32(<16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.bswap.v16i64(<16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.bswap.v2i16(<2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.bswap.v2i32(<2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.bswap.v2i64(<2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.bswap.v4i16(<4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.bswap.v4i32(<4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.bswap.v4i64(<4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.bswap.v8i16(<8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.bswap.v8i32(<8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.bswap.v8i64(<8 x i64>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

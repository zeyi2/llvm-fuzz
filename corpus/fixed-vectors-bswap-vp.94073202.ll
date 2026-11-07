; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+m,+zhinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <16 x i32> zeroinitializer
@G.1 = global <16 x i1> splat (i1 true)
@G.2 = global i64 0
@G.3 = global i1 false
@G.4 = global i32 -2147483648

define <2 x i16> @vp_bswap_v2i16(<2 x i16> %va, <2 x i1> %m, i32 zeroext %evl) {
  %A = alloca i16, align 2
  store i16 poison, ptr %A, align 2
  %B = srem i16 0, -32768
  %v = call <2 x i16> @llvm.bswap.v2i16(<2 x i16> %va)
  store i16 %B, ptr %A, align 2
  ret <2 x i16> %v
}

declare <2 x i16> @vp_bswap_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vp_bswap_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

define <4 x i16> @vp_bswap_v4i16_unmasked(<4 x i16> %va, i32 zeroext %evl) {
  %LGV = load i64, ptr @G.2, align 4
  %v = call <4 x i16> @llvm.bswap.v4i16(<4 x i16> %va)
  %C = icmp uge i64 0, %LGV
  store i1 %C, ptr @G.3, align 1
  ret <4 x i16> %v
}

declare <8 x i16> @vp_bswap_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vp_bswap_v8i16_unmasked(<8 x i16>, i32 zeroext)

declare <16 x i16> @vp_bswap_v16i16(<16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vp_bswap_v16i16_unmasked(<16 x i16>, i32 zeroext)

declare <2 x i32> @vp_bswap_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vp_bswap_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <4 x i32> @vp_bswap_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vp_bswap_v4i32_unmasked(<4 x i32>, i32 zeroext)

define <8 x i32> @vp_bswap_v8i32(<8 x i32> %va, <8 x i1> %m, i32 zeroext %evl) {
  %v = call <8 x i32> @llvm.bswap.v8i32(<8 x i32> %va)
  %B = mul <8 x i32> %v, %va
  ret <8 x i32> %B
}

declare <8 x i32> @vp_bswap_v8i32_unmasked(<8 x i32>, i32 zeroext)

define <16 x i32> @vp_bswap_v16i32(<16 x i32> %va, <16 x i1> %m, i32 zeroext %evl) {
  %LGV = load <16 x i32>, ptr @G, align 64
  %v = call <16 x i32> @llvm.bswap.v16i32(<16 x i32> %va)
  %C = icmp ule <16 x i32> %v, %LGV
  store <16 x i1> %C, ptr @G.1, align 2
  ret <16 x i32> %v
}

declare <16 x i32> @vp_bswap_v16i32_unmasked(<16 x i32>, i32 zeroext)

declare <2 x i64> @vp_bswap_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vp_bswap_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vp_bswap_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vp_bswap_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vp_bswap_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

define <8 x i64> @vp_bswap_v8i64_unmasked(<8 x i64> %va, i32 zeroext %evl) {
  %LGV1 = load i32, ptr @G.4, align 4
  %C = icmp sle i32 %evl, %LGV1
  %v = call <8 x i64> @llvm.bswap.v8i64(<8 x i64> %va)
  store i1 %C, ptr poison, align 1
  ret <8 x i64> %v
}

declare <15 x i64> @vp_bswap_v15i64(<15 x i64>, <15 x i1>, i32 zeroext)

declare <15 x i64> @vp_bswap_v15i64_unmasked(<15 x i64>, i32 zeroext)

declare <16 x i64> @vp_bswap_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vp_bswap_v16i64_unmasked(<16 x i64>, i32 zeroext)

declare <128 x i16> @vp_bswap_v128i16(<128 x i16>, <128 x i1>, i32 zeroext)

declare <128 x i16> @vp_bswap_v128i16_unmasked(<128 x i16>, i32 zeroext)

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

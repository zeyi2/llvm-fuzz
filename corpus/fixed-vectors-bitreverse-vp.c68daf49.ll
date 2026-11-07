; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+m,+zdinx -O0 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 -2147483648)
@G.1 = global <2 x i8> splat (i8 -128)
@G.2 = global i8 127
@G.3 = global half 5.960460e-08
@G.4 = global half 6.550400e+04
@G.5 = global <15 x i64> splat (i64 9223372036854775807)

declare <2 x i8> @vp_bitreverse_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

define <2 x i8> @vp_bitreverse_v2i8_unmasked(<2 x i8> %va, i32 zeroext %evl) {
  %v = call <2 x i8> @llvm.bitreverse.v2i8(<2 x i8> %va)
  %B = srem <2 x i8> %v, %va
  store <2 x i8> %B, ptr @G.1, align 2
  ret <2 x i8> %v
}

declare <4 x i8> @vp_bitreverse_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

define <4 x i8> @vp_bitreverse_v4i8_unmasked(<4 x i8> %va, i32 zeroext %evl) {
  %LGV = load i8, ptr @G.2, align 1
  %v = call <4 x i8> @llvm.bitreverse.v4i8(<4 x i8> %va)
  %B = or i8 0, %LGV
  store i8 %B, ptr poison, align 1
  ret <4 x i8> %v
}

declare <8 x i8> @vp_bitreverse_v8i8(<8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vp_bitreverse_v8i8_unmasked(<8 x i8>, i32 zeroext)

declare <16 x i8> @vp_bitreverse_v16i8(<16 x i8>, <16 x i1>, i32 zeroext)

define <16 x i8> @vp_bitreverse_v16i8_unmasked(<16 x i8> %va, i32 zeroext %evl) {
  %v = call <16 x i8> @llvm.bitreverse.v16i8(<16 x i8> %va)
  %C = icmp slt <16 x i8> %v, splat (i8 -1)
  store <16 x i1> %C, ptr poison, align 2
  ret <16 x i8> %v
}

declare <2 x i16> @vp_bitreverse_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vp_bitreverse_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vp_bitreverse_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vp_bitreverse_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <8 x i16> @vp_bitreverse_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

define <8 x i16> @vp_bitreverse_v8i16_unmasked(<8 x i16> %va, i32 zeroext %evl) {
  %LGV1 = load half, ptr @G.4, align 2
  %LGV = load half, ptr @G.3, align 2
  %v = call <8 x i16> @llvm.bitreverse.v8i16(<8 x i16> %va)
  %B = fadd half %LGV, %LGV1
  store half %B, ptr @G.4, align 2
  ret <8 x i16> %v
}

declare <16 x i16> @vp_bitreverse_v16i16(<16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vp_bitreverse_v16i16_unmasked(<16 x i16>, i32 zeroext)

declare <2 x i32> @vp_bitreverse_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vp_bitreverse_v2i32_unmasked(<2 x i32>, i32 zeroext)

define <4 x i32> @vp_bitreverse_v4i32(<4 x i32> %va, <4 x i1> %m, i32 zeroext %evl) {
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %LGV = load <4 x i32>, ptr @G, align 16
  %v = call <4 x i32> @llvm.bitreverse.v4i32(<4 x i32> %va)
  %B = sdiv <4 x i32> %v, %LGV
  store <4 x i32> %B, ptr %A, align 16
  ret <4 x i32> %v
}

declare <4 x i32> @vp_bitreverse_v4i32_unmasked(<4 x i32>, i32 zeroext)

define <8 x i32> @vp_bitreverse_v8i32(<8 x i32> %va, <8 x i1> %m, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %v = call <8 x i32> @llvm.bitreverse.v8i32(<8 x i32> %va)
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <8 x i32> %v

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

declare <8 x i32> @vp_bitreverse_v8i32_unmasked(<8 x i32>, i32 zeroext)

declare <16 x i32> @vp_bitreverse_v16i32(<16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vp_bitreverse_v16i32_unmasked(<16 x i32>, i32 zeroext)

declare <2 x i64> @vp_bitreverse_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vp_bitreverse_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vp_bitreverse_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vp_bitreverse_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vp_bitreverse_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vp_bitreverse_v8i64_unmasked(<8 x i64>, i32 zeroext)

declare <15 x i64> @vp_bitreverse_v15i64(<15 x i64>, <15 x i1>, i32 zeroext)

define <15 x i64> @vp_bitreverse_v15i64_unmasked(<15 x i64> %va, i32 zeroext %evl) {
  %v = call <15 x i64> @llvm.bitreverse.v15i64(<15 x i64> %va)
  store <15 x i64> %v, ptr @G.5, align 128
  ret <15 x i64> %v
}

declare <16 x i64> @vp_bitreverse_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vp_bitreverse_v16i64_unmasked(<16 x i64>, i32 zeroext)

declare <128 x i16> @vp_bitreverse_v128i16(<128 x i16>, <128 x i1>, i32 zeroext)

declare <128 x i16> @vp_bitreverse_v128i16_unmasked(<128 x i16>, i32 zeroext)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <128 x i16> @llvm.bitreverse.v128i16(<128 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <15 x i64> @llvm.bitreverse.v15i64(<15 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.bitreverse.v16i16(<16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.bitreverse.v16i32(<16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.bitreverse.v16i64(<16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.bitreverse.v16i8(<16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.bitreverse.v2i16(<2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.bitreverse.v2i32(<2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.bitreverse.v2i64(<2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.bitreverse.v2i8(<2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.bitreverse.v4i16(<4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.bitreverse.v4i32(<4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.bitreverse.v4i64(<4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.bitreverse.v4i8(<4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.bitreverse.v8i16(<8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.bitreverse.v8i32(<8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.bitreverse.v8i64(<8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.bitreverse.v8i8(<8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

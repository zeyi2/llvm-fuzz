; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+m,+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i1> zeroinitializer
@G.1 = global <8 x i32> splat (i32 -1)

declare <2 x i8> @vp_bitreverse_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vp_bitreverse_v2i8_unmasked(<2 x i8>, i32 zeroext)

declare <4 x i8> @vp_bitreverse_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vp_bitreverse_v4i8_unmasked(<4 x i8>, i32 zeroext)

define <8 x i8> @vp_bitreverse_v8i8(<8 x i8> %va, <8 x i1> %m, i32 zeroext %evl) {
  %LGV = load <8 x i1>, ptr @G, align 1
  %v = call <8 x i8> @llvm.bitreverse.v8i8(<8 x i8> %va)
  %C = icmp sgt <8 x i1> %m, %LGV
  store <8 x i1> %C, ptr @G, align 1
  ret <8 x i8> %v
}

declare <8 x i8> @vp_bitreverse_v8i8_unmasked(<8 x i8>, i32 zeroext)

declare <16 x i8> @vp_bitreverse_v16i8(<16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vp_bitreverse_v16i8_unmasked(<16 x i8>, i32 zeroext)

declare <2 x i16> @vp_bitreverse_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vp_bitreverse_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vp_bitreverse_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vp_bitreverse_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <8 x i16> @vp_bitreverse_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vp_bitreverse_v8i16_unmasked(<8 x i16>, i32 zeroext)

declare <16 x i16> @vp_bitreverse_v16i16(<16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vp_bitreverse_v16i16_unmasked(<16 x i16>, i32 zeroext)

declare <2 x i32> @vp_bitreverse_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

define <2 x i32> @vp_bitreverse_v2i32_unmasked(<2 x i32> %va, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = icmp sle i32 42, %evl
  %v = call <2 x i32> @llvm.bitreverse.v2i32(<2 x i32> %va)
  store i1 %C, ptr %A, align 1
  ret <2 x i32> %v
}

declare <4 x i32> @vp_bitreverse_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vp_bitreverse_v4i32_unmasked(<4 x i32>, i32 zeroext)

define <8 x i32> @vp_bitreverse_v8i32(<8 x i32> %va, <8 x i1> %m, i32 zeroext %evl) {
  %v = call <8 x i32> @llvm.bitreverse.v8i32(<8 x i32> %va)
  %S = shufflevector <8 x i32> %v, <8 x i32> %v, <8 x i32> poison
  store <8 x i32> %S, ptr @G.1, align 32
  ret <8 x i32> %v
}

declare <8 x i32> @vp_bitreverse_v8i32_unmasked(<8 x i32>, i32 zeroext)

define <16 x i32> @vp_bitreverse_v16i32(<16 x i32> %va, <16 x i1> %m, i32 zeroext %evl) {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %B = xor i32 %evl, %evl
  %v = call <16 x i32> @llvm.bitreverse.v16i32(<16 x i32> %va)
  store i32 %B, ptr %A, align 4
  ret <16 x i32> %v
}

define <16 x i32> @vp_bitreverse_v16i32_unmasked(<16 x i32> %va, i32 zeroext %evl) {
  %A1 = alloca i1, align 1
  store i1 true, ptr %A1, align 1
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %v = call <16 x i32> @llvm.bitreverse.v16i32(<16 x i32> %va)
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <16 x i32> %v

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %L2 = load i1, ptr %A1, align 1
  br i1 %L2, label %F, label %BB
}

declare <2 x i64> @vp_bitreverse_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vp_bitreverse_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vp_bitreverse_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vp_bitreverse_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vp_bitreverse_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vp_bitreverse_v8i64_unmasked(<8 x i64>, i32 zeroext)

declare <15 x i64> @vp_bitreverse_v15i64(<15 x i64>, <15 x i1>, i32 zeroext)

declare <15 x i64> @vp_bitreverse_v15i64_unmasked(<15 x i64>, i32 zeroext)

declare <16 x i64> @vp_bitreverse_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vp_bitreverse_v16i64_unmasked(<16 x i64>, i32 zeroext)

declare <128 x i16> @vp_bitreverse_v128i16(<128 x i16>, <128 x i1>, i32 zeroext)

define <128 x i16> @vp_bitreverse_v128i16_unmasked(<128 x i16> %va, i32 zeroext %evl) {
  %A = alloca <2 x i64>, align 16
  store <2 x i64> poison, ptr %A, align 16
  %B = lshr <2 x i64> splat (i64 -1), splat (i64 -9223372036854775808)
  %v = call <128 x i16> @llvm.bitreverse.v128i16(<128 x i16> %va)
  store <2 x i64> %B, ptr %A, align 16
  ret <128 x i16> %v
}

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

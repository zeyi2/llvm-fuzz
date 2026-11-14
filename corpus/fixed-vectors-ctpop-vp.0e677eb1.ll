; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+m,+zdinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i8> splat (i8 -1)

declare <2 x i8> @vp_ctpop_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

define <2 x i8> @vp_ctpop_v2i8_unmasked(<2 x i8> %va, i32 zeroext %evl) {
  %v = call <2 x i8> @llvm.ctpop.v2i8(<2 x i8> %va)
  %B = udiv <2 x i8> %va, %v
  store <2 x i8> %B, ptr @G, align 2
  ret <2 x i8> %v
}

declare <4 x i8> @vp_ctpop_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vp_ctpop_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <8 x i8> @vp_ctpop_v8i8(<8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vp_ctpop_v8i8_unmasked(<8 x i8>, i32 zeroext)

declare <16 x i8> @vp_ctpop_v16i8(<16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vp_ctpop_v16i8_unmasked(<16 x i8>, i32 zeroext)

declare <2 x i16> @vp_ctpop_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vp_ctpop_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vp_ctpop_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vp_ctpop_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <8 x i16> @vp_ctpop_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vp_ctpop_v8i16_unmasked(<8 x i16>, i32 zeroext)

declare <16 x i16> @vp_ctpop_v16i16(<16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vp_ctpop_v16i16_unmasked(<16 x i16>, i32 zeroext)

declare <2 x i32> @vp_ctpop_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vp_ctpop_v2i32_unmasked(<2 x i32>, i32 zeroext)

define <4 x i32> @vp_ctpop_v4i32(<4 x i32> %va, <4 x i1> %m, i32 zeroext %evl) {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %v = call <4 x i32> @llvm.ctpop.v4i32(<4 x i32> %va)
  %C = icmp uge <4 x i32> %v, %va
  store <4 x i1> %C, ptr %A, align 1
  ret <4 x i32> %v
}

declare <4 x i32> @vp_ctpop_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <8 x i32> @vp_ctpop_v8i32(<8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vp_ctpop_v8i32_unmasked(<8 x i32>, i32 zeroext)

declare <16 x i32> @vp_ctpop_v16i32(<16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vp_ctpop_v16i32_unmasked(<16 x i32>, i32 zeroext)

declare <2 x i64> @vp_ctpop_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vp_ctpop_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vp_ctpop_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vp_ctpop_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vp_ctpop_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

define <8 x i64> @vp_ctpop_v8i64_unmasked(<8 x i64> %va, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %v = call <8 x i64> @llvm.ctpop.v8i64(<8 x i64> %va)
  ret <8 x i64> %v

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  br i1 %L, label %BB, label %F
}

declare <15 x i64> @vp_ctpop_v15i64(<15 x i64>, <15 x i1>, i32 zeroext)

declare <15 x i64> @vp_ctpop_v15i64_unmasked(<15 x i64>, i32 zeroext)

declare <16 x i64> @vp_ctpop_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vp_ctpop_v16i64_unmasked(<16 x i64>, i32 zeroext)

declare <32 x i64> @vp_ctpop_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <32 x i64> @vp_ctpop_v32i64_unmasked(<32 x i64>, i32 zeroext)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <15 x i64> @llvm.ctpop.v15i64(<15 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.ctpop.v16i16(<16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.ctpop.v16i32(<16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.ctpop.v16i64(<16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.ctpop.v16i8(<16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.ctpop.v2i16(<2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.ctpop.v2i32(<2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.ctpop.v2i64(<2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.ctpop.v2i8(<2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.ctpop.v32i64(<32 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.ctpop.v4i16(<4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.ctpop.v4i32(<4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.ctpop.v4i64(<4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.ctpop.v4i8(<4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.ctpop.v8i16(<8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.ctpop.v8i32(<8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.ctpop.v8i64(<8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.ctpop.v8i8(<8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

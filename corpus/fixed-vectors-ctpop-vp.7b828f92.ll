; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+m,+zfinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i8> splat (i8 127)

declare <2 x i8> @vp_ctpop_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vp_ctpop_v2i8_unmasked(<2 x i8>, i32 zeroext)

define <4 x i8> @vp_ctpop_v4i8(<4 x i8> %va, <4 x i1> %m, i32 zeroext %evl) {
  %v = call <4 x i8> @llvm.ctpop.v4i8(<4 x i8> %va)
  store <4 x i8> %v, ptr @G, align 4
  ret <4 x i8> %v
}

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

declare <4 x i32> @vp_ctpop_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

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

declare <8 x i64> @vp_ctpop_v8i64_unmasked(<8 x i64>, i32 zeroext)

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

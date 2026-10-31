; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+m,+zdinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -128
@G.1 = global i8 16
@G.2 = global <4 x i64> splat (i64 -9223372036854775808)
@G.3 = global <4 x i16> splat (i16 -32768)
@G.4 = global i1 true
@G.5 = global <4 x i16> splat (i16 1)
@G.6 = global <4 x i1> zeroinitializer
@G.7 = global i1 true
@G.8 = global i1 false
@G.9 = global <16 x i1> zeroinitializer
@G.10 = global <4 x i16> zeroinitializer

declare <2 x i8> @vp_ctpop_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vp_ctpop_v2i8_unmasked(<2 x i8>, i32 zeroext)

declare <4 x i8> @vp_ctpop_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vp_ctpop_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <8 x i8> @vp_ctpop_v8i8(<8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vp_ctpop_v8i8_unmasked(<8 x i8>, i32 zeroext)

declare <16 x i8> @vp_ctpop_v16i8(<16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vp_ctpop_v16i8_unmasked(<16 x i8>, i32 zeroext)

declare <2 x i16> @vp_ctpop_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vp_ctpop_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vp_ctpop_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

define <4 x i16> @vp_ctpop_v4i16_unmasked(<4 x i16> %va, i32 zeroext %evl) {
  %B2 = or <4 x i16> %va, %va
  %LGV1 = load <4 x i16>, ptr @G.5, align 8
  %B = lshr <4 x i16> %va, %va
  %C1 = icmp sgt <4 x i16> %LGV1, %va
  %v = call <4 x i16> @llvm.ctpop.v4i16(<4 x i16> %va)
  store <4 x i1> %C1, ptr @G.6, align 1
  store <4 x i16> %B, ptr @G.5, align 8
  store <4 x i16> %B2, ptr @G.10, align 8
  ret <4 x i16> %v
}

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

define <16 x i32> @vp_ctpop_v16i32_unmasked(<16 x i32> %va, i32 zeroext %evl) {
  %B = and i1 true, false
  %v = call <16 x i32> @llvm.ctpop.v16i32(<16 x i32> %va)
  %C = icmp ugt <16 x i32> %va, %va
  store i1 %B, ptr @G.7, align 1
  store <16 x i1> %C, ptr @G.9, align 2
  ret <16 x i32> %v
}

declare <2 x i64> @vp_ctpop_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vp_ctpop_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vp_ctpop_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vp_ctpop_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vp_ctpop_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vp_ctpop_v8i64_unmasked(<8 x i64>, i32 zeroext)

define <15 x i64> @vp_ctpop_v15i64(<15 x i64> %va, <15 x i1> %m, i32 zeroext %evl) {
  %A = alloca <15 x i1>, align 2
  store <15 x i1> poison, ptr %A, align 2
  %LGV = load i8, ptr @G, align 1
  %v = call <15 x i64> @llvm.ctpop.v15i64(<15 x i64> %va)
  %C = icmp uge i8 %LGV, %LGV
  %C1 = icmp ult <15 x i64> %va, %v
  %B = sub i8 %LGV, -128
  store i8 %B, ptr @G.1, align 1
  store i1 %C, ptr @G.8, align 1
  store <15 x i1> %C1, ptr %A, align 2
  ret <15 x i64> %v
}

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

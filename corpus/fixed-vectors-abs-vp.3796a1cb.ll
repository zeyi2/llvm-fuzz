; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+m,+zdinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i1> zeroinitializer
@G.1 = global i32 1

declare <2 x i8> @vp_abs_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vp_abs_v2i8_unmasked(<2 x i8>, i32 zeroext)

declare <4 x i8> @vp_abs_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vp_abs_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <8 x i8> @vp_abs_v8i8(<8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vp_abs_v8i8_unmasked(<8 x i8>, i32 zeroext)

declare <16 x i8> @vp_abs_v16i8(<16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vp_abs_v16i8_unmasked(<16 x i8>, i32 zeroext)

declare <2 x i16> @vp_abs_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

define <2 x i16> @vp_abs_v2i16_unmasked(<2 x i16> %va, i32 zeroext %evl) {
  %v = call <2 x i16> @llvm.abs.v2i16(<2 x i16> %va, i1 false)
  %C = icmp uge <2 x i16> %v, splat (i16 -1)
  store <2 x i1> %C, ptr poison, align 1
  ret <2 x i16> %v
}

declare <4 x i16> @vp_abs_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vp_abs_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <8 x i16> @vp_abs_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vp_abs_v8i16_unmasked(<8 x i16>, i32 zeroext)

declare <16 x i16> @vp_abs_v16i16(<16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vp_abs_v16i16_unmasked(<16 x i16>, i32 zeroext)

define <2 x i32> @vp_abs_v2i32(<2 x i32> %va, <2 x i1> %m, i32 zeroext %evl) {
  %LGV = load i32, ptr @G.1, align 4
  %B = add i32 %evl, %LGV
  %v = call <2 x i32> @llvm.abs.v2i32(<2 x i32> %va, i1 false)
  store i32 %B, ptr poison, align 4
  ret <2 x i32> %v
}

declare <2 x i32> @vp_abs_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <4 x i32> @vp_abs_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vp_abs_v4i32_unmasked(<4 x i32>, i32 zeroext)

define <8 x i32> @vp_abs_v8i32(<8 x i32> %va, <8 x i1> %m, i32 zeroext %evl) {
  %v = call <8 x i32> @llvm.abs.v8i32(<8 x i32> %va, i1 false)
  %B = or <8 x i32> %v, %v
  ret <8 x i32> %B
}

declare <8 x i32> @vp_abs_v8i32_unmasked(<8 x i32>, i32 zeroext)

declare <16 x i32> @vp_abs_v16i32(<16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vp_abs_v16i32_unmasked(<16 x i32>, i32 zeroext)

declare <2 x i64> @vp_abs_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vp_abs_v2i64_unmasked(<2 x i64>, i32 zeroext)

define <4 x i64> @vp_abs_v4i64(<4 x i64> %va, <4 x i1> %m, i32 zeroext %evl) {
  %LGV = load <4 x i1>, ptr @G, align 1
  %B = sdiv <4 x i1> %m, %LGV
  %v = call <4 x i64> @llvm.abs.v4i64(<4 x i64> %va, i1 false)
  store <4 x i1> %B, ptr poison, align 1
  ret <4 x i64> %v
}

declare <4 x i64> @vp_abs_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vp_abs_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vp_abs_v8i64_unmasked(<8 x i64>, i32 zeroext)

declare <15 x i64> @vp_abs_v15i64(<15 x i64>, <15 x i1>, i32 zeroext)

declare <15 x i64> @vp_abs_v15i64_unmasked(<15 x i64>, i32 zeroext)

declare <16 x i64> @vp_abs_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vp_abs_v16i64_unmasked(<16 x i64>, i32 zeroext)

declare <32 x i64> @vp_abs_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <32 x i64> @vp_abs_v32i64_unmasked(<32 x i64>, i32 zeroext)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <15 x i64> @llvm.abs.v15i64(<15 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.abs.v16i16(<16 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.abs.v16i32(<16 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.abs.v16i64(<16 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.abs.v16i8(<16 x i8>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.abs.v2i16(<2 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.abs.v2i32(<2 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.abs.v2i64(<2 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.abs.v2i8(<2 x i8>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.abs.v32i64(<32 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.abs.v4i16(<4 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.abs.v4i32(<4 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.abs.v4i64(<4 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.abs.v4i8(<4 x i8>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.abs.v8i16(<8 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.abs.v8i32(<8 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.abs.v8i64(<8 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.abs.v8i8(<8 x i8>, i1 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

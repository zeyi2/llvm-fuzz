; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+zhinx,+zfinx -O2 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 -1
@G.1 = global i128 -1
@G.2 = global i1 false
@G.3 = global i1 false
@G.4 = global <4 x i1> splat (i1 true)
@G.5 = global <4 x i1> zeroinitializer

declare <2 x i8> @vp_ctlz_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vp_ctlz_v2i8_unmasked(<2 x i8>, i32 zeroext)

declare <4 x i8> @vp_ctlz_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vp_ctlz_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <8 x i8> @vp_ctlz_v8i8(<8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vp_ctlz_v8i8_unmasked(<8 x i8>, i32 zeroext)

declare <16 x i8> @vp_ctlz_v16i8(<16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vp_ctlz_v16i8_unmasked(<16 x i8>, i32 zeroext)

declare <2 x i16> @vp_ctlz_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vp_ctlz_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vp_ctlz_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vp_ctlz_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <8 x i16> @vp_ctlz_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vp_ctlz_v8i16_unmasked(<8 x i16>, i32 zeroext)

declare <16 x i16> @vp_ctlz_v16i16(<16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vp_ctlz_v16i16_unmasked(<16 x i16>, i32 zeroext)

define <2 x i32> @vp_ctlz_v2i32(<2 x i32> %va, <2 x i1> %m, i32 zeroext %evl) {
  %v = call <2 x i32> @llvm.ctlz.v2i32(<2 x i32> %va, i1 false)
  %C = icmp uge <4 x i32> splat (i32 42), zeroinitializer
  %LGV = load <4 x i1>, ptr @G.4, align 1
  %C1 = icmp uge <4 x i1> %C, %LGV
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  store <4 x i1> %C, ptr %A, align 1
  store <4 x i1> %C1, ptr @G.5, align 1
  ret <2 x i32> %v
}

declare <2 x i32> @vp_ctlz_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <4 x i32> @vp_ctlz_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vp_ctlz_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <8 x i32> @vp_ctlz_v8i32(<8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vp_ctlz_v8i32_unmasked(<8 x i32>, i32 zeroext)

declare <16 x i32> @vp_ctlz_v16i32(<16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vp_ctlz_v16i32_unmasked(<16 x i32>, i32 zeroext)

declare <2 x i64> @vp_ctlz_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vp_ctlz_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vp_ctlz_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vp_ctlz_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vp_ctlz_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vp_ctlz_v8i64_unmasked(<8 x i64>, i32 zeroext)

declare <15 x i64> @vp_ctlz_v15i64(<15 x i64>, <15 x i1>, i32 zeroext)

declare <15 x i64> @vp_ctlz_v15i64_unmasked(<15 x i64>, i32 zeroext)

declare <16 x i64> @vp_ctlz_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vp_ctlz_v16i64_unmasked(<16 x i64>, i32 zeroext)

declare <32 x i64> @vp_ctlz_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <32 x i64> @vp_ctlz_v32i64_unmasked(<32 x i64>, i32 zeroext)

declare <2 x i8> @vp_ctlz_zero_undef_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vp_ctlz_zero_undef_v2i8_unmasked(<2 x i8>, i32 zeroext)

declare <4 x i8> @vp_ctlz_zero_undef_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vp_ctlz_zero_undef_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <8 x i8> @vp_ctlz_zero_undef_v8i8(<8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vp_ctlz_zero_undef_v8i8_unmasked(<8 x i8>, i32 zeroext)

declare <16 x i8> @vp_ctlz_zero_undef_v16i8(<16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vp_ctlz_zero_undef_v16i8_unmasked(<16 x i8>, i32 zeroext)

declare <2 x i16> @vp_ctlz_zero_undef_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vp_ctlz_zero_undef_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vp_ctlz_zero_undef_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vp_ctlz_zero_undef_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <8 x i16> @vp_ctlz_zero_undef_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vp_ctlz_zero_undef_v8i16_unmasked(<8 x i16>, i32 zeroext)

define <16 x i16> @vp_ctlz_zero_undef_v16i16(<16 x i16> %va, <16 x i1> %m, i32 zeroext %evl) {
  %LGV1 = load i128, ptr @G.1, align 4
  %LGV = load i128, ptr @G, align 4
  %C = icmp sge i128 %LGV, %LGV1
  %v = call <16 x i16> @llvm.ctlz.v16i16(<16 x i16> %va, i1 true)
  store i1 %C, ptr @G.2, align 1
  store i128 %LGV, ptr @G, align 4
  ret <16 x i16> %v
}

declare <16 x i16> @vp_ctlz_zero_undef_v16i16_unmasked(<16 x i16>, i32 zeroext)

declare <2 x i32> @vp_ctlz_zero_undef_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vp_ctlz_zero_undef_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <4 x i32> @vp_ctlz_zero_undef_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vp_ctlz_zero_undef_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <8 x i32> @vp_ctlz_zero_undef_v8i32(<8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vp_ctlz_zero_undef_v8i32_unmasked(<8 x i32>, i32 zeroext)

declare <16 x i32> @vp_ctlz_zero_undef_v16i32(<16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vp_ctlz_zero_undef_v16i32_unmasked(<16 x i32>, i32 zeroext)

declare <2 x i64> @vp_ctlz_zero_undef_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @vp_ctlz_zero_undef_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vp_ctlz_zero_undef_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vp_ctlz_zero_undef_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vp_ctlz_zero_undef_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vp_ctlz_zero_undef_v8i64_unmasked(<8 x i64>, i32 zeroext)

declare <15 x i64> @vp_ctlz_zero_undef_v15i64(<15 x i64>, <15 x i1>, i32 zeroext)

declare <15 x i64> @vp_ctlz_zero_undef_v15i64_unmasked(<15 x i64>, i32 zeroext)

declare <16 x i64> @vp_ctlz_zero_undef_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

define <16 x i64> @vp_ctlz_zero_undef_v16i64_unmasked(<16 x i64> %va, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %B = add i32 %evl, 65536
  %v = call <16 x i64> @llvm.ctlz.v16i64(<16 x i64> %va, i1 true)
  %C = fcmp ord float 1.401300e-45, 0.000000e+00
  %C1 = icmp ule i32 %B, %evl
  store i1 %C, ptr @G.3, align 1
  store i32 %B, ptr poison, align 4
  store i1 %C1, ptr %A, align 1
  ret <16 x i64> %v
}

declare <32 x i64> @vp_ctlz_zero_undef_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <32 x i64> @vp_ctlz_zero_undef_v32i64_unmasked(<32 x i64>, i32 zeroext)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <15 x i64> @llvm.ctlz.v15i64(<15 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.ctlz.v16i16(<16 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.ctlz.v16i32(<16 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.ctlz.v16i64(<16 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.ctlz.v16i8(<16 x i8>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.ctlz.v2i16(<2 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.ctlz.v2i32(<2 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.ctlz.v2i64(<2 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.ctlz.v2i8(<2 x i8>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.ctlz.v32i64(<32 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.ctlz.v4i16(<4 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.ctlz.v4i32(<4 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.ctlz.v4i64(<4 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.ctlz.v4i8(<4 x i8>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.ctlz.v8i16(<8 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.ctlz.v8i32(<8 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.ctlz.v8i64(<8 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.ctlz.v8i8(<8 x i8>, i1 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

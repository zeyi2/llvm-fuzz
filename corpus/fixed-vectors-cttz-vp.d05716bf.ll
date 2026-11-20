; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+m,+zfinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half +inf
@G.1 = global <4 x i8> splat (i8 42)
@G.2 = global i1 true
@G.3 = global <8 x i1> zeroinitializer
@G.4 = global i128 42
@G.5 = global <2 x i64> splat (i64 -9223372036854775808)

define <2 x i8> @vp_cttz_v2i8(<2 x i8> %va, <2 x i1> %m, i32 zeroext %evl) {
  %v = call <2 x i8> @llvm.cttz.v2i8(<2 x i8> %va, i1 false)
  %C = fcmp ogt double 1.000000e+00, 4.200000e+01
  store i1 %C, ptr @G.2, align 1
  ret <2 x i8> %v
}

declare <2 x i8> @vp_cttz_v2i8_unmasked(<2 x i8>, i32 zeroext)

declare <4 x i8> @vp_cttz_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @vp_cttz_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <8 x i8> @vp_cttz_v8i8(<8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vp_cttz_v8i8_unmasked(<8 x i8>, i32 zeroext)

declare <16 x i8> @vp_cttz_v16i8(<16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vp_cttz_v16i8_unmasked(<16 x i8>, i32 zeroext)

declare <2 x i16> @vp_cttz_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vp_cttz_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vp_cttz_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vp_cttz_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <8 x i16> @vp_cttz_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vp_cttz_v8i16_unmasked(<8 x i16>, i32 zeroext)

declare <16 x i16> @vp_cttz_v16i16(<16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vp_cttz_v16i16_unmasked(<16 x i16>, i32 zeroext)

declare <2 x i32> @vp_cttz_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vp_cttz_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <4 x i32> @vp_cttz_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vp_cttz_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <8 x i32> @vp_cttz_v8i32(<8 x i32>, <8 x i1>, i32 zeroext)

define <8 x i32> @vp_cttz_v8i32_unmasked(<8 x i32> %va, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %v = call <8 x i32> @llvm.cttz.v8i32(<8 x i32> %va, i1 false)
  %C = icmp ne i32 %evl, %evl
  store i1 %C, ptr %A, align 1
  ret <8 x i32> %v
}

declare <16 x i32> @vp_cttz_v16i32(<16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vp_cttz_v16i32_unmasked(<16 x i32>, i32 zeroext)

define <2 x i64> @vp_cttz_v2i64(<2 x i64> %va, <2 x i1> %m, i32 zeroext %evl) {
  %LGV = load i128, ptr @G.4, align 4
  %v = call <2 x i64> @llvm.cttz.v2i64(<2 x i64> %va, i1 false)
  switch i128 %LGV, label %SW_D [
    i128 3700670832175265191, label %SW_C
    i128 3755013354810634106, label %SW_C1
  ]

BB:                                               ; preds = %SW_C, %SW_D
  ret <2 x i64> %v

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  %LGV2 = load <2 x i64>, ptr @G.5, align 16
  ret <2 x i64> %LGV2
}

declare <2 x i64> @vp_cttz_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vp_cttz_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vp_cttz_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vp_cttz_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @vp_cttz_v8i64_unmasked(<8 x i64>, i32 zeroext)

declare <15 x i64> @vp_cttz_v15i64(<15 x i64>, <15 x i1>, i32 zeroext)

declare <15 x i64> @vp_cttz_v15i64_unmasked(<15 x i64>, i32 zeroext)

declare <16 x i64> @vp_cttz_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vp_cttz_v16i64_unmasked(<16 x i64>, i32 zeroext)

declare <32 x i64> @vp_cttz_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <32 x i64> @vp_cttz_v32i64_unmasked(<32 x i64>, i32 zeroext)

declare <2 x i8> @vp_cttz_zero_undef_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vp_cttz_zero_undef_v2i8_unmasked(<2 x i8>, i32 zeroext)

define <4 x i8> @vp_cttz_zero_undef_v4i8(<4 x i8> %va, <4 x i1> %m, i32 zeroext %evl) {
  %v = call <4 x i8> @llvm.cttz.v4i8(<4 x i8> %va, i1 true)
  %B = add <4 x i8> %v, splat (i8 -128)
  store <4 x i8> %B, ptr @G.1, align 4
  ret <4 x i8> %v
}

declare <4 x i8> @vp_cttz_zero_undef_v4i8_unmasked(<4 x i8>, i32 zeroext)

declare <8 x i8> @vp_cttz_zero_undef_v8i8(<8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @vp_cttz_zero_undef_v8i8_unmasked(<8 x i8>, i32 zeroext)

declare <16 x i8> @vp_cttz_zero_undef_v16i8(<16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @vp_cttz_zero_undef_v16i8_unmasked(<16 x i8>, i32 zeroext)

declare <2 x i16> @vp_cttz_zero_undef_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vp_cttz_zero_undef_v2i16_unmasked(<2 x i16>, i32 zeroext)

declare <4 x i16> @vp_cttz_zero_undef_v4i16(<4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @vp_cttz_zero_undef_v4i16_unmasked(<4 x i16>, i32 zeroext)

declare <8 x i16> @vp_cttz_zero_undef_v8i16(<8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @vp_cttz_zero_undef_v8i16_unmasked(<8 x i16>, i32 zeroext)

declare <16 x i16> @vp_cttz_zero_undef_v16i16(<16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @vp_cttz_zero_undef_v16i16_unmasked(<16 x i16>, i32 zeroext)

declare <2 x i32> @vp_cttz_zero_undef_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vp_cttz_zero_undef_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <4 x i32> @vp_cttz_zero_undef_v4i32(<4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @vp_cttz_zero_undef_v4i32_unmasked(<4 x i32>, i32 zeroext)

declare <8 x i32> @vp_cttz_zero_undef_v8i32(<8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @vp_cttz_zero_undef_v8i32_unmasked(<8 x i32>, i32 zeroext)

declare <16 x i32> @vp_cttz_zero_undef_v16i32(<16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @vp_cttz_zero_undef_v16i32_unmasked(<16 x i32>, i32 zeroext)

define <2 x i64> @vp_cttz_zero_undef_v2i64(<2 x i64> %va, <2 x i1> %m, i32 zeroext %evl) {
  %LGV = load half, ptr @G, align 2
  %C = fcmp true half 4.200000e+01, %LGV
  %v = call <2 x i64> @llvm.cttz.v2i64(<2 x i64> %va, i1 true)
  store i1 %C, ptr poison, align 1
  ret <2 x i64> %v
}

declare <2 x i64> @vp_cttz_zero_undef_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <4 x i64> @vp_cttz_zero_undef_v4i64(<4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @vp_cttz_zero_undef_v4i64_unmasked(<4 x i64>, i32 zeroext)

declare <8 x i64> @vp_cttz_zero_undef_v8i64(<8 x i64>, <8 x i1>, i32 zeroext)

define <8 x i64> @vp_cttz_zero_undef_v8i64_unmasked(<8 x i64> %va, i32 zeroext %evl) {
  %v = call <8 x i64> @llvm.cttz.v8i64(<8 x i64> %va, i1 true)
  %C = icmp ugt <8 x i64> %v, %va
  store <8 x i1> %C, ptr @G.3, align 1
  ret <8 x i64> %v
}

declare <15 x i64> @vp_cttz_zero_undef_v15i64(<15 x i64>, <15 x i1>, i32 zeroext)

declare <15 x i64> @vp_cttz_zero_undef_v15i64_unmasked(<15 x i64>, i32 zeroext)

declare <16 x i64> @vp_cttz_zero_undef_v16i64(<16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @vp_cttz_zero_undef_v16i64_unmasked(<16 x i64>, i32 zeroext)

declare <32 x i64> @vp_cttz_zero_undef_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <32 x i64> @vp_cttz_zero_undef_v32i64_unmasked(<32 x i64>, i32 zeroext)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <15 x i64> @llvm.cttz.v15i64(<15 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.cttz.v16i16(<16 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.cttz.v16i32(<16 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.cttz.v16i64(<16 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.cttz.v16i8(<16 x i8>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.cttz.v2i16(<2 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.cttz.v2i32(<2 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.cttz.v2i64(<2 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.cttz.v2i8(<2 x i8>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i64> @llvm.cttz.v32i64(<32 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.cttz.v4i16(<4 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.cttz.v4i32(<4 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.cttz.v4i64(<4 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.cttz.v4i8(<4 x i8>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.cttz.v8i16(<8 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.cttz.v8i32(<8 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.cttz.v8i64(<8 x i64>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.cttz.v8i8(<8 x i8>, i1 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

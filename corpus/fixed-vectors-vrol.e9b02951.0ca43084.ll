; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zvbb,+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <32 x i8> splat (i8 16)
@G.1 = global i32 0
@G.3 = global <2 x i8> zeroinitializer
@G.2 = global i1 false
@G.4 = global <32 x i8> splat (i8 42)

declare <1 x i8> @vrol_vv_v1i8(<1 x i8>, <1 x i8>)

declare <1 x i8> @vrol_vx_v1i8(<1 x i8>, i8)

declare <2 x i8> @vrol_vv_v2i8(<2 x i8>, <2 x i8>)

declare <2 x i8> @vrol_vx_v2i8(<2 x i8>, i8)

declare <4 x i8> @vrol_vv_v4i8(<4 x i8>, <4 x i8>)

declare <4 x i8> @vrol_vx_v4i8(<4 x i8>, i8)

declare <8 x i8> @vrol_vv_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @vrol_vx_v8i8(<8 x i8>, i8)

declare <16 x i8> @vrol_vv_v16i8(<16 x i8>, <16 x i8>)

declare <16 x i8> @vrol_vx_v16i8(<16 x i8>, i8)

define <32 x i8> @vrol_vv_v32i8(<32 x i8> %a, <32 x i8> %b) {
  %B2 = udiv <32 x i8> %a, splat (i8 16)
  %LGV = load <32 x i8>, ptr @G, align 32
  %B = sub <32 x i8> %a, %LGV
  %x = call <32 x i8> @llvm.fshl.v32i8(<32 x i8> %a, <32 x i8> %B, <32 x i8> %b)
  store <32 x i8> %B2, ptr @G.4, align 32
  ret <32 x i8> %x
}

declare <32 x i8> @vrol_vx_v32i8(<32 x i8>, i8)

declare <64 x i8> @vrol_vv_v64i8(<64 x i8>, <64 x i8>)

declare <64 x i8> @vrol_vx_v64i8(<64 x i8>, i8)

declare <1 x i16> @vrol_vv_v1i16(<1 x i16>, <1 x i16>)

declare <1 x i16> @vrol_vx_v1i16(<1 x i16>, i16)

declare <2 x i16> @vrol_vv_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @vrol_vx_v2i16(<2 x i16>, i16)

declare <4 x i16> @vrol_vv_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @vrol_vx_v4i16(<4 x i16>, i16)

declare <8 x i16> @vrol_vv_v8i16(<8 x i16>, <8 x i16>)

declare <8 x i16> @vrol_vx_v8i16(<8 x i16>, i16)

declare <16 x i16> @vrol_vv_v16i16(<16 x i16>, <16 x i16>)

define <16 x i16> @vrol_vx_v16i16(<16 x i16> %a, i16 %b) {
  %B1 = srem i64 4294967296, 9223372036854775807
  %b.head = insertelement <16 x i16> poison, i16 %b, i32 0
  %b.splat = shufflevector <16 x i16> %b.head, <16 x i16> poison, <16 x i32> zeroinitializer
  %x = call <16 x i16> @llvm.fshl.v16i16(<16 x i16> %a, <16 x i16> %a, <16 x i16> %b.splat)
  %B = add <4 x i32> splat (i32 1), splat (i32 1)
  store <4 x i32> %B, ptr poison, align 16
  store i64 %B1, ptr poison, align 4
  %E = extractelement <4 x i32> splat (i32 2147483647), i64 %B1
  store i32 %E, ptr @G.1, align 4
  ret <16 x i16> %x
}

declare <32 x i16> @vrol_vv_v32i16(<32 x i16>, <32 x i16>)

declare <32 x i16> @vrol_vx_v32i16(<32 x i16>, i16)

declare <1 x i32> @vrol_vv_v1i32(<1 x i32>, <1 x i32>)

define <1 x i32> @vrol_vx_v1i32(<1 x i32> %a, i32 %b) {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV = load i32, ptr @G.1, align 4
  %b.head = insertelement <1 x i32> poison, i32 %b, i32 0
  %b.splat = shufflevector <1 x i32> %b.head, <1 x i32> poison, <1 x i32> zeroinitializer
  %B1 = lshr i32 %LGV, 2147483647
  %B = add i32 %b, %B1
  %x = call <1 x i32> @llvm.fshl.v1i32(<1 x i32> %a, <1 x i32> %a, <1 x i32> %b.splat)
  store i32 %B, ptr %A, align 4
  ret <1 x i32> %x
}

declare <2 x i32> @vrol_vv_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @vrol_vx_v2i32(<2 x i32>, i32)

declare <4 x i32> @vrol_vv_v4i32(<4 x i32>, <4 x i32>)

declare <4 x i32> @vrol_vx_v4i32(<4 x i32>, i32)

declare <8 x i32> @vrol_vv_v8i32(<8 x i32>, <8 x i32>)

declare <8 x i32> @vrol_vx_v8i32(<8 x i32>, i32)

declare <16 x i32> @vrol_vv_v16i32(<16 x i32>, <16 x i32>)

declare <16 x i32> @vrol_vx_v16i32(<16 x i32>, i32)

declare <1 x i64> @vrol_vv_v1i64(<1 x i64>, <1 x i64>)

declare <1 x i64> @vrol_vx_v1i64(<1 x i64>, i64)

declare <2 x i64> @vrol_vv_v2i64(<2 x i64>, <2 x i64>)

declare <2 x i64> @vrol_vx_v2i64(<2 x i64>, i64)

define <4 x i64> @vrol_vv_v4i64(<4 x i64> %a, <4 x i64> %b) {
  %x = call <4 x i64> @llvm.fshl.v4i64(<4 x i64> %a, <4 x i64> %a, <4 x i64> %b)
  %C = icmp ult <4 x i64> %b, splat (i64 9223372036854775807)
  %C1 = fcmp ult half 4.200000e+01, 5.960460e-08
  store <4 x i1> %C, ptr poison, align 1
  store i1 %C1, ptr @G.2, align 1
  ret <4 x i64> %x
}

declare <4 x i64> @vrol_vx_v4i64(<4 x i64>, i64)

declare <8 x i64> @vrol_vv_v8i64(<8 x i64>, <8 x i64>)

declare <8 x i64> @vrol_vx_v8i64(<8 x i64>, i64)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.fshl.v16i16(<16 x i16>, <16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.fshl.v16i32(<16 x i32>, <16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.fshl.v16i8(<16 x i8>, <16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i16> @llvm.fshl.v1i16(<1 x i16>, <1 x i16>, <1 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i32> @llvm.fshl.v1i32(<1 x i32>, <1 x i32>, <1 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.fshl.v1i64(<1 x i64>, <1 x i64>, <1 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i8> @llvm.fshl.v1i8(<1 x i8>, <1 x i8>, <1 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.fshl.v2i16(<2 x i16>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.fshl.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.fshl.v2i64(<2 x i64>, <2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.fshl.v2i8(<2 x i8>, <2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i16> @llvm.fshl.v32i16(<32 x i16>, <32 x i16>, <32 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i8> @llvm.fshl.v32i8(<32 x i8>, <32 x i8>, <32 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.fshl.v4i16(<4 x i16>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.fshl.v4i32(<4 x i32>, <4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.fshl.v4i64(<4 x i64>, <4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.fshl.v4i8(<4 x i8>, <4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <64 x i8> @llvm.fshl.v64i8(<64 x i8>, <64 x i8>, <64 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.fshl.v8i16(<8 x i16>, <8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.fshl.v8i32(<8 x i32>, <8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.fshl.v8i64(<8 x i64>, <8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.fshl.v8i8(<8 x i8>, <8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

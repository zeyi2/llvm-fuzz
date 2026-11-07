; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 -9223372036854775808
@G.1 = global <2 x i1> splat (i1 true)
@G.2 = global i128 0
@G.3 = global i128 -170141183460469231731687303715884105728
@G.4 = global <8 x i8> splat (i8 -128)
@G.5 = global i32 2147483647
@G.6 = global <4 x i32> zeroinitializer

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

declare <32 x i8> @vrol_vv_v32i8(<32 x i8>, <32 x i8>)

declare <32 x i8> @vrol_vx_v32i8(<32 x i8>, i8)

declare <64 x i8> @vrol_vv_v64i8(<64 x i8>, <64 x i8>)

declare <64 x i8> @vrol_vx_v64i8(<64 x i8>, i8)

define <1 x i16> @vrol_vv_v1i16(<1 x i16> %a, <1 x i16> %b) {
  %B = sub <1 x i16> %a, splat (i16 -32768)
  ret <1 x i16> %B
}

declare <1 x i16> @vrol_vx_v1i16(<1 x i16>, i16)

declare <2 x i16> @vrol_vv_v2i16(<2 x i16>, <2 x i16>)

define <2 x i16> @vrol_vx_v2i16(<2 x i16> %a, i16 %b) {
  %LGV = load i32, ptr @G.5, align 4
  %b.head = insertelement <2 x i16> poison, i16 %b, i32 0
  %I = insertelement <4 x i32> splat (i32 42), i32 %LGV, i128 42
  %b.splat = shufflevector <2 x i16> %b.head, <2 x i16> poison, <2 x i32> zeroinitializer
  %x = call <2 x i16> @llvm.fshl.v2i16(<2 x i16> %a, <2 x i16> %a, <2 x i16> %b.splat)
  store <4 x i32> %I, ptr @G.6, align 16
  ret <2 x i16> %x
}

declare <4 x i16> @vrol_vv_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @vrol_vx_v4i16(<4 x i16>, i16)

declare <8 x i16> @vrol_vv_v8i16(<8 x i16>, <8 x i16>)

declare <8 x i16> @vrol_vx_v8i16(<8 x i16>, i16)

declare <16 x i16> @vrol_vv_v16i16(<16 x i16>, <16 x i16>)

declare <16 x i16> @vrol_vx_v16i16(<16 x i16>, i16)

declare <32 x i16> @vrol_vv_v32i16(<32 x i16>, <32 x i16>)

declare <32 x i16> @vrol_vx_v32i16(<32 x i16>, i16)

declare <1 x i32> @vrol_vv_v1i32(<1 x i32>, <1 x i32>)

define <1 x i32> @vrol_vx_v1i32(<1 x i32> %a, i32 %b) {
  %LGV = load <8 x i8>, ptr @G.4, align 8
  %b.head = insertelement <1 x i32> poison, i32 %b, i32 0
  %B = shl <8 x i8> splat (i8 16), %LGV
  %b.splat = shufflevector <1 x i32> %b.head, <1 x i32> poison, <1 x i32> zeroinitializer
  %x = call <1 x i32> @llvm.fshl.v1i32(<1 x i32> %a, <1 x i32> %a, <1 x i32> %b.splat)
  store <8 x i8> %B, ptr poison, align 8
  ret <1 x i32> %x
}

define <2 x i32> @vrol_vv_v2i32(<2 x i32> %a, <2 x i32> %b) {
  %x = call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %a, <2 x i32> %a, <2 x i32> %b)
  %C = icmp sgt <2 x i32> %a, %x
  store <2 x i1> %C, ptr @G.1, align 1
  ret <2 x i32> %x
}

define <2 x i32> @vrol_vx_v2i32(<2 x i32> %a, i32 %b) {
  %LGV = load i128, ptr @G.2, align 4
  %B = shl i128 %LGV, -1
  %b.head = insertelement <2 x i32> poison, i32 %b, i32 0
  %b.splat = shufflevector <2 x i32> %b.head, <2 x i32> poison, <2 x i32> zeroinitializer
  %x = call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %a, <2 x i32> %a, <2 x i32> %b.splat)
  store i128 %B, ptr @G.3, align 4
  ret <2 x i32> %x
}

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
  %B = add i8 -128, -128
  %x = call <4 x i64> @llvm.fshl.v4i64(<4 x i64> %a, <4 x i64> %a, <4 x i64> %b)
  store i8 %B, ptr poison, align 1
  ret <4 x i64> %x
}

define <4 x i64> @vrol_vx_v4i64(<4 x i64> %a, i64 %b) {
  %b.head = insertelement <4 x i64> poison, i64 %b, i32 0
  %b.splat = shufflevector <4 x i64> %b.head, <4 x i64> poison, <4 x i32> zeroinitializer
  %E = extractelement <2 x i64> splat (i64 -9223372036854775808), i64 %b
  %x = call <4 x i64> @llvm.fshl.v4i64(<4 x i64> %a, <4 x i64> %a, <4 x i64> %b.splat)
  store i64 %E, ptr @G, align 4
  ret <4 x i64> %x
}

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

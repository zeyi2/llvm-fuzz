; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 256
@G.1 = global i64 -9223372036854775808
@G.2 = global <4 x i32> splat (i32 2147483647)

declare <1 x i8> @vrol_vv_v1i8(<1 x i8>, <1 x i8>)

declare <1 x i8> @vrol_vx_v1i8(<1 x i8>, i8)

declare <2 x i8> @vrol_vv_v2i8(<2 x i8>, <2 x i8>)

declare <2 x i8> @vrol_vx_v2i8(<2 x i8>, i8)

declare <4 x i8> @vrol_vv_v4i8(<4 x i8>, <4 x i8>)

declare <4 x i8> @vrol_vx_v4i8(<4 x i8>, i8)

define <8 x i8> @vrol_vv_v8i8(<8 x i8> %a, <8 x i8> %b) {
  %x = call <8 x i8> @llvm.fshl.v8i8(<8 x i8> %a, <8 x i8> %a, <8 x i8> %b)
  %B = sub i16 -1, -1
  store i16 %B, ptr @G, align 2
  ret <8 x i8> %x
}

declare <8 x i8> @vrol_vx_v8i8(<8 x i8>, i8)

declare <16 x i8> @vrol_vv_v16i8(<16 x i8>, <16 x i8>)

declare <16 x i8> @vrol_vx_v16i8(<16 x i8>, i8)

declare <32 x i8> @vrol_vv_v32i8(<32 x i8>, <32 x i8>)

declare <32 x i8> @vrol_vx_v32i8(<32 x i8>, i8)

declare <64 x i8> @vrol_vv_v64i8(<64 x i8>, <64 x i8>)

define <64 x i8> @vrol_vx_v64i8(<64 x i8> %a, i8 %b) {
  %LGV = load i64, ptr @G.1, align 4
  %b.head = insertelement <64 x i8> poison, i8 %b, i32 0
  %b.splat = shufflevector <64 x i8> %b.head, <64 x i8> poison, <64 x i32> zeroinitializer
  %x = call <64 x i8> @llvm.fshl.v64i8(<64 x i8> %a, <64 x i8> %a, <64 x i8> %b.splat)
  %B = or i64 1, %LGV
  store i64 %B, ptr poison, align 4
  ret <64 x i8> %x
}

declare <1 x i16> @vrol_vv_v1i16(<1 x i16>, <1 x i16>)

declare <1 x i16> @vrol_vx_v1i16(<1 x i16>, i16)

declare <2 x i16> @vrol_vv_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @vrol_vx_v2i16(<2 x i16>, i16)

declare <4 x i16> @vrol_vv_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @vrol_vx_v4i16(<4 x i16>, i16)

declare <8 x i16> @vrol_vv_v8i16(<8 x i16>, <8 x i16>)

declare <8 x i16> @vrol_vx_v8i16(<8 x i16>, i16)

declare <16 x i16> @vrol_vv_v16i16(<16 x i16>, <16 x i16>)

declare <16 x i16> @vrol_vx_v16i16(<16 x i16>, i16)

declare <32 x i16> @vrol_vv_v32i16(<32 x i16>, <32 x i16>)

declare <32 x i16> @vrol_vx_v32i16(<32 x i16>, i16)

declare <1 x i32> @vrol_vv_v1i32(<1 x i32>, <1 x i32>)

declare <1 x i32> @vrol_vx_v1i32(<1 x i32>, i32)

declare <2 x i32> @vrol_vv_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @vrol_vx_v2i32(<2 x i32>, i32)

declare <4 x i32> @vrol_vv_v4i32(<4 x i32>, <4 x i32>)

define <4 x i32> @vrol_vx_v4i32(<4 x i32> %a, i32 %b) {
  %LGV1 = load <4 x i32>, ptr @G.2, align 16
  %A = alloca i16, align 2
  store i16 poison, ptr %A, align 2
  %LGV = load i16, ptr @G, align 2
  %b.head = insertelement <4 x i32> poison, i32 %b, i32 0
  %b.splat = shufflevector <4 x i32> %b.head, <4 x i32> poison, <4 x i32> zeroinitializer
  %x = call <4 x i32> @llvm.fshl.v4i32(<4 x i32> %a, <4 x i32> %a, <4 x i32> %b.splat)
  %B = srem i16 %LGV, 0
  %B2 = sdiv <4 x i32> %b.head, %LGV1
  store i16 %B, ptr %A, align 2
  store <4 x i32> %B2, ptr @G.2, align 16
  ret <4 x i32> %x
}

declare <8 x i32> @vrol_vv_v8i32(<8 x i32>, <8 x i32>)

define <8 x i32> @vrol_vx_v8i32(<8 x i32> %a, i32 %b) {
  %b.head = insertelement <8 x i32> poison, i32 %b, i32 0
  %b.splat = shufflevector <8 x i32> poison, <8 x i32> %b.head, <8 x i32> zeroinitializer
  %x = call <8 x i32> @llvm.fshl.v8i32(<8 x i32> %a, <8 x i32> %a, <8 x i32> %b.splat)
  ret <8 x i32> %x
}

define <16 x i32> @vrol_vv_v16i32(<16 x i32> %a, <16 x i32> %b) {
  %B = lshr <16 x i32> %b, %b
  %x = call <16 x i32> @llvm.fshl.v16i32(<16 x i32> %a, <16 x i32> %a, <16 x i32> %b)
  store <16 x i32> %B, ptr poison, align 64
  ret <16 x i32> %x
}

declare <16 x i32> @vrol_vx_v16i32(<16 x i32>, i32)

declare <1 x i64> @vrol_vv_v1i64(<1 x i64>, <1 x i64>)

declare <1 x i64> @vrol_vx_v1i64(<1 x i64>, i64)

declare <2 x i64> @vrol_vv_v2i64(<2 x i64>, <2 x i64>)

declare <2 x i64> @vrol_vx_v2i64(<2 x i64>, i64)

declare <4 x i64> @vrol_vv_v4i64(<4 x i64>, <4 x i64>)

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

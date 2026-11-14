; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 -128)
@G.1 = global i16 42
@G.2 = global i64 1
@G.3 = global <16 x i32> zeroinitializer
@G.4 = global float 1.000000e+00

declare <1 x i8> @vror_vv_v1i8(<1 x i8>, <1 x i8>)

declare <1 x i8> @vror_vx_v1i8(<1 x i8>, i8)

declare <1 x i8> @vror_vi_v1i8(<1 x i8>)

declare <1 x i8> @vror_vi_rotl_v1i8(<1 x i8>)

declare <2 x i8> @vror_vv_v2i8(<2 x i8>, <2 x i8>)

declare <2 x i8> @vror_vx_v2i8(<2 x i8>, i8)

declare <2 x i8> @vror_vi_v2i8(<2 x i8>)

declare <2 x i8> @vror_vi_rotl_v2i8(<2 x i8>)

declare <4 x i8> @vror_vv_v4i8(<4 x i8>, <4 x i8>)

declare <4 x i8> @vror_vx_v4i8(<4 x i8>, i8)

declare <4 x i8> @vror_vi_v4i8(<4 x i8>)

define <4 x i8> @vror_vi_rotl_v4i8(<4 x i8> %a) {
  %LGV = load i64, ptr @G.2, align 4
  %B = sub i64 9223372036854775807, %LGV
  %x = call <4 x i8> @llvm.fshl.v4i8(<4 x i8> %a, <4 x i8> %a, <4 x i8> splat (i8 1))
  store i64 %B, ptr poison, align 4
  ret <4 x i8> %x
}

declare <8 x i8> @vror_vv_v8i8(<8 x i8>, <8 x i8>)

define <8 x i8> @vror_vx_v8i8(<8 x i8> %a, i8 %b) {
  %LGV = load <8 x i8>, ptr @G, align 8
  %C = icmp eq <8 x i8> %LGV, zeroinitializer
  %b.head = insertelement <8 x i8> poison, i8 %b, i32 0
  %b.splat = shufflevector <8 x i8> %b.head, <8 x i8> poison, <8 x i32> zeroinitializer
  %x = call <8 x i8> @llvm.fshr.v8i8(<8 x i8> %a, <8 x i8> %a, <8 x i8> %b.splat)
  store <8 x i1> %C, ptr poison, align 1
  ret <8 x i8> %x
}

declare <8 x i8> @vror_vi_v8i8(<8 x i8>)

declare <8 x i8> @vror_vi_rotl_v8i8(<8 x i8>)

declare <16 x i8> @vror_vv_v16i8(<16 x i8>, <16 x i8>)

declare <16 x i8> @vror_vx_v16i8(<16 x i8>, i8)

declare <16 x i8> @vror_vi_v16i8(<16 x i8>)

declare <16 x i8> @vror_vi_rotl_v16i8(<16 x i8>)

declare <32 x i8> @vror_vv_v32i8(<32 x i8>, <32 x i8>)

declare <32 x i8> @vror_vx_v32i8(<32 x i8>, i8)

declare <32 x i8> @vror_vi_v32i8(<32 x i8>)

declare <32 x i8> @vror_vi_rotl_v32i8(<32 x i8>)

declare <64 x i8> @vror_vv_v64i8(<64 x i8>, <64 x i8>)

declare <64 x i8> @vror_vx_v64i8(<64 x i8>, i8)

declare <64 x i8> @vror_vi_v64i8(<64 x i8>)

declare <64 x i8> @vror_vi_rotl_v64i8(<64 x i8>)

declare <1 x i16> @vror_vv_v1i16(<1 x i16>, <1 x i16>)

declare <1 x i16> @vror_vx_v1i16(<1 x i16>, i16)

declare <1 x i16> @vror_vi_v1i16(<1 x i16>)

declare <1 x i16> @vror_vi_rotl_v1i16(<1 x i16>)

declare <2 x i16> @vror_vv_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @vror_vx_v2i16(<2 x i16>, i16)

declare <2 x i16> @vror_vi_v2i16(<2 x i16>)

declare <2 x i16> @vror_vi_rotl_v2i16(<2 x i16>)

declare <4 x i16> @vror_vv_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @vror_vx_v4i16(<4 x i16>, i16)

declare <4 x i16> @vror_vi_v4i16(<4 x i16>)

declare <4 x i16> @vror_vi_rotl_v4i16(<4 x i16>)

declare <8 x i16> @vror_vv_v8i16(<8 x i16>, <8 x i16>)

declare <8 x i16> @vror_vx_v8i16(<8 x i16>, i16)

declare <8 x i16> @vror_vi_v8i16(<8 x i16>)

declare <8 x i16> @vror_vi_rotl_v8i16(<8 x i16>)

declare <16 x i16> @vror_vv_v16i16(<16 x i16>, <16 x i16>)

declare <16 x i16> @vror_vx_v16i16(<16 x i16>, i16)

declare <16 x i16> @vror_vi_v16i16(<16 x i16>)

declare <16 x i16> @vror_vi_rotl_v16i16(<16 x i16>)

declare <32 x i16> @vror_vv_v32i16(<32 x i16>, <32 x i16>)

define <32 x i16> @vror_vx_v32i16(<32 x i16> %a, i16 %b) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i16, ptr @G.1, align 2
  %b.head = insertelement <32 x i16> poison, i16 %b, i32 0
  %b.splat = shufflevector <32 x i16> %b.head, <32 x i16> poison, <32 x i32> zeroinitializer
  %C = icmp sgt i16 %b, %LGV
  %x = call <32 x i16> @llvm.fshr.v32i16(<32 x i16> %a, <32 x i16> %a, <32 x i16> %b.splat)
  store i1 %C, ptr %A, align 1
  ret <32 x i16> %x
}

declare <32 x i16> @vror_vi_v32i16(<32 x i16>)

declare <32 x i16> @vror_vi_rotl_v32i16(<32 x i16>)

declare <1 x i32> @vror_vv_v1i32(<1 x i32>, <1 x i32>)

declare <1 x i32> @vror_vx_v1i32(<1 x i32>, i32)

declare <1 x i32> @vror_vi_v1i32(<1 x i32>)

declare <1 x i32> @vror_vi_rotl_v1i32(<1 x i32>)

declare <2 x i32> @vror_vv_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @vror_vx_v2i32(<2 x i32>, i32)

declare <2 x i32> @vror_vi_v2i32(<2 x i32>)

declare <2 x i32> @vror_vi_rotl_v2i32(<2 x i32>)

declare <4 x i32> @vror_vv_v4i32(<4 x i32>, <4 x i32>)

declare <4 x i32> @vror_vx_v4i32(<4 x i32>, i32)

declare <4 x i32> @vror_vi_v4i32(<4 x i32>)

define <4 x i32> @vror_vi_rotl_v4i32(<4 x i32> %a) {
  %B = urem <8 x i8> splat (i8 1), splat (i8 42)
  %x = call <4 x i32> @llvm.fshl.v4i32(<4 x i32> %a, <4 x i32> %a, <4 x i32> splat (i32 1))
  store <8 x i8> %B, ptr poison, align 8
  ret <4 x i32> %x
}

declare <8 x i32> @vror_vv_v8i32(<8 x i32>, <8 x i32>)

declare <8 x i32> @vror_vx_v8i32(<8 x i32>, i32)

declare <8 x i32> @vror_vi_v8i32(<8 x i32>)

declare <8 x i32> @vror_vi_rotl_v8i32(<8 x i32>)

declare <16 x i32> @vror_vv_v16i32(<16 x i32>, <16 x i32>)

define <16 x i32> @vror_vx_v16i32(<16 x i32> %a, i32 %b) {
  %A = alloca <16 x i1>, align 2
  store <16 x i1> poison, ptr %A, align 2
  %LGV = load <16 x i32>, ptr @G.3, align 64
  %b.head = insertelement <16 x i32> poison, i32 %b, i32 0
  %b.splat = shufflevector <16 x i32> %b.head, <16 x i32> poison, <16 x i32> zeroinitializer
  %x = call <16 x i32> @llvm.fshr.v16i32(<16 x i32> %a, <16 x i32> %a, <16 x i32> %b.splat)
  %C = icmp uge <16 x i32> %b.splat, %LGV
  store <16 x i1> %C, ptr %A, align 2
  ret <16 x i32> %x
}

declare <16 x i32> @vror_vi_v16i32(<16 x i32>)

declare <16 x i32> @vror_vi_rotl_v16i32(<16 x i32>)

declare <1 x i64> @vror_vv_v1i64(<1 x i64>, <1 x i64>)

declare <1 x i64> @vror_vx_v1i64(<1 x i64>, i64)

define <1 x i64> @vror_vi_v1i64(<1 x i64> %a) {
  %x = call <1 x i64> @llvm.fshr.v1i64(<1 x i64> %a, <1 x i64> %a, <1 x i64> splat (i64 1))
  %B = and <1 x i64> %x, %x
  store <1 x i64> %B, ptr poison, align 8
  ret <1 x i64> %x
}

declare <1 x i64> @vror_vi_rotl_v1i64(<1 x i64>)

declare <2 x i64> @vror_vv_v2i64(<2 x i64>, <2 x i64>)

declare <2 x i64> @vror_vx_v2i64(<2 x i64>, i64)

define <2 x i64> @vror_vi_v2i64(<2 x i64> %a) {
  %x = call <2 x i64> @llvm.fshr.v2i64(<2 x i64> %a, <2 x i64> %a, <2 x i64> splat (i64 1))
  %C = fcmp false double 1.000000e+00, f0x7FEFFFFFFFFFFFFF
  store i1 %C, ptr poison, align 1
  ret <2 x i64> %x
}

declare <2 x i64> @vror_vi_rotl_v2i64(<2 x i64>)

declare <4 x i64> @vror_vv_v4i64(<4 x i64>, <4 x i64>)

declare <4 x i64> @vror_vx_v4i64(<4 x i64>, i64)

define <4 x i64> @vror_vi_v4i64(<4 x i64> %a) {
  %LGV = load float, ptr @G.4, align 4
  %B = fsub float 1.401300e-45, %LGV
  %x = call <4 x i64> @llvm.fshr.v4i64(<4 x i64> %a, <4 x i64> %a, <4 x i64> splat (i64 1))
  store float %B, ptr poison, align 4
  ret <4 x i64> %x
}

declare <4 x i64> @vror_vi_rotl_v4i64(<4 x i64>)

declare <8 x i64> @vror_vv_v8i64(<8 x i64>, <8 x i64>)

declare <8 x i64> @vror_vx_v8i64(<8 x i64>, i64)

declare <8 x i64> @vror_vi_v8i64(<8 x i64>)

declare <8 x i64> @vror_vi_rotl_v8i64(<8 x i64>)

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

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.fshr.v16i16(<16 x i16>, <16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.fshr.v16i32(<16 x i32>, <16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.fshr.v16i8(<16 x i8>, <16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i16> @llvm.fshr.v1i16(<1 x i16>, <1 x i16>, <1 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i32> @llvm.fshr.v1i32(<1 x i32>, <1 x i32>, <1 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.fshr.v1i64(<1 x i64>, <1 x i64>, <1 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i8> @llvm.fshr.v1i8(<1 x i8>, <1 x i8>, <1 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.fshr.v2i16(<2 x i16>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.fshr.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.fshr.v2i64(<2 x i64>, <2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.fshr.v2i8(<2 x i8>, <2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i16> @llvm.fshr.v32i16(<32 x i16>, <32 x i16>, <32 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i8> @llvm.fshr.v32i8(<32 x i8>, <32 x i8>, <32 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.fshr.v4i16(<4 x i16>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.fshr.v4i32(<4 x i32>, <4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.fshr.v4i64(<4 x i64>, <4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.fshr.v4i8(<4 x i8>, <4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <64 x i8> @llvm.fshr.v64i8(<64 x i8>, <64 x i8>, <64 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.fshr.v8i16(<8 x i16>, <8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.fshr.v8i32(<8 x i32>, <8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.fshr.v8i64(<8 x i64>, <8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.fshr.v8i8(<8 x i8>, <8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

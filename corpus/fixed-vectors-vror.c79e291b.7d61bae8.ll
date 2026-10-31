; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zvkb,+zhinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <1 x i64> splat (i64 4294967296)
@G.1 = global bfloat 1.000000e+00
@G.2 = global i128 42
@G.3 = global <1 x i1> splat (i1 true)
@G.4 = global <1 x i8> splat (i8 -128)

declare <1 x i8> @vror_vv_v1i8(<1 x i8>, <1 x i8>)

declare <1 x i8> @vror_vx_v1i8(<1 x i8>, i8)

define <1 x i8> @vror_vi_v1i8(<1 x i8> %a) {
  %x = call <1 x i8> @llvm.fshr.v1i8(<1 x i8> %a, <1 x i8> %a, <1 x i8> splat (i8 1))
  %LGV = load bfloat, ptr @G.1, align 2
  %A = alloca i1, align 1
  %B = mul <1 x i8> %a, %x
  %C = fcmp ord bfloat 4.200000e+01, %LGV
  store i1 %C, ptr %A, align 1
  store i1 poison, ptr %A, align 1
  store <1 x i8> %B, ptr @G.4, align 1
  ret <1 x i8> %x
}

declare <1 x i8> @vror_vi_rotl_v1i8(<1 x i8>)

declare <2 x i8> @vror_vv_v2i8(<2 x i8>, <2 x i8>)

declare <2 x i8> @vror_vx_v2i8(<2 x i8>, i8)

declare <2 x i8> @vror_vi_v2i8(<2 x i8>)

declare <2 x i8> @vror_vi_rotl_v2i8(<2 x i8>)

declare <4 x i8> @vror_vv_v4i8(<4 x i8>, <4 x i8>)

declare <4 x i8> @vror_vx_v4i8(<4 x i8>, i8)

declare <4 x i8> @vror_vi_v4i8(<4 x i8>)

declare <4 x i8> @vror_vi_rotl_v4i8(<4 x i8>)

declare <8 x i8> @vror_vv_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @vror_vx_v8i8(<8 x i8>, i8)

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

declare <32 x i16> @vror_vx_v32i16(<32 x i16>, i16)

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

declare <4 x i32> @vror_vi_rotl_v4i32(<4 x i32>)

declare <8 x i32> @vror_vv_v8i32(<8 x i32>, <8 x i32>)

declare <8 x i32> @vror_vx_v8i32(<8 x i32>, i32)

declare <8 x i32> @vror_vi_v8i32(<8 x i32>)

declare <8 x i32> @vror_vi_rotl_v8i32(<8 x i32>)

declare <16 x i32> @vror_vv_v16i32(<16 x i32>, <16 x i32>)

declare <16 x i32> @vror_vx_v16i32(<16 x i32>, i32)

declare <16 x i32> @vror_vi_v16i32(<16 x i32>)

declare <16 x i32> @vror_vi_rotl_v16i32(<16 x i32>)

declare <1 x i64> @vror_vv_v1i64(<1 x i64>, <1 x i64>)

declare <1 x i64> @vror_vx_v1i64(<1 x i64>, i64)

define <1 x i64> @vror_vi_v1i64(<1 x i64> %a) {
  %C = icmp sge <1 x i64> %a, splat (i64 42)
  %LGV = load i128, ptr @G.2, align 4
  %x = call <1 x i64> @llvm.fshr.v1i64(<1 x i64> %a, <1 x i64> %a, <1 x i64> splat (i64 1))
  %B1 = mul i128 %LGV, 0
  %B = shl <1 x i64> %x, %a
  store <1 x i64> %B, ptr @G, align 8
  store i128 %B1, ptr @G.2, align 4
  store <1 x i1> %C, ptr @G.3, align 1
  ret <1 x i64> %x
}

declare <1 x i64> @vror_vi_rotl_v1i64(<1 x i64>)

declare <2 x i64> @vror_vv_v2i64(<2 x i64>, <2 x i64>)

declare <2 x i64> @vror_vx_v2i64(<2 x i64>, i64)

declare <2 x i64> @vror_vi_v2i64(<2 x i64>)

declare <2 x i64> @vror_vi_rotl_v2i64(<2 x i64>)

declare <4 x i64> @vror_vv_v4i64(<4 x i64>, <4 x i64>)

declare <4 x i64> @vror_vx_v4i64(<4 x i64>, i64)

declare <4 x i64> @vror_vi_v4i64(<4 x i64>)

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

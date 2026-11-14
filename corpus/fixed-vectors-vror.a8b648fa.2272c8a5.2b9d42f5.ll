; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+c,+zfhmin,+d -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <1 x i16> splat (i16 -1)
@G.1 = global i64 0
@G.2 = global <1 x i1> zeroinitializer
@G.3 = global <8 x i8> zeroinitializer
@G.4 = global i128 42
@G.5 = global <4 x i32> splat (i32 42)
@G.6 = global <4 x i32> splat (i32 1)
@G.7 = global <4 x i32> splat (i32 2147483647)
@G.8 = global <4 x i1> splat (i1 true)
@G.9 = global i1 false
@G.10 = global i16 256

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

define <64 x i8> @vror_vx_v64i8(<64 x i8> %a, i8 %b) {
  %A3 = alloca i8, align 1
  store i8 poison, ptr %A3, align 1
  %LGV2 = load <4 x i32>, ptr @G.7, align 16
  %LGV1 = load <4 x i32>, ptr @G.5, align 16
  %B1 = xor <4 x i32> %LGV1, zeroinitializer
  %C3 = icmp sge <4 x i32> %LGV1, %LGV2
  %A = alloca <8 x i1>, align 1
  %B = and <4 x i32> splat (i32 -1), %LGV1
  store <8 x i1> poison, ptr %A, align 1
  %LGV = load <8 x i8>, ptr @G.3, align 8
  %b.head = insertelement <64 x i8> poison, i8 %b, i32 0
  %B2 = sub i8 %b, %b
  %b.splat = shufflevector <64 x i8> %b.head, <64 x i8> poison, <64 x i32> zeroinitializer
  %C = icmp uge <8 x i8> %LGV, splat (i8 127)
  %x = call <64 x i8> @llvm.fshr.v64i8(<64 x i8> %a, <64 x i8> %a, <64 x i8> %b.splat)
  store <8 x i1> %C, ptr %A, align 1
  store <4 x i32> %B, ptr @G.6, align 16
  store <4 x i1> %C3, ptr @G.8, align 1
  store <4 x i32> %B1, ptr %A, align 16
  store i8 %B2, ptr %A3, align 1
  ret <64 x i8> %x
}

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

define <1 x i32> @vror_vi_v1i32(<1 x i32> %a) {
  %LGV1 = load i16, ptr @G.10, align 2
  %B = lshr i16 0, %LGV1
  %LGV = load i1, ptr @G.9, align 1
  store i16 %B, ptr @G.10, align 2
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  %x = call <1 x i32> @llvm.fshr.v1i32(<1 x i32> %a, <1 x i32> %a, <1 x i32> splat (i32 1))
  %C = icmp sge <1 x i32> %x, %x
  store <1 x i1> %C, ptr @G.2, align 1
  ret <1 x i32> %x

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

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

declare <1 x i64> @vror_vi_v1i64(<1 x i64>)

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

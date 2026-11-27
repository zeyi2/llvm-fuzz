; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zfhmin -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 42
@G.1 = global <2 x i1> splat (i1 true)
@G.2 = global <4 x i32> zeroinitializer
@G.3 = global bfloat 0.000000e+00
@G.4 = global bfloat 3.389530e+38
@G.5 = global i64 42
@G.6 = global <32 x i8> splat (i8 42)
@G.7 = global <32 x i8> splat (i8 1)
@G.8 = global i1 false
@G.9 = global i16 256
@G.10 = global <32 x i1> zeroinitializer
@G.11 = global <32 x i1> splat (i1 true)
@G.12 = global <1 x i1> zeroinitializer
@G.13 = global <32 x i1> zeroinitializer

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

define <32 x i8> @vror_vi_v32i8(<32 x i8> %a) {
  %A2 = alloca <32 x i1>, align 4
  store <32 x i1> poison, ptr %A2, align 4
  %A1 = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A1, align 1
  %A11 = alloca i1, align 1
  store i1 false, ptr %A11, align 1
  %A8 = alloca i1, align 1
  store i1 false, ptr %A8, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i64, ptr @G.5, align 4
  %x = call <32 x i8> @llvm.fshr.v32i8(<32 x i8> %a, <32 x i8> %a, <32 x i8> splat (i8 1))
  switch i64 %LGV, label %SW_D [
    i64 -5432229275636659134, label %SW_C
    i64 -8026204853308778092, label %SW_C1
    i64 -2329504647574596141, label %SW_C2
    i64 -7252426693970921683, label %SW_C3
    i64 8186238445718590847, label %SW_C4
    i64 3402221681650743655, label %SW_C5
    i64 -695989564629349695, label %SW_C6
  ]

BB:                                               ; preds = %SW_C6, %SW_C5, %SW_C3, %SW_C2, %SW_C1, %SW_D
  %C6 = icmp sgt <32 x i8> %a, splat (i8 42)
  store <32 x i1> %C6, ptr @G.13, align 4
  ret <32 x i8> %x

SW_D:                                             ; preds = %SW_D, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  %LGV7 = load <32 x i8>, ptr @G.6, align 32
  ret <32 x i8> %LGV7

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  %LGV3 = load <32 x i1>, ptr @G.10, align 4
  %C1 = icmp slt <32 x i8> %a, %a
  store <32 x i1> %C1, ptr %A2, align 4
  %B4 = mul <32 x i1> %C1, %LGV3
  store <32 x i1> %B4, ptr @G.11, align 4
  br label %BB

SW_C3:                                            ; preds = %SW_C3, %0
  %C = fcmp ogt <4 x float> splat (float 4.200000e+01), splat (float +qnan)
  %L9 = load i1, ptr %A8, align 1
  store <4 x i1> %C, ptr %A1, align 1
  br i1 %L9, label %SW_C3, label %BB

SW_C4:                                            ; preds = %0
  %B = fsub bfloat 0.000000e+00, +inf
  %LGV10 = load <32 x i8>, ptr @G.7, align 32
  store bfloat %B, ptr %A2, align 2
  ret <32 x i8> %LGV10

SW_C5:                                            ; preds = %SW_C5, %0
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %SW_C5, label %BB

SW_C6:                                            ; preds = %SW_C6, %0
  %LGV13 = load i1, ptr @G.8, align 1
  br i1 %LGV13, label %BB, label %SW_C6
}

declare <32 x i8> @vror_vi_rotl_v32i8(<32 x i8>)

declare <64 x i8> @vror_vv_v64i8(<64 x i8>, <64 x i8>)

declare <64 x i8> @vror_vx_v64i8(<64 x i8>, i8)

declare <64 x i8> @vror_vi_v64i8(<64 x i8>)

declare <64 x i8> @vror_vi_rotl_v64i8(<64 x i8>)

declare <1 x i16> @vror_vv_v1i16(<1 x i16>, <1 x i16>)

define <1 x i16> @vror_vx_v1i16(<1 x i16> %a, i16 %b) {
  %A2 = alloca <1 x i16>, align 2
  store <1 x i16> poison, ptr %A2, align 2
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %b.head = insertelement <1 x i16> poison, i16 %b, i32 0
  %b.splat = shufflevector <1 x i16> %b.head, <1 x i16> poison, <1 x i32> zeroinitializer
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  %LGV = load i16, ptr @G.9, align 2
  %x = call <1 x i16> @llvm.fshr.v1i16(<1 x i16> %a, <1 x i16> %a, <1 x i16> %b.splat)
  %B = lshr <1 x i16> %b.head, %a
  %B3 = lshr i16 %b, %LGV
  store <1 x i16> %B, ptr %A, align 2
  store i16 %B3, ptr %A2, align 2
  ret <1 x i16> %x

T:                                                ; preds = %0
  ret <1 x i16> %b.splat

F:                                                ; preds = %0
  %B1 = and <1 x i16> %a, %b.head
  %C = icmp eq <1 x i16> %a, splat (i16 -1)
  store <1 x i16> %B1, ptr %A2, align 2
  store <1 x i1> %C, ptr @G.12, align 1
  br label %BB
}

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

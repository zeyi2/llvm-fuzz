; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <1 x i16> splat (i16 -1)
@G.1 = global i64 0
@G.2 = global <1 x i1> zeroinitializer
@G.3 = global <8 x i8> zeroinitializer
@G.4 = global i128 42
@G.5 = global i128 -1
@G.6 = global i1 false
@G.7 = global <2 x i64> splat (i64 -9223372036854775808)
@G.8 = global <2 x i1> zeroinitializer

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

define <1 x i32> @vror_vi_v1i32(<1 x i32> %a) {
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %LGV = load i128, ptr @G.5, align 4
  %x = call <1 x i32> @llvm.fshr.v1i32(<1 x i32> %a, <1 x i32> %a, <1 x i32> splat (i32 1))
  switch i128 %LGV, label %SW_D [
    i128 2485243579302075861, label %SW_C
    i128 16360190125455047181, label %SW_C1
    i128 16613242911449114066, label %SW_C2
    i128 2622762328089378656, label %SW_C3
    i128 13940380849269059046, label %SW_C4
    i128 13655008456586678087, label %SW_C5
    i128 16443456523980542505, label %SW_C6
  ]

BB:                                               ; preds = %SW_C6, %SW_C5, %SW_C1, %SW_C, %SW_D
  %C = icmp sge <1 x i32> %x, %x
  store <1 x i1> %C, ptr @G.2, align 1
  ret <1 x i32> %x

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %SW_C1, %0
  %LGV7 = load i1, ptr @G.6, align 1
  %B1 = ashr i64 4294967296, 0
  store i64 %B1, ptr %A, align 4
  br i1 %LGV7, label %BB, label %SW_C1

SW_C2:                                            ; preds = %0
  ret <1 x i32> %a

SW_C3:                                            ; preds = %0
  ret <1 x i32> %a

SW_C4:                                            ; preds = %0
  %B = add <1 x i32> %a, %x
  store <1 x i32> %B, ptr poison, align 4
  ret <1 x i32> %a

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
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

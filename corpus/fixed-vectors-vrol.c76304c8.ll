; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zvkb,+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i8> splat (i8 1)
@G.1 = global i8 -1
@G.2 = global <16 x i32> splat (i32 42)
@G.3 = global <4 x i64> splat (i64 -1)
@G.4 = global i1 false
@G.5 = global <4 x i32> splat (i32 -2147483648)
@G.6 = global <4 x i1> splat (i1 true)
@G.7 = global <4 x i1> splat (i1 true)

declare <1 x i8> @vrol_vv_v1i8(<1 x i8>, <1 x i8>)

declare <1 x i8> @vrol_vx_v1i8(<1 x i8>, i8)

declare <2 x i8> @vrol_vv_v2i8(<2 x i8>, <2 x i8>)

declare <2 x i8> @vrol_vx_v2i8(<2 x i8>, i8)

define <4 x i8> @vrol_vv_v4i8(<4 x i8> %a, <4 x i8> %b) {
  %LGV = load <4 x i8>, ptr @G, align 4
  %B = shl <4 x i8> %a, %LGV
  ret <4 x i8> %B
}

declare <4 x i8> @vrol_vx_v4i8(<4 x i8>, i8)

declare <8 x i8> @vrol_vv_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @vrol_vx_v8i8(<8 x i8>, i8)

declare <16 x i8> @vrol_vv_v16i8(<16 x i8>, <16 x i8>)

declare <16 x i8> @vrol_vx_v16i8(<16 x i8>, i8)

declare <32 x i8> @vrol_vv_v32i8(<32 x i8>, <32 x i8>)

declare <32 x i8> @vrol_vx_v32i8(<32 x i8>, i8)

define <64 x i8> @vrol_vv_v64i8(<64 x i8> %a, <64 x i8> %b) {
  %x = call <64 x i8> @llvm.fshl.v64i8(<64 x i8> %a, <64 x i8> %a, <64 x i8> %b)
  %B = or i8 0, 127
  store i8 %B, ptr @G.1, align 1
  ret <64 x i8> %x
}

declare <64 x i8> @vrol_vx_v64i8(<64 x i8>, i8)

declare <1 x i16> @vrol_vv_v1i16(<1 x i16>, <1 x i16>)

declare <1 x i16> @vrol_vx_v1i16(<1 x i16>, i16)

declare <2 x i16> @vrol_vv_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @vrol_vx_v2i16(<2 x i16>, i16)

define <4 x i16> @vrol_vv_v4i16(<4 x i16> %a, <4 x i16> %b) {
  %B = xor <4 x i16> %a, splat (i16 42)
  %x = call <4 x i16> @llvm.fshl.v4i16(<4 x i16> %a, <4 x i16> %a, <4 x i16> %b)
  store <4 x i16> %B, ptr poison, align 8
  ret <4 x i16> %x
}

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

define <4 x i32> @vrol_vv_v4i32(<4 x i32> %a, <4 x i32> %b) {
  %LGV = load <4 x i32>, ptr @G.5, align 16
  %x = call <4 x i32> @llvm.fshl.v4i32(<4 x i32> %a, <4 x i32> %a, <4 x i32> %b)
  %C = icmp uge <4 x i32> %x, %LGV
  store <4 x i1> %C, ptr @G.6, align 1
  ret <4 x i32> %x
}

declare <4 x i32> @vrol_vx_v4i32(<4 x i32>, i32)

declare <8 x i32> @vrol_vv_v8i32(<8 x i32>, <8 x i32>)

declare <8 x i32> @vrol_vx_v8i32(<8 x i32>, i32)

define <16 x i32> @vrol_vv_v16i32(<16 x i32> %a, <16 x i32> %b) {
  %B = lshr <16 x i32> %b, splat (i32 65536)
  %x = call <16 x i32> @llvm.fshl.v16i32(<16 x i32> %a, <16 x i32> %a, <16 x i32> %b)
  store <16 x i32> %B, ptr @G.2, align 64
  ret <16 x i32> %x
}

declare <16 x i32> @vrol_vx_v16i32(<16 x i32>, i32)

declare <1 x i64> @vrol_vv_v1i64(<1 x i64>, <1 x i64>)

declare <1 x i64> @vrol_vx_v1i64(<1 x i64>, i64)

declare <2 x i64> @vrol_vv_v2i64(<2 x i64>, <2 x i64>)

declare <2 x i64> @vrol_vx_v2i64(<2 x i64>, i64)

define <4 x i64> @vrol_vv_v4i64(<4 x i64> %a, <4 x i64> %b) {
  %A11 = alloca i1, align 1
  store i1 true, ptr %A11, align 1
  %A8 = alloca i1, align 1
  store i1 true, ptr %A8, align 1
  %A = alloca i8, align 1
  store i8 0, ptr %A, align 1
  %LGV = load i8, ptr @G.1, align 1
  %L = load i8, ptr %A, align 1
  switch i8 %L, label %SW_D [
    i8 103, label %SW_C
    i8 114, label %SW_C1
    i8 65, label %SW_C2
    i8 -55, label %SW_C3
    i8 71, label %SW_C4
    i8 38, label %SW_C5
    i8 123, label %SW_C6
    i8 40, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C4, %SW_C1, %SW_C, %SW_D
  %x = call <4 x i64> @llvm.fshl.v4i64(<4 x i64> %a, <4 x i64> %a, <4 x i64> %b)
  ret <4 x i64> %x

SW_D:                                             ; preds = %SW_D, %0
  %L9 = load i1, ptr %A8, align 1
  br i1 %L9, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  ret <4 x i64> splat (i64 1)

SW_C3:                                            ; preds = %0
  %LGV10 = load <4 x i64>, ptr @G.3, align 32
  ret <4 x i64> %LGV10

SW_C4:                                            ; preds = %SW_C4, %0
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %BB, label %SW_C4

SW_C5:                                            ; preds = %0
  %LGV13 = load <4 x i64>, ptr @G.3, align 32
  ret <4 x i64> %b

SW_C6:                                            ; preds = %0
  ret <4 x i64> zeroinitializer

SW_C7:                                            ; preds = %SW_C7, %0
  %LGV14 = load i1, ptr @G.4, align 1
  br i1 %LGV14, label %BB, label %SW_C7
}

define <4 x i64> @vrol_vx_v4i64(<4 x i64> %a, i64 %b) {
  %b.head = insertelement <4 x i64> poison, i64 %b, i32 0
  %b.splat = shufflevector <4 x i64> %b.head, <4 x i64> poison, <4 x i32> zeroinitializer
  %C = icmp eq <4 x i64> %b.splat, %a
  %x = call <4 x i64> @llvm.fshl.v4i64(<4 x i64> %a, <4 x i64> %a, <4 x i64> %b.splat)
  store <4 x i1> %C, ptr @G.7, align 1
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

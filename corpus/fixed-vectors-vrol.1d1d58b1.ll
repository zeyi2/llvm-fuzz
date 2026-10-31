; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zdinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 127)
@G.2 = global <2 x i64> splat (i64 42)
@G.3 = global i1 false
@G.5 = global i16 0
@G.6 = global <16 x i16> zeroinitializer
@G.7 = global <16 x i16> splat (i16 -32768)

declare <1 x i8> @vrol_vv_v1i8(<1 x i8>, <1 x i8>)

declare <1 x i8> @vrol_vx_v1i8(<1 x i8>, i8)

define <2 x i8> @vrol_vv_v2i8(<2 x i8> %a, <2 x i8> %b) {
  %LGV = load <8 x i8>, ptr @G, align 8
  %S = shufflevector <8 x i8> %LGV, <8 x i8> splat (i8 1), <8 x i32> poison
  %x = call <2 x i8> @llvm.fshl.v2i8(<2 x i8> %a, <2 x i8> %a, <2 x i8> %b)
  store <8 x i8> %S, ptr poison, align 8
  ret <2 x i8> %x
}

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

declare <1 x i16> @vrol_vv_v1i16(<1 x i16>, <1 x i16>)

declare <1 x i16> @vrol_vx_v1i16(<1 x i16>, i16)

declare <2 x i16> @vrol_vv_v2i16(<2 x i16>, <2 x i16>)

define <2 x i16> @vrol_vx_v2i16(<2 x i16> %a, i16 %b) {
  %C = icmp slt <2 x i16> %a, splat (i16 -1)
  %b.head = insertelement <2 x i16> poison, i16 %b, i32 0
  %b.splat = shufflevector <2 x i16> %b.head, <2 x i16> poison, <2 x i32> zeroinitializer
  %x = call <2 x i16> @llvm.fshl.v2i16(<2 x i16> %a, <2 x i16> %a, <2 x i16> %b.splat)
  store <2 x i1> %C, ptr poison, align 1
  ret <2 x i16> %x
}

declare <4 x i16> @vrol_vv_v4i16(<4 x i16>, <4 x i16>)

define <4 x i16> @vrol_vx_v4i16(<4 x i16> %a, i16 %b) {
  %S = shufflevector <4 x i16> %a, <4 x i16> %a, <4 x i32> poison
  %b.head = insertelement <4 x i16> poison, i16 %b, i32 0
  %b.splat = shufflevector <4 x i16> %b.head, <4 x i16> poison, <4 x i32> zeroinitializer
  %x = call <4 x i16> @llvm.fshl.v4i16(<4 x i16> %a, <4 x i16> %a, <4 x i16> %b.splat)
  store <4 x i16> %S, ptr poison, align 8
  ret <4 x i16> %x
}

declare <8 x i16> @vrol_vv_v8i16(<8 x i16>, <8 x i16>)

declare <8 x i16> @vrol_vx_v8i16(<8 x i16>, i16)

define <16 x i16> @vrol_vv_v16i16(<16 x i16> %a, <16 x i16> %b) {
  %LGV = load i1, ptr @G.3, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  %x = call <16 x i16> @llvm.fshl.v16i16(<16 x i16> %a, <16 x i16> %a, <16 x i16> %b)
  ret <16 x i16> %x

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

define <16 x i16> @vrol_vx_v16i16(<16 x i16> %a, i16 %b) {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i16, ptr @G.5, align 2
  switch i16 %LGV, label %SW_D [
    i16 30881, label %SW_C
    i16 15086, label %SW_C1
    i16 20992, label %SW_C2
    i16 11936, label %SW_C3
    i16 -26004, label %SW_C4
  ]

BB:                                               ; preds = %SW_C4, %SW_C1
  %b.head = insertelement <16 x i16> poison, i16 %b, i32 0
  %b.splat = shufflevector <16 x i16> %b.head, <16 x i16> poison, <16 x i32> zeroinitializer
  %x = call <16 x i16> @llvm.fshl.v16i16(<16 x i16> %a, <16 x i16> %a, <16 x i16> %b.splat)
  ret <16 x i16> %x

SW_D:                                             ; preds = %0
  ret <16 x i16> splat (i16 256)

SW_C:                                             ; preds = %0
  %LGV5 = load <16 x i16>, ptr @G.6, align 32
  ret <16 x i16> %LGV5

SW_C1:                                            ; preds = %SW_C1, %0
  %LGV6 = load i1, ptr @G.3, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_C1, label %BB

SW_C2:                                            ; preds = %0
  %LGV7 = load <16 x i16>, ptr @G.6, align 32
  ret <16 x i16> %a

SW_C3:                                            ; preds = %0
  %LGV8 = load <16 x i16>, ptr @G.7, align 32
  ret <16 x i16> %LGV8

SW_C4:                                            ; preds = %0
  br label %BB
}

declare <32 x i16> @vrol_vv_v32i16(<32 x i16>, <32 x i16>)

declare <32 x i16> @vrol_vx_v32i16(<32 x i16>, i16)

declare <1 x i32> @vrol_vv_v1i32(<1 x i32>, <1 x i32>)

declare <1 x i32> @vrol_vx_v1i32(<1 x i32>, i32)

declare <2 x i32> @vrol_vv_v2i32(<2 x i32>, <2 x i32>)

define <2 x i32> @vrol_vx_v2i32(<2 x i32> %a, i32 %b) {
  %B = lshr i32 %b, 65536
  %b.head = insertelement <2 x i32> poison, i32 %b, i32 0
  %b.splat = shufflevector <2 x i32> %b.head, <2 x i32> poison, <2 x i32> zeroinitializer
  %x = call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %a, <2 x i32> %a, <2 x i32> %b.splat)
  store i32 %B, ptr poison, align 4
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

define <2 x i64> @vrol_vx_v2i64(<2 x i64> %a, i64 %b) {
  %b.head = insertelement <2 x i64> poison, i64 %b, i32 0
  %I = insertelement <2 x i64> %a, i64 9223372036854775807, i64 %b
  %b.splat = shufflevector <2 x i64> %b.head, <2 x i64> poison, <2 x i32> zeroinitializer
  %x = call <2 x i64> @llvm.fshl.v2i64(<2 x i64> %a, <2 x i64> %a, <2 x i64> %b.splat)
  store <2 x i64> %I, ptr @G.2, align 16
  ret <2 x i64> %x
}

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

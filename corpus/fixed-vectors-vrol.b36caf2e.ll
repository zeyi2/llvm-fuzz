; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i1> splat (i1 true)
@G.1 = global i32 2147483647
@G.2 = global i8 -1
@G.3 = global i1 true
@G.4 = global i128 42
@G.5 = global i1 true

define <1 x i8> @vrol_vv_v1i8(<1 x i8> %a, <1 x i8> %b) {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i1, ptr @G.3, align 1
  %x = call <1 x i8> @llvm.fshl.v1i8(<1 x i8> %a, <1 x i8> %a, <1 x i8> %b)
  %L = load i1, ptr %A, align 1
  switch i1 %L, label %SW_D [
    i1 false, label %SW_C
    i1 true, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_D
  ret <1 x i8> %x

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  ret <1 x i8> %a

SW_C1:                                            ; preds = %0
  br label %BB
}

define <1 x i8> @vrol_vx_v1i8(<1 x i8> %a, i8 %b) {
  %b.head = insertelement <1 x i8> poison, i8 %b, i32 0
  %b.splat = shufflevector <1 x i8> %b.head, <1 x i8> poison, <1 x i32> zeroinitializer
  %x = call <1 x i8> @llvm.fshl.v1i8(<1 x i8> %a, <1 x i8> %a, <1 x i8> %b.splat)
  %C = icmp ugt <2 x i64> splat (i64 -1), splat (i64 42)
  store <2 x i1> %C, ptr @G, align 1
  ret <1 x i8> %x
}

declare <2 x i8> @vrol_vv_v2i8(<2 x i8>, <2 x i8>)

define <2 x i8> @vrol_vx_v2i8(<2 x i8> %a, i8 %b) {
  %A11 = alloca i1, align 1
  store i1 true, ptr %A11, align 1
  %A9 = alloca i1, align 1
  store i1 true, ptr %A9, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i128, ptr @G.4, align 4
  %b.head = insertelement <2 x i8> poison, i8 %b, i32 0
  %b.splat = shufflevector <2 x i8> %b.head, <2 x i8> poison, <2 x i32> zeroinitializer
  switch i128 %LGV, label %SW_D [
    i128 10493878562372513012, label %SW_C
    i128 6332374433323115034, label %SW_C1
    i128 10151425871377860175, label %SW_C2
    i128 17815788421434354592, label %SW_C3
    i128 16081855225304926802, label %SW_C4
    i128 9360885428196600776, label %SW_C5
    i128 5017669501726402728, label %SW_C6
    i128 18034799676010748590, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C6, %SW_C5, %SW_C4, %SW_C3, %SW_C1, %SW_C, %SW_D
  %x = call <2 x i8> @llvm.fshl.v2i8(<2 x i8> %a, <2 x i8> %a, <2 x i8> %b.splat)
  ret <2 x i8> %x

SW_D:                                             ; preds = %SW_D, %0
  %LGV8 = load i1, ptr @G.5, align 1
  br i1 %LGV8, label %SW_D, label %BB

SW_C:                                             ; preds = %SW_C, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_C, label %BB

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  ret <2 x i8> %b.head

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %SW_C5, %0
  %L10 = load i1, ptr %A9, align 1
  br i1 %L10, label %SW_C5, label %BB

SW_C6:                                            ; preds = %SW_C6, %0
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %SW_C6, label %BB

SW_C7:                                            ; preds = %0
  br label %BB
}

declare <4 x i8> @vrol_vv_v4i8(<4 x i8>, <4 x i8>)

declare <4 x i8> @vrol_vx_v4i8(<4 x i8>, i8)

declare <8 x i8> @vrol_vv_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @vrol_vx_v8i8(<8 x i8>, i8)

declare <16 x i8> @vrol_vv_v16i8(<16 x i8>, <16 x i8>)

declare <16 x i8> @vrol_vx_v16i8(<16 x i8>, i8)

declare <32 x i8> @vrol_vv_v32i8(<32 x i8>, <32 x i8>)

define <32 x i8> @vrol_vx_v32i8(<32 x i8> %a, i8 %b) {
  %A5 = alloca i1, align 1
  store i1 false, ptr %A5, align 1
  %A = alloca i128, align 8
  store i128 0, ptr %A, align 4
  %b.head = insertelement <32 x i8> poison, i8 %b, i32 0
  %b.splat = shufflevector <32 x i8> %b.head, <32 x i8> poison, <32 x i32> zeroinitializer
  %x = call <32 x i8> @llvm.fshl.v32i8(<32 x i8> %a, <32 x i8> %a, <32 x i8> %b.splat)
  %L = load i128, ptr %A, align 4
  switch i128 %L, label %SW_D [
    i128 7006186525872448967, label %SW_C
    i128 7605827764965219660, label %SW_C1
    i128 10994704510435110861, label %SW_C2
    i128 15890065988812401508, label %SW_C3
    i128 12847353327802112767, label %SW_C4
  ]

BB:                                               ; preds = %SW_C3, %SW_C2, %SW_C1, %SW_D
  ret <32 x i8> %x

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  ret <32 x i8> splat (i8 -128)

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %SW_C2, %0
  %L6 = load i1, ptr %A5, align 1
  br i1 %L6, label %SW_C2, label %BB

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  ret <32 x i8> zeroinitializer
}

declare <64 x i8> @vrol_vv_v64i8(<64 x i8>, <64 x i8>)

declare <64 x i8> @vrol_vx_v64i8(<64 x i8>, i8)

declare <1 x i16> @vrol_vv_v1i16(<1 x i16>, <1 x i16>)

declare <1 x i16> @vrol_vx_v1i16(<1 x i16>, i16)

declare <2 x i16> @vrol_vv_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @vrol_vx_v2i16(<2 x i16>, i16)

declare <4 x i16> @vrol_vv_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @vrol_vx_v4i16(<4 x i16>, i16)

declare <8 x i16> @vrol_vv_v8i16(<8 x i16>, <8 x i16>)

define <8 x i16> @vrol_vx_v8i16(<8 x i16> %a, i16 %b) {
  %LGV = load i8, ptr @G.2, align 1
  %b.head = insertelement <8 x i16> poison, i16 %b, i32 0
  %b.splat = shufflevector <8 x i16> %b.head, <8 x i16> poison, <8 x i32> zeroinitializer
  %x = call <8 x i16> @llvm.fshl.v8i16(<8 x i16> %a, <8 x i16> %a, <8 x i16> %b.splat)
  %C = icmp sgt i8 42, %LGV
  store i1 %C, ptr @G.3, align 1
  ret <8 x i16> %x
}

declare <16 x i16> @vrol_vv_v16i16(<16 x i16>, <16 x i16>)

declare <16 x i16> @vrol_vx_v16i16(<16 x i16>, i16)

declare <32 x i16> @vrol_vv_v32i16(<32 x i16>, <32 x i16>)

define <32 x i16> @vrol_vx_v32i16(<32 x i16> %a, i16 %b) {
  %b.head = insertelement <32 x i16> poison, i16 %b, i32 0
  %b.splat = shufflevector <32 x i16> %b.head, <32 x i16> poison, <32 x i32> zeroinitializer
  %B = sub i32 1, 2147483647
  %x = call <32 x i16> @llvm.fshl.v32i16(<32 x i16> %a, <32 x i16> %a, <32 x i16> %b.splat)
  store i32 %B, ptr @G.1, align 4
  ret <32 x i16> %x
}

declare <1 x i32> @vrol_vv_v1i32(<1 x i32>, <1 x i32>)

declare <1 x i32> @vrol_vx_v1i32(<1 x i32>, i32)

declare <2 x i32> @vrol_vv_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @vrol_vx_v2i32(<2 x i32>, i32)

declare <4 x i32> @vrol_vv_v4i32(<4 x i32>, <4 x i32>)

define <4 x i32> @vrol_vx_v4i32(<4 x i32> %a, i32 %b) {
  %b.head = insertelement <4 x i32> poison, i32 %b, i32 0
  %B = or <4 x i32> %b.head, %a
  %x = call <4 x i32> @llvm.fshl.v4i32(<4 x i32> %a, <4 x i32> %a, <4 x i32> %B)
  ret <4 x i32> %x
}

declare <8 x i32> @vrol_vv_v8i32(<8 x i32>, <8 x i32>)

declare <8 x i32> @vrol_vx_v8i32(<8 x i32>, i32)

declare <16 x i32> @vrol_vv_v16i32(<16 x i32>, <16 x i32>)

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

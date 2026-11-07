; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m,+zhinx -O1 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 42

declare <2 x i8> @fshr_v2i8(<2 x i8>, <2 x i8>, <2 x i8>, <2 x i1>, i32 zeroext)

define <2 x i8> @fshl_v2i8(<2 x i8> %a, <2 x i8> %b, <2 x i8> %c, <2 x i1> %m, i32 zeroext %evl) {
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %B = and i8 1, -1
  %res = call <2 x i8> @llvm.fshl.v2i8(<2 x i8> %a, <2 x i8> %b, <2 x i8> %c)
  store i8 %B, ptr %A, align 1
  ret <2 x i8> %res
}

declare <4 x i8> @fshr_v4i8(<4 x i8>, <4 x i8>, <4 x i8>, <4 x i1>, i32 zeroext)

declare <4 x i8> @fshl_v4i8(<4 x i8>, <4 x i8>, <4 x i8>, <4 x i1>, i32 zeroext)

declare <8 x i8> @fshr_v8i8(<8 x i8>, <8 x i8>, <8 x i8>, <8 x i1>, i32 zeroext)

declare <8 x i8> @fshl_v8i8(<8 x i8>, <8 x i8>, <8 x i8>, <8 x i1>, i32 zeroext)

declare <16 x i8> @fshr_v16i8(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i1>, i32 zeroext)

declare <16 x i8> @fshl_v16i8(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i1>, i32 zeroext)

declare <32 x i8> @fshr_v32i8(<32 x i8>, <32 x i8>, <32 x i8>, <32 x i1>, i32 zeroext)

declare <32 x i8> @fshl_v32i8(<32 x i8>, <32 x i8>, <32 x i8>, <32 x i1>, i32 zeroext)

declare <64 x i8> @fshr_v64i8(<64 x i8>, <64 x i8>, <64 x i8>, <64 x i1>, i32 zeroext)

declare <64 x i8> @fshl_v64i8(<64 x i8>, <64 x i8>, <64 x i8>, <64 x i1>, i32 zeroext)

declare <2 x i16> @fshr_v2i16(<2 x i16>, <2 x i16>, <2 x i16>, <2 x i1>, i32 zeroext)

declare <2 x i16> @fshl_v2i16(<2 x i16>, <2 x i16>, <2 x i16>, <2 x i1>, i32 zeroext)

declare <4 x i16> @fshr_v4i16(<4 x i16>, <4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @fshl_v4i16(<4 x i16>, <4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

declare <8 x i16> @fshr_v8i16(<8 x i16>, <8 x i16>, <8 x i16>, <8 x i1>, i32 zeroext)

define <8 x i16> @fshl_v8i16(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c, <8 x i1> %m, i32 zeroext %evl) {
  %res = call <8 x i16> @llvm.fshl.v8i16(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c)
  %S = shufflevector <8 x i16> %res, <8 x i16> splat (i16 256), <8 x i32> poison
  ret <8 x i16> %S
}

declare <16 x i16> @fshr_v16i16(<16 x i16>, <16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @fshl_v16i16(<16 x i16>, <16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

declare <32 x i16> @fshr_v32i16(<32 x i16>, <32 x i16>, <32 x i16>, <32 x i1>, i32 zeroext)

define <32 x i16> @fshl_v32i16(<32 x i16> %a, <32 x i16> %b, <32 x i16> %c, <32 x i1> %m, i32 zeroext %evl) {
  %res = call <32 x i16> @llvm.fshl.v32i16(<32 x i16> %a, <32 x i16> %b, <32 x i16> %c)
  %E = extractelement <8 x i8> splat (i8 16), i32 %evl
  store i8 %E, ptr @G, align 1
  ret <32 x i16> %res
}

declare <2 x i32> @fshr_v2i32(<2 x i32>, <2 x i32>, <2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @fshl_v2i32(<2 x i32>, <2 x i32>, <2 x i32>, <2 x i1>, i32 zeroext)

declare <4 x i32> @fshr_v4i32(<4 x i32>, <4 x i32>, <4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @fshl_v4i32(<4 x i32>, <4 x i32>, <4 x i32>, <4 x i1>, i32 zeroext)

define <8 x i32> @fshr_v8i32(<8 x i32> %a, <8 x i32> %b, <8 x i32> %c, <8 x i1> %m, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %res = call <8 x i32> @llvm.fshr.v8i32(<8 x i32> %a, <8 x i32> %b, <8 x i32> %c)
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <8 x i32> %res

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

declare <8 x i32> @fshl_v8i32(<8 x i32>, <8 x i32>, <8 x i32>, <8 x i1>, i32 zeroext)

declare <16 x i32> @fshr_v16i32(<16 x i32>, <16 x i32>, <16 x i32>, <16 x i1>, i32 zeroext)

declare <16 x i32> @fshl_v16i32(<16 x i32>, <16 x i32>, <16 x i32>, <16 x i1>, i32 zeroext)

declare <2 x i64> @fshr_v2i64(<2 x i64>, <2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @fshl_v2i64(<2 x i64>, <2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <4 x i64> @fshr_v4i64(<4 x i64>, <4 x i64>, <4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @fshl_v4i64(<4 x i64>, <4 x i64>, <4 x i64>, <4 x i1>, i32 zeroext)

declare <7 x i64> @fshr_v7i64(<7 x i64>, <7 x i64>, <7 x i64>, <7 x i1>, i32 zeroext)

declare <7 x i64> @fshl_v7i64(<7 x i64>, <7 x i64>, <7 x i64>, <7 x i1>, i32 zeroext)

declare <8 x i64> @fshr_v8i64(<8 x i64>, <8 x i64>, <8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @fshl_v8i64(<8 x i64>, <8 x i64>, <8 x i64>, <8 x i1>, i32 zeroext)

declare <16 x i64> @fshr_v16i64(<16 x i64>, <16 x i64>, <16 x i64>, <16 x i1>, i32 zeroext)

declare <16 x i64> @fshl_v16i64(<16 x i64>, <16 x i64>, <16 x i64>, <16 x i1>, i32 zeroext)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.fshl.v16i16(<16 x i16>, <16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.fshl.v16i32(<16 x i32>, <16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.fshl.v16i64(<16 x i64>, <16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.fshl.v16i8(<16 x i8>, <16 x i8>, <16 x i8>) #0

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
declare <7 x i64> @llvm.fshl.v7i64(<7 x i64>, <7 x i64>, <7 x i64>) #0

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
declare <16 x i64> @llvm.fshr.v16i64(<16 x i64>, <16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.fshr.v16i8(<16 x i8>, <16 x i8>, <16 x i8>) #0

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
declare <7 x i64> @llvm.fshr.v7i64(<7 x i64>, <7 x i64>, <7 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.fshr.v8i16(<8 x i16>, <8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.fshr.v8i32(<8 x i32>, <8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.fshr.v8i64(<8 x i64>, <8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.fshr.v8i8(<8 x i8>, <8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

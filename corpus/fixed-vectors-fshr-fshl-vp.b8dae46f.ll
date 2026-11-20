; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m,+zhinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i8> splat (i8 1)
@G.1 = global <2 x i64> splat (i64 42)
@G.2 = global <8 x i1> zeroinitializer

declare <2 x i8> @fshr_v2i8(<2 x i8>, <2 x i8>, <2 x i8>, <2 x i1>, i32 zeroext)

declare <2 x i8> @fshl_v2i8(<2 x i8>, <2 x i8>, <2 x i8>, <2 x i1>, i32 zeroext)

define <4 x i8> @fshr_v4i8(<4 x i8> %a, <4 x i8> %b, <4 x i8> %c, <4 x i1> %m, i32 zeroext %evl) {
  %LGV = load <4 x i8>, ptr @G, align 4
  %res = call <4 x i8> @llvm.fshr.v4i8(<4 x i8> %a, <4 x i8> %b, <4 x i8> %c)
  %B = ashr <4 x i8> %c, %LGV
  store <4 x i8> %B, ptr poison, align 4
  ret <4 x i8> %res
}

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

define <2 x i16> @fshl_v2i16(<2 x i16> %a, <2 x i16> %b, <2 x i16> %c, <2 x i1> %m, i32 zeroext %evl) {
  %res = call <2 x i16> @llvm.fshl.v2i16(<2 x i16> %a, <2 x i16> %b, <2 x i16> %c)
  %C = icmp eq <8 x i8> splat (i8 -1), splat (i8 127)
  store <8 x i1> %C, ptr @G.2, align 1
  ret <2 x i16> %res
}

declare <4 x i16> @fshr_v4i16(<4 x i16>, <4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

declare <4 x i16> @fshl_v4i16(<4 x i16>, <4 x i16>, <4 x i16>, <4 x i1>, i32 zeroext)

declare <8 x i16> @fshr_v8i16(<8 x i16>, <8 x i16>, <8 x i16>, <8 x i1>, i32 zeroext)

declare <8 x i16> @fshl_v8i16(<8 x i16>, <8 x i16>, <8 x i16>, <8 x i1>, i32 zeroext)

declare <16 x i16> @fshr_v16i16(<16 x i16>, <16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

declare <16 x i16> @fshl_v16i16(<16 x i16>, <16 x i16>, <16 x i16>, <16 x i1>, i32 zeroext)

declare <32 x i16> @fshr_v32i16(<32 x i16>, <32 x i16>, <32 x i16>, <32 x i1>, i32 zeroext)

declare <32 x i16> @fshl_v32i16(<32 x i16>, <32 x i16>, <32 x i16>, <32 x i1>, i32 zeroext)

declare <2 x i32> @fshr_v2i32(<2 x i32>, <2 x i32>, <2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i32> @fshl_v2i32(<2 x i32>, <2 x i32>, <2 x i32>, <2 x i1>, i32 zeroext)

declare <4 x i32> @fshr_v4i32(<4 x i32>, <4 x i32>, <4 x i32>, <4 x i1>, i32 zeroext)

declare <4 x i32> @fshl_v4i32(<4 x i32>, <4 x i32>, <4 x i32>, <4 x i1>, i32 zeroext)

declare <8 x i32> @fshr_v8i32(<8 x i32>, <8 x i32>, <8 x i32>, <8 x i1>, i32 zeroext)

declare <8 x i32> @fshl_v8i32(<8 x i32>, <8 x i32>, <8 x i32>, <8 x i1>, i32 zeroext)

declare <16 x i32> @fshr_v16i32(<16 x i32>, <16 x i32>, <16 x i32>, <16 x i1>, i32 zeroext)

define <16 x i32> @fshl_v16i32(<16 x i32> %a, <16 x i32> %b, <16 x i32> %c, <16 x i1> %m, i32 zeroext %evl) {
  %res = call <16 x i32> @llvm.fshl.v16i32(<16 x i32> %a, <16 x i32> %b, <16 x i32> %c)
  %B = mul <2 x i64> splat (i64 -1), zeroinitializer
  store <2 x i64> %B, ptr @G.1, align 16
  ret <16 x i32> %res
}

declare <2 x i64> @fshr_v2i64(<2 x i64>, <2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i64> @fshl_v2i64(<2 x i64>, <2 x i64>, <2 x i64>, <2 x i1>, i32 zeroext)

declare <4 x i64> @fshr_v4i64(<4 x i64>, <4 x i64>, <4 x i64>, <4 x i1>, i32 zeroext)

declare <4 x i64> @fshl_v4i64(<4 x i64>, <4 x i64>, <4 x i64>, <4 x i1>, i32 zeroext)

declare <7 x i64> @fshr_v7i64(<7 x i64>, <7 x i64>, <7 x i64>, <7 x i1>, i32 zeroext)

declare <7 x i64> @fshl_v7i64(<7 x i64>, <7 x i64>, <7 x i64>, <7 x i1>, i32 zeroext)

declare <8 x i64> @fshr_v8i64(<8 x i64>, <8 x i64>, <8 x i64>, <8 x i1>, i32 zeroext)

declare <8 x i64> @fshl_v8i64(<8 x i64>, <8 x i64>, <8 x i64>, <8 x i1>, i32 zeroext)

declare <16 x i64> @fshr_v16i64(<16 x i64>, <16 x i64>, <16 x i64>, <16 x i1>, i32 zeroext)

define <16 x i64> @fshl_v16i64(<16 x i64> %a, <16 x i64> %b, <16 x i64> %c, <16 x i1> %m, i32 zeroext %evl) {
  %res = call <16 x i64> @llvm.fshl.v16i64(<16 x i64> %a, <16 x i64> %b, <16 x i64> %c)
  %C = icmp sge <16 x i64> %b, %c
  store <16 x i1> %C, ptr poison, align 2
  ret <16 x i64> %res
}

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

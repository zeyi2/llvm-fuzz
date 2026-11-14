; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <1 x i1> splat (i1 true)
@G.1 = global <4 x i64> zeroinitializer
@G.2 = global i64 -9223372036854775808

; Function Attrs: nounwind
define <1 x i32> @clmul_v1i32(<1 x i32> %x, <1 x i32> %y) #0 {
  %a = call <1 x i32> @llvm.clmul.v1i32(<1 x i32> %x, <1 x i32> %y)
  %C = icmp uge <1 x i32> %y, splat (i32 -2147483648)
  store <1 x i1> %C, ptr @G, align 1
  ret <1 x i32> %a
}

; Function Attrs: nounwind
declare <2 x i32> @clmul_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
declare <4 x i32> @clmul_v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nounwind
declare <8 x i32> @clmul_v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nounwind
declare <16 x i32> @clmul_v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nounwind
declare <1 x i64> @clmul_v1i64(<1 x i64>, <1 x i64>) #0

; Function Attrs: nounwind
declare <2 x i64> @clmul_v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nounwind
define <4 x i64> @clmul_v4i64(<4 x i64> %x, <4 x i64> %y) #0 {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV = load <4 x i64>, ptr @G.1, align 32
  %a = call <4 x i64> @llvm.clmul.v4i64(<4 x i64> %x, <4 x i64> %y)
  %C = icmp sgt <4 x i64> %a, %LGV
  store <4 x i1> %C, ptr %A, align 1
  ret <4 x i64> %a
}

; Function Attrs: nounwind
define <8 x i64> @clmul_v8i64(<8 x i64> %x, <8 x i64> %y) #0 {
  %a = call <8 x i64> @llvm.clmul.v8i64(<8 x i64> %x, <8 x i64> %y)
  %E = extractelement <8 x i64> %x, i128 0
  store i64 %E, ptr @G.2, align 4
  ret <8 x i64> %a
}

; Function Attrs: nounwind
declare <4 x i8> @clmul_v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nounwind
declare <4 x i16> @clmul_v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nounwind
declare <4 x i8> @clmulr_v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.clmul.v16i32(<16 x i32>, <16 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i32> @llvm.clmul.v1i32(<1 x i32>, <1 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.clmul.v1i64(<1 x i64>, <1 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.clmul.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.clmul.v2i64(<2 x i64>, <2 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.clmul.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.clmul.v4i32(<4 x i32>, <4 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.clmul.v4i64(<4 x i64>, <4 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.clmul.v4i8(<4 x i8>, <4 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.clmul.v8i32(<8 x i32>, <8 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.clmul.v8i64(<8 x i64>, <8 x i64>) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

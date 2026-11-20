; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-zvbc32e,+d -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 42
@G.1 = global i8 16
@G.2 = global <4 x float> splat (float f0x7F7FFFFF)
@G.3 = global <4 x i1> zeroinitializer

; Function Attrs: nounwind
declare <1 x i32> @clmul_v1i32(<1 x i32>, <1 x i32>) #0

; Function Attrs: nounwind
declare <2 x i32> @clmul_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
define <4 x i32> @clmul_v4i32(<4 x i32> %x, <4 x i32> %y) #0 {
  %LGV = load <4 x float>, ptr @G.2, align 16
  %C = fcmp uge <4 x float> splat (float 4.200000e+01), %LGV
  %a = call <4 x i32> @llvm.clmul.v4i32(<4 x i32> %x, <4 x i32> %y)
  store <4 x i1> %C, ptr @G.3, align 1
  ret <4 x i32> %a
}

; Function Attrs: nounwind
declare <8 x i32> @clmul_v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nounwind
declare <16 x i32> @clmul_v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nounwind
declare <1 x i64> @clmul_v1i64(<1 x i64>, <1 x i64>) #0

; Function Attrs: nounwind
declare <2 x i64> @clmul_v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nounwind
declare <4 x i64> @clmul_v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nounwind
define <8 x i64> @clmul_v8i64(<8 x i64> %x, <8 x i64> %y) #0 {
  %A = alloca <8 x i1>, align 1
  store <8 x i1> poison, ptr %A, align 1
  %C = icmp sle <8 x i64> %x, %x
  %a = call <8 x i64> @llvm.clmul.v8i64(<8 x i64> %x, <8 x i64> %y)
  store <8 x i1> %C, ptr %A, align 1
  ret <8 x i64> %a
}

; Function Attrs: nounwind
define <4 x i8> @clmul_v4i8(<4 x i8> %a, <4 x i8> %b) #0 {
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %LGV1 = load i8, ptr @G.1, align 1
  %LGV = load i8, ptr @G, align 1
  %res = call <4 x i8> @llvm.clmul.v4i8(<4 x i8> %a, <4 x i8> %b)
  %B = lshr i8 %LGV, %LGV1
  store i8 %B, ptr %A, align 1
  ret <4 x i8> %res
}

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

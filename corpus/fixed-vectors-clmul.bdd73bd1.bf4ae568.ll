; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+experimental-zvbc32e,+zhinx,+zicond -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i32> zeroinitializer
@G.1 = global half 4.200000e+01
@G.2 = global float 4.200000e+01
@G.3 = global i1 true
@G.4 = global <4 x i8> splat (i8 127)
@G.5 = global <4 x i32> splat (i32 -2147483648)
@G.6 = global <4 x i1> zeroinitializer

; Function Attrs: nounwind
declare <1 x i32> @clmul_v1i32(<1 x i32>, <1 x i32>) #0

; Function Attrs: nounwind
declare <2 x i32> @clmul_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
define <4 x i32> @clmul_v4i32(<4 x i32> %x, <4 x i32> %y) #0 {
  %a = call <4 x i32> @llvm.clmul.v4i32(<4 x i32> %x, <4 x i32> %y)
  %I = insertelement <4 x i32> %x, i32 65536, i8 16
  %C = icmp ugt <4 x i32> %x, splat (i32 42)
  store <4 x i32> %I, ptr @G.5, align 16
  store <4 x i1> %C, ptr @G.6, align 1
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
declare <8 x i64> @clmul_v8i64(<8 x i64>, <8 x i64>) #0

; Function Attrs: nounwind
define <4 x i8> @clmul_v4i8(<4 x i8> %a, <4 x i8> %b) #0 {
  %A3 = alloca i1, align 1
  store i1 false, ptr %A3, align 1
  %A = alloca i64, align 8
  store i64 9223372036854775807, ptr %A, align 4
  %L = load i64, ptr %A, align 4
  switch i64 %L, label %SW_D [
    i64 -3109141580167396588, label %SW_C
    i64 7351154550997659848, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_D
  %LGV = load <4 x i8>, ptr @G.4, align 4
  %B = lshr <4 x i8> %a, %LGV
  ret <4 x i8> %B

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  ret <4 x i8> zeroinitializer

SW_C1:                                            ; preds = %SW_C1, %0
  %LGV2 = load i1, ptr @G.3, align 1
  %L4 = load i1, ptr %A3, align 1
  br i1 %L4, label %BB, label %SW_C1
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

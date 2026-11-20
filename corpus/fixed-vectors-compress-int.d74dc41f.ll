; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m,+zvbb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half 5.960460e-08
@G.1 = global i1 false

declare <1 x i8> @vector_compress_v1i8(<1 x i8>, <1 x i1>)

declare <1 x i8> @vector_compress_v1i8_passthru(<1 x i8>, <1 x i8>, <1 x i1>)

declare <2 x i8> @vector_compress_v2i8(<2 x i8>, <2 x i1>)

declare <2 x i8> @vector_compress_v2i8_passthru(<2 x i8>, <2 x i8>, <2 x i1>)

declare <4 x i8> @vector_compress_v4i8(<4 x i8>, <4 x i1>)

declare <4 x i8> @vector_compress_v4i8_passthru(<4 x i8>, <4 x i8>, <4 x i1>)

declare <8 x i8> @vector_compress_v8i8(<8 x i8>, <8 x i1>)

define <8 x i8> @vector_compress_v8i8_passthru(<8 x i8> %passthru, <8 x i8> %v, <8 x i1> %mask) {
  %A10 = alloca i1, align 1
  store i1 false, ptr %A10, align 1
  %A8 = alloca i1, align 1
  store i1 true, ptr %A8, align 1
  %A = alloca i8, align 1
  store i8 16, ptr %A, align 1
  %ret = call <8 x i8> @llvm.experimental.vector.compress.v8i8(<8 x i8> %v, <8 x i1> %mask, <8 x i8> %passthru)
  %L = load i8, ptr %A, align 1
  switch i8 %L, label %SW_D [
    i8 28, label %SW_C
    i8 -68, label %SW_C1
    i8 -106, label %SW_C2
    i8 -14, label %SW_C3
    i8 -38, label %SW_C4
    i8 -19, label %SW_C5
    i8 64, label %SW_C6
    i8 67, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C6, %SW_C5, %SW_C4, %SW_C2, %SW_C1, %SW_C, %SW_D
  ret <8 x i8> %ret

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  ret <8 x i8> %v

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %SW_C5, %0
  %L9 = load i1, ptr %A8, align 1
  br i1 %L9, label %BB, label %SW_C5

SW_C6:                                            ; preds = %SW_C6, %0
  %L11 = load i1, ptr %A10, align 1
  br i1 %L11, label %BB, label %SW_C6

SW_C7:                                            ; preds = %0
  br label %BB
}

declare <1 x i16> @vector_compress_v1i16(<1 x i16>, <1 x i1>)

declare <1 x i16> @vector_compress_v1i16_passthru(<1 x i16>, <1 x i16>, <1 x i1>)

declare <2 x i16> @vector_compress_v2i16(<2 x i16>, <2 x i1>)

declare <2 x i16> @vector_compress_v2i16_passthru(<2 x i16>, <2 x i16>, <2 x i1>)

declare <4 x i16> @vector_compress_v4i16(<4 x i16>, <4 x i1>)

declare <4 x i16> @vector_compress_v4i16_passthru(<4 x i16>, <4 x i16>, <4 x i1>)

declare <8 x i16> @vector_compress_v8i16(<8 x i16>, <8 x i1>)

declare <8 x i16> @vector_compress_v8i16_passthru(<8 x i16>, <8 x i16>, <8 x i1>)

declare <1 x i32> @vector_compress_v1i32(<1 x i32>, <1 x i1>)

declare <1 x i32> @vector_compress_v1i32_passthru(<1 x i32>, <1 x i32>, <1 x i1>)

declare <2 x i32> @vector_compress_v2i32(<2 x i32>, <2 x i1>)

declare <2 x i32> @vector_compress_v2i32_passthru(<2 x i32>, <2 x i32>, <2 x i1>)

declare <4 x i32> @vector_compress_v4i32(<4 x i32>, <4 x i1>)

define <4 x i32> @vector_compress_v4i32_passthru(<4 x i32> %passthru, <4 x i32> %v, <4 x i1> %mask) {
  %LGV = load half, ptr @G, align 2
  %C = fcmp ugt half 1.000000e+00, %LGV
  %ret = call <4 x i32> @llvm.experimental.vector.compress.v4i32(<4 x i32> %v, <4 x i1> %mask, <4 x i32> %passthru)
  store i1 %C, ptr @G.1, align 1
  ret <4 x i32> %ret
}

declare <8 x i32> @vector_compress_v8i32(<8 x i32>, <8 x i1>)

declare <8 x i32> @vector_compress_v8i32_passthru(<8 x i32>, <8 x i32>, <8 x i1>)

declare <1 x i64> @vector_compress_v1i64(<1 x i64>, <1 x i1>)

declare <1 x i64> @vector_compress_v1i64_passthru(<1 x i64>, <1 x i64>, <1 x i1>)

declare <2 x i64> @vector_compress_v2i64(<2 x i64>, <2 x i1>)

declare <2 x i64> @vector_compress_v2i64_passthru(<2 x i64>, <2 x i64>, <2 x i1>)

declare <4 x i64> @vector_compress_v4i64(<4 x i64>, <4 x i1>)

declare <4 x i64> @vector_compress_v4i64_passthru(<4 x i64>, <4 x i64>, <4 x i1>)

declare <8 x i64> @vector_compress_v8i64(<8 x i64>, <8 x i1>)

declare <8 x i64> @vector_compress_v8i64_passthru(<8 x i64>, <8 x i64>, <8 x i1>)

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <1 x i16> @llvm.experimental.vector.compress.v1i16(<1 x i16>, <1 x i1>, <1 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <1 x i32> @llvm.experimental.vector.compress.v1i32(<1 x i32>, <1 x i1>, <1 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <1 x i64> @llvm.experimental.vector.compress.v1i64(<1 x i64>, <1 x i1>, <1 x i64>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <1 x i8> @llvm.experimental.vector.compress.v1i8(<1 x i8>, <1 x i1>, <1 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i16> @llvm.experimental.vector.compress.v2i16(<2 x i16>, <2 x i1>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i32> @llvm.experimental.vector.compress.v2i32(<2 x i32>, <2 x i1>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i64> @llvm.experimental.vector.compress.v2i64(<2 x i64>, <2 x i1>, <2 x i64>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i8> @llvm.experimental.vector.compress.v2i8(<2 x i8>, <2 x i1>, <2 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i16> @llvm.experimental.vector.compress.v4i16(<4 x i16>, <4 x i1>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i32> @llvm.experimental.vector.compress.v4i32(<4 x i32>, <4 x i1>, <4 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i64> @llvm.experimental.vector.compress.v4i64(<4 x i64>, <4 x i1>, <4 x i64>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i8> @llvm.experimental.vector.compress.v4i8(<4 x i8>, <4 x i1>, <4 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x i16> @llvm.experimental.vector.compress.v8i16(<8 x i16>, <8 x i1>, <8 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x i32> @llvm.experimental.vector.compress.v8i32(<8 x i32>, <8 x i1>, <8 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x i64> @llvm.experimental.vector.compress.v8i64(<8 x i64>, <8 x i1>, <8 x i64>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x i8> @llvm.experimental.vector.compress.v8i8(<8 x i8>, <8 x i1>, <8 x i8>) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(none) }

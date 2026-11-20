; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 -1

declare <1 x i8> @vector_compress_v1i8(<1 x i8>, <1 x i1>)

declare <1 x i8> @vector_compress_v1i8_passthru(<1 x i8>, <1 x i8>, <1 x i1>)

declare <2 x i8> @vector_compress_v2i8(<2 x i8>, <2 x i1>)

declare <2 x i8> @vector_compress_v2i8_passthru(<2 x i8>, <2 x i8>, <2 x i1>)

declare <4 x i8> @vector_compress_v4i8(<4 x i8>, <4 x i1>)

declare <4 x i8> @vector_compress_v4i8_passthru(<4 x i8>, <4 x i8>, <4 x i1>)

declare <8 x i8> @vector_compress_v8i8(<8 x i8>, <8 x i1>)

declare <8 x i8> @vector_compress_v8i8_passthru(<8 x i8>, <8 x i8>, <8 x i1>)

declare <1 x i16> @vector_compress_v1i16(<1 x i16>, <1 x i1>)

declare <1 x i16> @vector_compress_v1i16_passthru(<1 x i16>, <1 x i16>, <1 x i1>)

declare <2 x i16> @vector_compress_v2i16(<2 x i16>, <2 x i1>)

declare <2 x i16> @vector_compress_v2i16_passthru(<2 x i16>, <2 x i16>, <2 x i1>)

declare <4 x i16> @vector_compress_v4i16(<4 x i16>, <4 x i1>)

declare <4 x i16> @vector_compress_v4i16_passthru(<4 x i16>, <4 x i16>, <4 x i1>)

declare <8 x i16> @vector_compress_v8i16(<8 x i16>, <8 x i1>)

define <8 x i16> @vector_compress_v8i16_passthru(<8 x i16> %passthru, <8 x i16> %v, <8 x i1> %mask) {
  %ret = call <8 x i16> @llvm.experimental.vector.compress.v8i16(<8 x i16> %v, <8 x i1> %mask, <8 x i16> %passthru)
  %B = add i128 0, 170141183460469231731687303715884105727
  store i128 %B, ptr @G, align 4
  ret <8 x i16> %ret
}

declare <1 x i32> @vector_compress_v1i32(<1 x i32>, <1 x i1>)

declare <1 x i32> @vector_compress_v1i32_passthru(<1 x i32>, <1 x i32>, <1 x i1>)

declare <2 x i32> @vector_compress_v2i32(<2 x i32>, <2 x i1>)

declare <2 x i32> @vector_compress_v2i32_passthru(<2 x i32>, <2 x i32>, <2 x i1>)

declare <4 x i32> @vector_compress_v4i32(<4 x i32>, <4 x i1>)

declare <4 x i32> @vector_compress_v4i32_passthru(<4 x i32>, <4 x i32>, <4 x i1>)

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

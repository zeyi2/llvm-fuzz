; isel-diff-config: -mtriple=riscv64 -mattr=+v,+zvbb,+zvfh -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

declare <32 x i1> @vector_interleave_v32i1_v16i1(<16 x i1>, <16 x i1>)

declare <16 x i16> @vector_interleave_v16i16_v8i16(<8 x i16>, <8 x i16>)

declare <8 x i32> @vector_interleave_v8i32_v4i32(<4 x i32>, <4 x i32>)

define <4 x i64> @vector_interleave_v4i64_v2i64(<2 x i64> %a, <2 x i64> %b) {
  %res = call <4 x i64> @llvm.vector.interleave2.v4i64(<2 x i64> %a, <2 x i64> %b)
  %B = shl i16 0, 1
  store i16 %B, ptr poison, align 2
  ret <4 x i64> %res
}

; Function Attrs: nounwind
declare <6 x i32> @vector_interleave3_v6i32_v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
declare <8 x i32> @vector_interleave4_v8i32_v2i32(<2 x i32>, <2 x i32>, <2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
declare <2048 x i8> @vector_interleave4_v512i8_v2048i8(<512 x i8>, <512 x i8>, <512 x i8>, <512 x i8>) #0

; Function Attrs: nounwind
declare <10 x i16> @vector_interleave5_v10i16_v2i16(<2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nounwind
declare <12 x i16> @vector_interleave6_v12i16_v2i16(<2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nounwind
declare <14 x i8> @vector_interleave7_v14i8_v2i8(<2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>) #0

; Function Attrs: nounwind
declare <16 x i8> @vector_interleave8_v16i8_v2i8(<2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>) #0

declare <4 x half> @vector_interleave_v4f16_v2f16(<2 x half>, <2 x half>)

declare <4 x bfloat> @vector_interleave_v4bf16_v2bf16(<2 x bfloat>, <2 x bfloat>)

declare <8 x half> @vector_interleave_v8f16_v4f16(<4 x half>, <4 x half>)

define <8 x bfloat> @vector_interleave_v8bf16_v4bf16(<4 x bfloat> %a, <4 x bfloat> %b) {
  %res = call <8 x bfloat> @llvm.vector.interleave2.v8bf16(<4 x bfloat> %a, <4 x bfloat> %b)
  store <8 x bfloat> %res, ptr poison, align 16
  ret <8 x bfloat> %res
}

declare <4 x float> @vector_interleave_v4f32_v2f32(<2 x float>, <2 x float>)

declare <16 x half> @vector_interleave_v16f16_v8f16(<8 x half>, <8 x half>)

declare <16 x bfloat> @vector_interleave_v16bf16_v8bf16(<8 x bfloat>, <8 x bfloat>)

declare <8 x float> @vector_interleave_v8f32_v4f32(<4 x float>, <4 x float>)

declare <4 x double> @vector_interleave_v4f64_v2f64(<2 x double>, <2 x double>)

; Function Attrs: nounwind
declare <6 x float> @vector_interleave3_v6f32_v2f32(<2 x float>, <2 x float>, <2 x float>) #0

; Function Attrs: nounwind
declare <8 x float> @vector_interleave4_v8f32_v2f32(<2 x float>, <2 x float>, <2 x float>, <2 x float>) #0

; Function Attrs: nounwind
declare <10 x half> @vector_interleave5_v10f16_v2f16(<2 x half>, <2 x half>, <2 x half>, <2 x half>, <2 x half>) #0

; Function Attrs: nounwind
declare <10 x bfloat> @vector_interleave5_v10bf16_v2bf16(<2 x bfloat>, <2 x bfloat>, <2 x bfloat>, <2 x bfloat>, <2 x bfloat>) #0

; Function Attrs: nounwind
declare <12 x half> @vector_interleave6_v12f16_v2f16(<2 x half>, <2 x half>, <2 x half>, <2 x half>, <2 x half>, <2 x half>) #0

; Function Attrs: nounwind
declare <12 x bfloat> @vector_interleave6_v12bf16_v2bf16(<2 x bfloat>, <2 x bfloat>, <2 x bfloat>, <2 x bfloat>, <2 x bfloat>, <2 x bfloat>) #0

; Function Attrs: nounwind
declare <7 x half> @vector_interleave7_v7f16_v1f16(<1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>) #0

; Function Attrs: nounwind
declare <7 x bfloat> @vector_interleave7_v7bf16_v1bf16(<1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>) #0

; Function Attrs: nounwind
declare <8 x half> @vector_interleave8_v8f16_v1f16(<1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>) #0

; Function Attrs: nounwind
define <8 x bfloat> @vector_interleave8_v8bf16_v1bf16(<1 x bfloat> %a, <1 x bfloat> %b, <1 x bfloat> %c, <1 x bfloat> %d, <1 x bfloat> %e, <1 x bfloat> %f, <1 x bfloat> %g, <1 x bfloat> %h) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %res = call <8 x bfloat> @llvm.vector.interleave8.v8bf16(<1 x bfloat> %a, <1 x bfloat> %b, <1 x bfloat> %c, <1 x bfloat> %d, <1 x bfloat> %e, <1 x bfloat> %f, <1 x bfloat> %g, <1 x bfloat> %h)
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <8 x bfloat> %res

T:                                                ; preds = %T, %0
  br i1 %L, label %BB, label %T

F:                                                ; preds = %0
  br label %BB
}

declare <8 x i16> @interleave4_const_splat_v8i16(<2 x i16>)

declare <8 x i16> @interleave4_same_nonconst_splat_v8i16(i16)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x bfloat> @llvm.vector.interleave2.v16bf16(<8 x bfloat>, <8 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x half> @llvm.vector.interleave2.v16f16(<8 x half>, <8 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.vector.interleave2.v16i16(<8 x i16>, <8 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i1> @llvm.vector.interleave2.v32i1(<16 x i1>, <16 x i1>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x bfloat> @llvm.vector.interleave2.v4bf16(<2 x bfloat>, <2 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x half> @llvm.vector.interleave2.v4f16(<2 x half>, <2 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.vector.interleave2.v4f32(<2 x float>, <2 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @llvm.vector.interleave2.v4f64(<2 x double>, <2 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.vector.interleave2.v4i64(<2 x i64>, <2 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x bfloat> @llvm.vector.interleave2.v8bf16(<4 x bfloat>, <4 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x half> @llvm.vector.interleave2.v8f16(<4 x half>, <4 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.vector.interleave2.v8f32(<4 x float>, <4 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.vector.interleave2.v8i32(<4 x i32>, <4 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <6 x float> @llvm.vector.interleave3.v6f32(<2 x float>, <2 x float>, <2 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <6 x i32> @llvm.vector.interleave3.v6i32(<2 x i32>, <2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2048 x i8> @llvm.vector.interleave4.v2048i8(<512 x i8>, <512 x i8>, <512 x i8>, <512 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.vector.interleave4.v8f32(<2 x float>, <2 x float>, <2 x float>, <2 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.vector.interleave4.v8i16(<2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.vector.interleave4.v8i32(<2 x i32>, <2 x i32>, <2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <10 x bfloat> @llvm.vector.interleave5.v10bf16(<2 x bfloat>, <2 x bfloat>, <2 x bfloat>, <2 x bfloat>, <2 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <10 x half> @llvm.vector.interleave5.v10f16(<2 x half>, <2 x half>, <2 x half>, <2 x half>, <2 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <10 x i16> @llvm.vector.interleave5.v10i16(<2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <12 x bfloat> @llvm.vector.interleave6.v12bf16(<2 x bfloat>, <2 x bfloat>, <2 x bfloat>, <2 x bfloat>, <2 x bfloat>, <2 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <12 x half> @llvm.vector.interleave6.v12f16(<2 x half>, <2 x half>, <2 x half>, <2 x half>, <2 x half>, <2 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <12 x i16> @llvm.vector.interleave6.v12i16(<2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <14 x i8> @llvm.vector.interleave7.v14i8(<2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <7 x bfloat> @llvm.vector.interleave7.v7bf16(<1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <7 x half> @llvm.vector.interleave7.v7f16(<1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.vector.interleave8.v16i8(<2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>, <2 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x bfloat> @llvm.vector.interleave8.v8bf16(<1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>, <1 x bfloat>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x half> @llvm.vector.interleave8.v8f16(<1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>, <1 x half>) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

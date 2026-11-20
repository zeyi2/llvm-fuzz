; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+f,+d,+zvfhmin,+zvfbfmin -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> zeroinitializer
@G.1 = global <1 x i1> zeroinitializer
@G.2 = global float 0.000000e+00
@G.3 = global i32 0
@G.4 = global <8 x float> splat (float 1.000000e+00)
@G.5 = global double 4.200000e+01
@G.6 = global i1 false
@G.7 = global i8 1
@G.8 = global i64 4294967296
@G.9 = global <1 x float> splat (float +inf)

define <1 x i64> @llrint_v1i64_v1f32(<1 x float> %x) {
  %a = call <1 x i64> @llvm.llrint.v1i64.v1f32(<1 x float> %x)
  %B = fdiv <1 x float> %x, zeroinitializer
  store <1 x float> %B, ptr @G.9, align 4
  ret <1 x i64> %a
}

declare <2 x i64> @llrint_v2i64_v2f32(<2 x float>)

declare <3 x i64> @llrint_v3i64_v3f32(<3 x float>)

declare <4 x i64> @llrint_v4i64_v4f32(<4 x float>)

define <8 x i64> @llrint_v8i64_v8f32(<8 x float> %x) {
  %LGV1 = load i32, ptr @G.3, align 4
  %LGV = load float, ptr @G.2, align 4
  %I = insertelement <8 x float> %x, float %LGV, i32 %LGV1
  %a = call <8 x i64> @llvm.llrint.v8i64.v8f32(<8 x float> %x)
  store <8 x float> %I, ptr @G.4, align 32
  ret <8 x i64> %a
}

declare <16 x i64> @llrint_v16i64_v16f32(<16 x float>)

declare <1 x i64> @llrint_v1i64_v1f64(<1 x double>)

declare <2 x i64> @llrint_v2i64_v2f64(<2 x double>)

declare <4 x i64> @llrint_v4i64_v4f64(<4 x double>)

declare <8 x i64> @llrint_v8i64_v8f64(<8 x double>)

define <1 x i64> @llrint_v1i64_v1f16(<1 x half> %x) {
  %C = fcmp uge <1 x half> %x, %x
  %a = call <1 x i64> @llvm.llrint.v1i64.v1f16(<1 x half> %x)
  store <1 x i1> %C, ptr @G.1, align 1
  ret <1 x i64> %a
}

declare <2 x i64> @llrint_v2i64_v2f16(<2 x half>)

define <3 x i64> @llrint_v3i64_v3f16(<3 x half> %x) {
  %A = alloca <3 x i64>, align 32
  store <3 x i64> poison, ptr %A, align 32
  %LGV = load i64, ptr @G.8, align 4
  %a = call <3 x i64> @llvm.llrint.v3i64.v3f16(<3 x half> %x)
  %I = insertelement <3 x i64> %a, i64 %LGV, i32 1
  store <3 x i64> %I, ptr %A, align 32
  ret <3 x i64> %a
}

define <4 x i64> @llrint_v4i64_v4f16(<4 x half> %x) {
  %LGV = load double, ptr @G.5, align 8
  %a = call <4 x i64> @llvm.llrint.v4i64.v4f16(<4 x half> %x)
  %C = fcmp oge double +qnan, %LGV
  store i1 %C, ptr @G.6, align 1
  ret <4 x i64> %a
}

declare <8 x i64> @llrint_v8i64_v8f16(<8 x half>)

define <16 x i64> @llrint_v16i64_v16f16(<16 x half> %x) {
  %I = insertelement <4 x i32> zeroinitializer, i32 -1, i16 -1
  %a = call <16 x i64> @llvm.llrint.v16i64.v16f16(<16 x half> %x)
  store <4 x i32> %I, ptr @G, align 16
  ret <16 x i64> %a
}

declare <1 x i64> @llrint_v1i64_v1bf16(<1 x bfloat>)

declare <2 x i64> @llrint_v2i64_v2bf16(<2 x bfloat>)

define <3 x i64> @llrint_v3i64_v3bf16(<3 x bfloat> %x) {
  %B = srem i8 -1, 0
  %a = call <3 x i64> @llvm.llrint.v3i64.v3bf16(<3 x bfloat> %x)
  store i8 %B, ptr @G.7, align 1
  ret <3 x i64> %a
}

declare <4 x i64> @llrint_v4i64_v4bf16(<4 x bfloat>)

declare <8 x i64> @llrint_v8i64_v8bf16(<8 x bfloat>)

declare <16 x i64> @llrint_v16i64_v16bf16(<16 x bfloat>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.llrint.v16i64.v16bf16(<16 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.llrint.v16i64.v16f16(<16 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.llrint.v16i64.v16f32(<16 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.llrint.v1i64.v1bf16(<1 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.llrint.v1i64.v1f16(<1 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.llrint.v1i64.v1f32(<1 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.llrint.v1i64.v1f64(<1 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.llrint.v2i64.v2bf16(<2 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.llrint.v2i64.v2f16(<2 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.llrint.v2i64.v2f32(<2 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.llrint.v2i64.v2f64(<2 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i64> @llvm.llrint.v3i64.v3bf16(<3 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i64> @llvm.llrint.v3i64.v3f16(<3 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i64> @llvm.llrint.v3i64.v3f32(<3 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.llrint.v4i64.v4bf16(<4 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.llrint.v4i64.v4f16(<4 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.llrint.v4i64.v4f32(<4 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.llrint.v4i64.v4f64(<4 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.llrint.v8i64.v8bf16(<8 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.llrint.v8i64.v8f16(<8 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.llrint.v8i64.v8f32(<8 x float>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.llrint.v8i64.v8f64(<8 x double>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

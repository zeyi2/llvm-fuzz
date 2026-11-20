; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+zvfh,+zvbb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 18446744073709551616
@G.1 = global <4 x float> splat (float 1.401300e-45)
@G.2 = global <4 x i32> splat (i32 65536)
@G.3 = global i32 -2147483648
@G.4 = global i32 42

define <4 x float> @canonicalize_v4f32(<4 x float> %a) {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV = load <4 x float>, ptr @G.1, align 16
  %C = fcmp ole <4 x float> %LGV, %a
  %r = call <4 x float> @llvm.canonicalize.v4f32(<4 x float> %a)
  store <4 x i1> %C, ptr %A, align 1
  ret <4 x float> %r
}

define <2 x double> @canonicalize_v2f64(<2 x double> %a) {
  %B = udiv <4 x i32> splat (i32 2147483647), zeroinitializer
  %r = call <2 x double> @llvm.canonicalize.v2f64(<2 x double> %a)
  %C = fcmp une <2 x double> %a, splat (double 4.940660e-324)
  store <2 x i1> %C, ptr poison, align 1
  store <4 x i32> %B, ptr @G.2, align 16
  ret <2 x double> %r
}

define <4 x half> @canonicalize_v4f16(<4 x half> %a) {
  %A = alloca <4 x half>, align 8
  store <4 x half> poison, ptr %A, align 8
  %B = fmul <4 x half> %a, %a
  %r = call <4 x half> @llvm.canonicalize.v4f16(<4 x half> %a)
  store <4 x half> %B, ptr %A, align 8
  ret <4 x half> %r
}

define <4 x bfloat> @canonicalize_v4bf16(<4 x bfloat> %a) {
  %LGV3 = load i32, ptr @G.4, align 4
  %LGV2 = load i32, ptr @G.3, align 4
  %LGV = load i128, ptr @G, align 4
  %B = mul i128 %LGV, 1
  %r = call <4 x bfloat> @llvm.canonicalize.v4bf16(<4 x bfloat> %a)
  %B4 = udiv i32 %LGV2, %LGV3
  store i128 %B, ptr poison, align 4
  store i32 %B4, ptr poison, align 4
  ret <4 x bfloat> %r
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.canonicalize.v2f64(<2 x double>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x bfloat> @llvm.canonicalize.v4bf16(<4 x bfloat>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x half> @llvm.canonicalize.v4f16(<4 x half>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.canonicalize.v4f32(<4 x float>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

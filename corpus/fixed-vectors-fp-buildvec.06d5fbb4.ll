; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zvfhmin,+f -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global <8 x i1> splat (i1 true)
@G.2 = global i128 18446744073709551616
@G.3 = global i16 256
@G.4 = global <8 x i8> zeroinitializer
@G.5 = global float +inf

declare void @buildvec_no_vid_v4f32(ptr)

; Function Attrs: optsize
declare <4 x float> @hang_when_merging_stores_after_legalization(<8 x float>, <8 x float>) #0

define void @buildvec_dominant0_v2f32(ptr %x) {
  %G = getelementptr i128, ptr %x, i64 1
  store <2 x float> <float 0.000000e+00, float 1.000000e+00>, ptr %x, align 8
  store ptr %G, ptr poison, align 8
  ret void
}

declare void @buildvec_dominant1_v2f32(ptr)

declare void @buildvec_dominant0_v4f32(ptr)

declare void @buildvec_dominant1_v4f32(ptr, float)

declare void @buildvec_dominant2_v4f32(ptr, float)

define void @buildvec_merge0_v4f32(ptr %x, float %f) {
  %LGV1 = load float, ptr @G.5, align 4
  %v0 = insertelement <4 x float> poison, float %f, i32 0
  %v1 = insertelement <4 x float> %v0, float 2.000000e+00, i32 1
  %I = insertelement <4 x float> %v1, float %LGV1, i128 170141183460469231731687303715884105727
  %v3 = insertelement <4 x float> %I, float %f, i32 3
  store <4 x float> %v3, ptr %x, align 16
  ret void
}

declare <4 x half> @splat_c3_v4f16(<4 x half>)

declare <4 x half> @splat_idx_v4f16(<4 x half>, i64)

declare <8 x float> @splat_c5_v8f32(<8 x float>)

declare <8 x float> @splat_idx_v8f32(<8 x float>, i64)

declare dso_local void @splat_load_licm(ptr)

declare <2 x half> @buildvec_v2f16(half, half)

declare <2 x float> @buildvec_v2f32(float, float)

declare <2 x double> @buildvec_v2f64(double, double)

define <2 x double> @buildvec_v2f64_b(double %a, double %b) {
  %v1 = insertelement <2 x double> poison, double %b, i64 1
  %C = fcmp ogt double %a, +qnan
  %v2 = insertelement <2 x double> %v1, double %a, i64 0
  store i1 %C, ptr @G, align 1
  ret <2 x double> %v2
}

declare <4 x float> @buildvec_v4f32(float, float, float, float)

declare <8 x float> @buildvec_v8f32(float, float, float, float, float, float, float, float)

declare <16 x float> @buildvec_v16f32(float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float)

declare <32 x float> @buildvec_v32f32(float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float)

declare <8 x double> @buildvec_v8f64(double, double, double, double, double, double, double, double)

declare <16 x double> @buildvec_v16f64(double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double)

declare <32 x double> @buildvec_v32f64(double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double)

; Function Attrs: vscale_range(2,2)
declare <32 x double> @buildvec_v32f64_exact_vlen(double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double) #1

declare <2 x float> @signbits()

declare <2 x half> @vid_v2f16()

declare <2 x half> @vid_addend1_v2f16()

define <2 x half> @vid_denominator2_v2f16() {
  %C = fcmp ord float 1.401300e-45, 1.000000e+00
  store i1 %C, ptr poison, align 1
  ret <2 x half> <half 5.000000e-01, half 1.000000e+00>
}

define <2 x half> @vid_step2_v2f16() {
  %LGV = load i16, ptr @G.3, align 2
  %B = shl i16 -1, %LGV
  store i16 %B, ptr poison, align 2
  ret <2 x half> <half 0.000000e+00, half 2.000000e+00>
}

declare <2 x float> @vid_v2f32()

declare <2 x float> @vid_addend1_v2f32()

declare <2 x float> @vid_denominator2_v2f32()

declare <2 x float> @vid_step2_v2f32()

declare <2 x double> @vid_v2f64()

declare <2 x double> @vid_addend1_v2f64()

declare <2 x double> @vid_denominator2_v2f64()

define <2 x double> @vid_step2_v2f64() {
  %LGV1 = load <8 x i8>, ptr @G.4, align 8
  %C = icmp sle <8 x i8> splat (i8 42), %LGV1
  store <8 x i1> %C, ptr @G.1, align 1
  ret <2 x double> <double 0.000000e+00, double 2.000000e+00>
}

; Function Attrs: vscale_range(4,128)
declare <8 x float> @buildvec_v8f32_zvl256(float, float, float, float, float, float, float, float) #2

; Function Attrs: vscale_range(4,128)
declare <8 x double> @buildvec_v8f64_zvl256(double, double, double, double, double, double, double, double) #2

; Function Attrs: vscale_range(8,128)
declare <8 x double> @buildvec_v8f64_zvl512(double, double, double, double, double, double, double, double) #3

; Function Attrs: nounwind
define <4 x float> @buildvec_vfredusum_slideup(float %start, <8 x float> %arg1, <8 x float> %arg2, <8 x float> %arg3, <8 x float> %arg4) #4 {
  %C = fcmp ult <8 x float> %arg1, %arg4
  %1 = tail call reassoc float @llvm.vector.reduce.fadd.v8f32(float %start, <8 x float> %arg1)
  %2 = insertelement <4 x float> poison, float %1, i64 0
  %3 = tail call reassoc float @llvm.vector.reduce.fadd.v8f32(float %start, <8 x float> %arg2)
  %4 = insertelement <4 x float> %2, float %3, i64 1
  %5 = tail call reassoc float @llvm.vector.reduce.fadd.v8f32(float %start, <8 x float> %arg3)
  %6 = insertelement <4 x float> %4, float %5, i64 2
  %7 = tail call reassoc float @llvm.vector.reduce.fadd.v8f32(float %start, <8 x float> %arg4)
  %8 = insertelement <4 x float> %6, float %7, i64 3
  store <8 x i1> %C, ptr @G.1, align 1
  ret <4 x float> %8
}

; Function Attrs: nounwind
declare <8 x float> @buildvec_vfredusum_slideup_leading_undef(float, <8 x float>, <8 x float>, <8 x float>, <8 x float>) #4

; Function Attrs: nounwind
declare <8 x float> @buildvec_vfredusum_slideup_trailing_undef(float, <8 x float>, <8 x float>, <8 x float>, <8 x float>) #4

; Function Attrs: nounwind
declare <8 x float> @buildvec_vfredusum_slideup_not_extract_first(float, <8 x float>, <8 x float>, <8 x float>, <8 x float>) #4

; Function Attrs: nounwind
declare <8 x float> @buildvec_vfredusum_slideup_mid_undef(float, <8 x float>, <8 x float>, <8 x float>, <8 x float>) #4

; Function Attrs: nounwind
declare <4 x float> @buildvec_vfredosum_slideup(float, <8 x float>, <8 x float>, <8 x float>, <8 x float>) #4

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fadd.v8f32(float, <8 x float>) #5

attributes #0 = { optsize }
attributes #1 = { vscale_range(2,2) }
attributes #2 = { vscale_range(4,128) }
attributes #3 = { vscale_range(8,128) }
attributes #4 = { nounwind }
attributes #5 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

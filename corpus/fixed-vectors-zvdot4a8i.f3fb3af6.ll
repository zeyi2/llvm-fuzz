; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x float> splat (float 4.200000e+01)
@G.1 = global <4 x i32> splat (i32 1)
@G.2 = global <16 x i8> splat (i8 42)

declare i32 @vdot4a_vv(<16 x i8>, <16 x i8>)

declare i32 @vdot4a_vx_constant(<16 x i8>)

declare i32 @vdot4a_vx_constant_swapped(<16 x i8>)

declare i32 @vdot4au_vv(<16 x i8>, <16 x i8>)

declare i32 @vdot4au_vx_constant(<16 x i8>)

declare i32 @vdot4asu_vv(<16 x i8>, <16 x i8>)

declare i32 @vdot4asu_vv_swapped(<16 x i8>, <16 x i8>)

declare i32 @vdotqsu_vx_constant(<16 x i8>)

declare i32 @vdotqus_vx_constant(<16 x i8>)

declare i32 @reduce_of_sext(<16 x i8>)

declare i32 @reduce_of_zext(<16 x i8>)

declare i32 @vdot4a_vv_accum(<16 x i8>, <16 x i8>, <16 x i32>)

declare i32 @vdot4au_vv_accum(<16 x i8>, <16 x i8>, <16 x i32>)

define i32 @vdot4asu_vv_accum(<16 x i8> %a, <16 x i8> %b, <16 x i32> %x) {
entry:
  %LGV1 = load <16 x i8>, ptr @G.2, align 16
  %a.sext = sext <16 x i8> %a to <16 x i32>
  %b.zext = zext <16 x i8> %b to <16 x i32>
  %B = udiv <16 x i8> %b, %LGV1
  %mul = mul <16 x i32> %a.sext, %b.zext
  %add = add <16 x i32> %mul, %x
  %sum = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %add)
  store <16 x i8> %B, ptr @G.2, align 16
  ret i32 %sum
}

declare i32 @vdot4a_vv_scalar_add(<16 x i8>, <16 x i8>, i32)

declare i32 @vdot4au_vv_scalar_add(<16 x i8>, <16 x i8>, i32)

declare i32 @vdot4asu_vv_scalar_add(<16 x i8>, <16 x i8>, i32)

declare i32 @vdot4a_vv_split(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>)

declare <1 x i32> @vdot4a_vv_partial_reduce_v1i32_v4i8(<4 x i8>, <4 x i8>)

declare <1 x i32> @vdot4au_vv_partial_reduce_v1i32_v4i8(<4 x i8>, <4 x i8>)

declare <1 x i32> @vdot4au_vx_partial_reduce(<4 x i8>, <4 x i8>)

declare <1 x i32> @vdot4a_vx_partial_reduce(<4 x i8>, <4 x i8>)

declare <1 x i32> @vdot4asu_vv_partial_reduce_v1i32_v4i8(<4 x i8>, <4 x i8>)

declare <1 x i32> @vdot4asu_vv_partial_reduce_swapped(<4 x i8>, <4 x i8>)

declare <1 x i32> @vdot4asu_vx_partial_reduce(<4 x i8>, <4 x i8>)

declare <2 x i32> @vdot4a_vv_partial_reduce_v2i32_v8i8(<8 x i8>, <8 x i8>)

declare <2 x i32> @vdot4a_vv_partial_reduce_v2i32_v64i8(<64 x i8>, <64 x i8>)

declare <4 x i32> @vdot4a_vv_partial_reduce_v4i32_v16i8(<16 x i8>, <16 x i8>)

declare <16 x i32> @vdot4a_vv_partial_reduce_v16i32_v64i8(<64 x i8>, <64 x i8>)

declare <4 x i32> @vdot4a_vv_partial_reduce_m1_accum(<16 x i8>, <16 x i8>, <4 x i32>)

declare <16 x i32> @vdot4a_vv_partial_reduce3(<16 x i8>, <16 x i8>)

declare <64 x i32> @vdot4asu_vv_partial_v64i32_v256i8(<256 x i8>, <256 x i8>)

define <4 x i31> @vdot4asu_vv_partial_v4i31_v16i7(<16 x i7> %a, <16 x i7> %b) {
entry:
  %a.ext = sext <16 x i7> %a to <16 x i31>
  %b.ext = zext <16 x i7> %b to <16 x i31>
  %mul = mul <16 x i31> %b.ext, %a.ext
  %res = call <4 x i31> @llvm.vector.partial.reduce.add.v4i31.v16i31(<4 x i31> zeroinitializer, <16 x i31> %mul)
  %B = fdiv <4 x float> splat (float +qnan), splat (float 4.200000e+01)
  store <4 x float> %B, ptr @G, align 16
  ret <4 x i31> %res
}

declare <1 x i32> @vdot4asu_vv_partial_v1i32_v2i8(<2 x i8>, <2 x i8>)

declare <1 x i32> @vdot4asu_vv_partial_v1i32_v8i8(<8 x i8>, <8 x i8>)

declare <4 x i32> @partial_of_sext(<16 x i8>)

define <4 x i32> @partial_of_zext(<16 x i8> %a) {
entry:
  %a.ext = zext <16 x i8> %a to <16 x i32>
  %res = call <4 x i32> @llvm.vector.partial.reduce.add.v4i32.v16i32(<4 x i32> zeroinitializer, <16 x i32> %a.ext)
  %B = mul <4 x i32> %res, splat (i32 2147483647)
  store <4 x i32> %B, ptr @G.1, align 16
  ret <4 x i32> %res
}

declare i32 @vdot4a_vv_accum_disjoint_or(<16 x i8>, <16 x i8>, <16 x i32>)

declare i32 @vdot4a_vv_accum_or(<16 x i8>, <16 x i8>, <16 x i32>)

declare i32 @vdot4au_vv_accum_disjoint_or(<16 x i8>, <16 x i8>, <16 x i32>)

declare i32 @vdot4asu_vv_accum_disjoint_or(<16 x i8>, <16 x i8>, <16 x i32>)

declare i32 @vdot4au_vv_scalar_add_chain2(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, i32)

declare i32 @vdot4a_vv_scalar_add_chain2(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, i32)

declare i32 @vdot4au_vv_chain4(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.vector.partial.reduce.add.v4i32.v16i32(<4 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i32> @llvm.vector.partial.reduce.add.v1i32.v8i32(<1 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i32> @llvm.vector.partial.reduce.add.v1i32.v2i32(<1 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i31> @llvm.vector.partial.reduce.add.v4i31.v16i31(<4 x i31>, <16 x i31>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <64 x i32> @llvm.vector.partial.reduce.add.v64i32.v256i32(<64 x i32>, <256 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.vector.partial.reduce.add.v16i32.v64i32(<16 x i32>, <64 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.vector.partial.reduce.add.v2i32.v64i32(<2 x i32>, <64 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.vector.partial.reduce.add.v2i32.v8i32(<2 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i32> @llvm.vector.partial.reduce.add.v1i32.v4i32(<1 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.vector.partial.reduce.add.v16i32.v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v16i32(<16 x i32>) #1

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -O3 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.401300e-45
@G.1 = global i64 1
@G.2 = global i8 1
@G.3 = global <16 x i31> splat (i31 32768)
@G.4 = global i8 42

define i32 @vdot4a_vv(<16 x i8> %a, <16 x i8> %b) {
entry:
  %LGV1 = load i8, ptr @G.2, align 1
  %LGV = load i64, ptr @G.1, align 4
  %I = insertelement <2 x i64> splat (i64 42), i64 %LGV, i8 %LGV1
  %a.sext = sext <16 x i8> %a to <16 x i32>
  %b.sext = sext <16 x i8> %b to <16 x i32>
  %mul = mul <16 x i32> %a.sext, %b.sext
  %res = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %mul)
  store <2 x i64> %I, ptr poison, align 16
  ret i32 %res
}

declare i32 @vdot4a_vx_constant(<16 x i8>)

define i32 @vdot4a_vx_constant_swapped(<16 x i8> %a) {
entry:
  %A = alloca <16 x i32>, align 64
  store <16 x i32> poison, ptr %A, align 64
  %a.sext = sext <16 x i8> %a to <16 x i32>
  %mul = mul <16 x i32> splat (i32 23), %a.sext
  %res = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %mul)
  store <16 x i32> %a.sext, ptr %A, align 64
  ret i32 %res
}

declare i32 @vdot4au_vv(<16 x i8>, <16 x i8>)

define i32 @vdot4au_vx_constant(<16 x i8> %a) {
entry:
  %LGV = load float, ptr @G, align 4
  %a.zext = zext <16 x i8> %a to <16 x i32>
  %C = fcmp true float 0.000000e+00, %LGV
  %mul = mul <16 x i32> %a.zext, splat (i32 123)
  %res = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %mul)
  store i1 %C, ptr poison, align 1
  ret i32 %res
}

define i32 @vdot4asu_vv(<16 x i8> %a, <16 x i8> %b) {
entry:
  %A = alloca <16 x i32>, align 64
  store <16 x i32> poison, ptr %A, align 64
  %a.sext = sext <16 x i8> %a to <16 x i32>
  %b.zext = zext <16 x i8> %b to <16 x i32>
  %mul = mul <16 x i32> %a.sext, %b.zext
  %res = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %mul)
  %B = xor <16 x i32> %a.sext, %mul
  store <16 x i32> %B, ptr %A, align 64
  ret i32 %res
}

declare i32 @vdot4asu_vv_swapped(<16 x i8>, <16 x i8>)

declare i32 @vdotqsu_vx_constant(<16 x i8>)

declare i32 @vdotqus_vx_constant(<16 x i8>)

declare i32 @reduce_of_sext(<16 x i8>)

declare i32 @reduce_of_zext(<16 x i8>)

declare i32 @vdot4a_vv_accum(<16 x i8>, <16 x i8>, <16 x i32>)

declare i32 @vdot4au_vv_accum(<16 x i8>, <16 x i8>, <16 x i32>)

declare i32 @vdot4asu_vv_accum(<16 x i8>, <16 x i8>, <16 x i32>)

declare i32 @vdot4a_vv_scalar_add(<16 x i8>, <16 x i8>, i32)

define i32 @vdot4au_vv_scalar_add(<16 x i8> %a, <16 x i8> %b, i32 %x) {
entry:
  %a.zext = zext <16 x i8> %a to <16 x i32>
  %b.zext = zext <16 x i8> %b to <16 x i32>
  %B = ashr i8 -1, 42
  %mul = mul <16 x i32> %a.zext, %b.zext
  %sum = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %mul)
  %add = add i32 %sum, %x
  store i8 %B, ptr @G.4, align 1
  ret i32 %add
}

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
  %B = urem <16 x i31> %b.ext, %a.ext
  %res = call <4 x i31> @llvm.vector.partial.reduce.add.v4i31.v16i31(<4 x i31> zeroinitializer, <16 x i31> %mul)
  store <16 x i31> %B, ptr @G.3, align 64
  ret <4 x i31> %res
}

declare <1 x i32> @vdot4asu_vv_partial_v1i32_v2i8(<2 x i8>, <2 x i8>)

declare <1 x i32> @vdot4asu_vv_partial_v1i32_v8i8(<8 x i8>, <8 x i8>)

declare <4 x i32> @partial_of_sext(<16 x i8>)

declare <4 x i32> @partial_of_zext(<16 x i8>)

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

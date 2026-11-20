; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 0
@G.1 = global <4 x i32> splat (i32 1)
@G.2 = global <4 x i32> splat (i32 42)
@G.3 = global i1 false
@G.4 = global <16 x i1> zeroinitializer
@G.5 = global <8 x i1> zeroinitializer
@G.6 = global <4 x float> splat (float 1.000000e+00)

define i32 @vdot4a_vv(<16 x i8> %a, <16 x i8> %b) {
entry:
  %a.sext = sext <16 x i8> %a to <16 x i32>
  %b.sext = sext <16 x i8> %b to <16 x i32>
  %mul = mul <16 x i32> %a.sext, %b.sext
  %C = icmp slt <16 x i8> %a, splat (i8 -128)
  %res = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %mul)
  store <16 x i1> %C, ptr @G.4, align 2
  ret i32 %res
}

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

define i32 @vdot4a_vv_accum(<16 x i8> %a, <16 x i8> %b, <16 x i32> %x) {
entry:
  %a.sext = sext <16 x i8> %a to <16 x i32>
  %C = icmp sge <16 x i8> %a, %b
  %b.sext = sext <16 x i8> %b to <16 x i32>
  %mul = mul <16 x i32> %a.sext, %b.sext
  %add = add <16 x i32> %mul, %x
  %sum = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %add)
  store <16 x i1> %C, ptr poison, align 2
  ret i32 %sum
}

declare i32 @vdot4au_vv_accum(<16 x i8>, <16 x i8>, <16 x i32>)

declare i32 @vdot4asu_vv_accum(<16 x i8>, <16 x i8>, <16 x i32>)

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

define <2 x i32> @vdot4a_vv_partial_reduce_v2i32_v8i8(<8 x i8> %a, <8 x i8> %b) {
entry:
  %a.sext = sext <8 x i8> %a to <8 x i32>
  %C = icmp sle <8 x i32> %a.sext, %a.sext
  %b.sext = sext <8 x i8> %b to <8 x i32>
  %mul = mul <8 x i32> %a.sext, %b.sext
  %res = call <2 x i32> @llvm.vector.partial.reduce.add.v2i32.v8i32(<2 x i32> zeroinitializer, <8 x i32> %mul)
  store <8 x i1> %C, ptr @G.5, align 1
  ret <2 x i32> %res
}

declare <2 x i32> @vdot4a_vv_partial_reduce_v2i32_v64i8(<64 x i8>, <64 x i8>)

define <4 x i32> @vdot4a_vv_partial_reduce_v4i32_v16i8(<16 x i8> %a, <16 x i8> %b) {
entry:
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i16, ptr @G, align 2
  %a.sext = sext <16 x i8> %a to <16 x i32>
  %b.sext = sext <16 x i8> %b to <16 x i32>
  %mul = mul <16 x i32> %a.sext, %b.sext
  switch i16 %LGV, label %SW_D [
    i16 -8019, label %SW_C
    i16 -18051, label %SW_C1
    i16 -23896, label %SW_C2
    i16 9506, label %SW_C3
    i16 -4533, label %SW_C4
    i16 30183, label %SW_C5
  ]

BB:                                               ; preds = %SW_C5, %SW_C4, %SW_C1, %SW_D
  %res = call <4 x i32> @llvm.vector.partial.reduce.add.v4i32.v16i32(<4 x i32> zeroinitializer, <16 x i32> %mul)
  ret <4 x i32> %res

SW_D:                                             ; preds = %entry
  br label %BB

SW_C:                                             ; preds = %entry
  %LGV6 = load <4 x i32>, ptr @G.1, align 16
  ret <4 x i32> %LGV6

SW_C1:                                            ; preds = %SW_C1, %entry
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %SW_C1

SW_C2:                                            ; preds = %entry
  %LGV7 = load <4 x i32>, ptr @G.1, align 16
  ret <4 x i32> splat (i32 65536)

SW_C3:                                            ; preds = %entry
  %LGV8 = load <4 x i32>, ptr @G.2, align 16
  ret <4 x i32> %LGV8

SW_C4:                                            ; preds = %entry
  br label %BB

SW_C5:                                            ; preds = %SW_C5, %entry
  %LGV9 = load i1, ptr @G.3, align 1
  br i1 %LGV9, label %SW_C5, label %BB
}

declare <16 x i32> @vdot4a_vv_partial_reduce_v16i32_v64i8(<64 x i8>, <64 x i8>)

declare <4 x i32> @vdot4a_vv_partial_reduce_m1_accum(<16 x i8>, <16 x i8>, <4 x i32>)

declare <16 x i32> @vdot4a_vv_partial_reduce3(<16 x i8>, <16 x i8>)

declare <64 x i32> @vdot4asu_vv_partial_v64i32_v256i8(<256 x i8>, <256 x i8>)

define <4 x i31> @vdot4asu_vv_partial_v4i31_v16i7(<16 x i7> %a, <16 x i7> %b) {
entry:
  %b.ext = zext <16 x i7> %b to <16 x i31>
  %a.ext = sext <16 x i7> %a to <16 x i31>
  %mul = mul <16 x i31> %b.ext, %a.ext
  %res = call <4 x i31> @llvm.vector.partial.reduce.add.v4i31.v16i31(<4 x i31> zeroinitializer, <16 x i31> %mul)
  ret <4 x i31> %res
}

declare <1 x i32> @vdot4asu_vv_partial_v1i32_v2i8(<2 x i8>, <2 x i8>)

define <1 x i32> @vdot4asu_vv_partial_v1i32_v8i8(<8 x i8> %a, <8 x i8> %b) {
entry:
  %LGV = load <4 x float>, ptr @G.6, align 16
  %a.ext = sext <8 x i8> %a to <8 x i32>
  %B = fadd <4 x float> %LGV, zeroinitializer
  %b.ext = zext <8 x i8> %b to <8 x i32>
  %mul = mul <8 x i32> %b.ext, %a.ext
  %res = call <1 x i32> @llvm.vector.partial.reduce.add.v1i32.v8i32(<1 x i32> zeroinitializer, <8 x i32> %mul)
  store <4 x float> %B, ptr poison, align 16
  ret <1 x i32> %res
}

declare <4 x i32> @partial_of_sext(<16 x i8>)

define <4 x i32> @partial_of_zext(<16 x i8> %a) {
entry:
  %a.ext = zext <16 x i8> %a to <16 x i32>
  %res = call <4 x i32> @llvm.vector.partial.reduce.add.v4i32.v16i32(<4 x i32> zeroinitializer, <16 x i32> %a.ext)
  %C = icmp slt <16 x i32> %a.ext, splat (i32 -2147483648)
  store <16 x i1> %C, ptr @G.4, align 2
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

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <256 x i1> splat (i1 true)
@G.1 = global i1 false

declare zeroext i1 @vpreduce_and_v1i1(i1 zeroext, <1 x i1>, <1 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_or_v1i1(i1 zeroext, <1 x i1>, <1 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_xor_v1i1(i1 zeroext, <1 x i1>, <1 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_and_v2i1(i1 zeroext, <2 x i1>, <2 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_or_v2i1(i1 zeroext, <2 x i1>, <2 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_xor_v2i1(i1 zeroext, <2 x i1>, <2 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_and_v4i1(i1 zeroext, <4 x i1>, <4 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_or_v4i1(i1 zeroext, <4 x i1>, <4 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_xor_v4i1(i1 zeroext, <4 x i1>, <4 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_and_v8i1(i1 zeroext, <8 x i1>, <8 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_or_v8i1(i1 zeroext, <8 x i1>, <8 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_xor_v8i1(i1 zeroext, <8 x i1>, <8 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_and_v10i1(i1 zeroext, <10 x i1>, <10 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_and_v16i1(i1 zeroext, <16 x i1>, <16 x i1>, i32 zeroext)

define zeroext i1 @vpreduce_and_v256i1(i1 zeroext %s, <256 x i1> %v, <256 x i1> %m, i32 zeroext %evl) {
  %r = call i1 @llvm.vp.reduce.and.v256i1(i1 %s, <256 x i1> %v, <256 x i1> %m, i32 %evl)
  %I = insertelement <256 x i1> %m, i1 %r, i1 %r
  store <256 x i1> %I, ptr @G, align 32
  ret i1 %r
}

declare zeroext i1 @vpreduce_or_v16i1(i1 zeroext, <16 x i1>, <16 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_xor_v16i1(i1 zeroext, <16 x i1>, <16 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_add_v1i1(i1 zeroext, <1 x i1>, <1 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_add_v2i1(i1 zeroext, <2 x i1>, <2 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_add_v4i1(i1 zeroext, <4 x i1>, <4 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_add_v8i1(i1 zeroext, <8 x i1>, <8 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_add_v16i1(i1 zeroext, <16 x i1>, <16 x i1>, i32 zeroext)

define zeroext i1 @vpreduce_smax_v1i1(i1 zeroext %s, <1 x i1> %v, <1 x i1> %m, i32 zeroext %evl) {
  %r = call i1 @llvm.vp.reduce.smax.v1i1(i1 %s, <1 x i1> %v, <1 x i1> %m, i32 %evl)
  %B = udiv i1 %r, %r
  store i1 %B, ptr @G.1, align 1
  ret i1 %r
}

declare zeroext i1 @vpreduce_smax_v2i1(i1 zeroext, <2 x i1>, <2 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_smax_v4i1(i1 zeroext, <4 x i1>, <4 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_smax_v8i1(i1 zeroext, <8 x i1>, <8 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_smax_v16i1(i1 zeroext, <16 x i1>, <16 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_smax_v32i1(i1 zeroext, <32 x i1>, <32 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_smax_v64i1(i1 zeroext, <64 x i1>, <64 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_smin_v1i1(i1 zeroext, <1 x i1>, <1 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_smin_v2i1(i1 zeroext, <2 x i1>, <2 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_smin_v4i1(i1 zeroext, <4 x i1>, <4 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_smin_v8i1(i1 zeroext, <8 x i1>, <8 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_smin_v16i1(i1 zeroext, <16 x i1>, <16 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_smin_v32i1(i1 zeroext, <32 x i1>, <32 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_smin_v64i1(i1 zeroext, <64 x i1>, <64 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umax_v1i1(i1 zeroext, <1 x i1>, <1 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umax_v2i1(i1 zeroext, <2 x i1>, <2 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umax_v4i1(i1 zeroext, <4 x i1>, <4 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umax_v8i1(i1 zeroext, <8 x i1>, <8 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umax_v16i1(i1 zeroext, <16 x i1>, <16 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umax_v32i1(i1 zeroext, <32 x i1>, <32 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umax_v64i1(i1 zeroext, <64 x i1>, <64 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umin_v1i1(i1 zeroext, <1 x i1>, <1 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umin_v2i1(i1 zeroext, <2 x i1>, <2 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umin_v4i1(i1 zeroext, <4 x i1>, <4 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umin_v8i1(i1 zeroext, <8 x i1>, <8 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umin_v16i1(i1 zeroext, <16 x i1>, <16 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umin_v32i1(i1 zeroext, <32 x i1>, <32 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_umin_v64i1(i1 zeroext, <64 x i1>, <64 x i1>, i32 zeroext)

declare i1 @vpreduce_mul_v1i1(i1, <1 x i1>, <1 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_mul_v2i1(i1 zeroext, <2 x i1>, <2 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_mul_v4i1(i1 zeroext, <4 x i1>, <4 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_mul_v8i1(i1 zeroext, <8 x i1>, <8 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_mul_v16i1(i1 zeroext, <16 x i1>, <16 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_mul_v32i1(i1 zeroext, <32 x i1>, <32 x i1>, i32 zeroext)

declare zeroext i1 @vpreduce_mul_v64i1(i1 zeroext, <64 x i1>, <64 x i1>, i32 zeroext)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.add.v16i1(i1, <16 x i1>, <16 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.add.v1i1(i1, <1 x i1>, <1 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.add.v2i1(i1, <2 x i1>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.add.v4i1(i1, <4 x i1>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.add.v8i1(i1, <8 x i1>, <8 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.and.v10i1(i1, <10 x i1>, <10 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.and.v16i1(i1, <16 x i1>, <16 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.and.v1i1(i1, <1 x i1>, <1 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.and.v256i1(i1, <256 x i1>, <256 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.and.v2i1(i1, <2 x i1>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.and.v4i1(i1, <4 x i1>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.and.v8i1(i1, <8 x i1>, <8 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.mul.v16i1(i1, <16 x i1>, <16 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.mul.v1i1(i1, <1 x i1>, <1 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.mul.v2i1(i1, <2 x i1>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.mul.v32i1(i1, <32 x i1>, <32 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.mul.v4i1(i1, <4 x i1>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.mul.v64i1(i1, <64 x i1>, <64 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.mul.v8i1(i1, <8 x i1>, <8 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.or.v16i1(i1, <16 x i1>, <16 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.or.v1i1(i1, <1 x i1>, <1 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.or.v2i1(i1, <2 x i1>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.or.v4i1(i1, <4 x i1>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.or.v8i1(i1, <8 x i1>, <8 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smax.v16i1(i1, <16 x i1>, <16 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smax.v1i1(i1, <1 x i1>, <1 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smax.v2i1(i1, <2 x i1>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smax.v32i1(i1, <32 x i1>, <32 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smax.v4i1(i1, <4 x i1>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smax.v64i1(i1, <64 x i1>, <64 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smax.v8i1(i1, <8 x i1>, <8 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smin.v16i1(i1, <16 x i1>, <16 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smin.v1i1(i1, <1 x i1>, <1 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smin.v2i1(i1, <2 x i1>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smin.v32i1(i1, <32 x i1>, <32 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smin.v4i1(i1, <4 x i1>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smin.v64i1(i1, <64 x i1>, <64 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.smin.v8i1(i1, <8 x i1>, <8 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umax.v16i1(i1, <16 x i1>, <16 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umax.v1i1(i1, <1 x i1>, <1 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umax.v2i1(i1, <2 x i1>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umax.v32i1(i1, <32 x i1>, <32 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umax.v4i1(i1, <4 x i1>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umax.v64i1(i1, <64 x i1>, <64 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umax.v8i1(i1, <8 x i1>, <8 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umin.v16i1(i1, <16 x i1>, <16 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umin.v1i1(i1, <1 x i1>, <1 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umin.v2i1(i1, <2 x i1>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umin.v32i1(i1, <32 x i1>, <32 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umin.v4i1(i1, <4 x i1>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umin.v64i1(i1, <64 x i1>, <64 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.umin.v8i1(i1, <8 x i1>, <8 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.xor.v16i1(i1, <16 x i1>, <16 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.xor.v1i1(i1, <1 x i1>, <1 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.xor.v2i1(i1, <2 x i1>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.xor.v4i1(i1, <4 x i1>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vp.reduce.xor.v8i1(i1, <8 x i1>, <8 x i1>, i32) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

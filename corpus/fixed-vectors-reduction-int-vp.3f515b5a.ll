; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 4294967296
@G.1 = global <8 x i8> zeroinitializer
@G.2 = global i32 0
@G.3 = global i32 -1

declare signext i8 @vpreduce_add_v2i8(i8 signext, <2 x i8>, <2 x i1>, i32 zeroext)

declare signext i8 @vpreduce_umax_v2i8(i8 signext, <2 x i8>, <2 x i1>, i32 zeroext)

declare signext i8 @vpreduce_smax_v2i8(i8 signext, <2 x i8>, <2 x i1>, i32 zeroext)

declare signext i8 @vpreduce_umin_v2i8(i8 signext, <2 x i8>, <2 x i1>, i32 zeroext)

declare signext i8 @vpreduce_smin_v2i8(i8 signext, <2 x i8>, <2 x i1>, i32 zeroext)

declare signext i8 @vpreduce_and_v2i8(i8 signext, <2 x i8>, <2 x i1>, i32 zeroext)

declare signext i8 @vpreduce_or_v2i8(i8 signext, <2 x i8>, <2 x i1>, i32 zeroext)

declare signext i8 @vpreduce_xor_v2i8(i8 signext, <2 x i8>, <2 x i1>, i32 zeroext)

declare signext i8 @vpreduce_umin_v3i8(i8 signext, <3 x i8>, <3 x i1>, i32 zeroext)

define signext i8 @vpreduce_add_v4i8(i8 signext %s, <4 x i8> %v, <4 x i1> %m, i32 zeroext %evl) {
  %LGV1 = load i32, ptr @G.2, align 4
  %LGV = load i64, ptr @G, align 4
  %B = add i64 42, %LGV
  %r = call i8 @llvm.vp.reduce.add.v4i8(i8 %s, <4 x i8> %v, <4 x i1> %m, i32 %evl)
  %B2 = shl i32 %evl, %LGV1
  store i64 %B, ptr poison, align 4
  store i32 %B2, ptr @G.3, align 4
  ret i8 %r
}

declare signext i8 @vpreduce_umax_v4i8(i8 signext, <4 x i8>, <4 x i1>, i32 zeroext)

declare signext i8 @vpreduce_smax_v4i8(i8 signext, <4 x i8>, <4 x i1>, i32 zeroext)

declare signext i8 @vpreduce_umin_v4i8(i8 signext, <4 x i8>, <4 x i1>, i32 zeroext)

declare signext i8 @vpreduce_smin_v4i8(i8 signext, <4 x i8>, <4 x i1>, i32 zeroext)

declare signext i8 @vpreduce_and_v4i8(i8 signext, <4 x i8>, <4 x i1>, i32 zeroext)

declare signext i8 @vpreduce_or_v4i8(i8 signext, <4 x i8>, <4 x i1>, i32 zeroext)

declare signext i8 @vpreduce_xor_v4i8(i8 signext, <4 x i8>, <4 x i1>, i32 zeroext)

define signext i16 @vpreduce_add_v2i16(i16 signext %s, <2 x i16> %v, <2 x i1> %m, i32 zeroext %evl) {
  br label %BB

BB:                                               ; preds = %0
  %r = call i16 @llvm.vp.reduce.add.v2i16(i16 %s, <2 x i16> %v, <2 x i1> %m, i32 %evl)
  ret i16 %r
}

declare signext i16 @vpreduce_umax_v2i16(i16 signext, <2 x i16>, <2 x i1>, i32 zeroext)

declare signext i16 @vpreduce_smax_v2i16(i16 signext, <2 x i16>, <2 x i1>, i32 zeroext)

declare signext i16 @vpreduce_umin_v2i16(i16 signext, <2 x i16>, <2 x i1>, i32 zeroext)

declare signext i16 @vpreduce_smin_v2i16(i16 signext, <2 x i16>, <2 x i1>, i32 zeroext)

declare signext i16 @vpreduce_and_v2i16(i16 signext, <2 x i16>, <2 x i1>, i32 zeroext)

declare signext i16 @vpreduce_or_v2i16(i16 signext, <2 x i16>, <2 x i1>, i32 zeroext)

declare signext i16 @vpreduce_xor_v2i16(i16 signext, <2 x i16>, <2 x i1>, i32 zeroext)

declare signext i16 @vpreduce_add_v4i16(i16 signext, <4 x i16>, <4 x i1>, i32 zeroext)

declare signext i16 @vpreduce_umax_v4i16(i16 signext, <4 x i16>, <4 x i1>, i32 zeroext)

declare signext i16 @vpreduce_smax_v4i16(i16 signext, <4 x i16>, <4 x i1>, i32 zeroext)

declare signext i16 @vpreduce_umin_v4i16(i16 signext, <4 x i16>, <4 x i1>, i32 zeroext)

declare signext i16 @vpreduce_smin_v4i16(i16 signext, <4 x i16>, <4 x i1>, i32 zeroext)

declare signext i16 @vpreduce_and_v4i16(i16 signext, <4 x i16>, <4 x i1>, i32 zeroext)

declare signext i16 @vpreduce_or_v4i16(i16 signext, <4 x i16>, <4 x i1>, i32 zeroext)

declare signext i16 @vpreduce_xor_v4i16(i16 signext, <4 x i16>, <4 x i1>, i32 zeroext)

declare signext i32 @vpreduce_add_v2i32(i32 signext, <2 x i32>, <2 x i1>, i32 zeroext)

declare signext i32 @vpreduce_umax_v2i32(i32 signext, <2 x i32>, <2 x i1>, i32 zeroext)

declare signext i32 @vpreduce_smax_v2i32(i32 signext, <2 x i32>, <2 x i1>, i32 zeroext)

declare signext i32 @vpreduce_umin_v2i32(i32 signext, <2 x i32>, <2 x i1>, i32 zeroext)

declare signext i32 @vpreduce_smin_v2i32(i32 signext, <2 x i32>, <2 x i1>, i32 zeroext)

define signext i32 @vpreduce_and_v2i32(i32 signext %s, <2 x i32> %v, <2 x i1> %m, i32 zeroext %evl) {
  %C = icmp sle i32 %s, %s
  %r = call i32 @llvm.vp.reduce.and.v2i32(i32 %s, <2 x i32> %v, <2 x i1> %m, i32 %evl)
  store i1 %C, ptr poison, align 1
  ret i32 %r
}

declare signext i32 @vpreduce_or_v2i32(i32 signext, <2 x i32>, <2 x i1>, i32 zeroext)

declare signext i32 @vpreduce_xor_v2i32(i32 signext, <2 x i32>, <2 x i1>, i32 zeroext)

declare signext i32 @vpreduce_add_v4i32(i32 signext, <4 x i32>, <4 x i1>, i32 zeroext)

declare signext i32 @vpreduce_umax_v4i32(i32 signext, <4 x i32>, <4 x i1>, i32 zeroext)

declare signext i32 @vpreduce_smax_v4i32(i32 signext, <4 x i32>, <4 x i1>, i32 zeroext)

declare signext i32 @vpreduce_umin_v4i32(i32 signext, <4 x i32>, <4 x i1>, i32 zeroext)

declare signext i32 @vpreduce_smin_v4i32(i32 signext, <4 x i32>, <4 x i1>, i32 zeroext)

declare signext i32 @vpreduce_and_v4i32(i32 signext, <4 x i32>, <4 x i1>, i32 zeroext)

declare signext i32 @vpreduce_or_v4i32(i32 signext, <4 x i32>, <4 x i1>, i32 zeroext)

declare signext i32 @vpreduce_xor_v4i32(i32 signext, <4 x i32>, <4 x i1>, i32 zeroext)

declare signext i32 @vpreduce_xor_v64i32(i32 signext, <64 x i32>, <64 x i1>, i32 zeroext)

declare signext i64 @vpreduce_add_v2i64(i64 signext, <2 x i64>, <2 x i1>, i32 zeroext)

declare signext i64 @vpreduce_umax_v2i64(i64 signext, <2 x i64>, <2 x i1>, i32 zeroext)

declare signext i64 @vpreduce_smax_v2i64(i64 signext, <2 x i64>, <2 x i1>, i32 zeroext)

declare signext i64 @vpreduce_umin_v2i64(i64 signext, <2 x i64>, <2 x i1>, i32 zeroext)

declare signext i64 @vpreduce_smin_v2i64(i64 signext, <2 x i64>, <2 x i1>, i32 zeroext)

declare signext i64 @vpreduce_and_v2i64(i64 signext, <2 x i64>, <2 x i1>, i32 zeroext)

declare signext i64 @vpreduce_or_v2i64(i64 signext, <2 x i64>, <2 x i1>, i32 zeroext)

declare signext i64 @vpreduce_xor_v2i64(i64 signext, <2 x i64>, <2 x i1>, i32 zeroext)

declare signext i64 @vpreduce_add_v4i64(i64 signext, <4 x i64>, <4 x i1>, i32 zeroext)

define signext i64 @vpreduce_umax_v4i64(i64 signext %s, <4 x i64> %v, <4 x i1> %m, i32 zeroext %evl) {
  %LGV = load <8 x i8>, ptr @G.1, align 8
  %B = xor <8 x i8> splat (i8 127), %LGV
  %r = call i64 @llvm.vp.reduce.umax.v4i64(i64 %s, <4 x i64> %v, <4 x i1> %m, i32 %evl)
  store <8 x i8> %B, ptr poison, align 8
  ret i64 %r
}

declare signext i64 @vpreduce_smax_v4i64(i64 signext, <4 x i64>, <4 x i1>, i32 zeroext)

declare signext i64 @vpreduce_umin_v4i64(i64 signext, <4 x i64>, <4 x i1>, i32 zeroext)

declare signext i64 @vpreduce_smin_v4i64(i64 signext, <4 x i64>, <4 x i1>, i32 zeroext)

declare signext i64 @vpreduce_and_v4i64(i64 signext, <4 x i64>, <4 x i1>, i32 zeroext)

declare signext i64 @vpreduce_or_v4i64(i64 signext, <4 x i64>, <4 x i1>, i32 zeroext)

declare signext i64 @vpreduce_xor_v4i64(i64 signext, <4 x i64>, <4 x i1>, i32 zeroext)

declare i8 @vpreduce_mul_v1i8(i8, <1 x i8>, <1 x i1>, i32 zeroext)

declare signext i8 @vpreduce_mul_v2i8(i8 signext, <2 x i8>, <2 x i1>, i32 zeroext)

declare signext i8 @vpreduce_mul_v4i8(i8 signext, <4 x i8>, <4 x i1>, i32 zeroext)

declare signext i8 @vpreduce_mul_v8i8(i8 signext, <8 x i8>, <8 x i1>, i32 zeroext)

declare signext i8 @vpreduce_mul_v16i8(i8 signext, <16 x i8>, <16 x i1>, i32 zeroext)

declare signext i8 @vpreduce_mul_v32i8(i8 signext, <32 x i8>, <32 x i1>, i32 zeroext)

declare signext i8 @vpreduce_mul_v64i8(i8 signext, <64 x i8>, <64 x i1>, i32 zeroext)

declare zeroext i8 @front_ele_v4i8(<4 x i8>, <4 x i1>, i32 zeroext)

declare zeroext i8 @front_ele_v32i8(<32 x i8>, <32 x i1>, i32 zeroext)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.add.v2i16(i16, <2 x i16>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.add.v2i32(i32, <2 x i32>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.add.v2i64(i64, <2 x i64>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.add.v2i8(i8, <2 x i8>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.add.v4i16(i16, <4 x i16>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.add.v4i32(i32, <4 x i32>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.add.v4i64(i64, <4 x i64>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.add.v4i8(i8, <4 x i8>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.and.v2i16(i16, <2 x i16>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.and.v2i32(i32, <2 x i32>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.and.v2i64(i64, <2 x i64>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.and.v2i8(i8, <2 x i8>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.and.v32i8(i8, <32 x i8>, <32 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.and.v4i16(i16, <4 x i16>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.and.v4i32(i32, <4 x i32>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.and.v4i64(i64, <4 x i64>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.and.v4i8(i8, <4 x i8>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.mul.v16i8(i8, <16 x i8>, <16 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.mul.v1i8(i8, <1 x i8>, <1 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.mul.v2i8(i8, <2 x i8>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.mul.v32i8(i8, <32 x i8>, <32 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.mul.v4i8(i8, <4 x i8>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.mul.v64i8(i8, <64 x i8>, <64 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.mul.v8i8(i8, <8 x i8>, <8 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.or.v2i16(i16, <2 x i16>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.or.v2i32(i32, <2 x i32>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.or.v2i64(i64, <2 x i64>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.or.v2i8(i8, <2 x i8>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.or.v4i16(i16, <4 x i16>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.or.v4i32(i32, <4 x i32>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.or.v4i64(i64, <4 x i64>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.or.v4i8(i8, <4 x i8>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.smax.v2i16(i16, <2 x i16>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.smax.v2i32(i32, <2 x i32>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.smax.v2i64(i64, <2 x i64>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.smax.v2i8(i8, <2 x i8>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.smax.v4i16(i16, <4 x i16>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.smax.v4i32(i32, <4 x i32>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.smax.v4i64(i64, <4 x i64>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.smax.v4i8(i8, <4 x i8>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.smin.v2i16(i16, <2 x i16>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.smin.v2i32(i32, <2 x i32>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.smin.v2i64(i64, <2 x i64>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.smin.v2i8(i8, <2 x i8>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.smin.v4i16(i16, <4 x i16>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.smin.v4i32(i32, <4 x i32>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.smin.v4i64(i64, <4 x i64>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.smin.v4i8(i8, <4 x i8>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.umax.v2i16(i16, <2 x i16>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.umax.v2i32(i32, <2 x i32>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.umax.v2i64(i64, <2 x i64>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.umax.v2i8(i8, <2 x i8>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.umax.v4i16(i16, <4 x i16>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.umax.v4i32(i32, <4 x i32>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.umax.v4i64(i64, <4 x i64>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.umax.v4i8(i8, <4 x i8>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.umin.v2i16(i16, <2 x i16>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.umin.v2i32(i32, <2 x i32>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.umin.v2i64(i64, <2 x i64>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.umin.v2i8(i8, <2 x i8>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.umin.v3i8(i8, <3 x i8>, <3 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.umin.v4i16(i16, <4 x i16>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.umin.v4i32(i32, <4 x i32>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.umin.v4i64(i64, <4 x i64>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.umin.v4i8(i8, <4 x i8>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.xor.v2i16(i16, <2 x i16>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.xor.v2i32(i32, <2 x i32>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.xor.v2i64(i64, <2 x i64>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.xor.v2i8(i8, <2 x i8>, <2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vp.reduce.xor.v4i16(i16, <4 x i16>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.xor.v4i32(i32, <4 x i32>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vp.reduce.xor.v4i64(i64, <4 x i64>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vp.reduce.xor.v4i8(i8, <4 x i8>, <4 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vp.reduce.xor.v64i32(i32, <64 x i32>, <64 x i1>, i32) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

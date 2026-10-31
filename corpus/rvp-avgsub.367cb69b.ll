; isel-diff-config: -mtriple=riscv64 -mattr=+experimental-p,+zbs,+zhinx -O3 -code-model=medium -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i32 1
@G.2 = global i1 false

declare <8 x i8> @sub_nsw_ashr_v8i8(<8 x i8>, <8 x i8>)

define <8 x i8> @sub_nuw_lshr_v8i8(<8 x i8> %a, <8 x i8> %b) {
  %d = sub nuw <8 x i8> %a, %b
  %B = urem <8 x i8> %d, splat (i8 16)
  %r = lshr <8 x i8> %d, %B
  ret <8 x i8> %r
}

define <4 x i16> @sub_nsw_ashr_v4i16(<4 x i16> %a, <4 x i16> %b) {
  %A = alloca <4 x i16>, align 8
  store <4 x i16> poison, ptr %A, align 8
  %d = sub nsw <4 x i16> %a, %b
  %B = sub <4 x i16> %a, %a
  %r = ashr <4 x i16> %d, splat (i16 1)
  store <4 x i16> %B, ptr %A, align 8
  ret <4 x i16> %r
}

declare <4 x i16> @sub_nuw_lshr_v4i16(<4 x i16>, <4 x i16>)

declare <2 x i32> @sub_nsw_ashr_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @sub_nuw_lshr_v2i32(<2 x i32>, <2 x i32>)

declare <4 x i8> @sub_nsw_ashr_v4i8(<4 x i8>, <4 x i8>)

define <2 x i16> @sub_nuw_lshr_v2i16(<2 x i16> %a, <2 x i16> %b) {
  %LGV = load i1, ptr @G.2, align 1
  %B = shl i1 %LGV, false
  %d = sub nuw <2 x i16> %a, %b
  %r = lshr <2 x i16> %d, splat (i16 1)
  store i1 %B, ptr poison, align 1
  ret <2 x i16> %r
}

declare i32 @sub_nsw_ashr_i32(i32, i32)

declare i32 @sub_nuw_lshr_i32(i32, i32)

define <8 x i8> @sub_ashr_v8i8_noflags(<8 x i8> %a, <8 x i8> %b) {
  %C = fcmp false half +qnan, 5.960460e-08
  %d = sub <8 x i8> %a, %b
  %r = ashr <8 x i8> %d, splat (i8 1)
  store i1 %C, ptr @G, align 1
  ret <8 x i8> %r
}

declare <8 x i8> @sub_lshr_v8i8_noflags(<8 x i8>, <8 x i8>)

define <8 x i8> @sub_nsw_ashr2_v8i8(<8 x i8> %a, <8 x i8> %b) {
  %d = sub nsw <8 x i8> %b, %a
  %r = ashr <8 x i8> %d, splat (i8 2)
  ret <8 x i8> %r
}

declare <8 x i8> @sub_nsw_lshr_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @sub_nsw_ashr_v8i8_swapped(<8 x i8>, <8 x i8>)

declare <4 x i16> @wide_sext_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @wide_zext_v4i16(<4 x i16>, <4 x i16>)

declare <8 x i8> @self_v8i8(<8 x i8>)

define <8 x i8> @zero_s_v8i8(<8 x i8> %a) {
  %r = call <8 x i8> @llvm.riscv.pasub.v8i8(<8 x i8> %a, <8 x i8> zeroinitializer)
  %B = or i32 0, -2147483648
  store i32 %B, ptr @G.1, align 4
  ret <8 x i8> %r
}

declare <8 x i8> @zero_u_v8i8(<8 x i8>)

declare i32 @fold_s_i32()

declare i32 @fold_s_i32_neg()

declare i32 @fold_s_i32_odd()

declare i32 @fold_u_i32()

declare i32 @fold_u_i32_max()

declare <8 x i8> @fold_s_v8i8()

declare <8 x i8> @fold_u_v8i8()

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.asub.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.asubu.u32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.pasub.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.pasubu.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

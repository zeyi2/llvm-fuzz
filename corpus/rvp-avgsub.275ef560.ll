; isel-diff-config: -mtriple=riscv64 -mattr=+experimental-p,+zdinx -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i1> zeroinitializer
@G.1 = global <8 x i1> splat (i1 true)
@G.2 = global <8 x i8> zeroinitializer
@G.3 = global i32 42
@G.4 = global i32 1
@G.5 = global <4 x float> zeroinitializer
@G.6 = global <4 x float> splat (float 1.000000e+00)

declare <8 x i8> @sub_nsw_ashr_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @sub_nuw_lshr_v8i8(<8 x i8>, <8 x i8>)

declare <4 x i16> @sub_nsw_ashr_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @sub_nuw_lshr_v4i16(<4 x i16>, <4 x i16>)

declare <2 x i32> @sub_nsw_ashr_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @sub_nuw_lshr_v2i32(<2 x i32>, <2 x i32>)

declare <4 x i8> @sub_nsw_ashr_v4i8(<4 x i8>, <4 x i8>)

declare <2 x i16> @sub_nuw_lshr_v2i16(<2 x i16>, <2 x i16>)

define i32 @sub_nsw_ashr_i32(i32 %a, i32 %b) {
  %d = sub nsw i32 %a, %b
  %r = ashr i32 %d, 1
  store i32 %d, ptr @G.4, align 4
  ret i32 %r
}

declare i32 @sub_nuw_lshr_i32(i32, i32)

define <8 x i8> @sub_ashr_v8i8_noflags(<8 x i8> %a, <8 x i8> %b) {
  %d = sub <8 x i8> %a, %b
  %B = sdiv <8 x i8> %b, splat (i8 -1)
  %r = ashr <8 x i8> %d, splat (i8 1)
  store <8 x i8> %B, ptr @G.2, align 8
  ret <8 x i8> %r
}

declare <8 x i8> @sub_lshr_v8i8_noflags(<8 x i8>, <8 x i8>)

declare <8 x i8> @sub_nsw_ashr2_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @sub_nsw_lshr_v8i8(<8 x i8>, <8 x i8>)

declare <8 x i8> @sub_nsw_ashr_v8i8_swapped(<8 x i8>, <8 x i8>)

define <4 x i16> @wide_sext_v4i16(<4 x i16> %a, <4 x i16> %b) {
  %x = sext <4 x i16> %a to <4 x i32>
  %y = sext <4 x i16> %b to <4 x i32>
  %d = sub <4 x i32> %x, %y
  %s = ashr <4 x i32> %d, splat (i32 1)
  %C = icmp ne <4 x i32> %s, splat (i32 -2147483648)
  %r = trunc <4 x i32> %s to <4 x i16>
  store <4 x i1> %C, ptr @G, align 1
  ret <4 x i16> %r
}

declare <4 x i16> @wide_zext_v4i16(<4 x i16>, <4 x i16>)

declare <8 x i8> @self_v8i8(<8 x i8>)

declare <8 x i8> @zero_s_v8i8(<8 x i8>)

declare <8 x i8> @zero_u_v8i8(<8 x i8>)

define i32 @fold_s_i32() {
  %r = call i32 @llvm.riscv.asub.i32(i32 2147483647, i32 -2147483648)
  %B = sub i32 %r, -2147483648
  store i32 %B, ptr @G.3, align 4
  ret i32 %r
}

declare i32 @fold_s_i32_neg()

declare i32 @fold_s_i32_odd()

define i32 @fold_u_i32() {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV1 = load <4 x float>, ptr @G.6, align 16
  %LGV = load <4 x float>, ptr @G.5, align 16
  %r = call i32 @llvm.riscv.asubu.u32(i32 0, i32 -1)
  %C = fcmp uno <4 x float> %LGV, %LGV1
  store <4 x i1> %C, ptr %A, align 1
  ret i32 %r
}

declare i32 @fold_u_i32_max()

declare <8 x i8> @fold_s_v8i8()

define <8 x i8> @fold_u_v8i8() {
  %r = call <8 x i8> @llvm.riscv.pasubu.v8i8(<8 x i8> <i8 0, i8 -1, i8 5, i8 -56, i8 0, i8 1, i8 -1, i8 100>, <8 x i8> <i8 -1, i8 0, i8 3, i8 100, i8 0, i8 -1, i8 1, i8 -100>)
  %C = icmp uge <8 x i8> %r, %r
  store <8 x i1> %C, ptr @G.1, align 1
  ret <8 x i8> %r
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.asub.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.asubu.u32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.pasub.v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.riscv.pasubu.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

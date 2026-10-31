; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+experimental-p,+zhinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i1> splat (i1 true)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pwsll.v4i16.v4i8(<4 x i8>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pwsll.v2i32.v2i16(<2 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.riscv.pwsla.v4i16.v4i8(<4 x i8>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pwsla.v2i32.v2i16(<2 x i16>, i32) #0

declare <4 x i16> @pwsll_v4i8(<4 x i8>, i16)

declare <2 x i32> @pwsll_v2i16(<2 x i16>, i32)

declare <4 x i16> @pwsla_v4i8(<4 x i8>, i16)

define <2 x i32> @pwsla_v2i16(<2 x i16> %x, i32 %shamt) {
  %res = call <2 x i32> @llvm.riscv.pwsla.v2i32.v2i16(<2 x i16> %x, i32 %shamt)
  %C = icmp ne <2 x i32> %res, %res
  store <2 x i1> %C, ptr @G, align 1
  ret <2 x i32> %res
}

declare <4 x i16> @pwslli_v4i8(<4 x i8>)

declare <2 x i32> @pwslli_v2i16(<2 x i16>)

declare <4 x i16> @pwslai_v4i8(<4 x i8>)

declare <2 x i32> @pwslai_v2i16(<2 x i16>)

declare <4 x i16> @pwslli_v4i8_31(<4 x i8>)

declare <4 x i16> @pwslai_v4i8_16(<4 x i8>)

declare <2 x i32> @pwslli_v2i16_31(<2 x i16>)

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

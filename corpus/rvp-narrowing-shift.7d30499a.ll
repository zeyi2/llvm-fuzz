; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double +inf
@G.1 = global i1 false
@G.2 = global i128 0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pnsrl.v4i8.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pnsrl.v2i16.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pnsra.v4i8.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pnsra.v2i16.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pnsrar.v4i8.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pnsrar.v2i16.v2i32(<2 x i32>, i32) #0

declare <4 x i8> @pnsrl_v4i8(<4 x i16>, i32)

declare <2 x i16> @pnsrl_v2i16(<2 x i32>, i32)

declare <4 x i8> @pnsra_v4i8(<4 x i16>, i32)

define <2 x i16> @pnsra_v2i16(<2 x i32> %x, i32 %shamt) {
  %res = call <2 x i16> @llvm.riscv.pnsra.v2i16.v2i32(<2 x i32> %x, i32 %shamt)
  %C = icmp sle i32 %shamt, %shamt
  store i1 %C, ptr poison, align 1
  ret <2 x i16> %res
}

declare <4 x i8> @pnsrar_v4i8(<4 x i16>, i32)

declare <2 x i16> @pnsrar_v2i16(<2 x i32>, i32)

declare <4 x i8> @pnsrl_v4i8_15(<4 x i16>)

declare <4 x i8> @pnsrl_v4i8_16(<4 x i16>)

define <4 x i8> @pnsrl_v4i8_32(<4 x i16> %x) {
  %res = call <4 x i8> @llvm.riscv.pnsrl.v4i8.v4i16(<4 x i16> %x, i32 32)
  %B = mul i128 0, 0
  store i128 %B, ptr @G.2, align 4
  ret <4 x i8> %res
}

declare <2 x i16> @pnsra_v2i16_31(<2 x i32>)

declare <2 x i16> @pnsra_v2i16_32(<2 x i32>)

define <4 x i8> @pnsrar_v4i8_15(<4 x i16> %x) {
  %LGV = load double, ptr @G, align 8
  %C = fcmp ole double %LGV, f0x7FEFFFFFFFFFFFFF
  %res = call <4 x i8> @llvm.riscv.pnsrar.v4i8.v4i16(<4 x i16> %x, i32 15)
  store i1 %C, ptr @G.1, align 1
  ret <4 x i8> %res
}

declare <4 x i8> @pnsrar_v4i8_16(<4 x i16>)

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

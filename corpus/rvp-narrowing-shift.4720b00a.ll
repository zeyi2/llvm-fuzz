; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+zfinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 18446744073709551616
@G.1 = global i128 18446744073709551616
@G.2 = global i1 false

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

declare <2 x i16> @pnsra_v2i16(<2 x i32>, i32)

define <4 x i8> @pnsrar_v4i8(<4 x i16> %x, i32 %shamt) {
  %res = call <4 x i8> @llvm.riscv.pnsrar.v4i8.v4i16(<4 x i16> %x, i32 %shamt)
  %B = lshr <4 x i32> zeroinitializer, splat (i32 42)
  store <4 x i32> %B, ptr poison, align 16
  ret <4 x i8> %res
}

define <2 x i16> @pnsrar_v2i16(<2 x i32> %x, i32 %shamt) {
  %LGV1 = load i128, ptr @G.1, align 4
  %LGV = load i128, ptr @G, align 4
  %C = icmp ule i128 %LGV, %LGV1
  %res = call <2 x i16> @llvm.riscv.pnsrar.v2i16.v2i32(<2 x i32> %x, i32 %shamt)
  store i1 %C, ptr @G.2, align 1
  ret <2 x i16> %res
}

declare <4 x i8> @pnsrl_v4i8_15(<4 x i16>)

declare <4 x i8> @pnsrl_v4i8_16(<4 x i16>)

declare <4 x i8> @pnsrl_v4i8_32(<4 x i16>)

declare <2 x i16> @pnsra_v2i16_31(<2 x i32>)

declare <2 x i16> @pnsra_v2i16_32(<2 x i32>)

declare <4 x i8> @pnsrar_v4i8_15(<4 x i16>)

declare <4 x i8> @pnsrar_v4i8_16(<4 x i16>)

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

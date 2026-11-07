; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i1> zeroinitializer
@G.1 = global i8 -128
@G.2 = global <8 x i8> splat (i8 1)
@G.3 = global <8 x i1> splat (i1 true)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pnclipu.v4i8.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pnclipu.v2i16.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pnclipru.v4i8.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pnclipru.v2i16.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pnclip.v4i8.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pnclip.v2i16.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pnclipr.v4i8.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pnclipr.v2i16.v2i32(<2 x i32>, i32) #0

declare <4 x i8> @pnclipu_v4i8(<4 x i16>, i32)

declare <2 x i16> @pnclipu_v2i16(<2 x i32>, i32)

declare <4 x i8> @pnclipru_v4i8(<4 x i16>, i32)

declare <2 x i16> @pnclipru_v2i16(<2 x i32>, i32)

define <4 x i8> @pnclip_v4i8(<4 x i16> %x, i32 %shamt) {
  %r = call <4 x i8> @llvm.riscv.pnclip.v4i8.v4i16(<4 x i16> %x, i32 %shamt)
  %C = icmp sle <4 x i16> %x, splat (i16 256)
  store <4 x i1> %C, ptr @G, align 1
  ret <4 x i8> %r
}

declare <2 x i16> @pnclip_v2i16(<2 x i32>, i32)

declare <4 x i8> @pnclipr_v4i8(<4 x i16>, i32)

declare <2 x i16> @pnclipr_v2i16(<2 x i32>, i32)

declare <4 x i8> @pnclipu_v4i8_15(<4 x i16>)

declare <4 x i8> @pnclipu_v4i8_16(<4 x i16>)

declare <2 x i16> @pnclipr_v2i16_31(<2 x i32>)

declare <2 x i16> @pnclipr_v2i16_32(<2 x i32>)

declare <4 x i8> @pnclipu_v4i8_0(<4 x i16>)

define <4 x i8> @pnclipu_v4i8_8(<4 x i16> %x) {
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %LGV = load i8, ptr @G.1, align 1
  %B = ashr i8 0, %LGV
  %r = call <4 x i8> @llvm.riscv.pnclipu.v4i8.v4i16(<4 x i16> %x, i32 8)
  store i8 %B, ptr %A, align 1
  ret <4 x i8> %r
}

define <4 x i8> @pnclipru_v4i8_17(<4 x i16> %x) {
  %LGV = load <8 x i8>, ptr @G.2, align 8
  %C = icmp ugt <8 x i8> zeroinitializer, %LGV
  %r = call <4 x i8> @llvm.riscv.pnclipru.v4i8.v4i16(<4 x i16> %x, i32 17)
  store <8 x i1> %C, ptr @G.3, align 1
  ret <4 x i8> %r
}

declare <2 x i16> @pnclipu_v2i16_16(<2 x i32>)

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

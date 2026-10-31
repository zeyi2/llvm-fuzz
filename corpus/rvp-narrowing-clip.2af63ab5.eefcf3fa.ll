; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+zfinx,+zvkb -O2 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i1> splat (i1 true)
@G.1 = global ptr poison
@G.2 = global half +inf
@G.3 = global i128 -170141183460469231731687303715884105728
@G.4 = global i128 1
@G.5 = global float +inf
@G.6 = global i1 false

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

declare <4 x i8> @pnclip_v4i8(<4 x i16>, i32)

declare <2 x i16> @pnclip_v2i16(<2 x i32>, i32)

define <4 x i8> @pnclipr_v4i8(<4 x i16> %x, i32 %shamt) {
  %r = call <4 x i8> @llvm.riscv.pnclipr.v4i8.v4i16(<4 x i16> %x, i32 %shamt)
  %A = alloca i1, align 1
  %A3 = alloca ptr, align 8
  %C = fcmp ole float 4.200000e+01, +qnan
  store i1 poison, ptr %A, align 1
  store ptr poison, ptr %A3, align 8
  %G = getelementptr <4 x i16>, ptr %A, i32 %shamt
  store i1 %C, ptr %A, align 1
  store ptr %G, ptr @G.1, align 8
  %LGV1 = load i128, ptr @G.3, align 4
  %B = add i128 %LGV1, %LGV1
  %G2 = getelementptr half, ptr %A, i128 %LGV1
  store ptr %G2, ptr %A3, align 8
  %G4 = getelementptr i32, ptr %G2, i32 %shamt
  store i128 %B, ptr %G4, align 4
  ret <4 x i8> %r
}

declare <2 x i16> @pnclipr_v2i16(<2 x i32>, i32)

declare <4 x i8> @pnclipu_v4i8_15(<4 x i16>)

declare <4 x i8> @pnclipu_v4i8_16(<4 x i16>)

define <2 x i16> @pnclipr_v2i16_31(<2 x i32> %x) {
  %LGV = load float, ptr @G.5, align 4
  %r = call <2 x i16> @llvm.riscv.pnclipr.v2i16.v2i32(<2 x i32> %x, i32 31)
  %C1 = fcmp une float f0x7F7FFFFF, %LGV
  %C = icmp ult <2 x i16> %r, %r
  store <2 x i1> %C, ptr @G, align 1
  store i1 %C1, ptr @G.6, align 1
  ret <2 x i16> %r
}

declare <2 x i16> @pnclipr_v2i16_32(<2 x i32>)

declare <4 x i8> @pnclipu_v4i8_0(<4 x i16>)

declare <4 x i8> @pnclipu_v4i8_8(<4 x i16>)

declare <4 x i8> @pnclipru_v4i8_17(<4 x i16>)

declare <2 x i16> @pnclipu_v2i16_16(<2 x i32>)

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

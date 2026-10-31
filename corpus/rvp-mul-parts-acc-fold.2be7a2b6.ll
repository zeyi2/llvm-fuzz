; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+m,+zbb,+zba,+zfinx -O2 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i16> splat (i16 -1)
@G.1 = global <4 x i16> splat (i16 -32768)
@G.2 = global i32 2147483647
@G.3 = global i16 1
@G.4 = global bfloat 3.389530e+38

declare i32 @macc_h00(i32, <2 x i16>, <2 x i16>)

define i32 @macc_h01(i32 %rd, <2 x i16> %a, <2 x i16> %b) {
  %LGV1 = load bfloat, ptr @G.4, align 2
  %C = fcmp ogt bfloat 1.000000e+00, %LGV1
  %m = call i32 @llvm.riscv.mul.01.i32.v2i16(<2 x i16> %a, <2 x i16> %b)
  %r = add i32 %rd, %m
  store i1 %C, ptr poison, align 1
  ret i32 %r
}

declare i32 @macc_h11(i32, <2 x i16>, <2 x i16>)

declare i32 @maccu_h00(i32, <2 x i16>, <2 x i16>)

define i32 @maccu_h01(i32 %rd, <2 x i16> %a, <2 x i16> %b) {
  %LGV = load i32, ptr @G.2, align 4
  %m = call i32 @llvm.riscv.mulu.01.i32.v2i16(<2 x i16> %a, <2 x i16> %b)
  %C = icmp sge i32 %m, %LGV
  %r = add i32 %rd, %m
  store i1 %C, ptr poison, align 1
  ret i32 %r
}

define i32 @maccu_h11(i32 %rd, <2 x i16> %a, <2 x i16> %b) {
  %LGV = load i16, ptr @G.3, align 2
  %m = call i32 @llvm.riscv.mulu.11.i32.v2i16(<2 x i16> %a, <2 x i16> %b)
  %B = sub i16 42, %LGV
  %r = add i32 %rd, %m
  store i16 %B, ptr @G.3, align 2
  ret i32 %r
}

declare i32 @maccsu_h00(i32, <2 x i16>, <2 x i16>)

declare i32 @maccsu_h11(i32, <2 x i16>, <2 x i16>)

declare i64 @macc_w00(i64, <2 x i32>, <2 x i32>)

declare i64 @macc_w01(i64, <2 x i32>, <2 x i32>)

declare i64 @macc_w11(i64, <2 x i32>, <2 x i32>)

declare i64 @maccu_w00(i64, <2 x i32>, <2 x i32>)

declare i64 @maccu_w01(i64, <2 x i32>, <2 x i32>)

declare i64 @maccu_w11(i64, <2 x i32>, <2 x i32>)

define i64 @maccsu_w00(i64 %rd, <2 x i32> %a, <2 x i32> %b) {
  %B = sdiv i64 %rd, -9223372036854775808
  %r = add i64 %rd, %B
  ret i64 %r
}

declare i64 @maccsu_w11(i64, <2 x i32>, <2 x i32>)

declare <2 x i32> @pmacc_h00(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmacc_h01(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmacc_h11(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmaccu_h00(<2 x i32>, <4 x i16>, <4 x i16>)

define <2 x i32> @pmaccu_h01(<2 x i32> %rd, <4 x i16> %a, <4 x i16> %b) {
  %m = call <2 x i32> @llvm.riscv.pmulu.01.v2i32(<4 x i16> %a, <4 x i16> %b)
  %r = add <2 x i32> %rd, %m
  %B = sdiv <4 x i16> %b, splat (i16 32767)
  store <4 x i16> %B, ptr @G.1, align 8
  ret <2 x i32> %r
}

declare <2 x i32> @pmaccu_h11(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmaccsu_h00(<2 x i32>, <4 x i16>, <4 x i16>)

define <2 x i32> @pmaccsu_h11(<2 x i32> %rd, <4 x i16> %a, <4 x i16> %b) {
  %B = mul <4 x i16> %a, %b
  %m = call <2 x i32> @llvm.riscv.pmulsu.11.v2i32(<4 x i16> %a, <4 x i16> %b)
  %r = add <2 x i32> %rd, %m
  store <4 x i16> %B, ptr @G, align 8
  ret <2 x i32> %r
}

declare i32 @multi_use(i32, <2 x i16>, <2 x i16>)

declare i32 @swapped_operands(i32, <2 x i16>, <2 x i16>)

declare i32 @accumulate_chain(i32, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mul.00.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mul.00.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mul.01.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mul.01.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mul.11.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mul.11.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulsu.00.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mulsu.00.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulsu.11.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mulsu.11.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulu.00.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mulu.00.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulu.01.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mulu.01.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mulu.11.i32.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mulu.11.i64.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmul.00.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmul.01.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmul.11.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulsu.00.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulsu.11.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulu.00.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulu.01.v2i32(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pmulu.11.v2i32(<4 x i16>, <4 x i16>) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

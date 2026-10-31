; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+m,+zbb,+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i32> splat (i32 42)
@G.1 = global <2 x i1> zeroinitializer
@G.2 = global i1 false
@G.3 = global i32 0

define i32 @macc_h00(i32 %rd, <2 x i16> %a, <2 x i16> %b) {
  %B = udiv i32 %rd, 0
  %m = call i32 @llvm.riscv.mul.00.i32.v2i16(<2 x i16> %a, <2 x i16> %b)
  %r = add i32 %m, %m
  store i32 %B, ptr @G.3, align 4
  ret i32 %r
}

declare i32 @macc_h01(i32, <2 x i16>, <2 x i16>)

declare i32 @macc_h11(i32, <2 x i16>, <2 x i16>)

declare i32 @maccu_h00(i32, <2 x i16>, <2 x i16>)

define i32 @maccu_h01(i32 %rd, <2 x i16> %a, <2 x i16> %b) {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %m = call i32 @llvm.riscv.mulu.01.i32.v2i16(<2 x i16> %a, <2 x i16> %b)
  %B = mul i32 %m, %m
  %r = add i32 %rd, %m
  store i32 %B, ptr %A, align 4
  ret i32 %r
}

declare i32 @maccu_h11(i32, <2 x i16>, <2 x i16>)

declare i32 @maccsu_h00(i32, <2 x i16>, <2 x i16>)

declare i32 @maccsu_h11(i32, <2 x i16>, <2 x i16>)

declare i64 @macc_w00(i64, <2 x i32>, <2 x i32>)

define i64 @macc_w01(i64 %rd, <2 x i32> %a, <2 x i32> %b) {
  %LGV = load <2 x i32>, ptr @G, align 8
  %m = call i64 @llvm.riscv.mul.01.i64.v2i32(<2 x i32> %a, <2 x i32> %b)
  %r = add i64 %rd, %m
  %C = icmp slt <2 x i32> %b, %LGV
  store <2 x i1> %C, ptr @G.1, align 1
  ret i64 %r
}

declare i64 @macc_w11(i64, <2 x i32>, <2 x i32>)

declare i64 @maccu_w00(i64, <2 x i32>, <2 x i32>)

define i64 @maccu_w01(i64 %rd, <2 x i32> %a, <2 x i32> %b) {
  %m = call i64 @llvm.riscv.mulu.01.i64.v2i32(<2 x i32> %a, <2 x i32> %b)
  %r = add i64 %rd, %m
  %C = icmp ne i64 %m, 42
  store i1 %C, ptr poison, align 1
  ret i64 %r
}

declare i64 @maccu_w11(i64, <2 x i32>, <2 x i32>)

declare i64 @maccsu_w00(i64, <2 x i32>, <2 x i32>)

declare i64 @maccsu_w11(i64, <2 x i32>, <2 x i32>)

declare <2 x i32> @pmacc_h00(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmacc_h01(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmacc_h11(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmaccu_h00(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmaccu_h01(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmaccu_h11(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmaccsu_h00(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmaccsu_h11(<2 x i32>, <4 x i16>, <4 x i16>)

define i32 @multi_use(i32 %rd, <2 x i16> %a, <2 x i16> %b) {
  %C = icmp sge i32 %rd, 2147483647
  %m = call i32 @llvm.riscv.mul.00.i32.v2i16(<2 x i16> %a, <2 x i16> %b)
  %r = add i32 %rd, %m
  %s = add i32 %r, %m
  store i1 %C, ptr poison, align 1
  ret i32 %s
}

declare i32 @swapped_operands(i32, <2 x i16>, <2 x i16>)

define i32 @accumulate_chain(i32 %rd, <2 x i16> %a, <2 x i16> %b, <2 x i16> %c, <2 x i16> %d) {
  %m1 = call i32 @llvm.riscv.mul.00.i32.v2i16(<2 x i16> %a, <2 x i16> %b)
  %r1 = add i32 %rd, %m1
  %C = icmp sle i32 %m1, 0
  %m2 = call i32 @llvm.riscv.mul.00.i32.v2i16(<2 x i16> %c, <2 x i16> %d)
  %r2 = add i32 %r1, %m2
  store i1 %C, ptr @G.2, align 1
  ret i32 %r2
}

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

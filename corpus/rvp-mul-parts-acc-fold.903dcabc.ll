; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+m,+zbb,+zhinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i16> splat (i16 42)
@G.1 = global <2 x i1> splat (i1 true)
@G.2 = global i1 true
@G.3 = global double 1.000000e+00
@G.4 = global bfloat 4.200000e+01
@G.5 = global i64 42
@G.6 = global i1 false

declare i32 @macc_h00(i32, <2 x i16>, <2 x i16>)

declare i32 @macc_h01(i32, <2 x i16>, <2 x i16>)

declare i32 @macc_h11(i32, <2 x i16>, <2 x i16>)

declare i32 @maccu_h00(i32, <2 x i16>, <2 x i16>)

declare i32 @maccu_h01(i32, <2 x i16>, <2 x i16>)

declare i32 @maccu_h11(i32, <2 x i16>, <2 x i16>)

declare i32 @maccsu_h00(i32, <2 x i16>, <2 x i16>)

declare i32 @maccsu_h11(i32, <2 x i16>, <2 x i16>)

declare i64 @macc_w00(i64, <2 x i32>, <2 x i32>)

define i64 @macc_w01(i64 %rd, <2 x i32> %a, <2 x i32> %b) {
  %LGV = load i64, ptr @G.5, align 4
  %C = icmp ugt i64 %rd, %LGV
  %m = call i64 @llvm.riscv.mul.01.i64.v2i32(<2 x i32> %a, <2 x i32> %b)
  %r = add i64 %rd, %m
  store i1 %C, ptr @G.6, align 1
  ret i64 %r
}

declare i64 @macc_w11(i64, <2 x i32>, <2 x i32>)

declare i64 @maccu_w00(i64, <2 x i32>, <2 x i32>)

define i64 @maccu_w01(i64 %rd, <2 x i32> %a, <2 x i32> %b) {
  %A = alloca double, align 8
  store double poison, ptr %A, align 8
  %LGV = load double, ptr @G.3, align 8
  %B = fsub double %LGV, 0.000000e+00
  %m = call i64 @llvm.riscv.mulu.01.i64.v2i32(<2 x i32> %a, <2 x i32> %b)
  %r = add i64 %rd, %m
  store double %B, ptr %A, align 8
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

define <2 x i32> @pmaccsu_h11(<2 x i32> %rd, <4 x i16> %a, <4 x i16> %b) {
  %m = call <2 x i32> @llvm.riscv.pmulsu.11.v2i32(<4 x i16> %a, <4 x i16> %b)
  %r = add <2 x i32> %m, %rd
  ret <2 x i32> %r
}

define i32 @multi_use(i32 %rd, <2 x i16> %a, <2 x i16> %b) {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %m = call i32 @llvm.riscv.mul.00.i32.v2i16(<2 x i16> %a, <2 x i16> %b)
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %r = add i32 %rd, %m
  %s = add i32 %r, %m
  ret i32 %s

T:                                                ; preds = %T, %0
  %LGV = load i1, ptr @G.2, align 1
  br i1 %LGV, label %BB, label %T

F:                                                ; preds = %0
  br label %BB
}

declare i32 @swapped_operands(i32, <2 x i16>, <2 x i16>)

define i32 @accumulate_chain(i32 %rd, <2 x i16> %a, <2 x i16> %b, <2 x i16> %c, <2 x i16> %d) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load bfloat, ptr @G.4, align 2
  %LGV = load <2 x i16>, ptr @G, align 4
  %C = icmp sle <2 x i16> %c, %LGV
  %m1 = call i32 @llvm.riscv.mul.00.i32.v2i16(<2 x i16> %a, <2 x i16> %b)
  %r1 = add i32 %rd, %m1
  %m2 = call i32 @llvm.riscv.mul.00.i32.v2i16(<2 x i16> %c, <2 x i16> %d)
  %r2 = add i32 %r1, %m2
  store <2 x i1> %C, ptr @G.1, align 1
  %C2 = fcmp ugt bfloat 4.200000e+01, %LGV1
  store i1 %C2, ptr %A, align 1
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

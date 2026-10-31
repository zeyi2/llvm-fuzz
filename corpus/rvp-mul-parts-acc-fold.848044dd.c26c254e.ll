; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+m,+zbb,+zdinx,+zvbb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 -170141183460469231731687303715884105728
@G.1 = global i128 170141183460469231731687303715884105727
@G.2 = global i1 false
@G.3 = global i64 0
@G.4 = global i16 -1
@G.5 = global <2 x i32> zeroinitializer
@G.6 = global i1 true
@G.7 = global <8 x i8> zeroinitializer

declare i32 @macc_h00(i32, <2 x i16>, <2 x i16>)

declare i32 @macc_h01(i32, <2 x i16>, <2 x i16>)

declare i32 @macc_h11(i32, <2 x i16>, <2 x i16>)

declare i32 @maccu_h00(i32, <2 x i16>, <2 x i16>)

declare i32 @maccu_h01(i32, <2 x i16>, <2 x i16>)

define i32 @maccu_h11(i32 %rd, <2 x i16> %a, <2 x i16> %b) {
  %m = call i32 @llvm.riscv.mulu.11.i32.v2i16(<2 x i16> %a, <2 x i16> %b)
  %LGV = load <8 x i8>, ptr @G.7, align 8
  %r = add i32 %rd, %m
  %C = icmp uge <8 x i8> %LGV, splat (i8 127)
  store <8 x i1> %C, ptr poison, align 1
  ret i32 %r
}

declare i32 @maccsu_h00(i32, <2 x i16>, <2 x i16>)

declare i32 @maccsu_h11(i32, <2 x i16>, <2 x i16>)

declare i64 @macc_w00(i64, <2 x i32>, <2 x i32>)

declare i64 @macc_w01(i64, <2 x i32>, <2 x i32>)

declare i64 @macc_w11(i64, <2 x i32>, <2 x i32>)

declare i64 @maccu_w00(i64, <2 x i32>, <2 x i32>)

declare i64 @maccu_w01(i64, <2 x i32>, <2 x i32>)

define i64 @maccu_w11(i64 %rd, <2 x i32> %a, <2 x i32> %b) {
  %A4 = alloca <2 x i32>, align 8
  %L5 = load i64, ptr %A4, align 4
  store <2 x i32> poison, ptr %A4, align 8
  %B6 = sub i64 %rd, %L5
  %A = alloca i64, align 8
  %L1 = load i128, ptr %A, align 4
  %L = load i128, ptr %A, align 4
  store i64 %B6, ptr %A, align 4
  %LGV = load i64, ptr @G.3, align 4
  %m = call i64 @llvm.riscv.mulu.11.i64.v2i32(<2 x i32> %a, <2 x i32> %b)
  %B = sub i64 %m, %LGV
  %r = add i64 %rd, %m
  %C = icmp ugt i128 %L, %L1
  store i64 %B, ptr %A, align 4
  store i1 %C, ptr poison, align 1
  %B3 = add <2 x i32> %a, splat (i32 42)
  store <2 x i32> %B3, ptr %A4, align 8
  ret i64 %r
}

declare i64 @maccsu_w00(i64, <2 x i32>, <2 x i32>)

declare i64 @maccsu_w11(i64, <2 x i32>, <2 x i32>)

declare <2 x i32> @pmacc_h00(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmacc_h01(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmacc_h11(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmaccu_h00(<2 x i32>, <4 x i16>, <4 x i16>)

define <2 x i32> @pmaccu_h01(<2 x i32> %rd, <4 x i16> %a, <4 x i16> %b) {
  %A15 = alloca i1, align 1
  store i1 true, ptr %A15, align 1
  %A11 = alloca i1, align 1
  store i1 true, ptr %A11, align 1
  %A9 = alloca i1, align 1
  store i1 false, ptr %A9, align 1
  %A = alloca i128, align 8
  store i128 -170141183460469231731687303715884105728, ptr %A, align 4
  %m = call <2 x i32> @llvm.riscv.pmulu.01.v2i32(<4 x i16> %a, <4 x i16> %b)
  %L = load i128, ptr %A, align 4
  switch i128 %L, label %SW_D [
    i128 13915524969392633091, label %SW_C
    i128 12325454385295592968, label %SW_C1
    i128 7224126129580602022, label %SW_C2
    i128 10725158730559190337, label %SW_C3
    i128 18371945771008510075, label %SW_C4
    i128 9184093142001870851, label %SW_C5
    i128 7411954364070400085, label %SW_C6
    i128 12715333884037694473, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C6, %SW_C5, %SW_C4, %SW_C3, %SW_C1, %SW_C
  %r = add <2 x i32> %rd, %m
  ret <2 x i32> %r

SW_D:                                             ; preds = %0
  ret <2 x i32> splat (i32 -2147483648)

SW_C:                                             ; preds = %SW_C, %0
  %L10 = load i1, ptr %A9, align 1
  br i1 %L10, label %BB, label %SW_C

SW_C1:                                            ; preds = %SW_C1, %0
  %G = getelementptr bfloat, ptr %A, i1 false
  %L12 = load i1, ptr %A11, align 1
  store ptr %G, ptr %A15, align 8
  br i1 %L12, label %BB, label %SW_C1

SW_C2:                                            ; preds = %0
  ret <2 x i32> splat (i32 65536)

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %SW_C4, %0
  %LGV13 = load i1, ptr @G.6, align 1
  br i1 %LGV13, label %SW_C4, label %BB

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %SW_C6, %0
  %L16 = load i1, ptr %A15, align 1
  br i1 %L16, label %BB, label %SW_C6

SW_C7:                                            ; preds = %0
  br label %BB
}

declare <2 x i32> @pmaccu_h11(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmaccsu_h00(<2 x i32>, <4 x i16>, <4 x i16>)

declare <2 x i32> @pmaccsu_h11(<2 x i32>, <4 x i16>, <4 x i16>)

declare i32 @multi_use(i32, <2 x i16>, <2 x i16>)

declare i32 @swapped_operands(i32, <2 x i16>, <2 x i16>)

define i32 @accumulate_chain(i32 %rd, <2 x i16> %a, <2 x i16> %b, <2 x i16> %c, <2 x i16> %d) {
  %m1 = call i32 @llvm.riscv.mul.00.i32.v2i16(<2 x i16> %a, <2 x i16> %b)
  %C = icmp sge i32 %rd, %m1
  %r1 = add i32 %rd, %m1
  %m2 = call i32 @llvm.riscv.mul.00.i32.v2i16(<2 x i16> %c, <2 x i16> %d)
  %C1 = icmp eq <2 x i16> %c, %a
  %r2 = add i32 %r1, %m2
  store i1 %C, ptr @G.2, align 1
  store <2 x i1> %C1, ptr poison, align 1
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

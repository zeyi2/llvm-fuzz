; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+zhinx -O3 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i64 0
@G.2 = global i8 127
@G.3 = global <4 x i32> splat (i32 42)

declare <2 x i32> @pm4adda(<2 x i32>, <8 x i8>, <8 x i8>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4add.v2i32.v8i8(<8 x i8>, <8 x i8>) #0

declare <2 x i32> @pm4addau(<2 x i32>, <8 x i8>, <8 x i8>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4addu.v2i32.v8i8(<8 x i8>, <8 x i8>) #0

define <2 x i32> @pm4addasu(<2 x i32> %rd, <8 x i8> %a, <8 x i8> %b) {
  %dot = call <2 x i32> @llvm.riscv.pm4addsu.v2i32.v8i8(<8 x i8> %a, <8 x i8> %b)
  %r = add nsw <2 x i32> %rd, %dot
  %B = add <4 x i32> splat (i32 -1), splat (i32 65536)
  store <4 x i32> %B, ptr @G.3, align 16
  ret <2 x i32> %r
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4addsu.v2i32.v8i8(<8 x i8>, <8 x i8>) #0

declare <2 x i32> @pm4adda_shared(<2 x i32>, <8 x i8>, <8 x i8>, ptr)

declare <2 x i32> @pm4adda_shared_word(<2 x i32>, <8 x i8>, <8 x i8>, ptr)

declare <2 x i32> @pm4adda_shared_words(<2 x i32>, <8 x i8>, <8 x i8>, ptr)

declare <2 x i32> @pm4adda_acc(<2 x i32>, <8 x i8>, <8 x i8>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4adda.v2i32.v8i8(<2 x i32>, <8 x i8>, <8 x i8>) #0

declare <2 x i32> @pm4addau_acc(<2 x i32>, <8 x i8>, <8 x i8>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4addau.v2i32.v8i8(<2 x i32>, <8 x i8>, <8 x i8>) #0

define <2 x i32> @pm4addasu_acc(<2 x i32> %rd, <8 x i8> %a, <8 x i8> %b) {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i1, ptr @G, align 1
  %r = call <2 x i32> @llvm.riscv.pm4addasu.v2i32.v8i8(<2 x i32> %rd, <8 x i8> %a, <8 x i8> %b)
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <2 x i32> %r

T:                                                ; preds = %0
  %LGV1 = load i64, ptr @G.1, align 4
  %C = icmp sge i64 -9223372036854775808, %LGV1
  store i1 %C, ptr %A, align 1
  br label %BB

F:                                                ; preds = %F, %0
  %LGV2 = load i8, ptr @G.2, align 1
  %B = add i8 127, %LGV2
  %L = load i1, ptr %A, align 1
  store i8 %B, ptr poison, align 1
  br i1 %L, label %BB, label %F
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4addasu.v2i32.v8i8(<2 x i32>, <8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

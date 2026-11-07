; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+zvkb,+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i32> splat (i32 2147483647)
@G.1 = global bfloat +inf
@G.2 = global float +inf
@G.3 = global i1 false

define <2 x i32> @pm4adda(<2 x i32> %rd, <8 x i8> %a, <8 x i8> %b) {
  %LGV = load bfloat, ptr @G.1, align 2
  %dot = call <2 x i32> @llvm.riscv.pm4add.v2i32.v8i8(<8 x i8> %a, <8 x i8> %b)
  %C = fcmp uno bfloat 4.200000e+01, %LGV
  %r = add <2 x i32> %rd, %dot
  store i1 %C, ptr poison, align 1
  ret <2 x i32> %r
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4add.v2i32.v8i8(<8 x i8>, <8 x i8>) #0

declare <2 x i32> @pm4addau(<2 x i32>, <8 x i8>, <8 x i8>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4addu.v2i32.v8i8(<8 x i8>, <8 x i8>) #0

define <2 x i32> @pm4addasu(<2 x i32> %rd, <8 x i8> %a, <8 x i8> %b) {
  %LGV = load <2 x i32>, ptr @G, align 8
  %C = icmp eq <2 x i32> %rd, %LGV
  %dot = call <2 x i32> @llvm.riscv.pm4addsu.v2i32.v8i8(<8 x i8> %a, <8 x i8> %b)
  %r = add <2 x i32> %rd, %dot
  store <2 x i1> %C, ptr poison, align 1
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

define <2 x i32> @pm4addau_acc(<2 x i32> %rd, <8 x i8> %a, <8 x i8> %b) {
  %LGV = load float, ptr @G.2, align 4
  %C = fcmp one float +qnan, %LGV
  %r = call <2 x i32> @llvm.riscv.pm4addau.v2i32.v8i8(<2 x i32> %rd, <8 x i8> %a, <8 x i8> %b)
  store i1 %C, ptr @G.3, align 1
  ret <2 x i32> %r
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4addau.v2i32.v8i8(<2 x i32>, <8 x i8>, <8 x i8>) #0

define <2 x i32> @pm4addasu_acc(<2 x i32> %rd, <8 x i8> %a, <8 x i8> %b) {
  %r = call <2 x i32> @llvm.riscv.pm4addasu.v2i32.v8i8(<2 x i32> %rd, <8 x i8> %a, <8 x i8> %b)
  %B = urem i8 1, 42
  store i8 %B, ptr poison, align 1
  ret <2 x i32> %r
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.riscv.pm4addasu.v2i32.v8i8(<2 x i32>, <8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zve64x,+experimental-zvdot4a8i,+zvbb,+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i1 false

; Function Attrs: nounwind
declare <vscale x 2 x i32> @commutable_vdot4a_vv(<vscale x 2 x i32>, <vscale x 2 x i32>, i32) #0

define <vscale x 2 x i32> @commutable_vdot4a_vv_masked(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, <vscale x 2 x i1> %mask, i32 %2) {
  %a = call <vscale x 2 x i32> @llvm.riscv.vdot4a.mask.nxv2i32.nxv2i32.i32(<vscale x 2 x i32> poison, <vscale x 2 x i32> %0, <vscale x 2 x i32> %1, <vscale x 2 x i1> %mask, i32 %2, i32 1)
  %b = call <vscale x 2 x i32> @llvm.riscv.vdot4a.mask.nxv2i32.nxv2i32.i32(<vscale x 2 x i32> poison, <vscale x 2 x i32> %1, <vscale x 2 x i32> %0, <vscale x 2 x i1> %mask, i32 %2, i32 1)
  %C = icmp slt i32 1, %2
  %ret = add <vscale x 2 x i32> %a, %b
  store i1 %C, ptr poison, align 1
  ret <vscale x 2 x i32> %ret
}

; Function Attrs: nounwind
define <vscale x 2 x i32> @commutable_vdot4au_vv(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, i32 %2) #0 {
entry:
  %C = icmp sle i32 %2, %2
  %a = call <vscale x 2 x i32> @llvm.riscv.vdot4au.nxv2i32.nxv2i32.i32(<vscale x 2 x i32> poison, <vscale x 2 x i32> %0, <vscale x 2 x i32> %1, i32 %2, i32 1)
  %b = call <vscale x 2 x i32> @llvm.riscv.vdot4au.nxv2i32.nxv2i32.i32(<vscale x 2 x i32> poison, <vscale x 2 x i32> %1, <vscale x 2 x i32> %0, i32 %2, i32 1)
  %ret = add <vscale x 2 x i32> %a, %b
  store i1 %C, ptr @G, align 1
  ret <vscale x 2 x i32> %ret
}

define <vscale x 2 x i32> @commutable_vdot4au_vv_masked(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, <vscale x 2 x i1> %mask, i32 %2) {
  %a = call <vscale x 2 x i32> @llvm.riscv.vdot4au.mask.nxv2i32.nxv2i32.i32(<vscale x 2 x i32> poison, <vscale x 2 x i32> %0, <vscale x 2 x i32> %1, <vscale x 2 x i1> %mask, i32 %2, i32 1)
  %b = call <vscale x 2 x i32> @llvm.riscv.vdot4au.mask.nxv2i32.nxv2i32.i32(<vscale x 2 x i32> poison, <vscale x 2 x i32> %1, <vscale x 2 x i32> %0, <vscale x 2 x i1> %mask, i32 %2, i32 1)
  %ret = add <vscale x 2 x i32> %a, %b
  %C = fcmp uno double f0x7FEFFFFFFFFFFFFF, 4.940660e-324
  store i1 %C, ptr @G.1, align 1
  ret <vscale x 2 x i32> %ret
}

; Function Attrs: nounwind
declare <vscale x 2 x i32> @commutable_vdot4asu_vv(<vscale x 2 x i32>, <vscale x 2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4a.mask.nxv2i32.nxv2i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4a.nxv2i32.nxv2i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4asu.nxv2i32.nxv2i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4au.mask.nxv2i32.nxv2i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4au.nxv2i32.nxv2i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i32, i32 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

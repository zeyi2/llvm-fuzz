; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zve64x,+experimental-zvdot4a8i,+c,+zdinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i1> splat (i1 true)

; Function Attrs: nounwind
define <vscale x 2 x i32> @commutable_vdot4a_vv(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, i64 %2) #0 {
entry:
  %a = call <vscale x 2 x i32> @llvm.riscv.vdot4a.nxv2i32.nxv2i32.i64(<vscale x 2 x i32> poison, <vscale x 2 x i32> %0, <vscale x 2 x i32> %1, i64 %2, i64 1)
  %C = icmp sle <2 x i64> splat (i64 42), splat (i64 -1)
  %b = call <vscale x 2 x i32> @llvm.riscv.vdot4a.nxv2i32.nxv2i32.i64(<vscale x 2 x i32> poison, <vscale x 2 x i32> %1, <vscale x 2 x i32> %0, i64 %2, i64 1)
  %ret = add <vscale x 2 x i32> %a, %b
  store <2 x i1> %C, ptr @G, align 1
  ret <vscale x 2 x i32> %ret
}

declare <vscale x 2 x i32> @commutable_vdot4a_vv_masked(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i64)

; Function Attrs: nounwind
define <vscale x 2 x i32> @commutable_vdot4au_vv(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, i64 %2) #0 {
entry:
  %a = call <vscale x 2 x i32> @llvm.riscv.vdot4au.nxv2i32.nxv2i32.i64(<vscale x 2 x i32> poison, <vscale x 2 x i32> %0, <vscale x 2 x i32> %1, i64 %2, i64 1)
  %b = call <vscale x 2 x i32> @llvm.riscv.vdot4au.nxv2i32.nxv2i32.i64(<vscale x 2 x i32> poison, <vscale x 2 x i32> %1, <vscale x 2 x i32> %0, i64 %2, i64 1)
  %B = sdiv <vscale x 2 x i32> %0, splat (i32 42)
  %ret = add <vscale x 2 x i32> %a, %b
  store <vscale x 2 x i32> %B, ptr poison, align 8
  ret <vscale x 2 x i32> %ret
}

declare <vscale x 2 x i32> @commutable_vdot4au_vv_masked(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i64)

; Function Attrs: nounwind
declare <vscale x 2 x i32> @commutable_vdot4asu_vv(<vscale x 2 x i32>, <vscale x 2 x i32>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4a.mask.nxv2i32.nxv2i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4a.nxv2i32.nxv2i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4asu.nxv2i32.nxv2i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4au.mask.nxv2i32.nxv2i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4au.nxv2i32.nxv2i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i64, i64 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

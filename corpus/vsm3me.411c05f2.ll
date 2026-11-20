; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zvksh,+zhinx -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vsm3me_vv_nxv8i32_nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i64) #0

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vsm3me_vv_nxv16i32_nxv16i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, i64 %2) #0 {
entry:
  %a = call <vscale x 16 x i32> @llvm.riscv.vsm3me.nxv16i32.nxv16i32.i64(<vscale x 16 x i32> poison, <vscale x 16 x i32> %0, <vscale x 16 x i32> %1, i64 %2)
  %B = or <vscale x 16 x i32> %a, %0
  ret <vscale x 16 x i32> %B
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vsm3me.nxv16i32.nxv16i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vsm3me.nxv8i32.nxv8i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i64) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

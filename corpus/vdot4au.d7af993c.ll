; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zve64x,+experimental-zvdot4a8i,+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 0
@G.1 = global <8 x i1> splat (i1 true)

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4au_vv_nxv1i32_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, i64) #0

; Function Attrs: nounwind
define <vscale x 2 x i32> @intrinsic_vdot4au_vv_nxv2i32_nxv2i32(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, <vscale x 2 x i32> %2, i64 %3) #0 {
entry:
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i16, ptr @G, align 2
  %C = icmp sge i16 %LGV, 42
  %a = call <vscale x 2 x i32> @llvm.riscv.vdot4au.nxv2i32.nxv2i32.i64(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, <vscale x 2 x i32> %2, i64 %3, i64 0)
  store i1 %C, ptr %A, align 1
  ret <vscale x 2 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4au_vv_nxv4i32_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vdot4au_vv_nxv8i32_nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vdot4au_vv_nxv16i32_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4au_mask_vv_nxv1i32_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4au_mask_vv_nxv2i32_nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4au_mask_vv_nxv4i32_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vdot4au_mask_vv_nxv8i32_nxv8i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, <vscale x 8 x i1> %m, i64 %3) #0 {
entry:
  %a = call <vscale x 8 x i32> @llvm.riscv.vdot4au.mask.nxv8i32.nxv8i32.i64(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, <vscale x 8 x i1> %m, i64 %3, i64 0)
  %C = icmp ult <8 x i8> splat (i8 127), zeroinitializer
  store <8 x i1> %C, ptr @G.1, align 1
  ret <vscale x 8 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vdot4au_mask_vv_nxv16i32_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4au_vx_nxv1i32_i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4au_vx_nxv2i32_i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4au_vx_nxv4i32_i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vdot4au_vx_nxv8i32_i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vdot4au_vx_nxv16i32_i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4au_mask_vx_nxv1i32_i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, <vscale x 1 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4au_mask_vx_nxv2i32_i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4au_mask_vx_nxv4i32_i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vdot4au_mask_vx_nxv8i32_i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, <vscale x 8 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vdot4au_mask_vx_nxv16i32_i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, <vscale x 16 x i1>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4au.mask.nxv16i32.i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4au.mask.nxv16i32.nxv16i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4au.mask.nxv1i32.i32.i64(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4au.mask.nxv1i32.nxv1i32.i64(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4au.mask.nxv2i32.i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4au.mask.nxv2i32.nxv2i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4au.mask.nxv4i32.i32.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4au.mask.nxv4i32.nxv4i32.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4au.mask.nxv8i32.i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4au.mask.nxv8i32.nxv8i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4au.nxv16i32.i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4au.nxv16i32.nxv16i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4au.nxv1i32.i32.i64(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4au.nxv1i32.nxv1i32.i64(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4au.nxv2i32.i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4au.nxv2i32.nxv2i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4au.nxv4i32.i32.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4au.nxv4i32.nxv4i32.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4au.nxv8i32.i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4au.nxv8i32.nxv8i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i64, i64 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

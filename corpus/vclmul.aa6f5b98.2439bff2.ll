; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zvbc,+zfinx,+zdinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 0
@G.1 = global half 4.200000e+01
@G.2 = global i64 9223372036854775807
@G.3 = global i1 false
@G.4 = global i1 true

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vclmul_vv_nxv1i64_nxv1i64(<vscale x 1 x i64>, <vscale x 1 x i64>, i64) #0

; Function Attrs: nounwind
define <vscale x 1 x i64> @intrinsic_vclmul_mask_vv_nxv1i64_nxv1i64(<vscale x 1 x i64> %0, <vscale x 1 x i64> %1, <vscale x 1 x i64> %2, <vscale x 1 x i1> %3, i64 %4) #0 {
entry:
  %LGV1 = load i1, ptr @G.3, align 1
  br i1 %LGV1, label %T, label %F

BB:                                               ; preds = %T
  %B3 = shl i1 %LGV1, %LGV1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %a = call <vscale x 1 x i64> @llvm.riscv.vclmul.mask.nxv1i64.nxv1i64.i64(<vscale x 1 x i64> %0, <vscale x 1 x i64> %1, <vscale x 1 x i64> %2, <vscale x 1 x i1> %3, i64 %4, i64 1)
  store i1 %B3, ptr %A, align 1
  ret <vscale x 1 x i64> %a

T:                                                ; preds = %entry
  br label %BB

F:                                                ; preds = %entry
  %LGV2 = load i1, ptr @G.4, align 1
  %C = fcmp ueq <4 x float> splat (float 1.000000e+00), splat (float 4.200000e+01)
  %B = udiv i1 %LGV2, %LGV1
  store i1 %B, ptr poison, align 1
  store <4 x i1> %C, ptr poison, align 1
  ret <vscale x 1 x i64> %1
}

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vclmul_vv_nxv2i64_nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vclmul_mask_vv_nxv2i64_nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vclmul_vv_nxv4i64_nxv4i64(<vscale x 4 x i64>, <vscale x 4 x i64>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vclmul_mask_vv_nxv4i64_nxv4i64(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vclmul_vv_nxv8i64_nxv8i64(<vscale x 8 x i64>, <vscale x 8 x i64>, i64) #0

; Function Attrs: nounwind
define <vscale x 8 x i64> @intrinsic_vclmul_mask_vv_nxv8i64_nxv8i64(<vscale x 8 x i64> %0, <vscale x 8 x i64> %1, <vscale x 8 x i64> %2, <vscale x 8 x i1> %3, i64 %4) #0 {
entry:
  %a = call <vscale x 8 x i64> @llvm.riscv.vclmul.mask.nxv8i64.nxv8i64.i64(<vscale x 8 x i64> %0, <vscale x 8 x i64> %1, <vscale x 8 x i64> %2, <vscale x 8 x i1> %3, i64 %4, i64 1)
  %LGV = load half, ptr @G.1, align 2
  %B = fsub half %LGV, 0.000000e+00
  store half %B, ptr poison, align 2
  ret <vscale x 8 x i64> %a
}

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vclmul_vx_nxv1i64_i64(<vscale x 1 x i64>, i64, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vclmul_mask_vx_nxv1i64_i64(<vscale x 1 x i64>, <vscale x 1 x i64>, i64, <vscale x 1 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vclmul_vx_nxv2i64_i64(<vscale x 2 x i64>, i64, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vclmul_mask_vx_nxv2i64_i64(<vscale x 2 x i64>, <vscale x 2 x i64>, i64, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vclmul_vx_nxv4i64_i64(<vscale x 4 x i64>, i64, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vclmul_mask_vx_nxv4i64_i64(<vscale x 4 x i64>, <vscale x 4 x i64>, i64, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vclmul_vx_nxv8i64_i64(<vscale x 8 x i64>, i64, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vclmul_mask_vx_nxv8i64_i64(<vscale x 8 x i64>, <vscale x 8 x i64>, i64, <vscale x 8 x i1>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.vclmul.mask.nxv1i64.i64.i64(<vscale x 1 x i64>, <vscale x 1 x i64>, i64, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.vclmul.mask.nxv1i64.nxv1i64.i64(<vscale x 1 x i64>, <vscale x 1 x i64>, <vscale x 1 x i64>, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.vclmul.mask.nxv2i64.i64.i64(<vscale x 2 x i64>, <vscale x 2 x i64>, i64, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.vclmul.mask.nxv2i64.nxv2i64.i64(<vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vclmul.mask.nxv4i64.i64.i64(<vscale x 4 x i64>, <vscale x 4 x i64>, i64, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vclmul.mask.nxv4i64.nxv4i64.i64(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vclmul.mask.nxv8i64.i64.i64(<vscale x 8 x i64>, <vscale x 8 x i64>, i64, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vclmul.mask.nxv8i64.nxv8i64.i64(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.vclmul.nxv1i64.i64.i64(<vscale x 1 x i64>, <vscale x 1 x i64>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.vclmul.nxv1i64.nxv1i64.i64(<vscale x 1 x i64>, <vscale x 1 x i64>, <vscale x 1 x i64>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.vclmul.nxv2i64.i64.i64(<vscale x 2 x i64>, <vscale x 2 x i64>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.vclmul.nxv2i64.nxv2i64.i64(<vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vclmul.nxv4i64.i64.i64(<vscale x 4 x i64>, <vscale x 4 x i64>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vclmul.nxv4i64.nxv4i64.i64(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i64>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vclmul.nxv8i64.i64.i64(<vscale x 8 x i64>, <vscale x 8 x i64>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vclmul.nxv8i64.nxv8i64.i64(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i64>, i64) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

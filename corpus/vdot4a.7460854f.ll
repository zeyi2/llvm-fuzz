; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zve64x,+experimental-zvdot4a8i,+zdinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x float> splat (float +qnan)
@G.1 = global <4 x float> splat (float f0x7F7FFFFF)
@G.2 = global <4 x i1> zeroinitializer

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4a_vv_nxv1i32_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, i64) #0

; Function Attrs: nounwind
define <vscale x 2 x i32> @intrinsic_vdot4a_vv_nxv2i32_nxv2i32(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, <vscale x 2 x i32> %2, i64 %3) #0 {
entry:
  %A = alloca <vscale x 2 x i32>, align 8
  store <vscale x 2 x i32> poison, ptr %A, align 8
  %B = add <vscale x 2 x i32> %2, splat (i32 1)
  %a = call <vscale x 2 x i32> @llvm.riscv.vdot4a.nxv2i32.nxv2i32.i64(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, <vscale x 2 x i32> %2, i64 %3, i64 0)
  store <vscale x 2 x i32> %B, ptr %A, align 8
  ret <vscale x 2 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4a_vv_nxv4i32_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i64) #0

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vdot4a_vv_nxv8i32_nxv8i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, i64 %3) #0 {
entry:
  %a = call <vscale x 8 x i32> @llvm.riscv.vdot4a.nxv8i32.nxv8i32.i64(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, i64 %3, i64 0)
  %C = icmp slt i64 %3, 0
  store i1 %C, ptr poison, align 1
  ret <vscale x 8 x i32> %a
}

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vdot4a_vv_nxv16i32_nxv16i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, <vscale x 16 x i32> %2, i64 %3) #0 {
entry:
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %a = call <vscale x 16 x i32> @llvm.riscv.vdot4a.nxv16i32.nxv16i32.i64(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, <vscale x 16 x i32> %2, i64 %3, i64 0)
  %C = fcmp ord float f0x7F7FFFFF, f0x7F7FFFFF
  store i1 %C, ptr %A, align 1
  ret <vscale x 16 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4a_mask_vv_nxv1i32_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4a_mask_vv_nxv2i32_nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4a_mask_vv_nxv4i32_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vdot4a_mask_vv_nxv8i32_nxv8i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, <vscale x 8 x i1> %m, i64 %3) #0 {
entry:
  %B = sub <vscale x 8 x i32> %0, splat (i32 -1)
  %a = call <vscale x 8 x i32> @llvm.riscv.vdot4a.mask.nxv8i32.nxv8i32.i64(<vscale x 8 x i32> %B, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, <vscale x 8 x i1> %m, i64 %3, i64 0)
  ret <vscale x 8 x i32> %a
}

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vdot4a_mask_vv_nxv16i32_nxv16i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, <vscale x 16 x i32> %2, <vscale x 16 x i1> %m, i64 %3) #0 {
entry:
  %LGV1 = load <4 x float>, ptr @G.1, align 16
  %LGV = load <4 x float>, ptr @G, align 16
  %C = fcmp uno <4 x float> %LGV, %LGV1
  %a = call <vscale x 16 x i32> @llvm.riscv.vdot4a.mask.nxv16i32.nxv16i32.i64(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, <vscale x 16 x i32> %2, <vscale x 16 x i1> %m, i64 %3, i64 0)
  store <4 x i1> %C, ptr @G.2, align 1
  ret <vscale x 16 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4a_vx_nxv1i32_i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4a_vx_nxv2i32_i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4a_vx_nxv4i32_i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, i64) #0

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vdot4a_vx_nxv8i32_i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, i32 %2, i64 %3) #0 {
entry:
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp ult float 0.000000e+00, 0.000000e+00
  %a = call <vscale x 8 x i32> @llvm.riscv.vdot4a.nxv8i32.i32.i64(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, i32 %2, i64 %3, i64 0)
  store i1 %C, ptr %A, align 1
  ret <vscale x 8 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vdot4a_vx_nxv16i32_i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, i64) #0

; Function Attrs: nounwind
define <vscale x 1 x i32> @intrinsic_vdot4a_mask_vx_nxv1i32_i32(<vscale x 1 x i32> %0, <vscale x 1 x i32> %1, i32 %2, <vscale x 1 x i1> %m, i64 %3) #0 {
entry:
  %I = insertelement <vscale x 1 x i32> %0, i32 2147483647, i64 0
  %a = call <vscale x 1 x i32> @llvm.riscv.vdot4a.mask.nxv1i32.i32.i64(<vscale x 1 x i32> %0, <vscale x 1 x i32> %I, i32 %2, <vscale x 1 x i1> %m, i64 %3, i64 0)
  ret <vscale x 1 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4a_mask_vx_nxv2i32_i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
define <vscale x 4 x i32> @intrinsic_vdot4a_mask_vx_nxv4i32_i32(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, i32 %2, <vscale x 4 x i1> %m, i64 %3) #0 {
entry:
  %C = icmp sle i32 42, %2
  %a = call <vscale x 4 x i32> @llvm.riscv.vdot4a.mask.nxv4i32.i32.i64(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, i32 %2, <vscale x 4 x i1> %m, i64 %3, i64 0)
  store i1 %C, ptr poison, align 1
  ret <vscale x 4 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vdot4a_mask_vx_nxv8i32_i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, <vscale x 8 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vdot4a_mask_vx_nxv16i32_i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, <vscale x 16 x i1>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4a.mask.nxv16i32.i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4a.mask.nxv16i32.nxv16i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4a.mask.nxv1i32.i32.i64(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4a.mask.nxv1i32.nxv1i32.i64(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4a.mask.nxv2i32.i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4a.mask.nxv2i32.nxv2i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4a.mask.nxv4i32.i32.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4a.mask.nxv4i32.nxv4i32.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4a.mask.nxv8i32.i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4a.mask.nxv8i32.nxv8i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4a.nxv16i32.i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4a.nxv16i32.nxv16i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4a.nxv1i32.i32.i64(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4a.nxv1i32.nxv1i32.i64(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4a.nxv2i32.i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4a.nxv2i32.nxv2i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4a.nxv4i32.i32.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4a.nxv4i32.nxv4i32.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4a.nxv8i32.i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4a.nxv8i32.nxv8i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i64, i64 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

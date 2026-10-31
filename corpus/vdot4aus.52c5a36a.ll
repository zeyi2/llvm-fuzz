; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zve64x,+experimental-zvdot4a8i,+zfinx,+zvbb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 1
@G.1 = global i1 true
@G.2 = global i64 -9223372036854775808

; Function Attrs: nounwind
define <vscale x 1 x i32> @intrinsic_vdot4aus_vx_nxv1i32_i32(<vscale x 1 x i32> %0, <vscale x 1 x i32> %1, i32 %2, i64 %3) #0 {
entry:
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %LGV = load i64, ptr @G.2, align 4
  %B = and i64 %3, %LGV
  %a = call <vscale x 1 x i32> @llvm.riscv.vdot4aus.nxv1i32.i32.i64(<vscale x 1 x i32> %0, <vscale x 1 x i32> %1, i32 %2, i64 %3, i64 0)
  store i64 %B, ptr %A, align 4
  ret <vscale x 1 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4aus_vx_nxv2i32_i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, i64) #0

; Function Attrs: nounwind
define <vscale x 4 x i32> @intrinsic_vdot4aus_vx_nxv4i32_i32(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, i32 %2, i64 %3) #0 {
entry:
  %a = call <vscale x 4 x i32> @llvm.riscv.vdot4aus.nxv4i32.i32.i64(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, i32 %2, i64 %3, i64 0)
  %C = icmp eq <vscale x 4 x i32> %1, splat (i32 2147483647)
  store <vscale x 4 x i1> %C, ptr poison, align 1
  ret <vscale x 4 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vdot4aus_vx_nxv8i32_i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, i64) #0

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vdot4aus_vx_nxv16i32_i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, i32 %2, i64 %3) #0 {
entry:
  %LGV = load i1, ptr @G.1, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  %a = call <vscale x 16 x i32> @llvm.riscv.vdot4aus.nxv16i32.i32.i64(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, i32 %2, i64 %3, i64 0)
  ret <vscale x 16 x i32> %a

T:                                                ; preds = %entry
  br label %BB

F:                                                ; preds = %entry
  br label %BB
}

; Function Attrs: nounwind
define <vscale x 1 x i32> @intrinsic_vdot4aus_mask_vx_nxv1i32_i32(<vscale x 1 x i32> %0, <vscale x 1 x i32> %1, i32 %2, <vscale x 1 x i1> %m, i64 %3) #0 {
entry:
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV = load i32, ptr @G, align 4
  %B = srem i32 -1, %LGV
  %a = call <vscale x 1 x i32> @llvm.riscv.vdot4aus.mask.nxv1i32.i32.i64(<vscale x 1 x i32> %0, <vscale x 1 x i32> %1, i32 %2, <vscale x 1 x i1> %m, i64 %3, i64 0)
  store i32 %B, ptr %A, align 4
  ret <vscale x 1 x i32> %a
}

; Function Attrs: nounwind
define <vscale x 2 x i32> @intrinsic_vdot4aus_mask_vx_nxv2i32_i32(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, i32 %2, <vscale x 2 x i1> %m, i64 %3) #0 {
entry:
  %C = icmp slt i64 %3, -9223372036854775808
  %a = call <vscale x 2 x i32> @llvm.riscv.vdot4aus.mask.nxv2i32.i32.i64(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, i32 %2, <vscale x 2 x i1> %m, i64 %3, i64 0)
  store i1 %C, ptr @G.1, align 1
  ret <vscale x 2 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4aus_mask_vx_nxv4i32_i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vdot4aus_mask_vx_nxv8i32_i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, <vscale x 8 x i1>, i64) #0

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vdot4aus_mask_vx_nxv16i32_i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, i32 %2, <vscale x 16 x i1> %m, i64 %3) #0 {
entry:
  %a = call <vscale x 16 x i32> @llvm.riscv.vdot4aus.mask.nxv16i32.i32.i64(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, i32 %2, <vscale x 16 x i1> %m, i64 %3, i64 0)
  %B = or i64 1, 0
  store i64 %B, ptr poison, align 4
  ret <vscale x 16 x i32> %a
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4aus.mask.nxv16i32.i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4aus.mask.nxv1i32.i32.i64(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4aus.mask.nxv2i32.i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4aus.mask.nxv4i32.i32.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4aus.mask.nxv8i32.i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4aus.nxv16i32.i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4aus.nxv1i32.i32.i64(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4aus.nxv2i32.i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4aus.nxv4i32.i32.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4aus.nxv8i32.i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, i64, i64 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+experimental-zvdot4a8i,+zdinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 42
@G.1 = global i1 false
@G.2 = global i64 -9223372036854775808
@G.3 = global i1 false
@G.4 = global i128 42

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4asu_vv_nxv1i32_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4asu_vv_nxv2i32_nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4asu_vv_nxv4i32_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i32) #0

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vdot4asu_vv_nxv8i32_nxv8i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, i32 %3) #0 {
entry:
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  switch i1 %L, label %SW_D [
    i1 true, label %SW_C
    i1 false, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_C, %SW_D
  %LGV = load i8, ptr @G, align 1
  %a = call <vscale x 8 x i32> @llvm.riscv.vdot4asu.nxv8i32.nxv8i32.i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, i32 %3, i32 0)
  %C = icmp ne i8 16, %LGV
  store i1 %C, ptr @G.1, align 1
  ret <vscale x 8 x i32> %a

SW_D:                                             ; preds = %SW_D, %entry
  %LGV2 = load i1, ptr @G.1, align 1
  br i1 %L, label %BB, label %SW_D

SW_C:                                             ; preds = %entry
  br label %BB

SW_C1:                                            ; preds = %entry
  br label %BB
}

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vdot4asu_vv_nxv16i32_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4asu_mask_vv_nxv1i32_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4asu_mask_vv_nxv2i32_nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4asu_mask_vv_nxv4i32_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vdot4asu_mask_vv_nxv8i32_nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vdot4asu_mask_vv_nxv16i32_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4asu_vx_nxv1i32_i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4asu_vx_nxv2i32_i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4asu_vx_nxv4i32_i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, i32) #0

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vdot4asu_vx_nxv8i32_i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, i32 %2, i32 %3) #0 {
entry:
  %a = call <vscale x 8 x i32> @llvm.riscv.vdot4asu.nxv8i32.i32.i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, i32 %2, i32 %3, i32 0)
  %C = fcmp one bfloat +inf, 1.000000e+00
  store i1 %C, ptr @G.3, align 1
  %B = udiv i1 %C, false
  store i1 %B, ptr @G.3, align 1
  ret <vscale x 8 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vdot4asu_vx_nxv16i32_i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4asu_mask_vx_nxv1i32_i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4asu_mask_vx_nxv2i32_i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
define <vscale x 4 x i32> @intrinsic_vdot4asu_mask_vx_nxv4i32_i32(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, i32 %2, <vscale x 4 x i1> %m, i32 %3) #0 {
entry:
  %LGV = load i128, ptr @G.4, align 4
  %A3 = alloca i64, align 8
  store i64 poison, ptr %A3, align 4
  %B5 = urem i128 0, %LGV
  %A = alloca i32, align 4
  %L = load i64, ptr %A, align 4
  %B2 = udiv i64 %L, -9223372036854775808
  store i32 poison, ptr %A, align 4
  %a = call <vscale x 4 x i32> @llvm.riscv.vdot4asu.mask.nxv4i32.i32.i32(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, i32 %2, <vscale x 4 x i1> %m, i32 %3, i32 0)
  %B = add i32 2147483647, %2
  store i32 %B, ptr %A, align 4
  store i64 %B2, ptr %A3, align 4
  store i128 %B5, ptr @G.4, align 4
  ret <vscale x 4 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vdot4asu_mask_vx_nxv8i32_i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vdot4asu_mask_vx_nxv16i32_i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, i32 %2, <vscale x 16 x i1> %m, i32 %3) #0 {
entry:
  %LGV = load i64, ptr @G.2, align 4
  %C = icmp sge i32 %2, %2
  %I = insertelement <vscale x 16 x i32> %0, i32 %2, i32 %2
  %B = xor i64 42, %LGV
  store i64 %B, ptr @G.2, align 4
  store i1 %C, ptr poison, align 1
  ret <vscale x 16 x i32> %I
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4asu.mask.nxv16i32.i32.i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, <vscale x 16 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4asu.mask.nxv16i32.nxv16i32.i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4asu.mask.nxv1i32.i32.i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4asu.mask.nxv1i32.nxv1i32.i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4asu.mask.nxv2i32.i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4asu.mask.nxv2i32.nxv2i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4asu.mask.nxv4i32.i32.i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4asu.mask.nxv4i32.nxv4i32.i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4asu.mask.nxv8i32.i32.i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4asu.mask.nxv8i32.nxv8i32.i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4asu.nxv16i32.i32.i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vdot4asu.nxv16i32.nxv16i32.i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4asu.nxv1i32.i32.i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vdot4asu.nxv1i32.nxv1i32.i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4asu.nxv2i32.i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vdot4asu.nxv2i32.nxv2i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4asu.nxv4i32.i32.i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vdot4asu.nxv4i32.nxv4i32.i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4asu.nxv8i32.i32.i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vdot4asu.nxv8i32.nxv8i32.i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i32, i32 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

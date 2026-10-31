; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zve64x,+experimental-zvdot4a8i,+zhinx -O0 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 42)
@G.1 = global i128 0
@G.2 = global i1 true
@G.3 = global i16 -1
@G.4 = global <4 x i32> splat (i32 42)

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4asu_vv_nxv1i32_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4asu_vv_nxv2i32_nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4asu_vv_nxv4i32_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i32) #0

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vdot4asu_vv_nxv8i32_nxv8i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, i32 %3) #0 {
entry:
  %LGV = load i128, ptr @G.1, align 4
  switch i128 %LGV, label %SW_D [
    i128 13212191814051794317, label %SW_C
    i128 9194779030486717325, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_C, %SW_D
  %a = call <vscale x 8 x i32> @llvm.riscv.vdot4asu.nxv8i32.nxv8i32.i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, i32 %3, i32 0)
  ret <vscale x 8 x i32> %a

SW_D:                                             ; preds = %SW_D, %entry
  %LGV2 = load i1, ptr @G.2, align 1
  br i1 %LGV2, label %SW_D, label %BB

SW_C:                                             ; preds = %entry
  br label %BB

SW_C1:                                            ; preds = %entry
  br label %BB
}

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vdot4asu_vv_nxv16i32_nxv16i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, <vscale x 16 x i32> %2, i32 %3) #0 {
entry:
  %a = call <vscale x 16 x i32> @llvm.riscv.vdot4asu.nxv16i32.nxv16i32.i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, <vscale x 16 x i32> %2, i32 %3, i32 0)
  %B = lshr <4 x i32> splat (i32 65536), splat (i32 -1)
  store <4 x i32> %B, ptr @G.4, align 16
  ret <vscale x 16 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4asu_mask_vv_nxv1i32_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4asu_mask_vv_nxv2i32_nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
define <vscale x 4 x i32> @intrinsic_vdot4asu_mask_vv_nxv4i32_nxv4i32(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, <vscale x 4 x i32> %2, <vscale x 4 x i1> %m, i32 %3) #0 {
entry:
  %B = sub <2 x i64> splat (i64 4294967296), splat (i64 -9223372036854775808)
  %a = call <vscale x 4 x i32> @llvm.riscv.vdot4asu.mask.nxv4i32.nxv4i32.i32(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, <vscale x 4 x i32> %2, <vscale x 4 x i1> %m, i32 %3, i32 0)
  store <2 x i64> %B, ptr @G, align 16
  ret <vscale x 4 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vdot4asu_mask_vv_nxv8i32_nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vdot4asu_mask_vv_nxv16i32_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4asu_vx_nxv1i32_i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vdot4asu_vx_nxv2i32_i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, i32) #0

; Function Attrs: nounwind
define <vscale x 4 x i32> @intrinsic_vdot4asu_vx_nxv4i32_i32(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, i32 %2, i32 %3) #0 {
entry:
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %a = call <vscale x 4 x i32> @llvm.riscv.vdot4asu.nxv4i32.i32.i32(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, i32 %2, i32 %3, i32 0)
  %C = icmp ule i32 %2, %3
  store i1 %C, ptr %A, align 1
  ret <vscale x 4 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vdot4asu_vx_nxv8i32_i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vdot4asu_vx_nxv16i32_i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vdot4asu_mask_vx_nxv1i32_i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
define <vscale x 2 x i32> @intrinsic_vdot4asu_mask_vx_nxv2i32_i32(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, i32 %2, <vscale x 2 x i1> %m, i32 %3) #0 {
entry:
  %A = alloca i16, align 2
  store i16 poison, ptr %A, align 2
  %LGV = load i16, ptr @G.3, align 2
  %B = ashr i16 %LGV, 0
  %a = call <vscale x 2 x i32> @llvm.riscv.vdot4asu.mask.nxv2i32.i32.i32(<vscale x 2 x i32> %0, <vscale x 2 x i32> %1, i32 %2, <vscale x 2 x i1> %m, i32 %3, i32 0)
  store i16 %B, ptr %A, align 2
  ret <vscale x 2 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vdot4asu_mask_vx_nxv4i32_i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vdot4asu_mask_vx_nxv8i32_i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vdot4asu_mask_vx_nxv16i32_i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, <vscale x 16 x i1>, i32) #0

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

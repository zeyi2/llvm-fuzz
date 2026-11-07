; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64 -mattr=+zve64x,+xandesvdot,+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 0
@G.1 = global float +inf
@G.2 = global i64 9223372036854775807
@G.3 = global i1 true
@G.4 = global <4 x float> splat (float +qnan)

; Function Attrs: nounwind
define <vscale x 1 x i32> @intrinsic_vd4dots_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32> %0, <vscale x 4 x i8> %1, <vscale x 4 x i8> %2, i64 %3) #0 {
entry:
  %LGV = load <4 x float>, ptr @G.4, align 16
  %B = fsub <4 x float> splat (float 1.401300e-45), %LGV
  %a = tail call <vscale x 1 x i32> @llvm.riscv.nds.vd4dots.nxv1i32.nxv4i8.nxv4i8.i64(<vscale x 1 x i32> %0, <vscale x 4 x i8> %1, <vscale x 4 x i8> %2, i64 %3, i64 2)
  store <4 x float> %B, ptr @G.4, align 16
  ret <vscale x 1 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vd4dots_mask_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 1 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vd4dots_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vd4dots_mask_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dots_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64) #0

; Function Attrs: nounwind
define <vscale x 4 x i32> @intrinsic_vd4dots_mask_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32> %0, <vscale x 16 x i8> %1, <vscale x 16 x i8> %2, <vscale x 4 x i1> %3, i64 %4) #0 {
entry:
  %LGV1 = load i64, ptr @G.2, align 4
  %C = icmp eq <vscale x 16 x i8> %2, %2
  %a = tail call <vscale x 4 x i32> @llvm.riscv.nds.vd4dots.mask.nxv4i32.nxv16i8.nxv16i8.i64(<vscale x 4 x i32> %0, <vscale x 16 x i8> %1, <vscale x 16 x i8> %2, <vscale x 4 x i1> %3, i64 %4, i64 2)
  %C2 = icmp ugt i64 %4, %LGV1
  store <vscale x 16 x i1> %C, ptr poison, align 2
  store i1 %C2, ptr @G.3, align 1
  ret <vscale x 4 x i32> %a
}

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vd4dots_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32> %0, <vscale x 32 x i8> %1, <vscale x 32 x i8> %2, i64 %3) #0 {
entry:
  %LGV = load i64, ptr @G, align 4
  %a = tail call <vscale x 8 x i32> @llvm.riscv.nds.vd4dots.nxv8i32.nxv32i8.nxv32i8.i64(<vscale x 8 x i32> %0, <vscale x 32 x i8> %1, <vscale x 32 x i8> %2, i64 %3, i64 2)
  %C = icmp sle i64 %3, %LGV
  store i1 %C, ptr poison, align 1
  ret <vscale x 8 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vd4dots_mask_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 8 x i1>, i64) #0

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vd4dots_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32> %0, <vscale x 64 x i8> %1, <vscale x 64 x i8> %2, i64 %3) #0 {
entry:
  %A = alloca <vscale x 64 x i1>, align 8
  store <vscale x 64 x i1> poison, ptr %A, align 8
  %a = tail call <vscale x 16 x i32> @llvm.riscv.nds.vd4dots.nxv16i32.nxv64i8.nxv64i8.i64(<vscale x 16 x i32> %0, <vscale x 64 x i8> %1, <vscale x 64 x i8> %2, i64 %3, i64 2)
  %C = icmp ne <vscale x 64 x i8> %2, %1
  store <vscale x 64 x i1> %C, ptr %A, align 8
  ret <vscale x 16 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vd4dots_mask_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 16 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vd4dots_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vd4dots_mask_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 1 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vd4dots_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, i64) #0

; Function Attrs: nounwind
define <vscale x 2 x i64> @intrinsic_vd4dots_mask_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64> %0, <vscale x 8 x i16> %1, <vscale x 8 x i16> %2, <vscale x 2 x i1> %3, i64 %4) #0 {
entry:
  %a = tail call <vscale x 2 x i64> @llvm.riscv.nds.vd4dots.mask.nxv2i64.nxv8i16.nxv8i16.i64(<vscale x 2 x i64> %0, <vscale x 8 x i16> %1, <vscale x 8 x i16> %2, <vscale x 2 x i1> %3, i64 %4, i64 2)
  %B = fsub float +inf, 0.000000e+00
  store float %B, ptr @G.1, align 4
  ret <vscale x 2 x i64> %a
}

; Function Attrs: nounwind
define <vscale x 4 x i64> @intrinsic_vd4dots_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64> %0, <vscale x 16 x i16> %1, <vscale x 16 x i16> %2, i64 %3) #0 {
entry:
  %C = icmp uge i64 %3, 4294967296
  %a = tail call <vscale x 4 x i64> @llvm.riscv.nds.vd4dots.nxv4i64.nxv16i16.nxv16i16.i64(<vscale x 4 x i64> %0, <vscale x 16 x i16> %1, <vscale x 16 x i16> %2, i64 %3, i64 2)
  store i1 %C, ptr @G.3, align 1
  ret <vscale x 4 x i64> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vd4dots_mask_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vd4dots_vv_nxv8i64_nxv32i16_nxv32i16(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vd4dots_mask_vv_nxv8i64_nxv32i16_nxv32i16(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 8 x i1>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.nds.vd4dots.mask.nxv16i32.nxv64i8.nxv64i8.i64(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.nds.vd4dots.mask.nxv1i32.nxv4i8.nxv4i8.i64(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.nds.vd4dots.mask.nxv1i64.nxv4i16.nxv4i16.i64(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.nds.vd4dots.mask.nxv2i32.nxv8i8.nxv8i8.i64(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.nds.vd4dots.mask.nxv2i64.nxv8i16.nxv8i16.i64(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.nds.vd4dots.mask.nxv4i32.nxv16i8.nxv16i8.i64(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.nds.vd4dots.mask.nxv4i64.nxv16i16.nxv16i16.i64(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.nds.vd4dots.mask.nxv8i32.nxv32i8.nxv32i8.i64(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.nds.vd4dots.mask.nxv8i64.nxv32i16.nxv32i16.i64(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.nds.vd4dots.nxv16i32.nxv64i8.nxv64i8.i64(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.nds.vd4dots.nxv1i32.nxv4i8.nxv4i8.i64(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.nds.vd4dots.nxv1i64.nxv4i16.nxv4i16.i64(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.nds.vd4dots.nxv2i32.nxv8i8.nxv8i8.i64(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.nds.vd4dots.nxv2i64.nxv8i16.nxv8i16.i64(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.nds.vd4dots.nxv4i32.nxv16i8.nxv16i8.i64(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.nds.vd4dots.nxv4i64.nxv16i16.nxv16i16.i64(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.nds.vd4dots.nxv8i32.nxv32i8.nxv32i8.i64(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.nds.vd4dots.nxv8i64.nxv32i16.nxv32i16.i64(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, i64, i64 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

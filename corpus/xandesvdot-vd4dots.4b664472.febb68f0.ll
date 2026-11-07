; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64 -mattr=+zve64x,+xandesvdot,+zfinx -O2 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i16 1
@G.2 = global i32 -2147483648
@G.3 = global <2 x i64> splat (i64 42)
@G.4 = global i1 false

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vd4dots_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, i64) #0

; Function Attrs: nounwind
define <vscale x 1 x i32> @intrinsic_vd4dots_mask_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32> %0, <vscale x 4 x i8> %1, <vscale x 4 x i8> %2, <vscale x 1 x i1> %3, i64 %4) #0 {
entry:
  %LGV = load i32, ptr @G.2, align 4
  %A = alloca i8, align 1
  %L5 = load float, ptr %A, align 4
  %L2 = load <2 x i64>, ptr %A, align 16
  %L = load i32, ptr %A, align 4
  store i8 poison, ptr %A, align 1
  %E = extractelement <vscale x 4 x i8> %1, i64 %4
  %B = add i32 %L, %LGV
  %a = tail call <vscale x 1 x i32> @llvm.riscv.nds.vd4dots.mask.nxv1i32.nxv4i8.nxv4i8.i64(<vscale x 1 x i32> %0, <vscale x 4 x i8> %1, <vscale x 4 x i8> %2, <vscale x 1 x i1> %3, i64 %4, i64 2)
  %C6 = fcmp oeq float 4.200000e+01, %L5
  %C = icmp sge i64 %4, %4
  %B3 = udiv <2 x i64> zeroinitializer, %L2
  store i1 %C, ptr @G, align 1
  store i8 %E, ptr %A, align 1
  store i32 %B, ptr @G.2, align 4
  store <2 x i64> %B3, ptr @G.3, align 16
  store i1 %C6, ptr @G.4, align 1
  ret <vscale x 1 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vd4dots_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vd4dots_mask_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dots_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dots_mask_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vd4dots_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vd4dots_mask_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 8 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vd4dots_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vd4dots_mask_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 16 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vd4dots_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vd4dots_mask_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 1 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vd4dots_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vd4dots_mask_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vd4dots_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, i64) #0

; Function Attrs: nounwind
define <vscale x 4 x i64> @intrinsic_vd4dots_mask_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64> %0, <vscale x 16 x i16> %1, <vscale x 16 x i16> %2, <vscale x 4 x i1> %3, i64 %4) #0 {
entry:
  %a = tail call <vscale x 4 x i64> @llvm.riscv.nds.vd4dots.mask.nxv4i64.nxv16i16.nxv16i16.i64(<vscale x 4 x i64> %0, <vscale x 16 x i16> %1, <vscale x 16 x i16> %2, <vscale x 4 x i1> %3, i64 %4, i64 2)
  %LGV = load i16, ptr @G.1, align 2
  %C = icmp ne i16 1, %LGV
  store i1 %C, ptr @G, align 1
  %C1 = icmp uge i1 %C, false
  store i1 %C1, ptr poison, align 1
  ret <vscale x 4 x i64> %a
}

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

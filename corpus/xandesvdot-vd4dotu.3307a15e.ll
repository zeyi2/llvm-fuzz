; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64 -mattr=+zve64x,+xandesvdot,+m,+zhinx -O1 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -128

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vd4dotu_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vd4dotu_mask_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 1 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vd4dotu_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vd4dotu_mask_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dotu_vv_nxv4i32_nxv16i8.nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dotu_mask_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vd4dotu_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vd4dotu_mask_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 8 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vd4dotu_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vd4dotu_mask_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 16 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vd4dotu_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vd4dotu_mask_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 1 x i1>, i64) #0

; Function Attrs: nounwind
define <vscale x 2 x i64> @intrinsic_vd4dotu_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64> %0, <vscale x 8 x i16> %1, <vscale x 8 x i16> %2, i64 %3) #0 {
entry:
  %a = tail call <vscale x 2 x i64> @llvm.riscv.nds.vd4dotu.nxv2i64.nxv8i16.nxv8i16.i64(<vscale x 2 x i64> %0, <vscale x 8 x i16> %1, <vscale x 8 x i16> %2, i64 %3, i64 2)
  %B = and i8 -1, -1
  store i8 %B, ptr @G, align 1
  ret <vscale x 2 x i64> %a
}

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vd4dotu_mask_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vd4dotu_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vd4dotu_mask_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vd4dotu_vv_nxv8i64_nxv32i16_nxv32i16(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vd4dotu_mask_vv_nxv8i64_nxv32i16_nxv32i16(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 8 x i1>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.nds.vd4dotu.mask.nxv16i32.nxv64i8.nxv64i8.i64(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.nds.vd4dotu.mask.nxv1i32.nxv4i8.nxv4i8.i64(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.nds.vd4dotu.mask.nxv1i64.nxv4i16.nxv4i16.i64(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.nds.vd4dotu.mask.nxv2i32.nxv8i8.nxv8i8.i64(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.nds.vd4dotu.mask.nxv2i64.nxv8i16.nxv8i16.i64(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.nds.vd4dotu.mask.nxv4i32.nxv16i8.nxv16i8.i64(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.nds.vd4dotu.mask.nxv4i64.nxv16i16.nxv16i16.i64(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.nds.vd4dotu.mask.nxv8i32.nxv32i8.nxv32i8.i64(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.nds.vd4dotu.mask.nxv8i64.nxv32i16.nxv32i16.i64(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.nds.vd4dotu.nxv16i32.nxv64i8.nxv64i8.i64(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.nds.vd4dotu.nxv1i32.nxv4i8.nxv4i8.i64(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.nds.vd4dotu.nxv1i64.nxv4i16.nxv4i16.i64(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.nds.vd4dotu.nxv2i32.nxv8i8.nxv8i8.i64(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.nds.vd4dotu.nxv2i64.nxv8i16.nxv8i16.i64(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.nds.vd4dotu.nxv4i32.nxv16i8.nxv16i8.i64(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.nds.vd4dotu.nxv4i64.nxv16i16.nxv16i16.i64(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.nds.vd4dotu.nxv8i32.nxv32i8.nxv32i8.i64(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.nds.vd4dotu.nxv8i64.nxv32i16.nxv32i16.i64(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, i64, i64 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32 -mattr=+zve64x,+xandesvdot,+zfinx,+xtheadba,+zicsr -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x float> zeroinitializer
@G.1 = global <4 x float> splat (float 1.401300e-45)
@G.2 = global i1 false
@G.3 = global <8 x i8> splat (i8 16)

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vd4dotsu_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vd4dotsu_mask_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vd4dotsu_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i32) #0

; Function Attrs: nounwind
define <vscale x 2 x i32> @intrinsic_vd4dotsu_mask_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32> %0, <vscale x 8 x i8> %1, <vscale x 8 x i8> %2, <vscale x 2 x i1> %3, i32 %4) #0 {
entry:
  %LGV = load <8 x i8>, ptr @G.3, align 8
  %a = tail call <vscale x 2 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv2i32.nxv8i8.nxv8i8.i32(<vscale x 2 x i32> %0, <vscale x 8 x i8> %1, <vscale x 8 x i8> %2, <vscale x 2 x i1> %3, i32 %4, i32 2)
  %C = icmp sge <8 x i8> splat (i8 -1), %LGV
  store <vscale x 2 x i32> %a, ptr poison, align 8
  store <8 x i1> %C, ptr poison, align 1
  ret <vscale x 2 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dotsu_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dotsu_mask_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vd4dotsu_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, i32) #0

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vd4dotsu_mask_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32> %0, <vscale x 32 x i8> %1, <vscale x 32 x i8> %2, <vscale x 8 x i1> %3, i32 %4) #0 {
entry:
  %A = alloca <vscale x 32 x i1>, align 4
  store <vscale x 32 x i1> poison, ptr %A, align 4
  %C1 = icmp sle <vscale x 32 x i8> %2, %1
  %a = tail call <vscale x 8 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv8i32.nxv32i8.nxv32i8.i32(<vscale x 8 x i32> %0, <vscale x 32 x i8> %1, <vscale x 32 x i8> %2, <vscale x 8 x i1> %3, i32 %4, i32 2)
  %C = icmp uge <vscale x 32 x i8> %2, splat (i8 127)
  store <vscale x 32 x i1> %C, ptr poison, align 4
  store <vscale x 32 x i1> %C1, ptr %A, align 4
  ret <vscale x 8 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vd4dotsu_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vd4dotsu_mask_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 16 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vd4dotsu_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vd4dotsu_mask_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vd4dotsu_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vd4dotsu_mask_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
define <vscale x 4 x i64> @intrinsic_vd4dotsu_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64> %0, <vscale x 16 x i16> %1, <vscale x 16 x i16> %2, i32 %3) #0 {
entry:
  %A = alloca <vscale x 16 x i16>, align 32
  store <vscale x 16 x i16> poison, ptr %A, align 32
  %a = tail call <vscale x 4 x i64> @llvm.riscv.nds.vd4dotsu.nxv4i64.nxv16i16.nxv16i16.i32(<vscale x 4 x i64> %0, <vscale x 16 x i16> %1, <vscale x 16 x i16> %2, i32 %3, i32 2)
  %C = fcmp uge float 1.401300e-45, +qnan
  store i1 %C, ptr @G.2, align 1
  %B = udiv <vscale x 16 x i16> %2, zeroinitializer
  store <vscale x 16 x i16> %B, ptr %A, align 32
  ret <vscale x 4 x i64> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vd4dotsu_mask_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vd4dotsu_vv_nxv8i64_nxv32i16_nxv32i16(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vd4dotsu_mask_vv_nxv8i64_nxv32i16_nxv32i16(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 8 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv16i32.nxv64i8.nxv64i8.i32(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 16 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv1i32.nxv4i8.nxv4i8.i32(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.nds.vd4dotsu.mask.nxv1i64.nxv4i16.nxv4i16.i32(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv2i32.nxv8i8.nxv8i8.i32(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.nds.vd4dotsu.mask.nxv2i64.nxv8i16.nxv8i16.i32(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv4i32.nxv16i8.nxv16i8.i32(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.nds.vd4dotsu.mask.nxv4i64.nxv16i16.nxv16i16.i32(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv8i32.nxv32i8.nxv32i8.i32(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.nds.vd4dotsu.mask.nxv8i64.nxv32i16.nxv32i16.i32(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.nds.vd4dotsu.nxv16i32.nxv64i8.nxv64i8.i32(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.nds.vd4dotsu.nxv1i32.nxv4i8.nxv4i8.i32(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.nds.vd4dotsu.nxv1i64.nxv4i16.nxv4i16.i32(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.nds.vd4dotsu.nxv2i32.nxv8i8.nxv8i8.i32(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.nds.vd4dotsu.nxv2i64.nxv8i16.nxv8i16.i32(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.nds.vd4dotsu.nxv4i32.nxv16i8.nxv16i8.i32(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.nds.vd4dotsu.nxv4i64.nxv16i16.nxv16i16.i32(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.nds.vd4dotsu.nxv8i32.nxv32i8.nxv32i8.i32(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.nds.vd4dotsu.nxv8i64.nxv32i16.nxv32i16.i32(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, i32, i32 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

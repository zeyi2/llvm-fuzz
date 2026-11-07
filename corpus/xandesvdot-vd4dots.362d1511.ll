; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32 -mattr=+zve64x,+xandesvdot,+zdinx,+zicsr -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -1
@G.1 = global i64 0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vd4dots_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vd4dots_mask_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vd4dots_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i32) #0

; Function Attrs: nounwind
define <vscale x 2 x i32> @intrinsic_vd4dots_mask_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32> %0, <vscale x 8 x i8> %1, <vscale x 8 x i8> %2, <vscale x 2 x i1> %3, i32 %4) #0 {
entry:
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %LGV = load i64, ptr @G.1, align 4
  %a = tail call <vscale x 2 x i32> @llvm.riscv.nds.vd4dots.mask.nxv2i32.nxv8i8.nxv8i8.i32(<vscale x 2 x i32> %0, <vscale x 8 x i8> %1, <vscale x 8 x i8> %2, <vscale x 2 x i1> %3, i32 %4, i32 2)
  %E = extractelement <vscale x 8 x i8> %1, i64 %LGV
  store i8 %E, ptr %A, align 1
  ret <vscale x 2 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dots_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dots_mask_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vd4dots_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vd4dots_mask_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vd4dots_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32> %0, <vscale x 64 x i8> %1, <vscale x 64 x i8> %2, i32 %3) #0 {
entry:
  %A1 = alloca i1, align 1
  store i1 true, ptr %A1, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %B = lshr i32 %3, %3
  %a = tail call <vscale x 16 x i32> @llvm.riscv.nds.vd4dots.nxv16i32.nxv64i8.nxv64i8.i32(<vscale x 16 x i32> %0, <vscale x 64 x i8> %1, <vscale x 64 x i8> %2, i32 %3, i32 2)
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  store i32 %B, ptr @G, align 4
  ret <vscale x 16 x i32> %a

T:                                                ; preds = %T, %entry
  %L2 = load i1, ptr %A1, align 1
  br i1 %L2, label %BB, label %T

F:                                                ; preds = %entry
  br label %BB
}

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vd4dots_mask_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32> %0, <vscale x 64 x i8> %1, <vscale x 64 x i8> %2, <vscale x 16 x i1> %3, i32 %4) #0 {
entry:
  %a = tail call <vscale x 16 x i32> @llvm.riscv.nds.vd4dots.mask.nxv16i32.nxv64i8.nxv64i8.i32(<vscale x 16 x i32> %0, <vscale x 64 x i8> %1, <vscale x 64 x i8> %2, <vscale x 16 x i1> %3, i32 %4, i32 2)
  %B = ashr <vscale x 16 x i32> %a, %0
  ret <vscale x 16 x i32> %B
}

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vd4dots_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, i32) #0

; Function Attrs: nounwind
define <vscale x 1 x i64> @intrinsic_vd4dots_mask_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64> %0, <vscale x 4 x i16> %1, <vscale x 4 x i16> %2, <vscale x 1 x i1> %3, i32 %4) #0 {
entry:
  %C = icmp sge i8 1, -128
  %a = tail call <vscale x 1 x i64> @llvm.riscv.nds.vd4dots.mask.nxv1i64.nxv4i16.nxv4i16.i32(<vscale x 1 x i64> %0, <vscale x 4 x i16> %1, <vscale x 4 x i16> %2, <vscale x 1 x i1> %3, i32 %4, i32 2)
  store i1 %C, ptr poison, align 1
  ret <vscale x 1 x i64> %a
}

; Function Attrs: nounwind
define <vscale x 2 x i64> @intrinsic_vd4dots_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64> %0, <vscale x 8 x i16> %1, <vscale x 8 x i16> %2, i32 %3) #0 {
entry:
  %a = tail call <vscale x 2 x i64> @llvm.riscv.nds.vd4dots.nxv2i64.nxv8i16.nxv8i16.i32(<vscale x 2 x i64> %0, <vscale x 8 x i16> %1, <vscale x 8 x i16> %2, i32 %3, i32 2)
  %B = sdiv <vscale x 2 x i64> %a, %a
  ret <vscale x 2 x i64> %B
}

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vd4dots_mask_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vd4dots_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vd4dots_mask_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vd4dots_vv_nxv8i64_nxv32i16_nxv32i16(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vd4dots_mask_vv_nxv8i64_nxv32i16_nxv32i16(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 8 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.nds.vd4dots.mask.nxv16i32.nxv64i8.nxv64i8.i32(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 16 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.nds.vd4dots.mask.nxv1i32.nxv4i8.nxv4i8.i32(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.nds.vd4dots.mask.nxv1i64.nxv4i16.nxv4i16.i32(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.nds.vd4dots.mask.nxv2i32.nxv8i8.nxv8i8.i32(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.nds.vd4dots.mask.nxv2i64.nxv8i16.nxv8i16.i32(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.nds.vd4dots.mask.nxv4i32.nxv16i8.nxv16i8.i32(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.nds.vd4dots.mask.nxv4i64.nxv16i16.nxv16i16.i32(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.nds.vd4dots.mask.nxv8i32.nxv32i8.nxv32i8.i32(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.nds.vd4dots.mask.nxv8i64.nxv32i16.nxv32i16.i32(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.nds.vd4dots.nxv16i32.nxv64i8.nxv64i8.i32(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.nds.vd4dots.nxv1i32.nxv4i8.nxv4i8.i32(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.nds.vd4dots.nxv1i64.nxv4i16.nxv4i16.i32(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.nds.vd4dots.nxv2i32.nxv8i8.nxv8i8.i32(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.nds.vd4dots.nxv2i64.nxv8i16.nxv8i16.i32(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.nds.vd4dots.nxv4i32.nxv16i8.nxv16i8.i32(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.nds.vd4dots.nxv4i64.nxv16i16.nxv16i16.i32(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.nds.vd4dots.nxv8i32.nxv32i8.nxv32i8.i32(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.nds.vd4dots.nxv8i64.nxv32i16.nxv32i16.i32(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, i32, i32 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32 -mattr=+zve64x,+xandesvdot,+zdinx,+m -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global <4 x float> splat (float f0x7F7FFFFF)
@G.2 = global <2 x i64> splat (i64 -9223372036854775808)
@G.3 = global i32 0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vd4dots_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, i32) #0

; Function Attrs: nounwind
define <vscale x 1 x i32> @intrinsic_vd4dots_mask_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32> %0, <vscale x 4 x i8> %1, <vscale x 4 x i8> %2, <vscale x 1 x i1> %3, i32 %4) #0 {
entry:
  %LGV = load <4 x float>, ptr @G.1, align 16
  %a = tail call <vscale x 1 x i32> @llvm.riscv.nds.vd4dots.mask.nxv1i32.nxv4i8.nxv4i8.i32(<vscale x 1 x i32> %0, <vscale x 4 x i8> %1, <vscale x 4 x i8> %2, <vscale x 1 x i1> %3, i32 %4, i32 2)
  %B = fmul <4 x float> zeroinitializer, %LGV
  store <4 x float> %B, ptr @G.1, align 16
  ret <vscale x 1 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vd4dots_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vd4dots_mask_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dots_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dots_mask_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vd4dots_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vd4dots_mask_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vd4dots_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vd4dots_mask_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 16 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vd4dots_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, i32) #0

; Function Attrs: nounwind
define <vscale x 1 x i64> @intrinsic_vd4dots_mask_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64> %0, <vscale x 4 x i16> %1, <vscale x 4 x i16> %2, <vscale x 1 x i1> %3, i32 %4) #0 {
entry:
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i1, ptr @G, align 1
  %B = xor i1 %LGV, false
  %a = tail call <vscale x 1 x i64> @llvm.riscv.nds.vd4dots.mask.nxv1i64.nxv4i16.nxv4i16.i32(<vscale x 1 x i64> %0, <vscale x 4 x i16> %1, <vscale x 4 x i16> %2, <vscale x 1 x i1> %3, i32 %4, i32 2)
  store i1 %B, ptr %A, align 1
  ret <vscale x 1 x i64> %a
}

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vd4dots_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, i32) #0

; Function Attrs: nounwind
define <vscale x 2 x i64> @intrinsic_vd4dots_mask_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64> %0, <vscale x 8 x i16> %1, <vscale x 8 x i16> %2, <vscale x 2 x i1> %3, i32 %4) #0 {
entry:
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i32, ptr @G.3, align 4
  %C = icmp eq i32 %4, %LGV
  %a = tail call <vscale x 2 x i64> @llvm.riscv.nds.vd4dots.mask.nxv2i64.nxv8i16.nxv8i16.i32(<vscale x 2 x i64> %0, <vscale x 8 x i16> %1, <vscale x 8 x i16> %2, <vscale x 2 x i1> %3, i32 %4, i32 2)
  store i1 %C, ptr %A, align 1
  ret <vscale x 2 x i64> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vd4dots_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, i32) #0

; Function Attrs: nounwind
define <vscale x 4 x i64> @intrinsic_vd4dots_mask_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64> %0, <vscale x 16 x i16> %1, <vscale x 16 x i16> %2, <vscale x 4 x i1> %3, i32 %4) #0 {
entry:
  %B = ashr <2 x i64> zeroinitializer, splat (i64 4294967296)
  %a = tail call <vscale x 4 x i64> @llvm.riscv.nds.vd4dots.mask.nxv4i64.nxv16i16.nxv16i16.i32(<vscale x 4 x i64> %0, <vscale x 16 x i16> %1, <vscale x 16 x i16> %2, <vscale x 4 x i1> %3, i32 %4, i32 2)
  store <2 x i64> %B, ptr @G.2, align 16
  ret <vscale x 4 x i64> %a
}

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vd4dots_vv_nxv8i64_nxv32i16_nxv32i16(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, i32) #0

; Function Attrs: nounwind
define <vscale x 8 x i64> @intrinsic_vd4dots_mask_vv_nxv8i64_nxv32i16_nxv32i16(<vscale x 8 x i64> %0, <vscale x 32 x i16> %1, <vscale x 32 x i16> %2, <vscale x 8 x i1> %3, i32 %4) #0 {
entry:
  %a = tail call <vscale x 8 x i64> @llvm.riscv.nds.vd4dots.mask.nxv8i64.nxv32i16.nxv32i16.i32(<vscale x 8 x i64> %0, <vscale x 32 x i16> %1, <vscale x 32 x i16> %2, <vscale x 8 x i1> %3, i32 %4, i32 2)
  %B = lshr <vscale x 32 x i16> %2, splat (i16 -32768)
  store <vscale x 32 x i16> %B, ptr poison, align 64
  ret <vscale x 8 x i64> %a
}

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

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zvknhb,+zfinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vsha2cl_vv_nxv4i32_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i32) #0

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vsha2cl_vv_nxv8i32_nxv8i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, i32 %3) #0 {
entry:
  %A = alloca i64, align 8
  %L1 = load i32, ptr %A, align 4
  store i64 poison, ptr %A, align 4
  %B = xor i64 1, 9223372036854775807
  %a = call <vscale x 8 x i32> @llvm.riscv.vsha2cl.nxv8i32.nxv8i32.i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, i32 %3, i32 2)
  store i64 %B, ptr %A, align 4
  %B2 = ashr i32 0, %L1
  store i32 %B2, ptr @G, align 4
  ret <vscale x 8 x i32> %a
}

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vsha2cl_vv_nxv16i32_nxv16i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, <vscale x 16 x i32> %2, i32 %3) #0 {
entry:
  %a = call <vscale x 16 x i32> @llvm.riscv.vsha2cl.nxv16i32.nxv16i32.i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, <vscale x 16 x i32> %2, i32 %3, i32 2)
  store <vscale x 16 x i32> %a, ptr poison, align 64
  ret <vscale x 16 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vsha2cl_vv_nxv4i64_nxv4i64(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i64>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vsha2cl_vv_nxv8i64_nxv8i64(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i64>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vsha2cl.nxv16i32.nxv16i32.i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vsha2cl.nxv4i32.nxv4i32.i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vsha2cl.nxv4i64.nxv4i64.i32(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i64>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vsha2cl.nxv8i32.nxv8i32.i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vsha2cl.nxv8i64.nxv8i64.i32(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i64>, i32, i32 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zvknhb,+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 1
@G.1 = global i8 16
@G.2 = global i1 false

; Function Attrs: nounwind
define <vscale x 4 x i32> @intrinsic_vsha2cl_vv_nxv4i32_nxv4i32(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, <vscale x 4 x i32> %2, i64 %3) #0 {
entry:
  %B1 = srem <vscale x 4 x i32> %2, %1
  %B = mul i128 42, -1
  %a = call <vscale x 4 x i32> @llvm.riscv.vsha2cl.nxv4i32.nxv4i32.i64(<vscale x 4 x i32> %B1, <vscale x 4 x i32> %1, <vscale x 4 x i32> %2, i64 %3, i64 2)
  store i128 %B, ptr @G, align 4
  ret <vscale x 4 x i32> %a
}

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vsha2cl_vv_nxv8i32_nxv8i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, i64 %3) #0 {
entry:
  %a = call <vscale x 8 x i32> @llvm.riscv.vsha2cl.nxv8i32.nxv8i32.i64(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, i64 %3, i64 2)
  %B = or i8 0, 0
  store i8 %B, ptr @G.1, align 1
  ret <vscale x 8 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vsha2cl_vv_nxv16i32_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i64) #0

; Function Attrs: nounwind
define <vscale x 4 x i64> @intrinsic_vsha2cl_vv_nxv4i64_nxv4i64(<vscale x 4 x i64> %0, <vscale x 4 x i64> %1, <vscale x 4 x i64> %2, i64 %3) #0 {
entry:
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i1, ptr @G.2, align 1
  %C = icmp slt i1 true, %LGV
  %I = insertelement <2 x i64> splat (i64 42), i64 %3, i64 %3
  %a = call <vscale x 4 x i64> @llvm.riscv.vsha2cl.nxv4i64.nxv4i64.i64(<vscale x 4 x i64> %0, <vscale x 4 x i64> %1, <vscale x 4 x i64> %2, i64 %3, i64 2)
  store <2 x i64> %I, ptr poison, align 16
  store i1 %C, ptr %A, align 1
  ret <vscale x 4 x i64> %a
}

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vsha2cl_vv_nxv8i64_nxv8i64(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i64>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vsha2cl.nxv16i32.nxv16i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vsha2cl.nxv4i32.nxv4i32.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vsha2cl.nxv4i64.nxv4i64.i64(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i64>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vsha2cl.nxv8i32.nxv8i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vsha2cl.nxv8i64.nxv8i64.i64(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i64>, i64, i64 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

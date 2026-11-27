; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zvknhb,+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 -170141183460469231731687303715884105728
@G.1 = global i128 -1

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vsha2ch_vv_nxv4i32_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vsha2ch_vv_nxv8i32_nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i32) #0

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vsha2ch_vv_nxv16i32_nxv16i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, <vscale x 16 x i32> %2, i32 %3) #0 {
entry:
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %a = call <vscale x 16 x i32> @llvm.riscv.vsha2ch.nxv16i32.nxv16i32.i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, <vscale x 16 x i32> %2, i32 %3, i32 2)
  %E = extractelement <vscale x 16 x i32> %a, i64 -9223372036854775808
  store i32 %E, ptr %A, align 4
  ret <vscale x 16 x i32> %a
}

; Function Attrs: nounwind
define <vscale x 4 x i64> @intrinsic_vsha2ch_vv_nxv4i64_nxv4i64(<vscale x 4 x i64> %0, <vscale x 4 x i64> %1, <vscale x 4 x i64> %2, i32 %3) #0 {
entry:
  %a = call <vscale x 4 x i64> @llvm.riscv.vsha2ch.nxv4i64.nxv4i64.i32(<vscale x 4 x i64> %0, <vscale x 4 x i64> %1, <vscale x 4 x i64> %2, i32 %3, i32 2)
  %B = and <vscale x 4 x i64> %0, %1
  store <vscale x 4 x i64> %B, ptr poison, align 32
  ret <vscale x 4 x i64> %a
}

; Function Attrs: nounwind
define <vscale x 8 x i64> @intrinsic_vsha2ch_vv_nxv8i64_nxv8i64(<vscale x 8 x i64> %0, <vscale x 8 x i64> %1, <vscale x 8 x i64> %2, i32 %3) #0 {
entry:
  %LGV = load i128, ptr @G, align 4
  %B = and i128 %LGV, 18446744073709551616
  %a = call <vscale x 8 x i64> @llvm.riscv.vsha2ch.nxv8i64.nxv8i64.i32(<vscale x 8 x i64> %0, <vscale x 8 x i64> %1, <vscale x 8 x i64> %2, i32 %3, i32 2)
  store i128 %B, ptr @G.1, align 4
  ret <vscale x 8 x i64> %a
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vsha2ch.nxv16i32.nxv16i32.i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vsha2ch.nxv4i32.nxv4i32.i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vsha2ch.nxv4i64.nxv4i64.i32(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i64>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vsha2ch.nxv8i32.nxv8i32.i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vsha2ch.nxv8i64.nxv8i64.i32(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i64>, i32, i32 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

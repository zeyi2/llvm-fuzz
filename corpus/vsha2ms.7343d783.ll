; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zvknha,+zvknhb,+zhinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 -9223372036854775808
@G.1 = global i1 true
@G.2 = global i64 9223372036854775807

; Function Attrs: nounwind
define <vscale x 4 x i32> @intrinsic_vsha2ms_vv_nxv4i32_nxv4i32(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, <vscale x 4 x i32> %2, i64 %3) #0 {
entry:
  %LGV = load i64, ptr @G.2, align 4
  %B = urem i64 %LGV, %3
  %a = call <vscale x 4 x i32> @llvm.riscv.vsha2ms.nxv4i32.nxv4i32.i64(<vscale x 4 x i32> %0, <vscale x 4 x i32> %1, <vscale x 4 x i32> %2, i64 %3, i64 2)
  store i64 %B, ptr @G, align 4
  ret <vscale x 4 x i32> %a
}

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vsha2ms_vv_nxv8i32_nxv8i32(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, i64 %3) #0 {
entry:
  %a = call <vscale x 8 x i32> @llvm.riscv.vsha2ms.nxv8i32.nxv8i32.i64(<vscale x 8 x i32> %0, <vscale x 8 x i32> %1, <vscale x 8 x i32> %2, i64 %3, i64 2)
  %C = icmp ne <vscale x 8 x i32> %0, %a
  store <vscale x 8 x i1> %C, ptr poison, align 1
  ret <vscale x 8 x i32> %a
}

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vsha2ms_vv_nxv16i32_nxv16i32(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, <vscale x 16 x i32> %2, i64 %3) #0 {
entry:
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %B = sub i64 1, 9223372036854775807
  %a = call <vscale x 16 x i32> @llvm.riscv.vsha2ms.nxv16i32.nxv16i32.i64(<vscale x 16 x i32> %0, <vscale x 16 x i32> %1, <vscale x 16 x i32> %2, i64 %3, i64 2)
  store i64 %B, ptr %A, align 4
  ret <vscale x 16 x i32> %a
}

; Function Attrs: nounwind
define <vscale x 4 x i64> @intrinsic_vsha2ms_vv_nxv4i64_nxv4i64(<vscale x 4 x i64> %0, <vscale x 4 x i64> %1, <vscale x 4 x i64> %2, i64 %3) #0 {
entry:
  %LGV = load i64, ptr @G, align 4
  %C = icmp ule i64 %LGV, 9223372036854775807
  %a = call <vscale x 4 x i64> @llvm.riscv.vsha2ms.nxv4i64.nxv4i64.i64(<vscale x 4 x i64> %0, <vscale x 4 x i64> %1, <vscale x 4 x i64> %2, i64 %3, i64 2)
  store i1 %C, ptr @G.1, align 1
  ret <vscale x 4 x i64> %a
}

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vsha2ms_vv_nxv8i64_nxv8i64(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i64>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vsha2ms.nxv16i32.nxv16i32.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vsha2ms.nxv4i32.nxv4i32.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vsha2ms.nxv4i64.nxv4i64.i64(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i64>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vsha2ms.nxv8i32.nxv8i32.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vsha2ms.nxv8i64.nxv8i64.i64(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i64>, i64, i64 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

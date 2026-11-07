; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zvksed,+zhinx,+zbb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float +qnan
@G.1 = global i1 true
@G.2 = global i128 -1

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vsm4k_vi_nxv4i32_i32(<vscale x 4 x i32>, i64) #0

; Function Attrs: nounwind
define <vscale x 8 x i32> @intrinsic_vsm4k_vi_nxv8i32_i32(<vscale x 8 x i32> %0, i64 %1) #0 {
entry:
  %LGV2 = load i128, ptr @G.2, align 4
  %LGV = load float, ptr @G, align 4
  %A = alloca i8, align 1
  %B3 = add i128 170141183460469231731687303715884105727, %LGV2
  store i8 poison, ptr %A, align 1
  %C = fcmp uno float %LGV, +qnan
  %a = call <vscale x 8 x i32> @llvm.riscv.vsm4k.nxv8i32.i64.i64(<vscale x 8 x i32> poison, <vscale x 8 x i32> %0, i64 2, i64 %1)
  %B = urem i8 1, 0
  store i8 %B, ptr %A, align 1
  store i1 %C, ptr @G.1, align 1
  store i128 %B3, ptr @G.2, align 4
  ret <vscale x 8 x i32> %a
}

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vsm4k_vi_nxv16i32_i32(<vscale x 16 x i32> %0, i64 %1) #0 {
entry:
  %B = and <vscale x 16 x i32> %0, zeroinitializer
  %S = shufflevector <8 x i8> splat (i8 -128), <8 x i8> zeroinitializer, <8 x i32> poison
  %C = icmp eq <vscale x 16 x i32> %B, splat (i32 -1)
  store <8 x i8> %S, ptr poison, align 8
  store <vscale x 16 x i1> %C, ptr poison, align 2
  ret <vscale x 16 x i32> %B
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vsm4k.nxv16i32.i64.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, i64 immarg, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vsm4k.nxv4i32.i64.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, i64 immarg, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vsm4k.nxv8i32.i64.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, i64 immarg, i64) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

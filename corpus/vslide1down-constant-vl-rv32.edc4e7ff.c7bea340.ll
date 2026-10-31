; isel-diff-config: -mtriple=riscv32 -riscv-v-vector-bits-max=64 -verify-machineinstrs -mattr=+zve64x,+zvl64b,+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 16)
@G.1 = global i128 0
@G.2 = global <4 x i32> splat (i32 65536)
@G.3 = global i64 42
@G.4 = global i1 true

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vslide1down_vx_nxv1i64_nxv1i64_i64_vl1(<vscale x 1 x i64>, i64) #0

; Function Attrs: nounwind
define <vscale x 1 x i64> @intrinsic_vslide1down_vx_nxv1i64_nxv1i64_i64_vl2(<vscale x 1 x i64> %0, i64 %1) #0 {
entry:
  %A = alloca <vscale x 1 x i64>, align 8
  store <vscale x 1 x i64> poison, ptr %A, align 8
  %a = call <vscale x 1 x i64> @llvm.riscv.vslide1down.nxv1i64.i64.i32(<vscale x 1 x i64> poison, <vscale x 1 x i64> %0, i64 %1, i32 2)
  %B1 = lshr <vscale x 1 x i64> %0, %0
  %B = sub <vscale x 1 x i64> %a, splat (i64 -9223372036854775808)
  store <vscale x 1 x i64> %B, ptr poison, align 8
  store <vscale x 1 x i64> %B1, ptr %A, align 8
  ret <vscale x 1 x i64> %a
}

; Function Attrs: nounwind
define <vscale x 1 x i64> @intrinsic_vslide1down_vx_nxv1i64_nxv1i64_i64_vl3(<vscale x 1 x i64> %0, i64 %1) #0 {
entry:
  %LGV1 = load i64, ptr @G.3, align 4
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %LGV = load <4 x i32>, ptr @G.2, align 16
  switch i64 %LGV1, label %SW_D [
    i64 2151761810435967831, label %SW_C
    i64 -8953974378101780075, label %SW_C2
    i64 -5185033573438159477, label %SW_C3
    i64 -5584844356885320945, label %SW_C4
  ]

BB:                                               ; preds = %SW_C4, %SW_C3, %SW_C, %SW_D
  %B = add <4 x i32> splat (i32 -1), %LGV
  %a = call <vscale x 1 x i64> @llvm.riscv.vslide1down.nxv1i64.i64.i32(<vscale x 1 x i64> poison, <vscale x 1 x i64> %0, i64 %1, i32 3)
  store <4 x i32> %B, ptr %A, align 16
  ret <vscale x 1 x i64> %a

SW_D:                                             ; preds = %entry
  br label %BB

SW_C:                                             ; preds = %entry
  br label %BB

SW_C2:                                            ; preds = %entry
  ret <vscale x 1 x i64> %0

SW_C3:                                            ; preds = %SW_C3, %entry
  %LGV5 = load i1, ptr @G.4, align 1
  br i1 %LGV5, label %BB, label %SW_C3

SW_C4:                                            ; preds = %entry
  br label %BB
}

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vslide1down_vx_nxv1i64_nxv1i64_i64_vl8(<vscale x 1 x i64>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vslide1down_vx_nxv1i64_nxv1i64_i64_vl9(<vscale x 1 x i64>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vslide1down_vx_nxv1i64_nxv1i64_i64_vl15(<vscale x 1 x i64>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vslide1down_vx_nxv1i64_nxv1i64_i64_vl16(<vscale x 1 x i64>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vslide1down_vx_nxv1i64_nxv1i64_i64_vl2047(<vscale x 1 x i64>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vslide1down_vx_nxv1i64_nxv1i64_i64_vl2048(<vscale x 1 x i64>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.vslide1down.nxv1i64.i64.i32(<vscale x 1 x i64>, <vscale x 1 x i64>, i64, i32) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

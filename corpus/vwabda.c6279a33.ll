; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-zvabd,+zhinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

declare <vscale x 1 x i16> @vwabda_vv_i8mf8(<vscale x 1 x i16>, <vscale x 1 x i8>, <vscale x 1 x i8>, i64)

declare <vscale x 1 x i16> @vwabda_vv_mask_i8mf8(<vscale x 1 x i16>, <vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i1>, i64)

declare <vscale x 2 x i16> @vwabda_vv_i8mf4(<vscale x 2 x i16>, <vscale x 2 x i8>, <vscale x 2 x i8>, i64)

declare <vscale x 2 x i16> @vwabda_vv_mask_i8mf4(<vscale x 2 x i16>, <vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i1>, i64)

declare <vscale x 4 x i16> @vwabda_vv_i8mf2(<vscale x 4 x i16>, <vscale x 4 x i8>, <vscale x 4 x i8>, i64)

declare <vscale x 4 x i16> @vwabda_vv_mask_i8mf2(<vscale x 4 x i16>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i1>, i64)

declare <vscale x 8 x i16> @vwabda_vv_i8m1(<vscale x 8 x i16>, <vscale x 8 x i8>, <vscale x 8 x i8>, i64)

declare <vscale x 8 x i16> @vwabda_vv_mask_i8m1(<vscale x 8 x i16>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i1>, i64)

declare <vscale x 16 x i16> @vwabda_vv_i8m2(<vscale x 16 x i16>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64)

declare <vscale x 16 x i16> @vwabda_vv_mask_i8m2(<vscale x 16 x i16>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i1>, i64)

declare <vscale x 32 x i16> @vwabda_vv_i8m4(<vscale x 32 x i16>, <vscale x 32 x i8>, <vscale x 32 x i8>, i64)

declare <vscale x 32 x i16> @vwabda_vv_mask_i8m4(<vscale x 32 x i16>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i1>, i64)

declare <vscale x 1 x i32> @vwabda_vv_i16mf4(<vscale x 1 x i32>, <vscale x 1 x i16>, <vscale x 1 x i16>, i64)

declare <vscale x 1 x i32> @vwabda_vv_mask_i16mf4(<vscale x 1 x i32>, <vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i1>, i64)

declare <vscale x 2 x i32> @vwabda_vv_i16mf2(<vscale x 2 x i32>, <vscale x 2 x i16>, <vscale x 2 x i16>, i64)

declare <vscale x 2 x i32> @vwabda_vv_mask_i16mf2(<vscale x 2 x i32>, <vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i1>, i64)

declare <vscale x 4 x i32> @vwabda_vv_i16m1(<vscale x 4 x i32>, <vscale x 4 x i16>, <vscale x 4 x i16>, i64)

declare <vscale x 4 x i32> @vwabda_vv_mask_i16m1(<vscale x 4 x i32>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i1>, i64)

declare <vscale x 8 x i32> @vwabda_vv_i16m2(<vscale x 8 x i32>, <vscale x 8 x i16>, <vscale x 8 x i16>, i64)

declare <vscale x 8 x i32> @vwabda_vv_mask_i16m2(<vscale x 8 x i32>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i1>, i64)

declare <vscale x 16 x i32> @vwabda_vv_i16m4(<vscale x 16 x i32>, <vscale x 16 x i16>, <vscale x 16 x i16>, i64)

declare <vscale x 16 x i32> @vwabda_vv_mask_i16m4(<vscale x 16 x i32>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i1>, i64)

declare <vscale x 1 x i16> @vwabda_vx_i8mf8(<vscale x 1 x i16>, <vscale x 1 x i8>, i64, i64)

declare <vscale x 1 x i16> @vwabda_vx_mask_i8mf8(<vscale x 1 x i16>, <vscale x 1 x i8>, i64, <vscale x 1 x i1>, i64)

declare <vscale x 2 x i16> @vwabda_vx_i8mf4(<vscale x 2 x i16>, <vscale x 2 x i8>, i64, i64)

declare <vscale x 2 x i16> @vwabda_vx_mask_i8mf4(<vscale x 2 x i16>, <vscale x 2 x i8>, i64, <vscale x 2 x i1>, i64)

declare <vscale x 4 x i16> @vwabda_vx_i8mf2(<vscale x 4 x i16>, <vscale x 4 x i8>, i64, i64)

declare <vscale x 4 x i16> @vwabda_vx_mask_i8mf2(<vscale x 4 x i16>, <vscale x 4 x i8>, i64, <vscale x 4 x i1>, i64)

declare <vscale x 8 x i16> @vwabda_vx_i8m1(<vscale x 8 x i16>, <vscale x 8 x i8>, i64, i64)

declare <vscale x 8 x i16> @vwabda_vx_mask_i8m1(<vscale x 8 x i16>, <vscale x 8 x i8>, i64, <vscale x 8 x i1>, i64)

declare <vscale x 16 x i16> @vwabda_vx_i8m2(<vscale x 16 x i16>, <vscale x 16 x i8>, i64, i64)

declare <vscale x 16 x i16> @vwabda_vx_mask_i8m2(<vscale x 16 x i16>, <vscale x 16 x i8>, i64, <vscale x 16 x i1>, i64)

declare <vscale x 32 x i16> @vwabda_vx_i8m4(<vscale x 32 x i16>, <vscale x 32 x i8>, i64, i64)

declare <vscale x 32 x i16> @vwabda_vx_mask_i8m4(<vscale x 32 x i16>, <vscale x 32 x i8>, i64, <vscale x 32 x i1>, i64)

declare <vscale x 1 x i32> @vwabda_vx_i16mf4(<vscale x 1 x i32>, <vscale x 1 x i16>, i64, i64)

declare <vscale x 1 x i32> @vwabda_vx_mask_i16mf4(<vscale x 1 x i32>, <vscale x 1 x i16>, i64, <vscale x 1 x i1>, i64)

declare <vscale x 2 x i32> @vwabda_vx_i16mf2(<vscale x 2 x i32>, <vscale x 2 x i16>, i64, i64)

declare <vscale x 2 x i32> @vwabda_vx_mask_i16mf2(<vscale x 2 x i32>, <vscale x 2 x i16>, i64, <vscale x 2 x i1>, i64)

declare <vscale x 4 x i32> @vwabda_vx_i16m1(<vscale x 4 x i32>, <vscale x 4 x i16>, i64, i64)

declare <vscale x 4 x i32> @vwabda_vx_mask_i16m1(<vscale x 4 x i32>, <vscale x 4 x i16>, i64, <vscale x 4 x i1>, i64)

declare <vscale x 8 x i32> @vwabda_vx_i16m2(<vscale x 8 x i32>, <vscale x 8 x i16>, i64, i64)

define <vscale x 8 x i32> @vwabda_vx_mask_i16m2(<vscale x 8 x i32> %vd, <vscale x 8 x i16> %vs2, i64 %rs1, <vscale x 8 x i1> %mask, i64 %vl) {
  %res = call <vscale x 8 x i32> @llvm.riscv.vwabda.mask.nxv8i32.nxv8i16.i64.i64(<vscale x 8 x i32> %vd, <vscale x 8 x i16> %vs2, i64 %rs1, <vscale x 8 x i1> %mask, i64 %vl, i64 0)
  %B = urem <vscale x 8 x i32> %res, %res
  ret <vscale x 8 x i32> %B
}

declare <vscale x 16 x i32> @vwabda_vx_i16m4(<vscale x 16 x i32>, <vscale x 16 x i16>, i64, i64)

declare <vscale x 16 x i32> @vwabda_vx_mask_i16m4(<vscale x 16 x i32>, <vscale x 16 x i16>, i64, <vscale x 16 x i1>, i64)

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vwabda.nxv16i32.nxv16i16.i64.i64(<vscale x 16 x i32>, <vscale x 16 x i16>, i64, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vwabda.nxv8i32.nxv8i16.i64.i64(<vscale x 8 x i32>, <vscale x 8 x i16>, i64, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vwabda.nxv4i32.nxv4i16.i64.i64(<vscale x 4 x i32>, <vscale x 4 x i16>, i64, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vwabda.nxv2i32.nxv2i16.i64.i64(<vscale x 2 x i32>, <vscale x 2 x i16>, i64, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vwabda.nxv1i32.nxv1i16.i64.i64(<vscale x 1 x i32>, <vscale x 1 x i16>, i64, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vwabda.nxv32i16.nxv32i8.i64.i64(<vscale x 32 x i16>, <vscale x 32 x i8>, i64, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vwabda.nxv16i16.nxv16i8.i64.i64(<vscale x 16 x i16>, <vscale x 16 x i8>, i64, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vwabda.nxv8i16.nxv8i8.i64.i64(<vscale x 8 x i16>, <vscale x 8 x i8>, i64, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vwabda.nxv4i16.nxv4i8.i64.i64(<vscale x 4 x i16>, <vscale x 4 x i8>, i64, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vwabda.nxv2i16.nxv2i8.i64.i64(<vscale x 2 x i16>, <vscale x 2 x i8>, i64, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vwabda.nxv1i16.nxv1i8.i64.i64(<vscale x 1 x i16>, <vscale x 1 x i8>, i64, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vwabda.nxv16i32.nxv16i16.nxv16i16.i64(<vscale x 16 x i32>, <vscale x 16 x i16>, <vscale x 16 x i16>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vwabda.nxv8i32.nxv8i16.nxv8i16.i64(<vscale x 8 x i32>, <vscale x 8 x i16>, <vscale x 8 x i16>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vwabda.nxv4i32.nxv4i16.nxv4i16.i64(<vscale x 4 x i32>, <vscale x 4 x i16>, <vscale x 4 x i16>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vwabda.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32>, <vscale x 2 x i16>, <vscale x 2 x i16>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vwabda.nxv1i32.nxv1i16.nxv1i16.i64(<vscale x 1 x i32>, <vscale x 1 x i16>, <vscale x 1 x i16>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vwabda.nxv32i16.nxv32i8.nxv32i8.i64(<vscale x 32 x i16>, <vscale x 32 x i8>, <vscale x 32 x i8>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vwabda.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vwabda.nxv8i16.nxv8i8.nxv8i8.i64(<vscale x 8 x i16>, <vscale x 8 x i8>, <vscale x 8 x i8>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vwabda.nxv4i16.nxv4i8.nxv4i8.i64(<vscale x 4 x i16>, <vscale x 4 x i8>, <vscale x 4 x i8>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vwabda.nxv2i16.nxv2i8.nxv2i8.i64(<vscale x 2 x i16>, <vscale x 2 x i8>, <vscale x 2 x i8>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vwabda.nxv1i16.nxv1i8.nxv1i8.i64(<vscale x 1 x i16>, <vscale x 1 x i8>, <vscale x 1 x i8>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vwabda.mask.nxv16i32.nxv16i16.i64.i64(<vscale x 16 x i32>, <vscale x 16 x i16>, i64, <vscale x 16 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vwabda.mask.nxv8i32.nxv8i16.i64.i64(<vscale x 8 x i32>, <vscale x 8 x i16>, i64, <vscale x 8 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vwabda.mask.nxv4i32.nxv4i16.i64.i64(<vscale x 4 x i32>, <vscale x 4 x i16>, i64, <vscale x 4 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vwabda.mask.nxv2i32.nxv2i16.i64.i64(<vscale x 2 x i32>, <vscale x 2 x i16>, i64, <vscale x 2 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vwabda.mask.nxv1i32.nxv1i16.i64.i64(<vscale x 1 x i32>, <vscale x 1 x i16>, i64, <vscale x 1 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vwabda.mask.nxv32i16.nxv32i8.i64.i64(<vscale x 32 x i16>, <vscale x 32 x i8>, i64, <vscale x 32 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vwabda.mask.nxv16i16.nxv16i8.i64.i64(<vscale x 16 x i16>, <vscale x 16 x i8>, i64, <vscale x 16 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vwabda.mask.nxv8i16.nxv8i8.i64.i64(<vscale x 8 x i16>, <vscale x 8 x i8>, i64, <vscale x 8 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vwabda.mask.nxv4i16.nxv4i8.i64.i64(<vscale x 4 x i16>, <vscale x 4 x i8>, i64, <vscale x 4 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vwabda.mask.nxv2i16.nxv2i8.i64.i64(<vscale x 2 x i16>, <vscale x 2 x i8>, i64, <vscale x 2 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vwabda.mask.nxv1i16.nxv1i8.i64.i64(<vscale x 1 x i16>, <vscale x 1 x i8>, i64, <vscale x 1 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vwabda.mask.nxv16i32.nxv16i16.nxv16i16.i64(<vscale x 16 x i32>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vwabda.mask.nxv8i32.nxv8i16.nxv8i16.i64(<vscale x 8 x i32>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vwabda.mask.nxv4i32.nxv4i16.nxv4i16.i64(<vscale x 4 x i32>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vwabda.mask.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32>, <vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vwabda.mask.nxv1i32.nxv1i16.nxv1i16.i64(<vscale x 1 x i32>, <vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vwabda.mask.nxv32i16.nxv32i8.nxv32i8.i64(<vscale x 32 x i16>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vwabda.mask.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vwabda.mask.nxv8i16.nxv8i8.nxv8i8.i64(<vscale x 8 x i16>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vwabda.mask.nxv4i16.nxv4i8.nxv4i8.i64(<vscale x 4 x i16>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vwabda.mask.nxv2i16.nxv2i8.nxv2i8.i64(<vscale x 2 x i16>, <vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i1>, i64, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vwabda.mask.nxv1i16.nxv1i8.nxv1i8.i64(<vscale x 1 x i16>, <vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i1>, i64, i64 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(none) }

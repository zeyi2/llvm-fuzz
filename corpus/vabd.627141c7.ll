; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-zvabd,+zfinx -O3 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false

declare <vscale x 1 x i8> @vabd_vv_i8mf8(<vscale x 1 x i8>, <vscale x 1 x i8>, i64)

declare <vscale x 1 x i8> @vabd_vv_mask_i8mf8(<vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i1>, i64)

declare <vscale x 2 x i8> @vabd_vv_i8mf4(<vscale x 2 x i8>, <vscale x 2 x i8>, i64)

declare <vscale x 2 x i8> @vabd_vv_mask_i8mf4(<vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i1>, i64)

declare <vscale x 4 x i8> @vabd_vv_i8mf2(<vscale x 4 x i8>, <vscale x 4 x i8>, i64)

declare <vscale x 4 x i8> @vabd_vv_mask_i8mf2(<vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i1>, i64)

declare <vscale x 8 x i8> @vabd_vv_i8m1(<vscale x 8 x i8>, <vscale x 8 x i8>, i64)

declare <vscale x 8 x i8> @vabd_vv_mask_i8m1(<vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i1>, i64)

declare <vscale x 16 x i8> @vabd_vv_i8m2(<vscale x 16 x i8>, <vscale x 16 x i8>, i64)

declare <vscale x 16 x i8> @vabd_vv_mask_i8m2(<vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i1>, i64)

declare <vscale x 32 x i8> @vabd_vv_i8m4(<vscale x 32 x i8>, <vscale x 32 x i8>, i64)

declare <vscale x 32 x i8> @vabd_vv_mask_i8m4(<vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i1>, i64)

define <vscale x 64 x i8> @vabd_vv_i8m8(<vscale x 64 x i8> %a, <vscale x 64 x i8> %b, i64 %vl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i1, ptr @G, align 1
  %C = icmp ult i1 %LGV, true
  %res = call <vscale x 64 x i8> @llvm.riscv.vabd.nxv64i8.nxv64i8.i64(<vscale x 64 x i8> poison, <vscale x 64 x i8> %a, <vscale x 64 x i8> %b, i64 %vl)
  store i1 %C, ptr %A, align 1
  ret <vscale x 64 x i8> %res
}

declare <vscale x 64 x i8> @vabd_vv_mask_i8m8(<vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 64 x i1>, i64)

declare <vscale x 1 x i16> @vabd_vv_i16mf4(<vscale x 1 x i16>, <vscale x 1 x i16>, i64)

declare <vscale x 1 x i16> @vabd_vv_mask_i16mf4(<vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i1>, i64)

declare <vscale x 2 x i16> @vabd_vv_i16mf2(<vscale x 2 x i16>, <vscale x 2 x i16>, i64)

declare <vscale x 2 x i16> @vabd_vv_mask_i16mf2(<vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i1>, i64)

declare <vscale x 4 x i16> @vabd_vv_i16m1(<vscale x 4 x i16>, <vscale x 4 x i16>, i64)

declare <vscale x 4 x i16> @vabd_vv_mask_i16m1(<vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i1>, i64)

declare <vscale x 8 x i16> @vabd_vv_i16m2(<vscale x 8 x i16>, <vscale x 8 x i16>, i64)

declare <vscale x 8 x i16> @vabd_vv_mask_i16m2(<vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i1>, i64)

declare <vscale x 16 x i16> @vabd_vv_i16m4(<vscale x 16 x i16>, <vscale x 16 x i16>, i64)

declare <vscale x 16 x i16> @vabd_vv_mask_i16m4(<vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i1>, i64)

declare <vscale x 32 x i16> @vabd_vv_i16m8(<vscale x 32 x i16>, <vscale x 32 x i16>, i64)

declare <vscale x 32 x i16> @vabd_vv_mask_i16m8(<vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 32 x i1>, i64)

declare <vscale x 1 x i32> @vabd_vx_i32mf2(<vscale x 1 x i32>, i64, i64)

declare <vscale x 1 x i32> @vabd_vx_mask_i32mf2(<vscale x 1 x i32>, <vscale x 1 x i32>, i64, <vscale x 1 x i1>, i64)

declare <vscale x 2 x i32> @vabd_vv_i32m1(<vscale x 2 x i32>, <vscale x 2 x i32>, i64)

declare <vscale x 2 x i32> @vabd_vx_i32m1(<vscale x 2 x i32>, i64, i64)

declare <vscale x 2 x i32> @vabd_vx_mask_i32m1(<vscale x 2 x i32>, <vscale x 2 x i32>, i64, <vscale x 2 x i1>, i64)

declare <vscale x 4 x i32> @vabd_vx_i32m2(<vscale x 4 x i32>, i64, i64)

declare <vscale x 4 x i32> @vabd_vx_mask_i32m2(<vscale x 4 x i32>, <vscale x 4 x i32>, i64, <vscale x 4 x i1>, i64)

declare <vscale x 8 x i32> @vabd_vx_i32m4(<vscale x 8 x i32>, i64, i64)

define <vscale x 8 x i32> @vabd_vx_mask_i32m4(<vscale x 8 x i32> %passthru, <vscale x 8 x i32> %a, i64 %b, <vscale x 8 x i1> %mask, i64 %vl) {
  %res = call <vscale x 8 x i32> @llvm.riscv.vabd.mask.nxv8i32.i64.i64(<vscale x 8 x i32> %passthru, <vscale x 8 x i32> %a, i64 %b, <vscale x 8 x i1> %mask, i64 %vl, i64 1)
  %B = mul <vscale x 8 x i32> %res, %passthru
  ret <vscale x 8 x i32> %B
}

declare <vscale x 16 x i32> @vabd_vx_i32m8(<vscale x 16 x i32>, i64, i64)

declare <vscale x 16 x i32> @vabd_vx_mask_i32m8(<vscale x 16 x i32>, <vscale x 16 x i32>, i64, <vscale x 16 x i1>, i64)

declare <vscale x 1 x i64> @vabd_vv_i64m1(<vscale x 1 x i64>, <vscale x 1 x i64>, i64)

declare <vscale x 1 x i64> @vabd_vx_i64m1(<vscale x 1 x i64>, i64, i64)

declare <vscale x 1 x i64> @vabd_vx_mask_i64m1(<vscale x 1 x i64>, <vscale x 1 x i64>, i64, <vscale x 1 x i1>, i64)

declare <vscale x 2 x i64> @vabd_vx_i64m2(<vscale x 2 x i64>, i64, i64)

declare <vscale x 2 x i64> @vabd_vx_mask_i64m2(<vscale x 2 x i64>, <vscale x 2 x i64>, i64, <vscale x 2 x i1>, i64)

declare <vscale x 4 x i64> @vabd_vx_i64m4(<vscale x 4 x i64>, i64, i64)

declare <vscale x 4 x i64> @vabd_vx_mask_i64m4(<vscale x 4 x i64>, <vscale x 4 x i64>, i64, <vscale x 4 x i1>, i64)

declare <vscale x 8 x i64> @vabd_vx_i64m8(<vscale x 8 x i64>, i64, i64)

declare <vscale x 8 x i64> @vabd_vx_mask_i64m8(<vscale x 8 x i64>, <vscale x 8 x i64>, i64, <vscale x 8 x i1>, i64)

declare <vscale x 4 x i32> @vwabda_i16(<vscale x 4 x i32>, <vscale x 4 x i16>, <vscale x 4 x i16>)

declare <vscale x 4 x i32> @vwabdau_i16(<vscale x 4 x i32>, <vscale x 4 x i16>, <vscale x 4 x i16>)

declare <vscale x 4 x i16> @wide_abd_is_not_narrow_operand(<vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i8>)

declare <vscale x 4 x i32> @vwabda_mask_mismatch(<vscale x 4 x i32>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i1>)

declare <vscale x 4 x i32> @vwabda_vl_mismatch(<vscale x 4 x i32>, <vscale x 4 x i16>, <vscale x 4 x i16>, i64)

declare <4 x i16> @vwabdau_combine_i16(<4 x i8>, <4 x i8>, <4 x i8>)

declare <4 x i32> @vwabdau_combine_i32(<4 x i16>, <4 x i16>, <4 x i16>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i32> @llvm.abs.nxv4i32(<vscale x 4 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.abs.v4i16(<4 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.abs.v4i8(<4 x i8>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vabd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i16>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vabd.nxv8i64.i64.i64(<vscale x 8 x i64>, <vscale x 8 x i64>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vabd.nxv4i64.i64.i64(<vscale x 4 x i64>, <vscale x 4 x i64>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.vabd.nxv2i64.i64.i64(<vscale x 2 x i64>, <vscale x 2 x i64>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.vabd.nxv1i64.i64.i64(<vscale x 1 x i64>, <vscale x 1 x i64>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.vabd.nxv1i64.nxv1i64.i64(<vscale x 1 x i64>, <vscale x 1 x i64>, <vscale x 1 x i64>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vabd.nxv16i32.i64.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vabd.nxv8i32.i64.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vabd.nxv4i32.i64.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vabd.nxv2i32.i64.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vabd.nxv2i32.nxv2i32.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vabd.nxv1i32.i64.i64(<vscale x 1 x i32>, <vscale x 1 x i32>, i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vabd.nxv32i16.nxv32i16.i64(<vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 32 x i16>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vabd.nxv16i16.nxv16i16.i64(<vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i16>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vabd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vabd.nxv2i16.nxv2i16.i64(<vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i16>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vabd.nxv1i16.nxv1i16.i64(<vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i16>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 64 x i8> @llvm.riscv.vabd.nxv64i8.nxv64i8.i64(<vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 64 x i8>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i8> @llvm.riscv.vabd.nxv32i8.nxv32i8.i64(<vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i8>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i8> @llvm.riscv.vabd.nxv16i8.nxv16i8.i64(<vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i8> @llvm.riscv.vabd.nxv8i8.nxv8i8.i64(<vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i8>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i8> @llvm.riscv.vabd.nxv4i8.nxv4i8.i64(<vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i8>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i8> @llvm.riscv.vabd.nxv2i8.nxv2i8.i64(<vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i8>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i8> @llvm.riscv.vabd.nxv1i8.nxv1i8.i64(<vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i8>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vabd.mask.nxv4i16.nxv4i16.i64(<vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vabd.mask.nxv8i64.i64.i64(<vscale x 8 x i64>, <vscale x 8 x i64>, i64, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vabd.mask.nxv4i64.i64.i64(<vscale x 4 x i64>, <vscale x 4 x i64>, i64, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.vabd.mask.nxv2i64.i64.i64(<vscale x 2 x i64>, <vscale x 2 x i64>, i64, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.vabd.mask.nxv1i64.i64.i64(<vscale x 1 x i64>, <vscale x 1 x i64>, i64, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vabd.mask.nxv16i32.i64.i64(<vscale x 16 x i32>, <vscale x 16 x i32>, i64, <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vabd.mask.nxv8i32.i64.i64(<vscale x 8 x i32>, <vscale x 8 x i32>, i64, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vabd.mask.nxv4i32.i64.i64(<vscale x 4 x i32>, <vscale x 4 x i32>, i64, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vabd.mask.nxv2i32.i64.i64(<vscale x 2 x i32>, <vscale x 2 x i32>, i64, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vabd.mask.nxv1i32.i64.i64(<vscale x 1 x i32>, <vscale x 1 x i32>, i64, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vabd.mask.nxv32i16.nxv32i16.i64(<vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 32 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vabd.mask.nxv16i16.nxv16i16.i64(<vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vabd.mask.nxv8i16.nxv8i16.i64(<vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vabd.mask.nxv2i16.nxv2i16.i64(<vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vabd.mask.nxv1i16.nxv1i16.i64(<vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 64 x i8> @llvm.riscv.vabd.mask.nxv64i8.nxv64i8.i64(<vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 64 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i8> @llvm.riscv.vabd.mask.nxv32i8.nxv32i8.i64(<vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i8> @llvm.riscv.vabd.mask.nxv16i8.nxv16i8.i64(<vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i8> @llvm.riscv.vabd.mask.nxv8i8.nxv8i8.i64(<vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i8> @llvm.riscv.vabd.mask.nxv4i8.nxv4i8.i64(<vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i8> @llvm.riscv.vabd.mask.nxv2i8.nxv2i8.i64(<vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i8> @llvm.riscv.vabd.mask.nxv1i8.nxv1i8.i64(<vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i1>, i64, i64 immarg) #1

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

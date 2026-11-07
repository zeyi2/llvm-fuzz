; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+v -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i1 false
@G.2 = global <4 x i32> splat (i32 -1)

; Function Attrs: nounwind
declare <vscale x 1 x i8> @intrinsic_vmulh_vv_nxv1i8_nxv1i8_nxv1i8(<vscale x 1 x i8>, <vscale x 1 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i8> @intrinsic_vmulh_mask_vv_nxv1i8_nxv1i8_nxv1i8(<vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i8> @intrinsic_vmulh_vv_nxv2i8_nxv2i8_nxv2i8(<vscale x 2 x i8>, <vscale x 2 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i8> @intrinsic_vmulh_mask_vv_nxv2i8_nxv2i8_nxv2i8(<vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i8> @intrinsic_vmulh_vv_nxv4i8_nxv4i8_nxv4i8(<vscale x 4 x i8>, <vscale x 4 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i8> @intrinsic_vmulh_mask_vv_nxv4i8_nxv4i8_nxv4i8(<vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i8> @intrinsic_vmulh_vv_nxv8i8_nxv8i8_nxv8i8(<vscale x 8 x i8>, <vscale x 8 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i8> @intrinsic_vmulh_mask_vv_nxv8i8_nxv8i8_nxv8i8(<vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i8> @intrinsic_vmulh_vv_nxv16i8_nxv16i8_nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>, i32) #0

; Function Attrs: nounwind
define <vscale x 16 x i8> @intrinsic_vmulh_mask_vv_nxv16i8_nxv16i8_nxv16i8(<vscale x 16 x i8> %0, <vscale x 16 x i8> %1, <vscale x 16 x i8> %2, <vscale x 16 x i1> %3, i32 %4) #0 {
entry:
  %LGV = load <4 x i32>, ptr @G.2, align 16
  %a = call <vscale x 16 x i8> @llvm.riscv.vmulh.mask.nxv16i8.nxv16i8.i32(<vscale x 16 x i8> %0, <vscale x 16 x i8> %1, <vscale x 16 x i8> %2, <vscale x 16 x i1> %3, i32 %4, i32 1)
  %C = icmp eq <4 x i32> splat (i32 -1), %LGV
  store <4 x i1> %C, ptr poison, align 1
  ret <vscale x 16 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 32 x i8> @intrinsic_vmulh_vv_nxv32i8_nxv32i8_nxv32i8(<vscale x 32 x i8>, <vscale x 32 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 32 x i8> @intrinsic_vmulh_mask_vv_nxv32i8_nxv32i8_nxv32i8(<vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 64 x i8> @intrinsic_vmulh_vv_nxv64i8_nxv64i8_nxv64i8(<vscale x 64 x i8>, <vscale x 64 x i8>, i32) #0

; Function Attrs: nounwind
declare <vscale x 64 x i8> @intrinsic_vmulh_mask_vv_nxv64i8_nxv64i8_nxv64i8(<vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 64 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i16> @intrinsic_vmulh_vv_nxv1i16_nxv1i16_nxv1i16(<vscale x 1 x i16>, <vscale x 1 x i16>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i16> @intrinsic_vmulh_mask_vv_nxv1i16_nxv1i16_nxv1i16(<vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i16> @intrinsic_vmulh_vv_nxv2i16_nxv2i16_nxv2i16(<vscale x 2 x i16>, <vscale x 2 x i16>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i16> @intrinsic_vmulh_mask_vv_nxv2i16_nxv2i16_nxv2i16(<vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i16> @intrinsic_vmulh_vv_nxv4i16_nxv4i16_nxv4i16(<vscale x 4 x i16>, <vscale x 4 x i16>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i16> @intrinsic_vmulh_mask_vv_nxv4i16_nxv4i16_nxv4i16(<vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i16> @intrinsic_vmulh_vv_nxv8i16_nxv8i16_nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i16> @intrinsic_vmulh_mask_vv_nxv8i16_nxv8i16_nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i16> @intrinsic_vmulh_vv_nxv16i16_nxv16i16_nxv16i16(<vscale x 16 x i16>, <vscale x 16 x i16>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i16> @intrinsic_vmulh_mask_vv_nxv16i16_nxv16i16_nxv16i16(<vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 32 x i16> @intrinsic_vmulh_vv_nxv32i16_nxv32i16_nxv32i16(<vscale x 32 x i16>, <vscale x 32 x i16>, i32) #0

; Function Attrs: nounwind
declare <vscale x 32 x i16> @intrinsic_vmulh_mask_vv_nxv32i16_nxv32i16_nxv32i16(<vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 32 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vmulh_vv_nxv1i32_nxv1i32_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vmulh_mask_vv_nxv1i32_nxv1i32_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vmulh_vv_nxv2i32_nxv2i32_nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vmulh_mask_vv_nxv2i32_nxv2i32_nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vmulh_vv_nxv4i32_nxv4i32_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vmulh_mask_vv_nxv4i32_nxv4i32_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vmulh_vv_nxv8i32_nxv8i32_nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vmulh_mask_vv_nxv8i32_nxv8i32_nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vmulh_vv_nxv16i32_nxv16i32_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vmulh_mask_vv_nxv16i32_nxv16i32_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vmulh_vv_nxv1i64_nxv1i64_nxv1i64(<vscale x 1 x i64>, <vscale x 1 x i64>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vmulh_mask_vv_nxv1i64_nxv1i64_nxv1i64(<vscale x 1 x i64>, <vscale x 1 x i64>, <vscale x 1 x i64>, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vmulh_vv_nxv2i64_nxv2i64_nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vmulh_mask_vv_nxv2i64_nxv2i64_nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vmulh_vv_nxv4i64_nxv4i64_nxv4i64(<vscale x 4 x i64>, <vscale x 4 x i64>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vmulh_mask_vv_nxv4i64_nxv4i64_nxv4i64(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vmulh_vv_nxv8i64_nxv8i64_nxv8i64(<vscale x 8 x i64>, <vscale x 8 x i64>, i32) #0

; Function Attrs: nounwind
define <vscale x 8 x i64> @intrinsic_vmulh_mask_vv_nxv8i64_nxv8i64_nxv8i64(<vscale x 8 x i64> %0, <vscale x 8 x i64> %1, <vscale x 8 x i64> %2, <vscale x 8 x i1> %3, i32 %4) #0 {
entry:
  %a = call <vscale x 8 x i64> @llvm.riscv.vmulh.mask.nxv8i64.nxv8i64.i32(<vscale x 8 x i64> %0, <vscale x 8 x i64> %1, <vscale x 8 x i64> %2, <vscale x 8 x i1> %3, i32 %4, i32 1)
  %B = and <vscale x 8 x i64> %0, %a
  store <vscale x 8 x i64> %B, ptr poison, align 64
  ret <vscale x 8 x i64> %a
}

; Function Attrs: nounwind
define <vscale x 1 x i8> @intrinsic_vmulh_vx_nxv1i8_nxv1i8_i8(<vscale x 1 x i8> %0, i8 %1, i32 %2) #0 {
entry:
  %LGV1 = load i1, ptr @G.1, align 1
  %LGV = load i1, ptr @G, align 1
  %C = icmp sle i1 %LGV, %LGV1
  %a = call <vscale x 1 x i8> @llvm.riscv.vmulh.nxv1i8.i8.i32(<vscale x 1 x i8> poison, <vscale x 1 x i8> %0, i8 %1, i32 %2)
  store i1 %C, ptr @G, align 1
  ret <vscale x 1 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 1 x i8> @intrinsic_vmulh_mask_vx_nxv1i8_nxv1i8_i8(<vscale x 1 x i8>, <vscale x 1 x i8>, i8, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i8> @intrinsic_vmulh_vx_nxv2i8_nxv2i8_i8(<vscale x 2 x i8>, i8, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i8> @intrinsic_vmulh_mask_vx_nxv2i8_nxv2i8_i8(<vscale x 2 x i8>, <vscale x 2 x i8>, i8, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i8> @intrinsic_vmulh_vx_nxv4i8_nxv4i8_i8(<vscale x 4 x i8>, i8, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i8> @intrinsic_vmulh_mask_vx_nxv4i8_nxv4i8_i8(<vscale x 4 x i8>, <vscale x 4 x i8>, i8, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i8> @intrinsic_vmulh_vx_nxv8i8_nxv8i8_i8(<vscale x 8 x i8>, i8, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i8> @intrinsic_vmulh_mask_vx_nxv8i8_nxv8i8_i8(<vscale x 8 x i8>, <vscale x 8 x i8>, i8, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i8> @intrinsic_vmulh_vx_nxv16i8_nxv16i8_i8(<vscale x 16 x i8>, i8, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i8> @intrinsic_vmulh_mask_vx_nxv16i8_nxv16i8_i8(<vscale x 16 x i8>, <vscale x 16 x i8>, i8, <vscale x 16 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 32 x i8> @intrinsic_vmulh_vx_nxv32i8_nxv32i8_i8(<vscale x 32 x i8>, i8, i32) #0

; Function Attrs: nounwind
declare <vscale x 32 x i8> @intrinsic_vmulh_mask_vx_nxv32i8_nxv32i8_i8(<vscale x 32 x i8>, <vscale x 32 x i8>, i8, <vscale x 32 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 64 x i8> @intrinsic_vmulh_vx_nxv64i8_nxv64i8_i8(<vscale x 64 x i8>, i8, i32) #0

; Function Attrs: nounwind
declare <vscale x 64 x i8> @intrinsic_vmulh_mask_vx_nxv64i8_nxv64i8_i8(<vscale x 64 x i8>, <vscale x 64 x i8>, i8, <vscale x 64 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i16> @intrinsic_vmulh_vx_nxv1i16_nxv1i16_i16(<vscale x 1 x i16>, i16, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i16> @intrinsic_vmulh_mask_vx_nxv1i16_nxv1i16_i16(<vscale x 1 x i16>, <vscale x 1 x i16>, i16, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i16> @intrinsic_vmulh_vx_nxv2i16_nxv2i16_i16(<vscale x 2 x i16>, i16, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i16> @intrinsic_vmulh_mask_vx_nxv2i16_nxv2i16_i16(<vscale x 2 x i16>, <vscale x 2 x i16>, i16, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i16> @intrinsic_vmulh_vx_nxv4i16_nxv4i16_i16(<vscale x 4 x i16>, i16, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i16> @intrinsic_vmulh_mask_vx_nxv4i16_nxv4i16_i16(<vscale x 4 x i16>, <vscale x 4 x i16>, i16, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i16> @intrinsic_vmulh_vx_nxv8i16_nxv8i16_i16(<vscale x 8 x i16>, i16, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i16> @intrinsic_vmulh_mask_vx_nxv8i16_nxv8i16_i16(<vscale x 8 x i16>, <vscale x 8 x i16>, i16, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i16> @intrinsic_vmulh_vx_nxv16i16_nxv16i16_i16(<vscale x 16 x i16>, i16, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i16> @intrinsic_vmulh_mask_vx_nxv16i16_nxv16i16_i16(<vscale x 16 x i16>, <vscale x 16 x i16>, i16, <vscale x 16 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 32 x i16> @intrinsic_vmulh_vx_nxv32i16_nxv32i16_i16(<vscale x 32 x i16>, i16, i32) #0

; Function Attrs: nounwind
declare <vscale x 32 x i16> @intrinsic_vmulh_mask_vx_nxv32i16_nxv32i16_i16(<vscale x 32 x i16>, <vscale x 32 x i16>, i16, <vscale x 32 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vmulh_vx_nxv1i32_nxv1i32_i32(<vscale x 1 x i32>, i32, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vmulh_mask_vx_nxv1i32_nxv1i32_i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vmulh_vx_nxv2i32_nxv2i32_i32(<vscale x 2 x i32>, i32, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vmulh_mask_vx_nxv2i32_nxv2i32_i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vmulh_vx_nxv4i32_nxv4i32_i32(<vscale x 4 x i32>, i32, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vmulh_mask_vx_nxv4i32_nxv4i32_i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vmulh_vx_nxv8i32_nxv8i32_i32(<vscale x 8 x i32>, i32, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vmulh_mask_vx_nxv8i32_nxv8i32_i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vmulh_vx_nxv16i32_nxv16i32_i32(<vscale x 16 x i32>, i32, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vmulh_mask_vx_nxv16i32_nxv16i32_i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, <vscale x 16 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vmulh_vx_nxv1i64_nxv1i64_i64(<vscale x 1 x i64>, i64, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vmulh_mask_vx_nxv1i64_nxv1i64_i64(<vscale x 1 x i64>, <vscale x 1 x i64>, i64, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vmulh_vx_nxv2i64_nxv2i64_i64(<vscale x 2 x i64>, i64, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vmulh_mask_vx_nxv2i64_nxv2i64_i64(<vscale x 2 x i64>, <vscale x 2 x i64>, i64, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vmulh_vx_nxv4i64_nxv4i64_i64(<vscale x 4 x i64>, i64, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vmulh_mask_vx_nxv4i64_nxv4i64_i64(<vscale x 4 x i64>, <vscale x 4 x i64>, i64, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vmulh_vx_nxv8i64_nxv8i64_i64(<vscale x 8 x i64>, i64, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vmulh_mask_vx_nxv8i64_nxv8i64_i64(<vscale x 8 x i64>, <vscale x 8 x i64>, i64, <vscale x 8 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vmulh.mask.nxv16i16.i16.i32(<vscale x 16 x i16>, <vscale x 16 x i16>, i16, <vscale x 16 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vmulh.mask.nxv16i16.nxv16i16.i32(<vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vmulh.mask.nxv16i32.i32.i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, <vscale x 16 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vmulh.mask.nxv16i32.nxv16i32.i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i8> @llvm.riscv.vmulh.mask.nxv16i8.i8.i32(<vscale x 16 x i8>, <vscale x 16 x i8>, i8, <vscale x 16 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i8> @llvm.riscv.vmulh.mask.nxv16i8.nxv16i8.i32(<vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vmulh.mask.nxv1i16.i16.i32(<vscale x 1 x i16>, <vscale x 1 x i16>, i16, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vmulh.mask.nxv1i16.nxv1i16.i32(<vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vmulh.mask.nxv1i32.i32.i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vmulh.mask.nxv1i32.nxv1i32.i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.vmulh.mask.nxv1i64.i64.i32(<vscale x 1 x i64>, <vscale x 1 x i64>, i64, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.vmulh.mask.nxv1i64.nxv1i64.i32(<vscale x 1 x i64>, <vscale x 1 x i64>, <vscale x 1 x i64>, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i8> @llvm.riscv.vmulh.mask.nxv1i8.i8.i32(<vscale x 1 x i8>, <vscale x 1 x i8>, i8, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i8> @llvm.riscv.vmulh.mask.nxv1i8.nxv1i8.i32(<vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vmulh.mask.nxv2i16.i16.i32(<vscale x 2 x i16>, <vscale x 2 x i16>, i16, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vmulh.mask.nxv2i16.nxv2i16.i32(<vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vmulh.mask.nxv2i32.i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vmulh.mask.nxv2i32.nxv2i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.vmulh.mask.nxv2i64.i64.i32(<vscale x 2 x i64>, <vscale x 2 x i64>, i64, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.vmulh.mask.nxv2i64.nxv2i64.i32(<vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i8> @llvm.riscv.vmulh.mask.nxv2i8.i8.i32(<vscale x 2 x i8>, <vscale x 2 x i8>, i8, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i8> @llvm.riscv.vmulh.mask.nxv2i8.nxv2i8.i32(<vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vmulh.mask.nxv32i16.i16.i32(<vscale x 32 x i16>, <vscale x 32 x i16>, i16, <vscale x 32 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vmulh.mask.nxv32i16.nxv32i16.i32(<vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 32 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i8> @llvm.riscv.vmulh.mask.nxv32i8.i8.i32(<vscale x 32 x i8>, <vscale x 32 x i8>, i8, <vscale x 32 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i8> @llvm.riscv.vmulh.mask.nxv32i8.nxv32i8.i32(<vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vmulh.mask.nxv4i16.i16.i32(<vscale x 4 x i16>, <vscale x 4 x i16>, i16, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vmulh.mask.nxv4i16.nxv4i16.i32(<vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vmulh.mask.nxv4i32.i32.i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vmulh.mask.nxv4i32.nxv4i32.i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vmulh.mask.nxv4i64.i64.i32(<vscale x 4 x i64>, <vscale x 4 x i64>, i64, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vmulh.mask.nxv4i64.nxv4i64.i32(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i8> @llvm.riscv.vmulh.mask.nxv4i8.i8.i32(<vscale x 4 x i8>, <vscale x 4 x i8>, i8, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i8> @llvm.riscv.vmulh.mask.nxv4i8.nxv4i8.i32(<vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 64 x i8> @llvm.riscv.vmulh.mask.nxv64i8.i8.i32(<vscale x 64 x i8>, <vscale x 64 x i8>, i8, <vscale x 64 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 64 x i8> @llvm.riscv.vmulh.mask.nxv64i8.nxv64i8.i32(<vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 64 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vmulh.mask.nxv8i16.i16.i32(<vscale x 8 x i16>, <vscale x 8 x i16>, i16, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vmulh.mask.nxv8i16.nxv8i16.i32(<vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vmulh.mask.nxv8i32.i32.i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vmulh.mask.nxv8i32.nxv8i32.i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vmulh.mask.nxv8i64.i64.i32(<vscale x 8 x i64>, <vscale x 8 x i64>, i64, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vmulh.mask.nxv8i64.nxv8i64.i32(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i8> @llvm.riscv.vmulh.mask.nxv8i8.i8.i32(<vscale x 8 x i8>, <vscale x 8 x i8>, i8, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i8> @llvm.riscv.vmulh.mask.nxv8i8.nxv8i8.i32(<vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vmulh.nxv16i16.i16.i32(<vscale x 16 x i16>, <vscale x 16 x i16>, i16, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vmulh.nxv16i16.nxv16i16.i32(<vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i16>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vmulh.nxv16i32.i32.i32(<vscale x 16 x i32>, <vscale x 16 x i32>, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vmulh.nxv16i32.nxv16i32.i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i8> @llvm.riscv.vmulh.nxv16i8.i8.i32(<vscale x 16 x i8>, <vscale x 16 x i8>, i8, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i8> @llvm.riscv.vmulh.nxv16i8.nxv16i8.i32(<vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vmulh.nxv1i16.i16.i32(<vscale x 1 x i16>, <vscale x 1 x i16>, i16, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vmulh.nxv1i16.nxv1i16.i32(<vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i16>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vmulh.nxv1i32.i32.i32(<vscale x 1 x i32>, <vscale x 1 x i32>, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vmulh.nxv1i32.nxv1i32.i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i32>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.vmulh.nxv1i64.i64.i32(<vscale x 1 x i64>, <vscale x 1 x i64>, i64, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.vmulh.nxv1i64.nxv1i64.i32(<vscale x 1 x i64>, <vscale x 1 x i64>, <vscale x 1 x i64>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i8> @llvm.riscv.vmulh.nxv1i8.i8.i32(<vscale x 1 x i8>, <vscale x 1 x i8>, i8, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i8> @llvm.riscv.vmulh.nxv1i8.nxv1i8.i32(<vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i8>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vmulh.nxv2i16.i16.i32(<vscale x 2 x i16>, <vscale x 2 x i16>, i16, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vmulh.nxv2i16.nxv2i16.i32(<vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i16>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vmulh.nxv2i32.i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vmulh.nxv2i32.nxv2i32.i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i32>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.vmulh.nxv2i64.i64.i32(<vscale x 2 x i64>, <vscale x 2 x i64>, i64, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.vmulh.nxv2i64.nxv2i64.i32(<vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i8> @llvm.riscv.vmulh.nxv2i8.i8.i32(<vscale x 2 x i8>, <vscale x 2 x i8>, i8, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i8> @llvm.riscv.vmulh.nxv2i8.nxv2i8.i32(<vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i8>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vmulh.nxv32i16.i16.i32(<vscale x 32 x i16>, <vscale x 32 x i16>, i16, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vmulh.nxv32i16.nxv32i16.i32(<vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 32 x i16>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i8> @llvm.riscv.vmulh.nxv32i8.i8.i32(<vscale x 32 x i8>, <vscale x 32 x i8>, i8, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i8> @llvm.riscv.vmulh.nxv32i8.nxv32i8.i32(<vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i8>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vmulh.nxv4i16.i16.i32(<vscale x 4 x i16>, <vscale x 4 x i16>, i16, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vmulh.nxv4i16.nxv4i16.i32(<vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i16>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vmulh.nxv4i32.i32.i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vmulh.nxv4i32.nxv4i32.i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vmulh.nxv4i64.i64.i32(<vscale x 4 x i64>, <vscale x 4 x i64>, i64, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vmulh.nxv4i64.nxv4i64.i32(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i64>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i8> @llvm.riscv.vmulh.nxv4i8.i8.i32(<vscale x 4 x i8>, <vscale x 4 x i8>, i8, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i8> @llvm.riscv.vmulh.nxv4i8.nxv4i8.i32(<vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i8>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 64 x i8> @llvm.riscv.vmulh.nxv64i8.i8.i32(<vscale x 64 x i8>, <vscale x 64 x i8>, i8, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 64 x i8> @llvm.riscv.vmulh.nxv64i8.nxv64i8.i32(<vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 64 x i8>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vmulh.nxv8i16.i16.i32(<vscale x 8 x i16>, <vscale x 8 x i16>, i16, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vmulh.nxv8i16.nxv8i16.i32(<vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vmulh.nxv8i32.i32.i32(<vscale x 8 x i32>, <vscale x 8 x i32>, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vmulh.nxv8i32.nxv8i32.i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vmulh.nxv8i64.i64.i32(<vscale x 8 x i64>, <vscale x 8 x i64>, i64, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vmulh.nxv8i64.nxv8i64.i32(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i64>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i8> @llvm.riscv.vmulh.nxv8i8.i8.i32(<vscale x 8 x i8>, <vscale x 8 x i8>, i8, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i8> @llvm.riscv.vmulh.nxv8i8.nxv8i8.i32(<vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i8>, i32) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

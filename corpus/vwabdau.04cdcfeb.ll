; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+experimental-zvabd,+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false

declare <vscale x 1 x i16> @vwabdau_vv_i8mf8(<vscale x 1 x i16>, <vscale x 1 x i8>, <vscale x 1 x i8>, i32)

declare <vscale x 1 x i16> @vwabdau_vv_mask_i8mf8(<vscale x 1 x i16>, <vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i1>, i32)

declare <vscale x 2 x i16> @vwabdau_vv_i8mf4(<vscale x 2 x i16>, <vscale x 2 x i8>, <vscale x 2 x i8>, i32)

declare <vscale x 2 x i16> @vwabdau_vv_mask_i8mf4(<vscale x 2 x i16>, <vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i1>, i32)

declare <vscale x 4 x i16> @vwabdau_vv_i8mf2(<vscale x 4 x i16>, <vscale x 4 x i8>, <vscale x 4 x i8>, i32)

declare <vscale x 4 x i16> @vwabdau_vv_mask_i8mf2(<vscale x 4 x i16>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i1>, i32)

declare <vscale x 8 x i16> @vwabdau_vv_i8m1(<vscale x 8 x i16>, <vscale x 8 x i8>, <vscale x 8 x i8>, i32)

declare <vscale x 8 x i16> @vwabdau_vv_mask_i8m1(<vscale x 8 x i16>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i1>, i32)

declare <vscale x 16 x i16> @vwabdau_vv_i8m2(<vscale x 16 x i16>, <vscale x 16 x i8>, <vscale x 16 x i8>, i32)

declare <vscale x 16 x i16> @vwabdau_vv_mask_i8m2(<vscale x 16 x i16>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i1>, i32)

declare <vscale x 32 x i16> @vwabdau_vv_i8m4(<vscale x 32 x i16>, <vscale x 32 x i8>, <vscale x 32 x i8>, i32)

define <vscale x 32 x i16> @vwabdau_vv_mask_i8m4(<vscale x 32 x i16> %vd, <vscale x 32 x i8> %a, <vscale x 32 x i8> %b, <vscale x 32 x i1> %mask, i32 %vl) {
  %A = alloca <vscale x 32 x i1>, align 4
  store <vscale x 32 x i1> poison, ptr %A, align 4
  %res = call <vscale x 32 x i16> @llvm.riscv.vwabdau.mask.nxv32i16.nxv32i8.nxv32i8.i32(<vscale x 32 x i16> %vd, <vscale x 32 x i8> %a, <vscale x 32 x i8> %b, <vscale x 32 x i1> %mask, i32 %vl, i32 0)
  %C = icmp sge <vscale x 32 x i16> %res, splat (i16 42)
  store <vscale x 32 x i1> %C, ptr %A, align 4
  ret <vscale x 32 x i16> %res
}

declare <vscale x 1 x i32> @vwabdau_vv_i16mf4(<vscale x 1 x i32>, <vscale x 1 x i16>, <vscale x 1 x i16>, i32)

declare <vscale x 1 x i32> @vwabdau_vv_mask_i16mf4(<vscale x 1 x i32>, <vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i1>, i32)

declare <vscale x 2 x i32> @vwabdau_vv_i16mf2(<vscale x 2 x i32>, <vscale x 2 x i16>, <vscale x 2 x i16>, i32)

declare <vscale x 2 x i32> @vwabdau_vv_mask_i16mf2(<vscale x 2 x i32>, <vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i1>, i32)

declare <vscale x 4 x i32> @vwabdau_vv_i16m1(<vscale x 4 x i32>, <vscale x 4 x i16>, <vscale x 4 x i16>, i32)

declare <vscale x 4 x i32> @vwabdau_vv_mask_i16m1(<vscale x 4 x i32>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i1>, i32)

declare <vscale x 8 x i32> @vwabdau_vv_i16m2(<vscale x 8 x i32>, <vscale x 8 x i16>, <vscale x 8 x i16>, i32)

declare <vscale x 8 x i32> @vwabdau_vv_mask_i16m2(<vscale x 8 x i32>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i1>, i32)

define <vscale x 16 x i32> @vwabdau_vv_i16m4(<vscale x 16 x i32> %vd, <vscale x 16 x i16> %a, <vscale x 16 x i16> %b, i32 %vl) {
  %res = call <vscale x 16 x i32> @llvm.riscv.vwabdau.nxv16i32.nxv16i16.nxv16i16.i32(<vscale x 16 x i32> %vd, <vscale x 16 x i16> %a, <vscale x 16 x i16> %b, i32 %vl, i32 0)
  %C = fcmp ult double 1.000000e+00, 1.000000e+00
  store i1 %C, ptr @G, align 1
  ret <vscale x 16 x i32> %res
}

declare <vscale x 16 x i32> @vwabdau_vv_mask_i16m4(<vscale x 16 x i32>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i1>, i32)

declare <vscale x 1 x i16> @vwabdau_vx_i8mf8(<vscale x 1 x i16>, <vscale x 1 x i8>, i32, i32)

declare <vscale x 1 x i16> @vwabdau_vx_mask_i8mf8(<vscale x 1 x i16>, <vscale x 1 x i8>, i32, <vscale x 1 x i1>, i32)

define <vscale x 2 x i16> @vwabdau_vx_i8mf4(<vscale x 2 x i16> %vd, <vscale x 2 x i8> %vs2, i32 %rs1, i32 %vl) {
  %B = shl i32 %vl, %vl
  %res = call <vscale x 2 x i16> @llvm.riscv.vwabdau.nxv2i16.nxv2i8.i32.i32(<vscale x 2 x i16> %vd, <vscale x 2 x i8> %vs2, i32 %rs1, i32 %vl, i32 0)
  store i32 %B, ptr poison, align 4
  ret <vscale x 2 x i16> %res
}

declare <vscale x 2 x i16> @vwabdau_vx_mask_i8mf4(<vscale x 2 x i16>, <vscale x 2 x i8>, i32, <vscale x 2 x i1>, i32)

define <vscale x 4 x i16> @vwabdau_vx_i8mf2(<vscale x 4 x i16> %vd, <vscale x 4 x i8> %vs2, i32 %rs1, i32 %vl) {
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %B = urem i8 0, 127
  %res = call <vscale x 4 x i16> @llvm.riscv.vwabdau.nxv4i16.nxv4i8.i32.i32(<vscale x 4 x i16> %vd, <vscale x 4 x i8> %vs2, i32 %rs1, i32 %vl, i32 0)
  store i8 %B, ptr %A, align 1
  ret <vscale x 4 x i16> %res
}

declare <vscale x 4 x i16> @vwabdau_vx_mask_i8mf2(<vscale x 4 x i16>, <vscale x 4 x i8>, i32, <vscale x 4 x i1>, i32)

define <vscale x 8 x i16> @vwabdau_vx_i8m1(<vscale x 8 x i16> %vd, <vscale x 8 x i8> %vs2, i32 %rs1, i32 %vl) {
  %B = lshr i128 18446744073709551616, 1
  %res = call <vscale x 8 x i16> @llvm.riscv.vwabdau.nxv8i16.nxv8i8.i32.i32(<vscale x 8 x i16> %vd, <vscale x 8 x i8> %vs2, i32 %rs1, i32 %vl, i32 0)
  store i128 %B, ptr poison, align 4
  ret <vscale x 8 x i16> %res
}

declare <vscale x 8 x i16> @vwabdau_vx_mask_i8m1(<vscale x 8 x i16>, <vscale x 8 x i8>, i32, <vscale x 8 x i1>, i32)

declare <vscale x 16 x i16> @vwabdau_vx_i8m2(<vscale x 16 x i16>, <vscale x 16 x i8>, i32, i32)

declare <vscale x 16 x i16> @vwabdau_vx_mask_i8m2(<vscale x 16 x i16>, <vscale x 16 x i8>, i32, <vscale x 16 x i1>, i32)

define <vscale x 32 x i16> @vwabdau_vx_i8m4(<vscale x 32 x i16> %vd, <vscale x 32 x i8> %vs2, i32 %rs1, i32 %vl) {
  %res = call <vscale x 32 x i16> @llvm.riscv.vwabdau.nxv32i16.nxv32i8.i32.i32(<vscale x 32 x i16> %vd, <vscale x 32 x i8> %vs2, i32 %rs1, i32 %vl, i32 0)
  %C = icmp slt i32 %vl, 42
  store i1 %C, ptr @G, align 1
  ret <vscale x 32 x i16> %res
}

declare <vscale x 32 x i16> @vwabdau_vx_mask_i8m4(<vscale x 32 x i16>, <vscale x 32 x i8>, i32, <vscale x 32 x i1>, i32)

declare <vscale x 1 x i32> @vwabdau_vx_i16mf4(<vscale x 1 x i32>, <vscale x 1 x i16>, i32, i32)

declare <vscale x 1 x i32> @vwabdau_vx_mask_i16mf4(<vscale x 1 x i32>, <vscale x 1 x i16>, i32, <vscale x 1 x i1>, i32)

declare <vscale x 2 x i32> @vwabdau_vx_i16mf2(<vscale x 2 x i32>, <vscale x 2 x i16>, i32, i32)

declare <vscale x 2 x i32> @vwabdau_vx_mask_i16mf2(<vscale x 2 x i32>, <vscale x 2 x i16>, i32, <vscale x 2 x i1>, i32)

declare <vscale x 4 x i32> @vwabdau_vx_i16m1(<vscale x 4 x i32>, <vscale x 4 x i16>, i32, i32)

declare <vscale x 4 x i32> @vwabdau_vx_mask_i16m1(<vscale x 4 x i32>, <vscale x 4 x i16>, i32, <vscale x 4 x i1>, i32)

declare <vscale x 8 x i32> @vwabdau_vx_i16m2(<vscale x 8 x i32>, <vscale x 8 x i16>, i32, i32)

declare <vscale x 8 x i32> @vwabdau_vx_mask_i16m2(<vscale x 8 x i32>, <vscale x 8 x i16>, i32, <vscale x 8 x i1>, i32)

declare <vscale x 16 x i32> @vwabdau_vx_i16m4(<vscale x 16 x i32>, <vscale x 16 x i16>, i32, i32)

declare <vscale x 16 x i32> @vwabdau_vx_mask_i16m4(<vscale x 16 x i32>, <vscale x 16 x i16>, i32, <vscale x 16 x i1>, i32)

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vwabdau.nxv16i32.nxv16i16.i32.i32(<vscale x 16 x i32>, <vscale x 16 x i16>, i32, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vwabdau.nxv8i32.nxv8i16.i32.i32(<vscale x 8 x i32>, <vscale x 8 x i16>, i32, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vwabdau.nxv4i32.nxv4i16.i32.i32(<vscale x 4 x i32>, <vscale x 4 x i16>, i32, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vwabdau.nxv2i32.nxv2i16.i32.i32(<vscale x 2 x i32>, <vscale x 2 x i16>, i32, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vwabdau.nxv1i32.nxv1i16.i32.i32(<vscale x 1 x i32>, <vscale x 1 x i16>, i32, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vwabdau.nxv32i16.nxv32i8.i32.i32(<vscale x 32 x i16>, <vscale x 32 x i8>, i32, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vwabdau.nxv16i16.nxv16i8.i32.i32(<vscale x 16 x i16>, <vscale x 16 x i8>, i32, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vwabdau.nxv8i16.nxv8i8.i32.i32(<vscale x 8 x i16>, <vscale x 8 x i8>, i32, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vwabdau.nxv4i16.nxv4i8.i32.i32(<vscale x 4 x i16>, <vscale x 4 x i8>, i32, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vwabdau.nxv2i16.nxv2i8.i32.i32(<vscale x 2 x i16>, <vscale x 2 x i8>, i32, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vwabdau.nxv1i16.nxv1i8.i32.i32(<vscale x 1 x i16>, <vscale x 1 x i8>, i32, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vwabdau.nxv16i32.nxv16i16.nxv16i16.i32(<vscale x 16 x i32>, <vscale x 16 x i16>, <vscale x 16 x i16>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vwabdau.nxv8i32.nxv8i16.nxv8i16.i32(<vscale x 8 x i32>, <vscale x 8 x i16>, <vscale x 8 x i16>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vwabdau.nxv4i32.nxv4i16.nxv4i16.i32(<vscale x 4 x i32>, <vscale x 4 x i16>, <vscale x 4 x i16>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vwabdau.nxv2i32.nxv2i16.nxv2i16.i32(<vscale x 2 x i32>, <vscale x 2 x i16>, <vscale x 2 x i16>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vwabdau.nxv1i32.nxv1i16.nxv1i16.i32(<vscale x 1 x i32>, <vscale x 1 x i16>, <vscale x 1 x i16>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vwabdau.nxv32i16.nxv32i8.nxv32i8.i32(<vscale x 32 x i16>, <vscale x 32 x i8>, <vscale x 32 x i8>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vwabdau.nxv16i16.nxv16i8.nxv16i8.i32(<vscale x 16 x i16>, <vscale x 16 x i8>, <vscale x 16 x i8>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vwabdau.nxv8i16.nxv8i8.nxv8i8.i32(<vscale x 8 x i16>, <vscale x 8 x i8>, <vscale x 8 x i8>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vwabdau.nxv4i16.nxv4i8.nxv4i8.i32(<vscale x 4 x i16>, <vscale x 4 x i8>, <vscale x 4 x i8>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vwabdau.nxv2i16.nxv2i8.nxv2i8.i32(<vscale x 2 x i16>, <vscale x 2 x i8>, <vscale x 2 x i8>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vwabdau.nxv1i16.nxv1i8.nxv1i8.i32(<vscale x 1 x i16>, <vscale x 1 x i8>, <vscale x 1 x i8>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vwabdau.mask.nxv16i32.nxv16i16.i32.i32(<vscale x 16 x i32>, <vscale x 16 x i16>, i32, <vscale x 16 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vwabdau.mask.nxv8i32.nxv8i16.i32.i32(<vscale x 8 x i32>, <vscale x 8 x i16>, i32, <vscale x 8 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vwabdau.mask.nxv4i32.nxv4i16.i32.i32(<vscale x 4 x i32>, <vscale x 4 x i16>, i32, <vscale x 4 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vwabdau.mask.nxv2i32.nxv2i16.i32.i32(<vscale x 2 x i32>, <vscale x 2 x i16>, i32, <vscale x 2 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vwabdau.mask.nxv1i32.nxv1i16.i32.i32(<vscale x 1 x i32>, <vscale x 1 x i16>, i32, <vscale x 1 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vwabdau.mask.nxv32i16.nxv32i8.i32.i32(<vscale x 32 x i16>, <vscale x 32 x i8>, i32, <vscale x 32 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vwabdau.mask.nxv16i16.nxv16i8.i32.i32(<vscale x 16 x i16>, <vscale x 16 x i8>, i32, <vscale x 16 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vwabdau.mask.nxv8i16.nxv8i8.i32.i32(<vscale x 8 x i16>, <vscale x 8 x i8>, i32, <vscale x 8 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vwabdau.mask.nxv4i16.nxv4i8.i32.i32(<vscale x 4 x i16>, <vscale x 4 x i8>, i32, <vscale x 4 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vwabdau.mask.nxv2i16.nxv2i8.i32.i32(<vscale x 2 x i16>, <vscale x 2 x i8>, i32, <vscale x 2 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vwabdau.mask.nxv1i16.nxv1i8.i32.i32(<vscale x 1 x i16>, <vscale x 1 x i8>, i32, <vscale x 1 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vwabdau.mask.nxv16i32.nxv16i16.nxv16i16.i32(<vscale x 16 x i32>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vwabdau.mask.nxv8i32.nxv8i16.nxv8i16.i32(<vscale x 8 x i32>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vwabdau.mask.nxv4i32.nxv4i16.nxv4i16.i32(<vscale x 4 x i32>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vwabdau.mask.nxv2i32.nxv2i16.nxv2i16.i32(<vscale x 2 x i32>, <vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.vwabdau.mask.nxv1i32.nxv1i16.nxv1i16.i32(<vscale x 1 x i32>, <vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i16> @llvm.riscv.vwabdau.mask.nxv32i16.nxv32i8.nxv32i8.i32(<vscale x 32 x i16>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vwabdau.mask.nxv16i16.nxv16i8.nxv16i8.i32(<vscale x 16 x i16>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vwabdau.mask.nxv8i16.nxv8i8.nxv8i8.i32(<vscale x 8 x i16>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vwabdau.mask.nxv4i16.nxv4i8.nxv4i8.i32(<vscale x 4 x i16>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vwabdau.mask.nxv2i16.nxv2i8.nxv2i8.i32(<vscale x 2 x i16>, <vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i1>, i32, i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i16> @llvm.riscv.vwabdau.mask.nxv1i16.nxv1i8.nxv1i8.i32(<vscale x 1 x i16>, <vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i1>, i32, i32 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(none) }

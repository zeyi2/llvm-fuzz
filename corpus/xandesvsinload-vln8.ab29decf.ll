; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32 -mattr=+zve64x,+xandesvsintload,+zbs,+zhinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 0
@G.1 = global i8 -128

; Function Attrs: nounwind
declare <vscale x 1 x i8> @intrinsic_nds_vln_v_nxv1i8_nxv1i8(ptr, i32) #0

; Function Attrs: nounwind
declare <vscale x 1 x i8> @intrinsic_nds_vln_mask_v_nxv1i8_nxv1i8(<vscale x 1 x i8>, ptr, <vscale x 1 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i8> @intrinsic_nds_vln_v_nxv2i8_nxv2i8(ptr, i32) #0

; Function Attrs: nounwind
define <vscale x 2 x i8> @intrinsic_nds_vln_mask_v_nxv2i8_nxv2i8(<vscale x 2 x i8> %0, ptr %1, <vscale x 2 x i1> %2, i32 %3) #0 {
entry:
  %a = call <vscale x 2 x i8> @llvm.riscv.nds.vln.mask.nxv2i8.p0.i32(<vscale x 2 x i8> %0, ptr %1, <vscale x 2 x i1> %2, i32 %3, i32 1)
  %B = urem <4 x i32> zeroinitializer, splat (i32 2147483647)
  store <4 x i32> %B, ptr poison, align 16
  ret <vscale x 2 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i8> @intrinsic_nds_vln_v_nxv4i8_nxv4i8(ptr, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i8> @intrinsic_nds_vln_mask_v_nxv4i8_nxv4i8(<vscale x 4 x i8>, ptr, <vscale x 4 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i8> @intrinsic_nds_vln_v_nxv8i8_nxv8i8(ptr, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i8> @intrinsic_nds_vln_mask_v_nxv8i8_nxv8i8(<vscale x 8 x i8>, ptr, <vscale x 8 x i1>, i32) #0

; Function Attrs: nounwind
define <vscale x 16 x i8> @intrinsic_nds_vln_v_nxv16i8_nxv16i8(ptr %0, i32 %1) #0 {
entry:
  %G = getelementptr ptr, ptr %0, i1 false
  %LGV = load i8, ptr %G, align 1
  %B = sdiv i8 %LGV, -128
  %a = call <vscale x 16 x i8> @llvm.riscv.nds.vln.nxv16i8.p0.i32(<vscale x 16 x i8> poison, ptr %0, i32 %1)
  store i8 %B, ptr @G.1, align 1
  ret <vscale x 16 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 16 x i8> @intrinsic_nds_vln_mask_v_nxv16i8_nxv16i8(<vscale x 16 x i8>, ptr, <vscale x 16 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 32 x i8> @intrinsic_nds_vln_v_nxv32i8_nxv32i8(ptr, i32) #0

; Function Attrs: nounwind
declare <vscale x 32 x i8> @intrinsic_nds_vln_mask_v_nxv32i8_nxv32i8(<vscale x 32 x i8>, ptr, <vscale x 32 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 64 x i8> @intrinsic_nds_vln_v_nxv64i8_nxv64i8(ptr, i32) #0

; Function Attrs: nounwind
declare <vscale x 64 x i8> @intrinsic_nds_vln_mask_v_nxv64i8_nxv64i8(<vscale x 64 x i8>, ptr, <vscale x 64 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 16 x i8> @llvm.riscv.nds.vln.mask.nxv16i8.p0.i32(<vscale x 16 x i8>, ptr captures(none), <vscale x 16 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i8> @llvm.riscv.nds.vln.mask.nxv1i8.p0.i32(<vscale x 1 x i8>, ptr captures(none), <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x i8> @llvm.riscv.nds.vln.mask.nxv2i8.p0.i32(<vscale x 2 x i8>, ptr captures(none), <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 32 x i8> @llvm.riscv.nds.vln.mask.nxv32i8.p0.i32(<vscale x 32 x i8>, ptr captures(none), <vscale x 32 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x i8> @llvm.riscv.nds.vln.mask.nxv4i8.p0.i32(<vscale x 4 x i8>, ptr captures(none), <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 64 x i8> @llvm.riscv.nds.vln.mask.nxv64i8.p0.i32(<vscale x 64 x i8>, ptr captures(none), <vscale x 64 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x i8> @llvm.riscv.nds.vln.mask.nxv8i8.p0.i32(<vscale x 8 x i8>, ptr captures(none), <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 16 x i8> @llvm.riscv.nds.vln.nxv16i8.p0.i32(<vscale x 16 x i8>, ptr captures(none), i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i8> @llvm.riscv.nds.vln.nxv1i8.p0.i32(<vscale x 1 x i8>, ptr captures(none), i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x i8> @llvm.riscv.nds.vln.nxv2i8.p0.i32(<vscale x 2 x i8>, ptr captures(none), i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 32 x i8> @llvm.riscv.nds.vln.nxv32i8.p0.i32(<vscale x 32 x i8>, ptr captures(none), i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x i8> @llvm.riscv.nds.vln.nxv4i8.p0.i32(<vscale x 4 x i8>, ptr captures(none), i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 64 x i8> @llvm.riscv.nds.vln.nxv64i8.p0.i32(<vscale x 64 x i8>, ptr captures(none), i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x i8> @llvm.riscv.nds.vln.nxv8i8.p0.i32(<vscale x 8 x i8>, ptr captures(none), i32) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }

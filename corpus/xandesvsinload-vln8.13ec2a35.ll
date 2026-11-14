; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64 -mattr=+zve64x,+xandesvsintload,+zihintpause,+zhinx -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double +inf
@G.1 = global double +qnan

; Function Attrs: nounwind
declare <vscale x 1 x i8> @intrinsic_nds_vln_v_nxv1i8_nxv1i8(ptr, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i8> @intrinsic_nds_vln_mask_v_nxv1i8_nxv1i8(<vscale x 1 x i8>, ptr, <vscale x 1 x i1>, i64) #0

; Function Attrs: nounwind
define <vscale x 2 x i8> @intrinsic_nds_vln_v_nxv2i8_nxv2i8(ptr %0, i64 %1) #0 {
entry:
  %a = call <vscale x 2 x i8> @llvm.riscv.nds.vln.nxv2i8.p0.i64(<vscale x 2 x i8> poison, ptr %0, i64 %1)
  %B = xor <vscale x 2 x i8> %a, %a
  ret <vscale x 2 x i8> %B
}

; Function Attrs: nounwind
declare <vscale x 2 x i8> @intrinsic_nds_vln_mask_v_nxv2i8_nxv2i8(<vscale x 2 x i8>, ptr, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i8> @intrinsic_nds_vln_v_nxv4i8_nxv4i8(ptr, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i8> @intrinsic_nds_vln_mask_v_nxv4i8_nxv4i8(<vscale x 4 x i8>, ptr, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
define <vscale x 8 x i8> @intrinsic_nds_vln_v_nxv8i8_nxv8i8(ptr %0, i64 %1) #0 {
entry:
  %A = alloca double, align 8
  store double poison, ptr %A, align 8
  %LGV1 = load double, ptr @G.1, align 8
  %LGV = load double, ptr @G, align 8
  %B = fsub double %LGV, %LGV1
  %a = call <vscale x 8 x i8> @llvm.riscv.nds.vln.nxv8i8.p0.i64(<vscale x 8 x i8> poison, ptr %0, i64 %1)
  store double %B, ptr %A, align 8
  ret <vscale x 8 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 8 x i8> @intrinsic_nds_vln_mask_v_nxv8i8_nxv8i8(<vscale x 8 x i8>, ptr, <vscale x 8 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i8> @intrinsic_nds_vln_v_nxv16i8_nxv16i8(ptr, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i8> @intrinsic_nds_vln_mask_v_nxv16i8_nxv16i8(<vscale x 16 x i8>, ptr, <vscale x 16 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 32 x i8> @intrinsic_nds_vln_v_nxv32i8_nxv32i8(ptr, i64) #0

; Function Attrs: nounwind
declare <vscale x 32 x i8> @intrinsic_nds_vln_mask_v_nxv32i8_nxv32i8(<vscale x 32 x i8>, ptr, <vscale x 32 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 64 x i8> @intrinsic_nds_vln_v_nxv64i8_nxv64i8(ptr, i64) #0

; Function Attrs: nounwind
define <vscale x 64 x i8> @intrinsic_nds_vln_mask_v_nxv64i8_nxv64i8(<vscale x 64 x i8> %0, ptr %1, <vscale x 64 x i1> %2, i64 %3) #0 {
entry:
  %B = ashr <vscale x 64 x i1> %2, splat (i1 true)
  %a = call <vscale x 64 x i8> @llvm.riscv.nds.vln.mask.nxv64i8.p0.i64(<vscale x 64 x i8> %0, ptr %1, <vscale x 64 x i1> %B, i64 %3, i64 1)
  ret <vscale x 64 x i8> %a
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 16 x i8> @llvm.riscv.nds.vln.mask.nxv16i8.p0.i64(<vscale x 16 x i8>, ptr captures(none), <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i8> @llvm.riscv.nds.vln.mask.nxv1i8.p0.i64(<vscale x 1 x i8>, ptr captures(none), <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x i8> @llvm.riscv.nds.vln.mask.nxv2i8.p0.i64(<vscale x 2 x i8>, ptr captures(none), <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 32 x i8> @llvm.riscv.nds.vln.mask.nxv32i8.p0.i64(<vscale x 32 x i8>, ptr captures(none), <vscale x 32 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x i8> @llvm.riscv.nds.vln.mask.nxv4i8.p0.i64(<vscale x 4 x i8>, ptr captures(none), <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 64 x i8> @llvm.riscv.nds.vln.mask.nxv64i8.p0.i64(<vscale x 64 x i8>, ptr captures(none), <vscale x 64 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x i8> @llvm.riscv.nds.vln.mask.nxv8i8.p0.i64(<vscale x 8 x i8>, ptr captures(none), <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 16 x i8> @llvm.riscv.nds.vln.nxv16i8.p0.i64(<vscale x 16 x i8>, ptr captures(none), i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i8> @llvm.riscv.nds.vln.nxv1i8.p0.i64(<vscale x 1 x i8>, ptr captures(none), i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x i8> @llvm.riscv.nds.vln.nxv2i8.p0.i64(<vscale x 2 x i8>, ptr captures(none), i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 32 x i8> @llvm.riscv.nds.vln.nxv32i8.p0.i64(<vscale x 32 x i8>, ptr captures(none), i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x i8> @llvm.riscv.nds.vln.nxv4i8.p0.i64(<vscale x 4 x i8>, ptr captures(none), i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 64 x i8> @llvm.riscv.nds.vln.nxv64i8.p0.i64(<vscale x 64 x i8>, ptr captures(none), i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x i8> @llvm.riscv.nds.vln.nxv8i8.p0.i64(<vscale x 8 x i8>, ptr captures(none), i64) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }

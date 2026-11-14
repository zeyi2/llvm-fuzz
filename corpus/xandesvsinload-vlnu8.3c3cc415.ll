; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64 -mattr=+xandesvsintload,+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false

; Function Attrs: nounwind
declare <vscale x 1 x i8> @intrinsic_nds_vlnu_v_nxv1i8_nxv1i8(ptr, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i8> @intrinsic_nds_vlnu_mask_v_nxv1i8_nxv1i8(<vscale x 1 x i8>, ptr, <vscale x 1 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i8> @intrinsic_nds_vlnu_v_nxv2i8_nxv2i8(ptr, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i8> @intrinsic_nds_vlnu_mask_v_nxv2i8_nxv2i8(<vscale x 2 x i8>, ptr, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
define <vscale x 4 x i8> @intrinsic_nds_vlnu_v_nxv4i8_nxv4i8(ptr %0, i64 %1) #0 {
entry:
  %a = call <vscale x 4 x i8> @llvm.riscv.nds.vlnu.nxv4i8.p0.i64(<vscale x 4 x i8> poison, ptr %0, i64 %1)
  %B = shl <vscale x 4 x i8> %a, %a
  store <vscale x 4 x i8> %B, ptr poison, align 4
  ret <vscale x 4 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i8> @intrinsic_nds_vlnu_mask_v_nxv4i8_nxv4i8(<vscale x 4 x i8>, ptr, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i8> @intrinsic_nds_vlnu_v_nxv8i8_nxv8i8(ptr, i64) #0

; Function Attrs: nounwind
define <vscale x 8 x i8> @intrinsic_nds_vlnu_mask_v_nxv8i8_nxv8i8(<vscale x 8 x i8> %0, ptr %1, <vscale x 8 x i1> %2, i64 %3) #0 {
entry:
  %LGV = load i1, ptr @G, align 1
  %C = icmp ne i1 true, %LGV
  %a = call <vscale x 8 x i8> @llvm.riscv.nds.vlnu.mask.nxv8i8.p0.i64(<vscale x 8 x i8> %0, ptr %1, <vscale x 8 x i1> %2, i64 %3, i64 1)
  store i1 %C, ptr @G, align 1
  ret <vscale x 8 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 16 x i8> @intrinsic_nds_vlnu_v_nxv16i8_nxv16i8(ptr, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i8> @intrinsic_nds_vlnu_mask_v_nxv16i8_nxv16i8(<vscale x 16 x i8>, ptr, <vscale x 16 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 32 x i8> @intrinsic_nds_vlnu_v_nxv32i8_nxv32i8(ptr, i64) #0

; Function Attrs: nounwind
declare <vscale x 32 x i8> @intrinsic_nds_vlnu_mask_v_nxv32i8_nxv32i8(<vscale x 32 x i8>, ptr, <vscale x 32 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 64 x i8> @intrinsic_nds_vlnu_v_nxv64i8_nxv64i8(ptr, i64) #0

; Function Attrs: nounwind
declare <vscale x 64 x i8> @intrinsic_nds_vlnu_mask_v_nxv64i8_nxv64i8(<vscale x 64 x i8>, ptr, <vscale x 64 x i1>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 16 x i8> @llvm.riscv.nds.vlnu.mask.nxv16i8.p0.i64(<vscale x 16 x i8>, ptr captures(none), <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i8> @llvm.riscv.nds.vlnu.mask.nxv1i8.p0.i64(<vscale x 1 x i8>, ptr captures(none), <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x i8> @llvm.riscv.nds.vlnu.mask.nxv2i8.p0.i64(<vscale x 2 x i8>, ptr captures(none), <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 32 x i8> @llvm.riscv.nds.vlnu.mask.nxv32i8.p0.i64(<vscale x 32 x i8>, ptr captures(none), <vscale x 32 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x i8> @llvm.riscv.nds.vlnu.mask.nxv4i8.p0.i64(<vscale x 4 x i8>, ptr captures(none), <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 64 x i8> @llvm.riscv.nds.vlnu.mask.nxv64i8.p0.i64(<vscale x 64 x i8>, ptr captures(none), <vscale x 64 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x i8> @llvm.riscv.nds.vlnu.mask.nxv8i8.p0.i64(<vscale x 8 x i8>, ptr captures(none), <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 16 x i8> @llvm.riscv.nds.vlnu.nxv16i8.p0.i64(<vscale x 16 x i8>, ptr captures(none), i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i8> @llvm.riscv.nds.vlnu.nxv1i8.p0.i64(<vscale x 1 x i8>, ptr captures(none), i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x i8> @llvm.riscv.nds.vlnu.nxv2i8.p0.i64(<vscale x 2 x i8>, ptr captures(none), i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 32 x i8> @llvm.riscv.nds.vlnu.nxv32i8.p0.i64(<vscale x 32 x i8>, ptr captures(none), i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x i8> @llvm.riscv.nds.vlnu.nxv4i8.p0.i64(<vscale x 4 x i8>, ptr captures(none), i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 64 x i8> @llvm.riscv.nds.vlnu.nxv64i8.p0.i64(<vscale x 64 x i8>, ptr captures(none), i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x i8> @llvm.riscv.nds.vlnu.nxv8i8.p0.i64(<vscale x 8 x i8>, ptr captures(none), i64) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }

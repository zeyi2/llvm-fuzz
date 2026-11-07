; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64 -mattr=+zve64x,+xandesvsintload,+zdinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 -1
@G.1 = global i128 0
@G.2 = global i1 true
@G.3 = global <8 x i8> splat (i8 42)
@G.4 = global <8 x i1> zeroinitializer
@G.5 = global ptr poison

; Function Attrs: nounwind
declare <vscale x 1 x i8> @intrinsic_nds_vlnu_v_nxv1i8_nxv1i8(ptr, i64) #0

; Function Attrs: nounwind
define <vscale x 1 x i8> @intrinsic_nds_vlnu_mask_v_nxv1i8_nxv1i8(<vscale x 1 x i8> %0, ptr %1, <vscale x 1 x i1> %2, i64 %3) #0 {
entry:
  %a = call <vscale x 1 x i8> @llvm.riscv.nds.vlnu.mask.nxv1i8.p0.i64(<vscale x 1 x i8> %0, ptr %1, <vscale x 1 x i1> %2, i64 %3, i64 1)
  %G = getelementptr double, ptr %1, i64 %3
  store ptr %G, ptr @G.5, align 8
  ret <vscale x 1 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 2 x i8> @intrinsic_nds_vlnu_v_nxv2i8_nxv2i8(ptr, i64) #0

; Function Attrs: nounwind
define <vscale x 2 x i8> @intrinsic_nds_vlnu_mask_v_nxv2i8_nxv2i8(<vscale x 2 x i8> %0, ptr %1, <vscale x 2 x i1> %2, i64 %3) #0 {
entry:
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %a = call <vscale x 2 x i8> @llvm.riscv.nds.vlnu.mask.nxv2i8.p0.i64(<vscale x 2 x i8> %0, ptr %1, <vscale x 2 x i1> %2, i64 %3, i64 1)
  %B = lshr i64 %3, %3
  store i64 %B, ptr %A, align 4
  ret <vscale x 2 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i8> @intrinsic_nds_vlnu_v_nxv4i8_nxv4i8(ptr, i64) #0

; Function Attrs: nounwind
define <vscale x 4 x i8> @intrinsic_nds_vlnu_mask_v_nxv4i8_nxv4i8(<vscale x 4 x i8> %0, ptr %1, <vscale x 4 x i1> %2, i64 %3) #0 {
entry:
  %A = alloca i128, align 8
  store i128 poison, ptr %A, align 4
  %B = udiv i128 170141183460469231731687303715884105727, 42
  %a = call <vscale x 4 x i8> @llvm.riscv.nds.vlnu.mask.nxv4i8.p0.i64(<vscale x 4 x i8> %0, ptr %1, <vscale x 4 x i1> %2, i64 %3, i64 1)
  store i128 %B, ptr %A, align 4
  ret <vscale x 4 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 8 x i8> @intrinsic_nds_vlnu_v_nxv8i8_nxv8i8(ptr, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i8> @intrinsic_nds_vlnu_mask_v_nxv8i8_nxv8i8(<vscale x 8 x i8>, ptr, <vscale x 8 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i8> @intrinsic_nds_vlnu_v_nxv16i8_nxv16i8(ptr, i64) #0

; Function Attrs: nounwind
define <vscale x 16 x i8> @intrinsic_nds_vlnu_mask_v_nxv16i8_nxv16i8(<vscale x 16 x i8> %0, ptr %1, <vscale x 16 x i1> %2, i64 %3) #0 {
entry:
  %A = alloca <vscale x 16 x i1>, align 2
  store <vscale x 16 x i1> poison, ptr %A, align 2
  %a = call <vscale x 16 x i8> @llvm.riscv.nds.vlnu.mask.nxv16i8.p0.i64(<vscale x 16 x i8> %0, ptr %1, <vscale x 16 x i1> %2, i64 %3, i64 1)
  %C = icmp sge <vscale x 16 x i8> %a, %a
  store <vscale x 16 x i1> %C, ptr %A, align 2
  ret <vscale x 16 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 32 x i8> @intrinsic_nds_vlnu_v_nxv32i8_nxv32i8(ptr, i64) #0

; Function Attrs: nounwind
define <vscale x 32 x i8> @intrinsic_nds_vlnu_mask_v_nxv32i8_nxv32i8(<vscale x 32 x i8> %0, ptr %1, <vscale x 32 x i1> %2, i64 %3) #0 {
entry:
  %LGV = load <8 x i8>, ptr @G.3, align 8
  %C = icmp ugt <8 x i8> splat (i8 127), %LGV
  %a = call <vscale x 32 x i8> @llvm.riscv.nds.vlnu.mask.nxv32i8.p0.i64(<vscale x 32 x i8> %0, ptr %1, <vscale x 32 x i1> %2, i64 %3, i64 1)
  store <8 x i1> %C, ptr @G.4, align 1
  ret <vscale x 32 x i8> %a
}

; Function Attrs: nounwind
define <vscale x 64 x i8> @intrinsic_nds_vlnu_v_nxv64i8_nxv64i8(ptr %0, i64 %1) #0 {
entry:
  %LGV1 = load i128, ptr @G.1, align 4
  %LGV = load i128, ptr @G, align 4
  %C = icmp ugt i128 %LGV, %LGV1
  %a = call <vscale x 64 x i8> @llvm.riscv.nds.vlnu.nxv64i8.p0.i64(<vscale x 64 x i8> poison, ptr %0, i64 %1)
  %B = mul i16 -1, -1
  store i16 %B, ptr poison, align 2
  store i1 %C, ptr @G.2, align 1
  ret <vscale x 64 x i8> %a
}

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

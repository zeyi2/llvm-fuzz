; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32 -mattr=+zve64x,+xandesvsintload,+zvbb,+zdinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i1 true

; Function Attrs: nounwind
define <vscale x 1 x i8> @intrinsic_nds_vlnu_v_nxv1i8_nxv1i8(ptr %0, i32 %1) #0 {
entry:
  %A1 = alloca i1, align 1
  store i1 true, ptr %A1, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %a = call <vscale x 1 x i8> @llvm.riscv.nds.vlnu.nxv1i8.p0.i32(<vscale x 1 x i8> poison, ptr %0, i32 %1)
  ret <vscale x 1 x i8> %a

T:                                                ; preds = %entry
  %C = icmp sgt i16 42, 32767
  store i1 %C, ptr %A1, align 1
  br label %BB

F:                                                ; preds = %F, %entry
  %L2 = load i1, ptr %A1, align 1
  br i1 %L2, label %F, label %BB
}

; Function Attrs: nounwind
define <vscale x 1 x i8> @intrinsic_nds_vlnu_mask_v_nxv1i8_nxv1i8(<vscale x 1 x i8> %0, ptr %1, <vscale x 1 x i1> %2, i32 %3) #0 {
entry:
  %B = or i32 1, %3
  %a = call <vscale x 1 x i8> @llvm.riscv.nds.vlnu.mask.nxv1i8.p0.i32(<vscale x 1 x i8> %0, ptr %1, <vscale x 1 x i1> %2, i32 %3, i32 1)
  store i32 %B, ptr poison, align 4
  ret <vscale x 1 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 2 x i8> @intrinsic_nds_vlnu_v_nxv2i8_nxv2i8(ptr, i32) #0

; Function Attrs: nounwind
declare <vscale x 2 x i8> @intrinsic_nds_vlnu_mask_v_nxv2i8_nxv2i8(<vscale x 2 x i8>, ptr, <vscale x 2 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 4 x i8> @intrinsic_nds_vlnu_v_nxv4i8_nxv4i8(ptr, i32) #0

; Function Attrs: nounwind
define <vscale x 4 x i8> @intrinsic_nds_vlnu_mask_v_nxv4i8_nxv4i8(<vscale x 4 x i8> %0, ptr %1, <vscale x 4 x i1> %2, i32 %3) #0 {
entry:
  %A11 = alloca i1, align 1
  store i1 false, ptr %A11, align 1
  %A8 = alloca i1, align 1
  store i1 true, ptr %A8, align 1
  %A = alloca i128, align 8
  store i128 1, ptr %A, align 4
  %L = load i128, ptr %A, align 4
  switch i128 %L, label %SW_D [
    i128 4113958030309896626, label %SW_C
    i128 13157457891830136890, label %SW_C1
    i128 13411994414023703939, label %SW_C2
    i128 360451200861029602, label %SW_C3
    i128 2938123942203904126, label %SW_C4
    i128 15026875689395960060, label %SW_C5
    i128 13194305559267845650, label %SW_C6
    i128 5782609139721808035, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C6, %SW_C4, %SW_C3, %SW_C2, %SW_C1, %SW_C, %SW_D
  %a = call <vscale x 4 x i8> @llvm.riscv.nds.vlnu.mask.nxv4i8.p0.i32(<vscale x 4 x i8> %0, ptr %1, <vscale x 4 x i1> %2, i32 %3, i32 1)
  ret <vscale x 4 x i8> %a

SW_D:                                             ; preds = %entry
  br label %BB

SW_C:                                             ; preds = %SW_C, %entry
  %LGV = load i1, ptr @G.1, align 1
  br i1 %LGV, label %SW_C, label %BB

SW_C1:                                            ; preds = %SW_C1, %entry
  %L9 = load i1, ptr %A8, align 1
  br i1 %L9, label %BB, label %SW_C1

SW_C2:                                            ; preds = %SW_C2, %entry
  %LGV10 = load i1, ptr @G, align 1
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %SW_C2, label %BB

SW_C3:                                            ; preds = %entry
  br label %BB

SW_C4:                                            ; preds = %entry
  br label %BB

SW_C5:                                            ; preds = %entry
  ret <vscale x 4 x i8> splat (i8 -1)

SW_C6:                                            ; preds = %entry
  br label %BB

SW_C7:                                            ; preds = %entry
  br label %BB
}

; Function Attrs: nounwind
declare <vscale x 8 x i8> @intrinsic_nds_vlnu_v_nxv8i8_nxv8i8(ptr, i32) #0

; Function Attrs: nounwind
define <vscale x 8 x i8> @intrinsic_nds_vlnu_mask_v_nxv8i8_nxv8i8(<vscale x 8 x i8> %0, ptr %1, <vscale x 8 x i1> %2, i32 %3) #0 {
entry:
  %a = call <vscale x 8 x i8> @llvm.riscv.nds.vlnu.mask.nxv8i8.p0.i32(<vscale x 8 x i8> %0, ptr %1, <vscale x 8 x i1> %2, i32 %3, i32 1)
  %C = icmp slt i32 %3, %3
  store i1 %C, ptr @G, align 1
  ret <vscale x 8 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 16 x i8> @intrinsic_nds_vlnu_v_nxv16i8_nxv16i8(ptr, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i8> @intrinsic_nds_vlnu_mask_v_nxv16i8_nxv16i8(<vscale x 16 x i8>, ptr, <vscale x 16 x i1>, i32) #0

; Function Attrs: nounwind
declare <vscale x 32 x i8> @intrinsic_nds_vlnu_v_nxv32i8_nxv32i8(ptr, i32) #0

; Function Attrs: nounwind
define <vscale x 32 x i8> @intrinsic_nds_vlnu_mask_v_nxv32i8_nxv32i8(<vscale x 32 x i8> %0, ptr %1, <vscale x 32 x i1> %2, i32 %3) #0 {
entry:
  %B = and i32 %3, %3
  %a = call <vscale x 32 x i8> @llvm.riscv.nds.vlnu.mask.nxv32i8.p0.i32(<vscale x 32 x i8> %0, ptr %1, <vscale x 32 x i1> %2, i32 %B, i32 1)
  ret <vscale x 32 x i8> %a
}

; Function Attrs: nounwind
declare <vscale x 64 x i8> @intrinsic_nds_vlnu_v_nxv64i8_nxv64i8(ptr, i32) #0

; Function Attrs: nounwind
declare <vscale x 64 x i8> @intrinsic_nds_vlnu_mask_v_nxv64i8_nxv64i8(<vscale x 64 x i8>, ptr, <vscale x 64 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 16 x i8> @llvm.riscv.nds.vlnu.mask.nxv16i8.p0.i32(<vscale x 16 x i8>, ptr captures(none), <vscale x 16 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i8> @llvm.riscv.nds.vlnu.mask.nxv1i8.p0.i32(<vscale x 1 x i8>, ptr captures(none), <vscale x 1 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x i8> @llvm.riscv.nds.vlnu.mask.nxv2i8.p0.i32(<vscale x 2 x i8>, ptr captures(none), <vscale x 2 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 32 x i8> @llvm.riscv.nds.vlnu.mask.nxv32i8.p0.i32(<vscale x 32 x i8>, ptr captures(none), <vscale x 32 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x i8> @llvm.riscv.nds.vlnu.mask.nxv4i8.p0.i32(<vscale x 4 x i8>, ptr captures(none), <vscale x 4 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 64 x i8> @llvm.riscv.nds.vlnu.mask.nxv64i8.p0.i32(<vscale x 64 x i8>, ptr captures(none), <vscale x 64 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x i8> @llvm.riscv.nds.vlnu.mask.nxv8i8.p0.i32(<vscale x 8 x i8>, ptr captures(none), <vscale x 8 x i1>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 16 x i8> @llvm.riscv.nds.vlnu.nxv16i8.p0.i32(<vscale x 16 x i8>, ptr captures(none), i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i8> @llvm.riscv.nds.vlnu.nxv1i8.p0.i32(<vscale x 1 x i8>, ptr captures(none), i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x i8> @llvm.riscv.nds.vlnu.nxv2i8.p0.i32(<vscale x 2 x i8>, ptr captures(none), i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 32 x i8> @llvm.riscv.nds.vlnu.nxv32i8.p0.i32(<vscale x 32 x i8>, ptr captures(none), i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x i8> @llvm.riscv.nds.vlnu.nxv4i8.p0.i32(<vscale x 4 x i8>, ptr captures(none), i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 64 x i8> @llvm.riscv.nds.vlnu.nxv64i8.p0.i32(<vscale x 64 x i8>, ptr captures(none), i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x i8> @llvm.riscv.nds.vlnu.nxv8i8.p0.i32(<vscale x 8 x i8>, ptr captures(none), i32) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }

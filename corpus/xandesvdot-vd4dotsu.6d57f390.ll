; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64 -mattr=+zve64x,+xandesvdot,+xtheadba,+zhinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 1
@G.1 = global i1 false
@G.2 = global i1 true

; Function Attrs: nounwind
declare <vscale x 1 x i32> @intrinsic_vd4dotsu_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, i64) #0

; Function Attrs: nounwind
define <vscale x 1 x i32> @intrinsic_vd4dotsu_mask_vv_nxv1i32_nxv4i8_nxv4i8(<vscale x 1 x i32> %0, <vscale x 4 x i8> %1, <vscale x 4 x i8> %2, <vscale x 1 x i1> %3, i64 %4) #0 {
entry:
  %A7 = alloca i1, align 1
  store i1 true, ptr %A7, align 1
  %A5 = alloca i1, align 1
  store i1 false, ptr %A5, align 1
  %A = alloca i64, align 8
  store i64 42, ptr %A, align 4
  %a = tail call <vscale x 1 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv1i32.nxv4i8.nxv4i8.i64(<vscale x 1 x i32> %0, <vscale x 4 x i8> %1, <vscale x 4 x i8> %2, <vscale x 1 x i1> %3, i64 %4, i64 2)
  %L = load i64, ptr %A, align 4
  switch i64 %L, label %SW_D [
    i64 3991321928701293892, label %SW_C
    i64 5206455411938889937, label %SW_C1
    i64 612715669360619712, label %SW_C2
    i64 -8640012061051651497, label %SW_C3
    i64 -6542447722631405074, label %SW_C4
  ]

BB:                                               ; preds = %SW_C4, %SW_C3, %SW_C2, %SW_C1, %SW_C
  ret <vscale x 1 x i32> %a

SW_D:                                             ; preds = %entry
  ret <vscale x 1 x i32> splat (i32 2147483647)

SW_C:                                             ; preds = %entry
  br label %BB

SW_C1:                                            ; preds = %entry
  br label %BB

SW_C2:                                            ; preds = %SW_C2, %entry
  %L6 = load i1, ptr %A5, align 1
  br i1 %L6, label %BB, label %SW_C2

SW_C3:                                            ; preds = %entry
  br label %BB

SW_C4:                                            ; preds = %SW_C4, %entry
  %L8 = load i1, ptr %A7, align 1
  br i1 %L8, label %SW_C4, label %BB
}

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vd4dotsu_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i64) #0

; Function Attrs: nounwind
define <vscale x 2 x i32> @intrinsic_vd4dotsu_mask_vv_nxv2i32_nxv8i8_nxv8i8(<vscale x 2 x i32> %0, <vscale x 8 x i8> %1, <vscale x 8 x i8> %2, <vscale x 2 x i1> %3, i64 %4) #0 {
entry:
  %LGV = load i128, ptr @G, align 4
  %a = tail call <vscale x 2 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv2i32.nxv8i8.nxv8i8.i64(<vscale x 2 x i32> %0, <vscale x 8 x i8> %1, <vscale x 8 x i8> %2, <vscale x 2 x i1> %3, i64 %4, i64 2)
  %C = icmp ne i128 %LGV, 0
  store i1 %C, ptr @G.1, align 1
  ret <vscale x 2 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dotsu_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vd4dotsu_mask_vv_nxv4i32_nxv16i8_nxv16i8(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 4 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vd4dotsu_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vd4dotsu_mask_vv_nxv8i32_nxv32i8_nxv32i8(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 8 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vd4dotsu_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vd4dotsu_mask_vv_nxv16i32_nxv64i8_nxv64i8(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 16 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 1 x i64> @intrinsic_vd4dotsu_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, i64) #0

; Function Attrs: nounwind
define <vscale x 1 x i64> @intrinsic_vd4dotsu_mask_vv_nxv1i64_nxv4i16_nxv4i16(<vscale x 1 x i64> %0, <vscale x 4 x i16> %1, <vscale x 4 x i16> %2, <vscale x 1 x i1> %3, i64 %4) #0 {
entry:
  %LGV = load i1, ptr @G.2, align 1
  %a = tail call <vscale x 1 x i64> @llvm.riscv.nds.vd4dotsu.mask.nxv1i64.nxv4i16.nxv4i16.i64(<vscale x 1 x i64> %0, <vscale x 4 x i16> %1, <vscale x 4 x i16> %2, <vscale x 1 x i1> %3, i64 %4, i64 2)
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <vscale x 1 x i64> %a

T:                                                ; preds = %entry
  br label %BB

F:                                                ; preds = %entry
  br label %BB
}

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vd4dotsu_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, i64) #0

; Function Attrs: nounwind
declare <vscale x 2 x i64> @intrinsic_vd4dotsu_mask_vv_nxv2i64_nxv8i16_nxv8i16(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 2 x i1>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i64> @intrinsic_vd4dotsu_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, i64) #0

; Function Attrs: nounwind
define <vscale x 4 x i64> @intrinsic_vd4dotsu_mask_vv_nxv4i64_nxv16i16_nxv16i16(<vscale x 4 x i64> %0, <vscale x 16 x i16> %1, <vscale x 16 x i16> %2, <vscale x 4 x i1> %3, i64 %4) #0 {
entry:
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %B = sdiv i64 %4, 0
  %a = tail call <vscale x 4 x i64> @llvm.riscv.nds.vd4dotsu.mask.nxv4i64.nxv16i16.nxv16i16.i64(<vscale x 4 x i64> %0, <vscale x 16 x i16> %1, <vscale x 16 x i16> %2, <vscale x 4 x i1> %3, i64 %4, i64 2)
  store i64 %B, ptr %A, align 4
  ret <vscale x 4 x i64> %a
}

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vd4dotsu_vv_nxv8i64_nxv32i16_nxv32i16(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i64> @intrinsic_vd4dotsu_mask_vv_nxv8i64_nxv32i16_nxv32i16(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 8 x i1>, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv16i32.nxv64i8.nxv64i8.i64(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 16 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv1i32.nxv4i8.nxv4i8.i64(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.nds.vd4dotsu.mask.nxv1i64.nxv4i16.nxv4i16.i64(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 1 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv2i32.nxv8i8.nxv8i8.i64(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.nds.vd4dotsu.mask.nxv2i64.nxv8i16.nxv8i16.i64(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 2 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv4i32.nxv16i8.nxv16i8.i64(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.nds.vd4dotsu.mask.nxv4i64.nxv16i16.nxv16i16.i64(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 4 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.nds.vd4dotsu.mask.nxv8i32.nxv32i8.nxv32i8.i64(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.nds.vd4dotsu.mask.nxv8i64.nxv32i16.nxv32i16.i64(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 8 x i1>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.nds.vd4dotsu.nxv16i32.nxv64i8.nxv64i8.i64(<vscale x 16 x i32>, <vscale x 64 x i8>, <vscale x 64 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i32> @llvm.riscv.nds.vd4dotsu.nxv1i32.nxv4i8.nxv4i8.i64(<vscale x 1 x i32>, <vscale x 4 x i8>, <vscale x 4 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 1 x i64> @llvm.riscv.nds.vd4dotsu.nxv1i64.nxv4i16.nxv4i16.i64(<vscale x 1 x i64>, <vscale x 4 x i16>, <vscale x 4 x i16>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.nds.vd4dotsu.nxv2i32.nxv8i8.nxv8i8.i64(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.nds.vd4dotsu.nxv2i64.nxv8i16.nxv8i16.i64(<vscale x 2 x i64>, <vscale x 8 x i16>, <vscale x 8 x i16>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.nds.vd4dotsu.nxv4i32.nxv16i8.nxv16i8.i64(<vscale x 4 x i32>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.nds.vd4dotsu.nxv4i64.nxv16i16.nxv16i16.i64(<vscale x 4 x i64>, <vscale x 16 x i16>, <vscale x 16 x i16>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.nds.vd4dotsu.nxv8i32.nxv32i8.nxv32i8.i64(<vscale x 8 x i32>, <vscale x 32 x i8>, <vscale x 32 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.nds.vd4dotsu.nxv8i64.nxv32i16.nxv32i16.i64(<vscale x 8 x i64>, <vscale x 32 x i16>, <vscale x 32 x i16>, i64, i64 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

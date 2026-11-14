; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zvknhb,+zdinx,+zba -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> zeroinitializer
@G.1 = global i1 false
@G.2 = global <2 x i64> splat (i64 -9223372036854775808)
@G.3 = global i1 true
@G.4 = global i128 1
@G.5 = global i128 42
@G.6 = global ptr poison
@G.7 = global i32 -2147483648

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vsha2cl_vv_nxv4i32_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vsha2cl_vv_nxv8i32_nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i32) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vsha2cl_vv_nxv16i32_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i32) #0

; Function Attrs: nounwind
define <vscale x 4 x i64> @intrinsic_vsha2cl_vv_nxv4i64_nxv4i64(<vscale x 4 x i64> %0, <vscale x 4 x i64> %1, <vscale x 4 x i64> %2, i32 %3) #0 {
entry:
  %a = call <vscale x 4 x i64> @llvm.riscv.vsha2cl.nxv4i64.nxv4i64.i32(<vscale x 4 x i64> %0, <vscale x 4 x i64> %1, <vscale x 4 x i64> %2, i32 %3, i32 2)
  %LGV = load <8 x i8>, ptr @G, align 8
  %LGV2 = load i128, ptr @G.4, align 4
  %B = and i128 42, %LGV2
  store i128 %B, ptr @G.5, align 4
  %C = icmp uge <vscale x 4 x i64> %1, zeroinitializer
  store <vscale x 4 x i1> %C, ptr poison, align 1
  %S = shufflevector <8 x i8> splat (i8 -128), <8 x i8> %LGV, <8 x i32> poison
  store <8 x i8> %S, ptr @G, align 8
  ret <vscale x 4 x i64> %a
}

; Function Attrs: nounwind
define <vscale x 8 x i64> @intrinsic_vsha2cl_vv_nxv8i64_nxv8i64(<vscale x 8 x i64> %0, <vscale x 8 x i64> %1, <vscale x 8 x i64> %2, i32 %3) #0 {
entry:
  %A1 = alloca i1, align 1
  store i1 false, ptr %A1, align 1
  %A = alloca <2 x i1>, align 1
  store <2 x i1> poison, ptr %A, align 1
  %G = getelementptr i16, ptr %A, i32 %3
  %L2 = load i1, ptr %A1, align 1
  store ptr %G, ptr @G.6, align 8
  switch i1 %L2, label %SW_D [
    i1 false, label %SW_C
    i1 true, label %SW_C3
  ]

BB:                                               ; preds = %SW_C3, %SW_C, %SW_D
  %LGV = load <2 x i64>, ptr @G.2, align 16
  %C = icmp sle <2 x i64> zeroinitializer, %LGV
  %a = call <vscale x 8 x i64> @llvm.riscv.vsha2cl.nxv8i64.nxv8i64.i32(<vscale x 8 x i64> %0, <vscale x 8 x i64> %1, <vscale x 8 x i64> %2, i32 %3, i32 2)
  store <2 x i1> %C, ptr %A, align 1
  ret <vscale x 8 x i64> %a

SW_D:                                             ; preds = %SW_D, %entry
  %LGV4 = load i1, ptr @G.3, align 1
  br i1 %LGV4, label %SW_D, label %BB

SW_C:                                             ; preds = %entry
  br label %BB

SW_C3:                                            ; preds = %entry
  %B = sub i32 0, %3
  store i32 %B, ptr @G.7, align 4
  br label %BB
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.vsha2cl.nxv16i32.nxv16i32.i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.vsha2cl.nxv4i32.nxv4i32.i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.riscv.vsha2cl.nxv4i64.nxv4i64.i32(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i64>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.vsha2cl.nxv8i32.nxv8i32.i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i32>, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i64> @llvm.riscv.vsha2cl.nxv8i64.nxv8i64.i32(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i64>, i32, i32 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

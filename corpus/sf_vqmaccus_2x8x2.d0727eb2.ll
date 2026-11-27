; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+xsfvqmaccdod,+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 256

; Function Attrs: nounwind
define <vscale x 2 x i32> @intrinsic_vqmaccus_2x8x2_tu_i32m1(<vscale x 2 x i32> %0, <vscale x 8 x i8> %1, <vscale x 8 x i8> %2, i64 %3) #0 {
entry:
  %a = call <vscale x 2 x i32> @llvm.riscv.sf.vqmaccus.2x8x2.nxv2i32.nxv8i8.nxv8i8.i64(<vscale x 2 x i32> %0, <vscale x 8 x i8> %1, <vscale x 8 x i8> %2, i64 %3, i64 2)
  %C = icmp uge <vscale x 2 x i32> %a, %0
  store <vscale x 2 x i1> %C, ptr poison, align 1
  ret <vscale x 2 x i32> %a
}

; Function Attrs: nounwind
declare <vscale x 2 x i32> @intrinsic_vqmaccus_2x8x2_ta_i32m1(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vqmaccus_2x8x2_tu_i32m2(<vscale x 4 x i32>, <vscale x 8 x i8>, <vscale x 16 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @intrinsic_vqmaccus_2x8x2_ta_i32m2(<vscale x 4 x i32>, <vscale x 8 x i8>, <vscale x 16 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vqmaccus_2x8x2_tu_i32m4(<vscale x 8 x i32>, <vscale x 8 x i8>, <vscale x 32 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 8 x i32> @intrinsic_vqmaccus_2x8x2_ta_i32m4(<vscale x 8 x i32>, <vscale x 8 x i8>, <vscale x 32 x i8>, i64) #0

; Function Attrs: nounwind
declare <vscale x 16 x i32> @intrinsic_vqmaccus_2x8x2_tu_i32m8(<vscale x 16 x i32>, <vscale x 8 x i8>, <vscale x 64 x i8>, i64) #0

; Function Attrs: nounwind
define <vscale x 16 x i32> @intrinsic_vqmaccus_2x8x2_ta_i32m8(<vscale x 16 x i32> %0, <vscale x 8 x i8> %1, <vscale x 64 x i8> %2, i64 %3) #0 {
entry:
  %B = or i16 42, 32767
  %a = call <vscale x 16 x i32> @llvm.riscv.sf.vqmaccus.2x8x2.nxv16i32.nxv8i8.nxv64i8.i64(<vscale x 16 x i32> %0, <vscale x 8 x i8> %1, <vscale x 64 x i8> %2, i64 %3, i64 3)
  store i16 %B, ptr @G, align 2
  ret <vscale x 16 x i32> %a
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i32> @llvm.riscv.sf.vqmaccus.2x8x2.nxv16i32.nxv8i8.nxv64i8.i64(<vscale x 16 x i32>, <vscale x 8 x i8>, <vscale x 64 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.sf.vqmaccus.2x8x2.nxv2i32.nxv8i8.nxv8i8.i64(<vscale x 2 x i32>, <vscale x 8 x i8>, <vscale x 8 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.sf.vqmaccus.2x8x2.nxv4i32.nxv8i8.nxv16i8.i64(<vscale x 4 x i32>, <vscale x 8 x i8>, <vscale x 16 x i8>, i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i32> @llvm.riscv.sf.vqmaccus.2x8x2.nxv8i32.nxv8i8.nxv32i8.i64(<vscale x 8 x i32>, <vscale x 8 x i8>, <vscale x 32 x i8>, i64, i64 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

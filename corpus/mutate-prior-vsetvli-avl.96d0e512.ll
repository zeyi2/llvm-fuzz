; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@__const.test.var_45 = private unnamed_addr constant [2 x i8] c"\D1S", align 1
@__const.test.var_101 = private unnamed_addr constant [2 x i8] c"\830", align 1
@G = global i8 127

define dso_local void @test(ptr noundef captures(none) %var_99) {
entry:
  %0 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.p0.i64(<vscale x 32 x i8> poison, ptr nonnull @__const.test.var_45, i64 2)
  %1 = tail call <vscale x 32 x i8> @llvm.riscv.vmul.nxv32i8.i8.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %0, i8 1, i64 2)
  %2 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.p0.i64(<vscale x 32 x i8> poison, ptr nonnull @__const.test.var_101, i64 2)
  %3 = tail call i8 @llvm.riscv.vmv.x.s.nxv32i8(<vscale x 32 x i8> %1)
  %4 = tail call <vscale x 32 x i8> @llvm.riscv.vssra.nxv32i8.nxv32i8.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %2, <vscale x 32 x i8> %0, i64 0, i64 2)
  %5 = tail call <vscale x 32 x i1> @llvm.riscv.vmsleu.nxv32i8.i8.i64(<vscale x 32 x i8> %0, i8 %3, i64 2)
  %6 = tail call <vscale x 32 x i8> @llvm.riscv.vmerge.nxv32i8.nxv32i8.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %4, <vscale x 32 x i8> %4, <vscale x 32 x i1> %5, i64 2)
  %G = getelementptr ptr, ptr %var_99, i16 256
  %B = shl i8 %3, %3
  tail call void @llvm.riscv.vse.nxv32i8.p0.i64(<vscale x 32 x i8> %6, ptr %var_99, i64 2)
  store i8 %B, ptr %G, align 1
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.p0.i64(<vscale x 32 x i8>, ptr captures(none), i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i8> @llvm.riscv.vmerge.nxv32i8.nxv32i8.i64(<vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i1>, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i1> @llvm.riscv.vmsleu.nxv32i8.i8.i64(<vscale x 32 x i8>, i8, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i8> @llvm.riscv.vmul.nxv32i8.i8.i64(<vscale x 32 x i8>, <vscale x 32 x i8>, i8, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i8 @llvm.riscv.vmv.x.s.nxv32i8(<vscale x 32 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.riscv.vse.nxv32i8.p0.i64(<vscale x 32 x i8>, ptr captures(none), i64) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.riscv.vsetvli.i64(i64, i64 immarg, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i8> @llvm.riscv.vssra.nxv32i8.nxv32i8.i64(<vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i8>, i64 immarg, i64) #1

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }

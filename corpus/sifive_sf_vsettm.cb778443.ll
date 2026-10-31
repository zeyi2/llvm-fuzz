; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+xsfmmbase,+zhinx,+zihintpause -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i1> zeroinitializer
@G.1 = global bfloat 0.000000e+00

define i64 @test_sf_vsettm(i64 %tm) {
entry:
  %0 = call i64 @llvm.riscv.sf.vsettm.i64(i64 %tm, i64 0, i64 3)
  %C = icmp sle <4 x i32> splat (i32 -2147483648), splat (i32 42)
  %B = fdiv bfloat 0.000000e+00, 1.000000e+00
  store <4 x i1> %C, ptr @G, align 1
  store bfloat %B, ptr @G.1, align 2
  ret i64 %0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.riscv.sf.vsettm.i64(i64, i64 immarg, i64 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(none) }

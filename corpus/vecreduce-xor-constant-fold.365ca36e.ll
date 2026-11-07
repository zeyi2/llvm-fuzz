; isel-diff-config: -mtriple=riscv64 -mattr=+zhinx -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half 0.000000e+00
@G.1 = global i1 true
@G.2 = global i1 true
@G.3 = global i32 -1

define i32 @test_xor_const() {
  %r = call i32 @llvm.vector.reduce.xor.v4i32(<4 x i32> <i32 1, i32 -2, i32 4, i32 8>)
  store i32 %r, ptr @G.3, align 4
  ret i32 %r
}

declare i32 @test_xor_const_wide()

define i32 @test_xor_nonconst(<4 x i32> %v) {
  %LGV = load half, ptr @G, align 2
  %C = fcmp one half 5.960460e-08, %LGV
  %r = call i32 @llvm.vector.reduce.xor.v4i32(<4 x i32> %v)
  store i1 %C, ptr @G.1, align 1
  %C2 = fcmp oeq float 4.200000e+01, 1.000000e+00
  store i1 %C2, ptr @G.2, align 1
  ret i32 %r
}

declare i32 @test_xor_poison()

declare i32 @test_xor_undef()

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.xor.v4i32(<4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.xor.v8i32(<8 x i32>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

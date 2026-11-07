; isel-diff-config: -mtriple=riscv64 -mattr=+zhinx -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 -1
@G.1 = global i1 true
@G.2 = global half 1.000000e+00
@G.3 = global half +qnan

declare i32 @test_or_const()

define i32 @test_or_const_wide() {
  %r = call i32 @llvm.vector.reduce.or.v8i32(<8 x i32> <i32 10, i32 20, i32 30, i32 40, i32 50, i32 60, i32 70, i32 80>)
  %C = fcmp uge bfloat 9.183550e-41, 0.000000e+00
  store i1 %C, ptr poison, align 1
  ret i32 %r
}

define i32 @test_or_nonconst(<4 x i32> %v) {
  %LGV2 = load half, ptr @G.3, align 2
  %LGV1 = load half, ptr @G.2, align 2
  %LGV = load i128, ptr @G, align 4
  %C = icmp sgt i128 0, %LGV
  %r = call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %v)
  store i1 %C, ptr @G.1, align 1
  %C3 = fcmp uno half %LGV1, %LGV2
  store i1 %C3, ptr poison, align 1
  ret i32 %r
}

declare i32 @test_or_poison()

declare i32 @test_or_undef()

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.or.v4i32(<4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.or.v8i32(<8 x i32>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

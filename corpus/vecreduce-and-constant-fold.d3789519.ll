; isel-diff-config: -mtriple=riscv64 -mattr=+zhinx -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global <4 x float> splat (float 4.200000e+01)
@G.2 = global <4 x i1> zeroinitializer
@G.3 = global i8 0
@G.4 = global i8 42

declare i32 @test_and_const()

define i32 @test_and_const_wide() {
  %LGV = load <4 x float>, ptr @G.1, align 16
  %C = fcmp ugt <4 x float> splat (float +qnan), %LGV
  %r = call i32 @llvm.vector.reduce.and.v8i32(<8 x i32> <i32 10, i32 20, i32 30, i32 40, i32 50, i32 60, i32 70, i32 80>)
  store <4 x i1> %C, ptr @G.2, align 1
  ret i32 %r
}

define i32 @test_and_nonconst(<4 x i32> %v) {
  %LGV4 = load i8, ptr @G.4, align 1
  %A3 = alloca ptr, align 8
  %C5 = icmp ne i8 42, %LGV4
  store ptr poison, ptr %A3, align 8
  %LGV2 = load i8, ptr @G.3, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %r = call i32 @llvm.vector.reduce.and.v4i32(<4 x i32> %v)
  %C = icmp ule i8 0, -1
  %G = getelementptr <2 x i64>, ptr %A, i8 %LGV2
  store i1 %C, ptr %A, align 1
  store ptr %G, ptr %A3, align 8
  store i1 %C5, ptr %G, align 1
  ret i32 %r
}

define i32 @test_and_poison() {
  %r = call i32 @llvm.vector.reduce.and.v4i32(<4 x i32> <i32 -1, i32 15, i32 poison, i32 3>)
  %C = icmp eq i16 0, 0
  store i1 %C, ptr @G, align 1
  ret i32 %r
}

define i32 @test_and_undef() {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %r = call i32 @llvm.vector.reduce.and.v4i32(<4 x i32> <i32 -1, i32 15, i32 undef, i32 3>)
  %C = icmp uge i32 %r, 0
  store i1 %C, ptr %A, align 1
  ret i32 %r
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.and.v4i32(<4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.and.v8i32(<8 x i32>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

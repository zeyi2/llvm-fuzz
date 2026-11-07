; isel-diff-config: -mtriple=riscv64 -mattr=+zdinx -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 1
@G.1 = global i32 0
@G.2 = global i1 true
@G.3 = global i64 9223372036854775807
@G.4 = global <4 x i32> zeroinitializer

declare i32 @test_or_const()

define i32 @test_or_const_wide() {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  %r = call i32 @llvm.vector.reduce.or.v8i32(<8 x i32> <i32 10, i32 20, i32 30, i32 40, i32 50, i32 60, i32 70, i32 80>)
  ret i32 %r

T:                                                ; preds = %0
  ret i32 -1

F:                                                ; preds = %0
  br label %BB
}

define i32 @test_or_nonconst(<4 x i32> %v) {
  %LGV = load i32, ptr @G, align 4
  %r = call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %v)
  %B = sdiv i32 %r, %LGV
  store i32 %B, ptr @G.1, align 4
  %B1 = sdiv <4 x i32> %v, zeroinitializer
  store <4 x i32> %B1, ptr @G.4, align 16
  ret i32 %r
}

define i32 @test_or_poison() {
  %r = call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> <i32 1, i32 -2, i32 poison, i32 8>)
  %B = and i32 %r, 42
  %C = icmp ule i32 %r, 2147483647
  store i1 %C, ptr @G.2, align 1
  store i32 %B, ptr poison, align 4
  ret i32 %r
}

define i32 @test_or_undef() {
  %E = extractelement <2 x i64> zeroinitializer, i128 170141183460469231731687303715884105727
  %r = call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> <i32 1, i32 2, i32 undef, i32 -8>)
  %B = shl i64 %E, 4294967296
  store i64 %E, ptr @G.3, align 4
  store i64 %B, ptr poison, align 4
  ret i32 %r
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.or.v4i32(<4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.or.v8i32(<8 x i32>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

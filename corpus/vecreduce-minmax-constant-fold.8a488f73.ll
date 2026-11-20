; isel-diff-config: -mtriple=riscv64 -mattr=+zhinx -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i32 -2147483648
@G.2 = global <8 x i8> splat (i8 1)
@G.3 = global <8 x i8> splat (i8 127)

declare i64 @test_const_smax()

define i64 @test_const_smin() {
  %r = call i64 @llvm.vector.reduce.smin.v4i64(<4 x i64> <i64 -128, i64 -1, i64 0, i64 127>)
  %B = shl i1 true, false
  store i1 %B, ptr poison, align 1
  ret i64 %r
}

declare i64 @test_const_umax()

declare i64 @test_const_umin()

define i64 @test_const_smax_i8() {
  %C = icmp sge i1 false, true
  %r = call i8 @llvm.vector.reduce.smax.v4i8(<4 x i8> <i8 -128, i8 -1, i8 0, i8 127>)
  %ext = sext i8 %r to i64
  store i1 %C, ptr @G, align 1
  ret i64 %ext
}

define i64 @test_const_smin_i8() {
  %r = call i8 @llvm.vector.reduce.smin.v4i8(<4 x i8> <i8 -128, i8 -1, i8 0, i8 127>)
  %ext = sext i8 %r to i64
  %C = icmp slt i64 %ext, 0
  store i1 %C, ptr @G, align 1
  ret i64 %ext
}

define i64 @test_const_umax_i8() {
  %LGV = load <8 x i8>, ptr @G.2, align 8
  %B = xor <8 x i8> %LGV, splat (i8 127)
  %r = call i8 @llvm.vector.reduce.umax.v4i8(<4 x i8> <i8 -128, i8 -1, i8 0, i8 127>)
  %ext = zext i8 %r to i64
  store <8 x i8> %B, ptr @G.3, align 8
  ret i64 %ext
}

define i64 @test_const_umin_i8() {
  %r = call i8 @llvm.vector.reduce.umin.v4i8(<4 x i8> <i8 -128, i8 -1, i8 0, i8 127>)
  %B = udiv i32 1, 2147483647
  %ext = zext i8 %r to i64
  store i32 %B, ptr @G.1, align 4
  ret i64 %ext
}

declare i64 @test_nonconst(<4 x i64>)

declare i64 @test_poison()

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smax.v4i64(<4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smax.v4i8(<4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smin.v4i64(<4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smin.v4i8(<4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umax.v4i64(<4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umax.v4i8(<4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umin.v4i64(<4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umin.v4i8(<4 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

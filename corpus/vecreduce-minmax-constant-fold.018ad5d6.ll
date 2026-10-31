; isel-diff-config: -mtriple=riscv64 -mattr=+zhinx -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x float> zeroinitializer
@G.1 = global <4 x i1> splat (i1 true)
@G.2 = global half +qnan
@G.3 = global half 6.550400e+04
@G.4 = global i1 false

declare i64 @test_const_smax()

declare i64 @test_const_smin()

declare i64 @test_const_umax()

declare i64 @test_const_umin()

define i64 @test_const_smax_i8() {
  %r = call i8 @llvm.vector.reduce.smax.v4i8(<4 x i8> <i8 -128, i8 -1, i8 0, i8 127>)
  %ext = sext i8 %r to i64
  %C = icmp eq <8 x i8> splat (i8 -128), splat (i8 -1)
  store <8 x i1> %C, ptr poison, align 1
  ret i64 %ext
}

declare i64 @test_const_smin_i8()

declare i64 @test_const_umax_i8()

define i64 @test_const_umin_i8() {
  %LGV = load <4 x float>, ptr @G, align 16
  %r = call i8 @llvm.vector.reduce.umin.v4i8(<4 x i8> <i8 -128, i8 -1, i8 0, i8 127>)
  %ext = zext i8 %r to i64
  %C = fcmp uno <4 x float> %LGV, splat (float +qnan)
  store <4 x i1> %C, ptr @G.1, align 1
  ret i64 %ext
}

declare i64 @test_nonconst(<4 x i64>)

define i64 @test_poison() {
  %LGV1 = load half, ptr @G.3, align 2
  %LGV = load half, ptr @G.2, align 2
  %r = call i64 @llvm.vector.reduce.smax.v4i64(<4 x i64> <i64 -128, i64 -1, i64 poison, i64 127>)
  %C = fcmp olt half %LGV, %LGV1
  store i1 %C, ptr @G.4, align 1
  ret i64 %r
}

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

; isel-diff-config: -mtriple=riscv64 -mattr=+zhinx -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float +qnan
@G.1 = global float 1.000000e+00
@G.2 = global i1 false
@G.3 = global i128 1
@G.4 = global i1 true
@G.5 = global i64 1
@G.6 = global <8 x i8> splat (i8 16)

declare i64 @test_const_smax()

define i64 @test_const_smin() {
  %A7 = alloca i1, align 1
  store i1 false, ptr %A7, align 1
  %A5 = alloca i1, align 1
  store i1 false, ptr %A5, align 1
  %A = alloca i128, align 8
  store i128 0, ptr %A, align 4
  %L = load i128, ptr %A, align 4
  switch i128 %L, label %SW_D [
    i128 11759882437302103612, label %SW_C
    i128 4600119886732512256, label %SW_C1
    i128 1440998392160829395, label %SW_C2
    i128 14206914349216518361, label %SW_C3
    i128 1615191429897234607, label %SW_C4
  ]

BB:                                               ; preds = %SW_C4, %SW_C3, %SW_C2, %SW_C1, %SW_D
  %r = call i64 @llvm.vector.reduce.smin.v4i64(<4 x i64> <i64 -128, i64 -1, i64 0, i64 127>)
  ret i64 %r

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %LGV9 = load <8 x i8>, ptr @G.6, align 8
  %B = lshr <8 x i8> splat (i8 42), %LGV9
  store <8 x i8> %B, ptr %A7, align 8
  ret i64 -9223372036854775808

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %SW_C2, %0
  %L6 = load i1, ptr %A5, align 1
  br i1 %L6, label %SW_C2, label %BB

SW_C3:                                            ; preds = %SW_C3, %0
  %L8 = load i1, ptr %A7, align 1
  br i1 %L8, label %SW_C3, label %BB

SW_C4:                                            ; preds = %0
  br label %BB
}

define i64 @test_const_umax() {
  %r = call i64 @llvm.vector.reduce.umax.v4i64(<4 x i64> <i64 -128, i64 -1, i64 0, i64 127>)
  %C = icmp ne i64 %r, %r
  store i1 %C, ptr @G.2, align 1
  ret i64 %r
}

define i64 @test_const_umin() {
  %LGV1 = load i128, ptr @G.3, align 4
  %C = icmp eq i128 18446744073709551616, %LGV1
  %r = call i64 @llvm.vector.reduce.umin.v4i64(<4 x i64> <i64 -128, i64 -1, i64 0, i64 127>)
  store i1 %C, ptr @G.4, align 1
  ret i64 %r
}

define i64 @test_const_smax_i8() {
  %LGV1 = load float, ptr @G.1, align 4
  %LGV = load float, ptr @G, align 4
  %C = fcmp ult float %LGV, %LGV1
  %r = call i8 @llvm.vector.reduce.smax.v4i8(<4 x i8> <i8 -128, i8 -1, i8 0, i8 127>)
  %ext = sext i8 %r to i64
  store i1 %C, ptr @G.2, align 1
  ret i64 %ext
}

declare i64 @test_const_smin_i8()

declare i64 @test_const_umax_i8()

declare i64 @test_const_umin_i8()

define i64 @test_nonconst(<4 x i64> %v) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i64, ptr @G.5, align 4
  %r = call i64 @llvm.vector.reduce.smax.v4i64(<4 x i64> %v)
  %C = icmp slt i64 %r, %LGV
  store i1 %C, ptr %A, align 1
  ret i64 %r
}

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

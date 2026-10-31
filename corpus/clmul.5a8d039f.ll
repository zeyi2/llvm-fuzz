; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zfinx,+zve32x -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i16 -1
@G.2 = global i4 -6

; Function Attrs: nounwind
declare i4 @clmul_i4(i4, i4) #0

; Function Attrs: nounwind
declare i8 @clmul_i8(i8, i8) #0

; Function Attrs: nounwind
define i16 @clmul_i16(i16 %a, i16 %b) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %res = call i16 @llvm.clmul.i16(i16 %a, i16 %b)
  %C = icmp slt i16 %b, 256
  store i1 %C, ptr %A, align 1
  ret i16 %res
}

; Function Attrs: nounwind
declare i32 @clmul_i32(i32, i32) #0

; Function Attrs: nounwind
declare i48 @clmul_i48(i48, i48) #0

; Function Attrs: nounwind
declare i64 @clmul_i64(i64, i64) #0

declare i64 @clmul_i64_zext(i32, i32)

define i96 @clmul_i96(i96 %x, i96 %y) {
  %B = udiv i96 %x, -39614081257132168796771975168
  ret i96 %B
}

declare i128 @clmul_i128(i128, i128)

declare i128 @clmul_i128_zext(i64, i64)

; Function Attrs: nounwind
declare i4 @clmul_constfold_i4() #0

; Function Attrs: nounwind
define i16 @clmul_constfold_i16() #0 {
  %LGV = load i1, ptr @G, align 1
  %res = call i16 @llvm.clmul.i16(i16 -2, i16 -1)
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %T
  ret i16 %res

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  %LGV1 = load i16, ptr @G.1, align 2
  ret i16 %LGV1
}

declare i8 @use(i8, i1)

; Function Attrs: nounwind
define void @commutative_clmul_i8(i8 %x, i8 %y, ptr %p0, ptr %p1) #0 {
  %xy = call i8 @llvm.clmul.i8(i8 %x, i8 %y)
  %yx = call i8 @llvm.clmul.i8(i8 %y, i8 %x)
  store i8 %xy, ptr %p0, align 1
  %C = fcmp true bfloat 0.000000e+00, 3.389530e+38
  store i8 %yx, ptr %p1, align 1
  store i1 %C, ptr @G, align 1
  ret void
}

; Function Attrs: nounwind
declare void @mul_use_commutative_clmul_i8(i8, i8, ptr, ptr) #0

; Function Attrs: nounwind
declare void @neg_commutative_clmul_i8(i8, i8, ptr, ptr) #0

declare void @vector_use(<2 x i64>)

; Function Attrs: nounwind
declare void @commutative_clmul_v2i64(<2 x i64>, <2 x i64>, ptr, ptr) #0

; Function Attrs: nounwind
declare void @mul_use_commutative_clmul_v2i64(<2 x i64>, <2 x i64>, ptr, ptr) #0

; Function Attrs: noimplicitfloat nounwind
define i4 @clmul_i4_noimplicitfloat(i4 %a, i4 %b) #1 {
  %B = udiv i4 %b, %b
  %res = call i4 @llvm.clmul.i4(i4 %a, i4 %b)
  store i4 %B, ptr @G.2, align 1
  ret i4 %res
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.clmul.i128(i128, i128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.clmul.i16(i16, i16) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.clmul.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i4 @llvm.clmul.i4(i4, i4) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i48 @llvm.clmul.i48(i48, i48) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.clmul.i64(i64, i64) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.clmul.i8(i8, i8) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i96 @llvm.clmul.i96(i96, i96) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.clmul.v2i64(<2 x i64>, <2 x i64>) #2

attributes #0 = { nounwind }
attributes #1 = { noimplicitfloat nounwind }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

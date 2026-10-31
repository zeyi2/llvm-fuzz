; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m,+zbc,+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 42
@G.1 = global <4 x i1> zeroinitializer

; Function Attrs: nounwind
declare i4 @clmul_i4(i4, i4) #0

; Function Attrs: nounwind
declare i8 @clmul_i8(i8, i8) #0

; Function Attrs: nounwind
define i16 @clmul_i16(i16 %a, i16 %b) #0 {
  %LGV = load i64, ptr @G, align 4
  %C = icmp ult i64 9223372036854775807, %LGV
  %res = call i16 @llvm.clmul.i16(i16 %a, i16 %b)
  store i1 %C, ptr poison, align 1
  ret i16 %res
}

; Function Attrs: nounwind
declare i32 @clmul_i32(i32, i32) #0

; Function Attrs: nounwind
define i48 @clmul_i48(i48 %a, i48 %b) #0 {
  %B = udiv i48 %a, %a
  ret i48 %B
}

; Function Attrs: nounwind
declare i64 @clmul_i64(i64, i64) #0

define i64 @clmul_i64_zext(i32 %x, i32 %y) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %zextx = zext i32 %x to i64
  %C = icmp sle i64 %zextx, %zextx
  %zexty = zext i32 %y to i64
  %a = call i64 @llvm.clmul.i64(i64 %zextx, i64 %zexty)
  store i1 %C, ptr %A, align 1
  ret i64 %a
}

declare i96 @clmul_i96(i96, i96)

declare i128 @clmul_i128(i128, i128)

declare i128 @clmul_i128_zext(i64, i64)

; Function Attrs: nounwind
define i4 @clmul_constfold_i4() #0 {
  %res = call i4 @llvm.clmul.i4(i4 1, i4 2)
  %C = fcmp ult <4 x float> zeroinitializer, splat (float +inf)
  store <4 x i1> %C, ptr @G.1, align 1
  ret i4 %res
}

; Function Attrs: nounwind
declare i16 @clmul_constfold_i16() #0

declare i8 @use(i8, i1)

; Function Attrs: nounwind
declare void @commutative_clmul_i8(i8, i8, ptr, ptr) #0

; Function Attrs: nounwind
declare void @mul_use_commutative_clmul_i8(i8, i8, ptr, ptr) #0

; Function Attrs: nounwind
define void @neg_commutative_clmul_i8(i8 %x, i8 %y, ptr %p0, ptr %p1) #0 {
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %G = getelementptr half, ptr %p0, i1 true
  %xy = call i8 @llvm.clmul.i8(i8 %x, i8 %y)
  store i8 %xy, ptr %p0, align 1
  store i8 %xy, ptr %p1, align 1
  store ptr %G, ptr %A, align 8
  ret void
}

declare void @vector_use(<2 x i64>)

; Function Attrs: nounwind
declare void @commutative_clmul_v2i64(<2 x i64>, <2 x i64>, ptr, ptr) #0

; Function Attrs: nounwind
declare void @mul_use_commutative_clmul_v2i64(<2 x i64>, <2 x i64>, ptr, ptr) #0

; Function Attrs: noimplicitfloat nounwind
declare i4 @clmul_i4_noimplicitfloat(i4, i4) #1

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

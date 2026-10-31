; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x float> splat (float 4.200000e+01)
@G.1 = global <4 x i1> zeroinitializer
@G.2 = global <4 x float> splat (float +inf)
@G.3 = global <2 x i64> splat (i64 -9223372036854775808)

; Function Attrs: nounwind
declare i4 @clmul_i4(i4, i4) #0

; Function Attrs: nounwind
define i8 @clmul_i8(i8 %a, i8 %b) #0 {
  %res = call i8 @llvm.clmul.i8(i8 %a, i8 %b)
  %B = add i8 %b, %res
  %B1 = udiv i8 %b, -128
  store i8 %B, ptr poison, align 1
  ret i8 %B1
}

; Function Attrs: nounwind
declare i16 @clmul_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @clmul_i32(i32, i32) #0

; Function Attrs: nounwind
define i48 @clmul_i48(i48 %a, i48 %b) #0 {
  %B = or i48 %a, %a
  ret i48 %B
}

; Function Attrs: nounwind
declare i64 @clmul_i64(i64, i64) #0

declare i64 @clmul_i64_zext(i32, i32)

declare i96 @clmul_i96(i96, i96)

declare i128 @clmul_i128(i128, i128)

define i128 @clmul_i128_zext(i64 %x, i64 %y) {
  %LGV = load <4 x float>, ptr @G, align 16
  %C = fcmp ult <4 x float> %LGV, splat (float f0x7F7FFFFF)
  %zextx = zext i64 %x to i128
  %zexty = zext i64 %y to i128
  %a = call i128 @llvm.clmul.i128(i128 %zextx, i128 %zexty)
  store <4 x i1> %C, ptr @G.1, align 1
  ret i128 %a
}

; Function Attrs: nounwind
define i4 @clmul_constfold_i4() #0 {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV = load <4 x float>, ptr @G.2, align 16
  %C = fcmp ole <4 x float> zeroinitializer, %LGV
  %res = call i4 @llvm.clmul.i4(i4 1, i4 2)
  store <4 x i1> %C, ptr %A, align 1
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
declare void @neg_commutative_clmul_i8(i8, i8, ptr, ptr) #0

declare void @vector_use(<2 x i64>)

; Function Attrs: nounwind
declare void @commutative_clmul_v2i64(<2 x i64>, <2 x i64>, ptr, ptr) #0

; Function Attrs: nounwind
define void @mul_use_commutative_clmul_v2i64(<2 x i64> %x, <2 x i64> %y, ptr %p0, ptr %p1) #0 {
  %xy = call <2 x i64> @llvm.clmul.v2i64(<2 x i64> %x, <2 x i64> %y)
  %yx = call <2 x i64> @llvm.clmul.v2i64(<2 x i64> %y, <2 x i64> %x)
  store <2 x i64> %xy, ptr %p0, align 16
  call void @vector_use(<2 x i64> %xy)
  store <2 x i64> %yx, ptr %p1, align 16
  %B = shl <2 x i64> %x, %xy
  store <2 x i64> %B, ptr @G.3, align 16
  ret void
}

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

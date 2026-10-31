; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m,+zvbc,+zhinx,+zcb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -2147483648
@G.1 = global i1 false
@G.2 = global i1 true
@G.3 = global i48 42
@G.4 = global i1 false
@G.5 = global i8 1

; Function Attrs: nounwind
declare i4 @clmul_i4(i4, i4) #0

; Function Attrs: nounwind
declare i8 @clmul_i8(i8, i8) #0

; Function Attrs: nounwind
declare i16 @clmul_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @clmul_i32(i32, i32) #0

; Function Attrs: nounwind
define i48 @clmul_i48(i48 %a, i48 %b) #0 {
  %A = alloca i48, align 8
  store i48 poison, ptr %A, align 4
  %LGV = load i48, ptr @G.3, align 4
  %res = call i48 @llvm.clmul.i48(i48 %a, i48 %b)
  %B = udiv i48 %res, %LGV
  store i48 %B, ptr %A, align 4
  ret i48 %res
}

; Function Attrs: nounwind
define i64 @clmul_i64(i64 %a, i64 %b) #0 {
  %res = call i64 @llvm.clmul.i64(i64 %a, i64 %b)
  %C = fcmp ult half 6.550400e+04, 4.200000e+01
  store i1 %C, ptr @G.4, align 1
  ret i64 %res
}

define i64 @clmul_i64_zext(i32 %x, i32 %y) {
  %zextx = zext i32 %x to i64
  %C = icmp ult i32 %x, %x
  %C1 = icmp ule i64 %zextx, 1
  %zexty = zext i32 %y to i64
  %a = call i64 @llvm.clmul.i64(i64 %zextx, i64 %zexty)
  store i1 %C, ptr @G.2, align 1
  store i1 %C1, ptr poison, align 1
  ret i64 %a
}

declare i96 @clmul_i96(i96, i96)

declare i128 @clmul_i128(i128, i128)

declare i128 @clmul_i128_zext(i64, i64)

; Function Attrs: nounwind
declare i4 @clmul_constfold_i4() #0

; Function Attrs: nounwind
declare i16 @clmul_constfold_i16() #0

declare i8 @use(i8, i1)

; Function Attrs: nounwind
define void @commutative_clmul_i8(i8 %x, i8 %y, ptr %p0, ptr %p1) #0 {
  %LGV = load i8, ptr @G.5, align 1
  %xy = call i8 @llvm.clmul.i8(i8 %x, i8 %y)
  %yx = call i8 @llvm.clmul.i8(i8 %y, i8 %x)
  %C = icmp ult i8 %xy, %LGV
  store i8 %xy, ptr %p0, align 1
  store i8 %yx, ptr %p1, align 1
  store i1 %C, ptr poison, align 1
  ret void
}

; Function Attrs: nounwind
define void @mul_use_commutative_clmul_i8(i8 %x, i8 %y, ptr %p0, ptr %p1) #0 {
  %LGV = load i32, ptr @G, align 4
  %xy = call i8 @llvm.clmul.i8(i8 %x, i8 %y)
  %yx = call i8 @llvm.clmul.i8(i8 %y, i8 %x)
  store i8 %xy, ptr %p0, align 1
  %C = icmp slt i32 %LGV, -2147483648
  call void @use(i8 %xy)
  store i8 %yx, ptr %p1, align 1
  store i1 %C, ptr @G.1, align 1
  ret void
}

; Function Attrs: nounwind
define void @neg_commutative_clmul_i8(i8 %x, i8 %y, ptr %p0, ptr %p1) #0 {
  %xy = call i8 @llvm.clmul.i8(i8 %x, i8 %y)
  store i8 %xy, ptr %p0, align 1
  %B = urem i8 %xy, %x
  store i8 %xy, ptr %p1, align 1
  store i8 %B, ptr poison, align 1
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

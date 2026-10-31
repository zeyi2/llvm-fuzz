; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zhinx,+zdinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> zeroinitializer
@G.1 = global i48 -1
@G.2 = global i128 -170141183460469231731687303715884105728
@G.3 = global i1 true

; Function Attrs: nounwind
declare i4 @clmul_i4(i4, i4) #0

; Function Attrs: nounwind
declare i8 @clmul_i8(i8, i8) #0

; Function Attrs: nounwind
define i16 @clmul_i16(i16 %a, i16 %b) #0 {
  %C = icmp eq i8 127, 0
  %res = call i16 @llvm.clmul.i16(i16 %a, i16 %b)
  store i1 %C, ptr @G.3, align 1
  ret i16 %res
}

; Function Attrs: nounwind
declare i32 @clmul_i32(i32, i32) #0

; Function Attrs: nounwind
define i48 @clmul_i48(i48 %a, i48 %b) #0 {
  %B1 = sub i48 %b, %a
  %B = lshr i48 %a, -1
  %res = call i48 @llvm.clmul.i48(i48 %a, i48 %b)
  store i48 %B, ptr @G.1, align 4
  store i48 %B1, ptr @G.1, align 4
  ret i48 %res
}

; Function Attrs: nounwind
declare i64 @clmul_i64(i64, i64) #0

declare i64 @clmul_i64_zext(i32, i32)

define i96 @clmul_i96(i96 %x, i96 %y) {
  %B = lshr <8 x i8> splat (i8 127), zeroinitializer
  %a = call i96 @llvm.clmul.i96(i96 %x, i96 %y)
  store <8 x i8> %B, ptr @G, align 8
  ret i96 %a
}

define i128 @clmul_i128(i128 %x, i128 %y) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i128, ptr @G.2, align 4
  %C = icmp ult i128 %x, %LGV
  %a = call i128 @llvm.clmul.i128(i128 %x, i128 %y)
  store i1 %C, ptr %A, align 1
  ret i128 %a
}

declare i128 @clmul_i128_zext(i64, i64)

; Function Attrs: nounwind
declare i4 @clmul_constfold_i4() #0

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

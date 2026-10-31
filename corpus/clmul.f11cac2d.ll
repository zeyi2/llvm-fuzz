; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zvbc,+zfinx -O2 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float f0x7F7FFFFF
@G.1 = global <2 x i64> splat (i64 4294967296)
@G.2 = global <2 x i1> zeroinitializer
@G.3 = global i16 32767
@G.4 = global i64 0
@G.5 = global i1 false

; Function Attrs: nounwind
declare i4 @clmul_i4(i4, i4) #0

; Function Attrs: nounwind
declare i8 @clmul_i8(i8, i8) #0

; Function Attrs: nounwind
define i16 @clmul_i16(i16 %a, i16 %b) #0 {
  %LGV2 = load <2 x i64>, ptr @G.1, align 16
  %C = icmp ule <2 x i64> %LGV2, zeroinitializer
  %LGV = load float, ptr @G, align 4
  %res = call i16 @llvm.clmul.i16(i16 %a, i16 %b)
  %B = fmul float %LGV, +qnan
  store float %B, ptr poison, align 4
  store <2 x i1> %C, ptr @G.2, align 1
  ret i16 %res
}

; Function Attrs: nounwind
declare i32 @clmul_i32(i32, i32) #0

; Function Attrs: nounwind
declare i48 @clmul_i48(i48, i48) #0

; Function Attrs: nounwind
declare i64 @clmul_i64(i64, i64) #0

define i64 @clmul_i64_zext(i32 %x, i32 %y) {
  %LGV = load i64, ptr @G.4, align 4
  %C = icmp ult i64 %LGV, 0
  %zextx = zext i32 %x to i64
  %zexty = zext i32 %y to i64
  %a = call i64 @llvm.clmul.i64(i64 %zextx, i64 %zexty)
  store i1 %C, ptr @G.5, align 1
  ret i64 %a
}

define i96 @clmul_i96(i96 %x, i96 %y) {
  %a = call i96 @llvm.clmul.i96(i96 %x, i96 %y)
  %B = udiv i8 -128, 0
  store i8 %B, ptr poison, align 1
  ret i96 %a
}

declare i128 @clmul_i128(i128, i128)

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
define void @neg_commutative_clmul_i8(i8 %x, i8 %y, ptr %p0, ptr %p1) #0 {
  %B = sub i16 -1, 0
  %xy = call i8 @llvm.clmul.i8(i8 %x, i8 %y)
  store i8 %xy, ptr %p0, align 1
  store i8 %xy, ptr %p1, align 1
  store i16 %B, ptr @G.3, align 2
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

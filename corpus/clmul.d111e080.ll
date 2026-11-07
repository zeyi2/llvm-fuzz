; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zhinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 0
@G.1 = global i48 16777216
@G.2 = global i1 false

; Function Attrs: nounwind
declare i4 @clmul_i4(i4, i4) #0

; Function Attrs: nounwind
declare i8 @clmul_i8(i8, i8) #0

; Function Attrs: nounwind
declare i16 @clmul_i16(i16, i16) #0

; Function Attrs: nounwind
define i32 @clmul_i32(i32 %a, i32 %b) #0 {
  %A1 = alloca i1, align 1
  store i1 false, ptr %A1, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %res = call i32 @llvm.clmul.i32(i32 %a, i32 %b)
  ret i32 %res

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %L2 = load i1, ptr %A1, align 1
  br i1 %L2, label %F, label %BB
}

; Function Attrs: nounwind
define i48 @clmul_i48(i48 %a, i48 %b) #0 {
  %B = srem i48 %a, %a
  %res = call i48 @llvm.clmul.i48(i48 %a, i48 %b)
  store i48 %B, ptr @G.1, align 4
  ret i48 %res
}

; Function Attrs: nounwind
define i64 @clmul_i64(i64 %a, i64 %b) #0 {
  %res = call i64 @llvm.clmul.i64(i64 %a, i64 %b)
  %B = mul i64 %res, %b
  ret i64 %B
}

declare i64 @clmul_i64_zext(i32, i32)

declare i96 @clmul_i96(i96, i96)

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
  %A1 = alloca i8, align 1
  store i8 0, ptr %A1, align 1
  %L = load i8, ptr %A1, align 1
  switch i8 %L, label %SW_D [
    i8 23, label %SW_C
    i8 -68, label %SW_C2
    i8 -17, label %SW_C3
  ]

BB:                                               ; preds = %SW_C3, %SW_C2, %SW_C, %SW_D
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %LGV = load i64, ptr @G, align 4
  %xy = call i8 @llvm.clmul.i8(i8 %x, i8 %y)
  store i8 %xy, ptr %p0, align 1
  %B = udiv i64 -9223372036854775808, %LGV
  store i8 %xy, ptr %p1, align 1
  store i64 %B, ptr %A, align 4
  ret void

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %SW_C3, %0
  %LGV4 = load i1, ptr @G.2, align 1
  br i1 %LGV4, label %SW_C3, label %BB
}

declare void @vector_use(<2 x i64>)

; Function Attrs: nounwind
define void @commutative_clmul_v2i64(<2 x i64> %x, <2 x i64> %y, ptr %p0, ptr %p1) #0 {
  %xy = call <2 x i64> @llvm.clmul.v2i64(<2 x i64> %x, <2 x i64> %y)
  %yx = call <2 x i64> @llvm.clmul.v2i64(<2 x i64> %y, <2 x i64> %x)
  store <2 x i64> %xy, ptr %p0, align 16
  store <2 x i64> %yx, ptr %p1, align 16
  store <2 x i64> %xy, ptr poison, align 16
  ret void
}

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

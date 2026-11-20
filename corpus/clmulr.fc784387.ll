; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i128> splat (i128 1)
@G.1 = global i4 0
@G.2 = global i1 false
@G.3 = global i16 42
@G.4 = global i16 -32768

; Function Attrs: nounwind
declare i4 @clmulr_i4(i4, i4) #0

; Function Attrs: nounwind
define i4 @clmulr_i4_bitreverse(i4 %a, i4 %b) #0 {
  %LGV1 = load i4, ptr @G.1, align 1
  %C = icmp ne i4 %a, %LGV1
  %a.rev = call i4 @llvm.bitreverse.i4(i4 %a)
  %b.rev = call i4 @llvm.bitreverse.i4(i4 %b)
  %res.rev = call i4 @llvm.clmul.i4(i4 %a.rev, i4 %b.rev)
  %res = call i4 @llvm.bitreverse.i4(i4 %res.rev)
  store i1 %C, ptr @G.2, align 1
  ret i4 %res
}

; Function Attrs: nounwind
define i8 @clmulr_i8(i8 %a, i8 %b) #0 {
  %LGV = load i16, ptr @G.3, align 2
  %a.ext = zext i8 %a to i16
  %b.ext = zext i8 %b to i16
  %clmul = call i16 @llvm.clmul.i16(i16 %a.ext, i16 %b.ext)
  %res.ext = lshr i16 %clmul, 7
  %res = trunc i16 %res.ext to i8
  %B = shl i16 %b.ext, %LGV
  store i16 %B, ptr poison, align 2
  ret i8 %res
}

; Function Attrs: nounwind
declare i16 @clmulr_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @clmulr_i32(i32, i32) #0

declare i8 @use(i8, i1)

; Function Attrs: nounwind
define void @commutative_clmulr_i8(i8 %x, i8 %y, ptr %p0, ptr %p1) #0 {
  %LGV = load i16, ptr @G.4, align 2
  %x.ext = zext i8 %x to i16
  %y.ext = zext i8 %y to i16
  %C = icmp ugt i16 32767, %LGV
  %clmul_xy = call i16 @llvm.clmul.i16(i16 %x.ext, i16 %y.ext)
  %clmul_yx = call i16 @llvm.clmul.i16(i16 %y.ext, i16 %x.ext)
  %clmul_xy_lshr = lshr i16 %clmul_xy, 7
  %clmul_yx_lshr = lshr i16 %clmul_yx, 7
  %clmulh_xy = trunc i16 %clmul_xy_lshr to i8
  %clmulh_yx = trunc i16 %clmul_yx_lshr to i8
  store i8 %clmulh_xy, ptr %p0, align 1
  store i8 %clmulh_yx, ptr %p1, align 1
  store i1 %C, ptr poison, align 1
  ret void
}

; Function Attrs: nounwind
define void @mul_use_commutative_clmul_i8(i8 %x, i8 %y, ptr %p0, ptr %p1) #0 {
  %G = getelementptr i64, ptr %p1, i8 %x
  %xy = call i8 @llvm.clmul.i8(i8 %x, i8 %y)
  %yx = call i8 @llvm.clmul.i8(i8 %y, i8 %x)
  store i8 %xy, ptr %p0, align 1
  call void @use(i8 %xy)
  store i8 %yx, ptr %p1, align 1
  store ptr %G, ptr poison, align 8
  ret void
}

; Function Attrs: nounwind
define void @commutative_clmulr_v2i64(<2 x i64> %x, <2 x i64> %y, ptr %p0, ptr %p1) #0 {
  %LGV = load <2 x i128>, ptr @G, align 32
  %x.ext = zext <2 x i64> %x to <2 x i128>
  %y.ext = zext <2 x i64> %y to <2 x i128>
  %clmul_xy = call <2 x i128> @llvm.clmul.v2i128(<2 x i128> %x.ext, <2 x i128> %y.ext)
  %clmul_xy_lshr = lshr <2 x i128> %clmul_xy, splat (i128 63)
  %clmulh_xy = trunc <2 x i128> %clmul_xy_lshr to <2 x i64>
  %B = and <2 x i128> %x.ext, %LGV
  %clmulh_yx = trunc <2 x i128> %B to <2 x i64>
  store <2 x i64> %clmulh_xy, ptr %p0, align 16
  store <2 x i64> %clmulh_yx, ptr %p1, align 16
  ret void
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i4 @llvm.bitreverse.i4(i4) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.clmul.i16(i16, i16) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.clmul.i32(i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i4 @llvm.clmul.i4(i4, i4) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.clmul.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.clmul.i8(i8, i8) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i128> @llvm.clmul.v2i128(<2 x i128>, <2 x i128>) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

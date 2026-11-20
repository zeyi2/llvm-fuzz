; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -O2 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 42)
@G.1 = global i8 -1
@G.2 = global i1 false

; Function Attrs: nounwind
declare i4 @clmulh_i4(i4, i4) #0

; Function Attrs: nounwind
define i4 @clmulh_i4_bitreverse(i4 %a, i4 %b) #0 {
  %a.rev = call i4 @llvm.bitreverse.i4(i4 %a)
  %B = or i4 %a.rev, 7
  %b.rev = call i4 @llvm.bitreverse.i4(i4 %b)
  %clmul = call i4 @llvm.clmul.i4(i4 %B, i4 %b.rev)
  %clmul.rev = call i4 @llvm.bitreverse.i4(i4 %clmul)
  %res = lshr i4 %clmul.rev, 1
  ret i4 %res
}

; Function Attrs: nounwind
define i8 @clmulh_i8(i8 %a, i8 %b) #0 {
  %a.ext = zext i8 %a to i16
  %b.ext = zext i8 %b to i16
  %C = icmp slt i16 %b.ext, 1
  %clmul = call i16 @llvm.clmul.i16(i16 %a.ext, i16 %b.ext)
  %res.ext = lshr i16 %clmul, 8
  %res = trunc i16 %res.ext to i8
  store i1 %C, ptr @G.2, align 1
  ret i8 %res
}

; Function Attrs: nounwind
define i16 @clmulh_i16(i16 %a, i16 %b) #0 {
  %LGV = load <2 x i64>, ptr @G, align 16
  %a.ext = zext i16 %a to i32
  %B = sub <2 x i64> %LGV, splat (i64 -9223372036854775808)
  %b.ext = zext i16 %b to i32
  %clmul = call i32 @llvm.clmul.i32(i32 %a.ext, i32 %b.ext)
  %res.ext = lshr i32 %clmul, 16
  %res = trunc i32 %res.ext to i16
  store <2 x i64> %B, ptr @G, align 16
  ret i16 %res
}

; Function Attrs: nounwind
declare i32 @clmulh_i32(i32, i32) #0

declare i8 @use(i8, i1)

define void @commutative_clmulh_i8(i8 %x, i8 %y, ptr %p0, ptr %p1) {
  %LGV = load i8, ptr @G.1, align 1
  %x.ext = zext i8 %x to i16
  %y.ext = zext i8 %y to i16
  %B = srem i8 %y, %LGV
  %clmul_xy = call i16 @llvm.clmul.i16(i16 %x.ext, i16 %y.ext)
  %clmul_yx = call i16 @llvm.clmul.i16(i16 %y.ext, i16 %x.ext)
  %clmul_xy_lshr = lshr i16 %clmul_xy, 8
  %clmul_yx_lshr = lshr i16 %clmul_yx, 8
  %clmulh_xy = trunc i16 %clmul_xy_lshr to i8
  %clmulh_yx = trunc i16 %clmul_yx_lshr to i8
  store i8 %clmulh_xy, ptr %p0, align 1
  store i8 %clmulh_yx, ptr %p1, align 1
  store i8 %B, ptr poison, align 1
  ret void
}

; Function Attrs: nounwind
define void @commutative_clmulh_v2i64(<2 x i64> %x, <2 x i64> %y, ptr %p0, ptr %p1) #0 {
  %x.ext = zext <2 x i64> %x to <2 x i128>
  %y.ext = zext <2 x i64> %y to <2 x i128>
  %clmul_xy = call <2 x i128> @llvm.clmul.v2i128(<2 x i128> %x.ext, <2 x i128> %y.ext)
  %clmul_yx = call <2 x i128> @llvm.clmul.v2i128(<2 x i128> %y.ext, <2 x i128> %x.ext)
  %clmul_xy_lshr = lshr <2 x i128> %clmul_xy, splat (i128 64)
  %clmul_yx_lshr = lshr <2 x i128> %clmul_yx, splat (i128 64)
  %clmulh_xy = trunc <2 x i128> %clmul_xy_lshr to <2 x i64>
  %clmulh_yx = trunc <2 x i128> %clmul_yx_lshr to <2 x i64>
  store <2 x i64> %clmulh_xy, ptr %p0, align 16
  %B = sdiv <2 x i128> %clmul_xy, %clmul_xy_lshr
  store <2 x i64> %clmulh_yx, ptr %p1, align 16
  store <2 x i128> %B, ptr poison, align 32
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

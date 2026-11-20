; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global bfloat 4.200000e+01
@G.1 = global bfloat +inf
@G.2 = global <2 x i128> splat (i128 18446744073709551616)
@G.3 = global i1 false
@G.4 = global i128 18446744073709551616

; Function Attrs: nounwind
declare i4 @clmulh_i4(i4, i4) #0

; Function Attrs: nounwind
declare i4 @clmulh_i4_bitreverse(i4, i4) #0

; Function Attrs: nounwind
declare i8 @clmulh_i8(i8, i8) #0

; Function Attrs: nounwind
declare i16 @clmulh_i16(i16, i16) #0

; Function Attrs: nounwind
define i32 @clmulh_i32(i32 %a, i32 %b) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load bfloat, ptr @G.1, align 2
  %LGV = load bfloat, ptr @G, align 2
  %a.ext = zext i32 %a to i64
  %b.ext = zext i32 %b to i64
  %clmul = call i64 @llvm.clmul.i64(i64 %a.ext, i64 %b.ext)
  %res.ext = lshr i64 %clmul, 32
  %C = fcmp false bfloat %LGV, %LGV1
  %res = trunc i64 %res.ext to i32
  store i1 %C, ptr %A, align 1
  ret i32 %res
}

declare i8 @use(i8, i1)

declare void @commutative_clmulh_i8(i8, i8, ptr, ptr)

; Function Attrs: nounwind
define void @commutative_clmulh_v2i64(<2 x i64> %x, <2 x i64> %y, ptr %p0, ptr %p1) #0 {
  %LGV = load i1, ptr @G.3, align 1
  %x.ext = zext <2 x i64> %x to <2 x i128>
  %y.ext = zext <2 x i64> %y to <2 x i128>
  %clmul_xy = call <2 x i128> @llvm.clmul.v2i128(<2 x i128> %x.ext, <2 x i128> %y.ext)
  %clmul_yx = call <2 x i128> @llvm.clmul.v2i128(<2 x i128> %y.ext, <2 x i128> %x.ext)
  %E = extractelement <2 x i128> %x.ext, i1 %LGV
  %clmul_xy_lshr = lshr <2 x i128> %clmul_xy, splat (i128 64)
  %clmul_yx_lshr = lshr <2 x i128> %clmul_yx, splat (i128 64)
  %B = shl <2 x i128> %x.ext, %clmul_yx
  %clmulh_xy = trunc <2 x i128> %clmul_xy_lshr to <2 x i64>
  %clmulh_yx = trunc <2 x i128> %clmul_yx_lshr to <2 x i64>
  store <2 x i64> %clmulh_xy, ptr %p0, align 16
  store <2 x i64> %clmulh_yx, ptr %p1, align 16
  store <2 x i128> %B, ptr @G.2, align 32
  store i128 %E, ptr @G.4, align 4
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

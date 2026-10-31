; isel-diff-config: -mtriple=riscv32 -mattr=+m,+zdinx,+zbb -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> zeroinitializer
@G.1 = global <16 x i8> splat (i8 16)
@G.2 = global i1 false
@G.3 = global i8 42

; Function Attrs: nounwind
declare i16 @umulh_i16(i16, i16) #0

; Function Attrs: nounwind
define i32 @umulh_i32(i32 %x, i32 %y) #0 {
  %LGV1 = load i8, ptr @G.3, align 1
  %C = icmp sge i8 1, %LGV1
  %r = call i32 @llvm.umulh.i32(i32 %x, i32 %y)
  store i1 %C, ptr poison, align 1
  ret i32 %r
}

; Function Attrs: nounwind
define i64 @umulh_i64(i64 %x, i64 %y) #0 {
  %r = call i64 @llvm.umulh.i64(i64 %x, i64 %y)
  %C = icmp eq i64 %y, %r
  store i1 %C, ptr @G.2, align 1
  ret i64 %r
}

; Function Attrs: nounwind
define i96 @umulh_i96(i96 %x, i96 %y) #0 {
  %r = call i96 @llvm.umulh.i96(i96 %x, i96 %y)
  %C = icmp slt i1 false, true
  store i1 %C, ptr @G.2, align 1
  ret i96 %r
}

; Function Attrs: nounwind
declare i128 @umulh_i128(i128, i128) #0

; Function Attrs: nounwind
declare <8 x i8> @umulh_v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nounwind
declare <4 x i16> @umulh_v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nounwind
declare <2 x i32> @umulh_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
define <1 x i64> @umulh_v1i64(<1 x i64> %x, <1 x i64> %y) #0 {
  %LGV = load <4 x i32>, ptr @G, align 16
  %B = add <4 x i32> splat (i32 1), %LGV
  %r = call <1 x i64> @llvm.umulh.v1i64(<1 x i64> %x, <1 x i64> %y)
  store <4 x i32> %B, ptr @G, align 16
  ret <1 x i64> %r
}

; Function Attrs: nounwind
define <16 x i8> @umulh_v16i8(<16 x i8> %x, <16 x i8> %y) #0 {
  %r = call <16 x i8> @llvm.umulh.v16i8(<16 x i8> %x, <16 x i8> %y)
  %B = srem <16 x i8> %x, %x
  store <16 x i8> %B, ptr @G.1, align 16
  ret <16 x i8> %r
}

; Function Attrs: nounwind
declare <8 x i16> @umulh_v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nounwind
declare <4 x i32> @umulh_v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nounwind
declare <2 x i64> @umulh_v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nounwind
declare <3 x i32> @umulh_v3i32(<3 x i32>, <3 x i32>) #0

; Function Attrs: nounwind
declare <2 x i48> @umulh_v2i48(<2 x i48>, <2 x i48>) #0

; Function Attrs: nounwind
declare <2 x i128> @umulh_v2i128(<2 x i128>, <2 x i128>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i128> @llvm.umulh.v2i128(<2 x i128>, <2 x i128>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i48> @llvm.umulh.v2i48(<2 x i48>, <2 x i48>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i32> @llvm.umulh.v3i32(<3 x i32>, <3 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.umulh.v2i64(<2 x i64>, <2 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.umulh.v4i32(<4 x i32>, <4 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.umulh.v8i16(<8 x i16>, <8 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.umulh.v16i8(<16 x i8>, <16 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.umulh.v1i64(<1 x i64>, <1 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.umulh.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.umulh.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.umulh.v8i8(<8 x i8>, <8 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.umulh.i128(i128, i128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i96 @llvm.umulh.i96(i96, i96) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umulh.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umulh.i32(i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.umulh.i16(i16, i16) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

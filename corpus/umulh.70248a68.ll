; isel-diff-config: -mtriple=riscv32 -mattr=+zbs -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -1
@G.1 = global <2 x i64> splat (i64 -1)
@G.2 = global <2 x i48> zeroinitializer
@G.3 = global <8 x i16> splat (i16 -1)
@G.4 = global float +qnan
@G.5 = global i1 false
@G.6 = global i96 1
@G.7 = global i1 false

; Function Attrs: nounwind
declare i16 @umulh_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @umulh_i32(i32, i32) #0

; Function Attrs: nounwind
declare i64 @umulh_i64(i64, i64) #0

; Function Attrs: nounwind
define i96 @umulh_i96(i96 %x, i96 %y) #0 {
  %LGV1 = load i96, ptr @G.6, align 4
  %r = call i96 @llvm.umulh.i96(i96 %x, i96 %y)
  %C = icmp slt i96 %r, %LGV1
  store i1 %C, ptr @G.7, align 1
  ret i96 %r
}

; Function Attrs: nounwind
declare i128 @umulh_i128(i128, i128) #0

; Function Attrs: nounwind
declare <8 x i8> @umulh_v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nounwind
define <4 x i16> @umulh_v4i16(<4 x i16> %x, <4 x i16> %y) #0 {
  %LGV = load float, ptr @G.4, align 4
  %C = fcmp ule float 4.200000e+01, %LGV
  %r = call <4 x i16> @llvm.umulh.v4i16(<4 x i16> %x, <4 x i16> %y)
  store i1 %C, ptr @G.5, align 1
  ret <4 x i16> %r
}

; Function Attrs: nounwind
declare <2 x i32> @umulh_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
declare <1 x i64> @umulh_v1i64(<1 x i64>, <1 x i64>) #0

; Function Attrs: nounwind
declare <16 x i8> @umulh_v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nounwind
define <8 x i16> @umulh_v8i16(<8 x i16> %x, <8 x i16> %y) #0 {
  %LGV = load <8 x i16>, ptr @G.3, align 16
  %B = urem <8 x i16> %y, %LGV
  %r = call <8 x i16> @llvm.umulh.v8i16(<8 x i16> %B, <8 x i16> %y)
  ret <8 x i16> %r
}

; Function Attrs: nounwind
declare <4 x i32> @umulh_v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nounwind
define <2 x i64> @umulh_v2i64(<2 x i64> %x, <2 x i64> %y) #0 {
  %LGV = load i8, ptr @G, align 1
  %r = call <2 x i64> @llvm.umulh.v2i64(<2 x i64> %x, <2 x i64> %y)
  %I = insertelement <2 x i64> %r, i64 9223372036854775807, i8 %LGV
  store <2 x i64> %I, ptr @G.1, align 16
  ret <2 x i64> %r
}

; Function Attrs: nounwind
declare <3 x i32> @umulh_v3i32(<3 x i32>, <3 x i32>) #0

; Function Attrs: nounwind
define <2 x i48> @umulh_v2i48(<2 x i48> %x, <2 x i48> %y) #0 {
  %r = call <2 x i48> @llvm.umulh.v2i48(<2 x i48> %x, <2 x i48> %y)
  %B = srem <2 x i48> %r, %x
  store <2 x i48> %B, ptr @G.2, align 16
  ret <2 x i48> %r
}

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

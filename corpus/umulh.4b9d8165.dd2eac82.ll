; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zdinx -O1 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 65536
@G.1 = global i16 256
@G.2 = global <2 x i64> splat (i64 -1)
@G.3 = global <1 x i64> splat (i64 4294967296)
@G.4 = global <4 x i16> zeroinitializer

; Function Attrs: nounwind
declare i16 @umulh_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @umulh_i32(i32, i32) #0

; Function Attrs: nounwind
declare i64 @umulh_i64(i64, i64) #0

; Function Attrs: nounwind
declare i96 @umulh_i96(i96, i96) #0

; Function Attrs: nounwind
declare i128 @umulh_i128(i128, i128) #0

; Function Attrs: nounwind
declare <8 x i8> @umulh_v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nounwind
define <4 x i16> @umulh_v4i16(<4 x i16> %x, <4 x i16> %y) #0 {
  %LGV = load i32, ptr @G, align 4
  %A = alloca i32, align 4
  %r = call <4 x i16> @llvm.umulh.v4i16(<4 x i16> %x, <4 x i16> %y)
  store i32 poison, ptr %A, align 4
  %B = lshr i32 %LGV, 2147483647
  store i32 %B, ptr %A, align 4
  %B1 = ashr <4 x i16> %x, zeroinitializer
  store <4 x i16> %B1, ptr @G.4, align 8
  ret <4 x i16> %r
}

; Function Attrs: nounwind
declare <2 x i32> @umulh_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
define <1 x i64> @umulh_v1i64(<1 x i64> %x, <1 x i64> %y) #0 {
  %A = alloca <1 x i64>, align 8
  store <1 x i64> poison, ptr %A, align 8
  %LGV = load <1 x i64>, ptr @G.3, align 8
  %r = call <1 x i64> @llvm.umulh.v1i64(<1 x i64> %x, <1 x i64> %y)
  %B = sub <2 x i64> zeroinitializer, splat (i64 1)
  store <2 x i64> %B, ptr @G.2, align 16
  %B1 = urem <1 x i64> %r, %LGV
  store <1 x i64> %B1, ptr %A, align 8
  ret <1 x i64> %r
}

; Function Attrs: nounwind
declare <16 x i8> @umulh_v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nounwind
declare <8 x i16> @umulh_v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nounwind
declare <4 x i32> @umulh_v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nounwind
declare <2 x i64> @umulh_v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nounwind
declare <3 x i32> @umulh_v3i32(<3 x i32>, <3 x i32>) #0

; Function Attrs: nounwind
define <2 x i48> @umulh_v2i48(<2 x i48> %x, <2 x i48> %y) #0 {
  %B = sdiv <2 x i48> %x, %y
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i16, ptr @G.1, align 2
  %C = icmp ne i16 0, %LGV
  %r = call <2 x i48> @llvm.umulh.v2i48(<2 x i48> %x, <2 x i48> %y)
  store i1 %C, ptr %A, align 1
  store <2 x i48> %B, ptr %A, align 16
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

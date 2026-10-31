; isel-diff-config: -mtriple=riscv32 -mattr=+m,+a,+zdinx -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i1 true
@G.2 = global i1 false
@G.3 = global <2 x i1> zeroinitializer

; Function Attrs: nounwind
declare i16 @umulh_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @umulh_i32(i32, i32) #0

; Function Attrs: nounwind
define i64 @umulh_i64(i64 %x, i64 %y) #0 {
  %LGV1 = load i1, ptr @G.2, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i1, ptr @G.1, align 1
  %r = call i64 @llvm.umulh.i64(i64 %x, i64 %y)
  %C = icmp ugt i1 true, %LGV
  store i1 %C, ptr %A, align 1
  %B = sub i1 %LGV1, %C
  store i1 %B, ptr @G.1, align 1
  ret i64 %r
}

; Function Attrs: nounwind
declare i96 @umulh_i96(i96, i96) #0

; Function Attrs: nounwind
declare i128 @umulh_i128(i128, i128) #0

; Function Attrs: nounwind
declare <8 x i8> @umulh_v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nounwind
declare <4 x i16> @umulh_v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nounwind
declare <2 x i32> @umulh_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
declare <1 x i64> @umulh_v1i64(<1 x i64>, <1 x i64>) #0

; Function Attrs: nounwind
declare <16 x i8> @umulh_v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nounwind
define <8 x i16> @umulh_v8i16(<8 x i16> %x, <8 x i16> %y) #0 {
  %r = call <8 x i16> @llvm.umulh.v8i16(<8 x i16> %x, <8 x i16> %y)
  %C = icmp sgt <8 x i16> %x, %r
  store <8 x i1> %C, ptr poison, align 1
  ret <8 x i16> %r
}

; Function Attrs: nounwind
define <4 x i32> @umulh_v4i32(<4 x i32> %x, <4 x i32> %y) #0 {
  %r = call <4 x i32> @llvm.umulh.v4i32(<4 x i32> %x, <4 x i32> %y)
  %C = fcmp uge bfloat +qnan, 9.183550e-41
  store i1 %C, ptr @G, align 1
  ret <4 x i32> %r
}

; Function Attrs: nounwind
declare <2 x i64> @umulh_v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nounwind
declare <3 x i32> @umulh_v3i32(<3 x i32>, <3 x i32>) #0

; Function Attrs: nounwind
define <2 x i48> @umulh_v2i48(<2 x i48> %x, <2 x i48> %y) #0 {
  %A = alloca <2 x i1>, align 1
  store <2 x i1> poison, ptr %A, align 1
  %r = call <2 x i48> @llvm.umulh.v2i48(<2 x i48> %x, <2 x i48> %y)
  %C = icmp ne <2 x i48> %r, %y
  store <2 x i1> %C, ptr %A, align 1
  ret <2 x i48> %r
}

; Function Attrs: nounwind
define <2 x i128> @umulh_v2i128(<2 x i128> %x, <2 x i128> %y) #0 {
  %r = call <2 x i128> @llvm.umulh.v2i128(<2 x i128> %x, <2 x i128> %y)
  %C = icmp sge <2 x i64> splat (i64 1), zeroinitializer
  store <2 x i1> %C, ptr @G.3, align 1
  ret <2 x i128> %r
}

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

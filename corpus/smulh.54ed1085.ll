; isel-diff-config: -mtriple=riscv32 -mattr=+zhinx -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i32 1

; Function Attrs: nounwind
declare i16 @smulh_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @smulh_i32(i32, i32) #0

; Function Attrs: nounwind
define i64 @smulh_i64(i64 %x, i64 %y) #0 {
  %r = call i64 @llvm.smulh.i64(i64 %x, i64 %y)
  %C = icmp ule i64 %r, %y
  store i1 %C, ptr poison, align 1
  ret i64 %r
}

; Function Attrs: nounwind
declare i96 @smulh_i96(i96, i96) #0

; Function Attrs: nounwind
declare i128 @smulh_i128(i128, i128) #0

; Function Attrs: nounwind
declare <8 x i8> @smulh_v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nounwind
declare <4 x i16> @smulh_v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nounwind
declare <2 x i32> @smulh_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
declare <1 x i64> @smulh_v1i64(<1 x i64>, <1 x i64>) #0

; Function Attrs: nounwind
declare <16 x i8> @smulh_v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nounwind
declare <8 x i16> @smulh_v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nounwind
declare <4 x i32> @smulh_v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nounwind
declare <2 x i64> @smulh_v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nounwind
define <3 x i32> @smulh_v3i32(<3 x i32> %x, <3 x i32> %y) #0 {
  %LGV = load i1, ptr @G, align 1
  %B = mul i1 false, %LGV
  %r = call <3 x i32> @llvm.smulh.v3i32(<3 x i32> %x, <3 x i32> %y)
  store i1 %B, ptr @G, align 1
  ret <3 x i32> %r
}

; Function Attrs: nounwind
declare <2 x i48> @smulh_v2i48(<2 x i48>, <2 x i48>) #0

; Function Attrs: nounwind
define <2 x i128> @smulh_v2i128(<2 x i128> %x, <2 x i128> %y) #0 {
  %LGV = load i32, ptr @G.1, align 4
  %B = urem i32 -1, %LGV
  %r = call <2 x i128> @llvm.smulh.v2i128(<2 x i128> %x, <2 x i128> %y)
  store i32 %B, ptr @G.1, align 4
  ret <2 x i128> %r
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i128> @llvm.smulh.v2i128(<2 x i128>, <2 x i128>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i48> @llvm.smulh.v2i48(<2 x i48>, <2 x i48>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <3 x i32> @llvm.smulh.v3i32(<3 x i32>, <3 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.smulh.v2i64(<2 x i64>, <2 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.smulh.v4i32(<4 x i32>, <4 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.smulh.v8i16(<8 x i16>, <8 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.smulh.v16i8(<16 x i8>, <16 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.smulh.v1i64(<1 x i64>, <1 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.smulh.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.smulh.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.smulh.v8i8(<8 x i8>, <8 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.smulh.i128(i128, i128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i96 @llvm.smulh.i96(i96, i96) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smulh.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smulh.i32(i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.smulh.i16(i16, i16) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

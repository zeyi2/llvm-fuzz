; isel-diff-config: -mtriple=riscv64 -mattr=+m -O3 -code-model=small -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.000000e+00
@G.1 = global i8 127
@G.2 = global <2 x i48> splat (i48 16777216)
@G.3 = global <2 x i64> splat (i64 1)

; Function Attrs: nounwind
declare i16 @smulh_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @smulh_i32(i32, i32) #0

; Function Attrs: nounwind
declare i64 @smulh_i64(i64, i64) #0

; Function Attrs: nounwind
declare i96 @smulh_i96(i96, i96) #0

; Function Attrs: nounwind
define i128 @smulh_i128(i128 %x, i128 %y) #0 {
  %r = call i128 @llvm.smulh.i128(i128 %x, i128 %y)
  %B = xor i128 %y, %r
  store i128 %B, ptr poison, align 4
  ret i128 %r
}

; Function Attrs: nounwind
define <8 x i8> @smulh_v8i8(<8 x i8> %x, <8 x i8> %y) #0 {
  %r = call <8 x i8> @llvm.smulh.v8i8(<8 x i8> %x, <8 x i8> %y)
  %B = srem i8 127, 16
  store i8 %B, ptr @G.1, align 1
  ret <8 x i8> %r
}

; Function Attrs: nounwind
declare <4 x i16> @smulh_v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nounwind
declare <2 x i32> @smulh_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
define <1 x i64> @smulh_v1i64(<1 x i64> %x, <1 x i64> %y) #0 {
  %LGV = load float, ptr @G, align 4
  %r = call <1 x i64> @llvm.smulh.v1i64(<1 x i64> %x, <1 x i64> %y)
  %B = frem float %LGV, +qnan
  store float %B, ptr poison, align 4
  ret <1 x i64> %r
}

; Function Attrs: nounwind
declare <16 x i8> @smulh_v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nounwind
declare <8 x i16> @smulh_v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nounwind
declare <4 x i32> @smulh_v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nounwind
define <2 x i64> @smulh_v2i64(<2 x i64> %x, <2 x i64> %y) #0 {
  %A = alloca <2 x i64>, align 16
  store <2 x i64> poison, ptr %A, align 16
  %B1 = add <2 x i64> %x, splat (i64 -9223372036854775808)
  %r = call <2 x i64> @llvm.smulh.v2i64(<2 x i64> %x, <2 x i64> %y)
  %B = and <2 x i64> %y, %r
  store <2 x i64> %B, ptr @G.3, align 16
  store <2 x i64> %B1, ptr %A, align 16
  ret <2 x i64> %r
}

; Function Attrs: nounwind
declare <3 x i32> @smulh_v3i32(<3 x i32>, <3 x i32>) #0

; Function Attrs: nounwind
define <2 x i48> @smulh_v2i48(<2 x i48> %x, <2 x i48> %y) #0 {
  %r = call <2 x i48> @llvm.smulh.v2i48(<2 x i48> %x, <2 x i48> %y)
  %B = sdiv <2 x i48> %r, splat (i48 16777216)
  store <2 x i48> %B, ptr @G.2, align 16
  ret <2 x i48> %r
}

; Function Attrs: nounwind
declare <2 x i128> @smulh_v2i128(<2 x i128>, <2 x i128>) #0

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

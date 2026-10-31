; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float +qnan
@G.1 = global float 0.000000e+00
@G.2 = global i1 true
@G.3 = global i16 0
@G.4 = global <16 x i8> zeroinitializer
@G.5 = global <8 x i8> splat (i8 127)
@G.6 = global <4 x float> splat (float 1.000000e+00)
@G.7 = global <4 x i1> zeroinitializer

; Function Attrs: nounwind
declare i16 @smulh_i16(i16, i16) #0

; Function Attrs: nounwind
define i32 @smulh_i32(i32 %x, i32 %y) #0 {
  %LGV1 = load <4 x float>, ptr @G.6, align 16
  %C2 = fcmp ult <4 x float> zeroinitializer, %LGV1
  %A = alloca i1, align 1
  %L1 = load i16, ptr %A, align 2
  store i1 poison, ptr %A, align 1
  %C = fcmp ogt bfloat 0.000000e+00, +inf
  %r = call i32 @llvm.smulh.i32(i32 %x, i32 %y)
  %B = xor i16 256, %L1
  store i1 %C, ptr %A, align 1
  store i16 %B, ptr @G.3, align 2
  store <4 x i1> %C2, ptr @G.7, align 1
  ret i32 %r
}

; Function Attrs: nounwind
declare i64 @smulh_i64(i64, i64) #0

; Function Attrs: nounwind
declare i96 @smulh_i96(i96, i96) #0

; Function Attrs: nounwind
declare i128 @smulh_i128(i128, i128) #0

; Function Attrs: nounwind
define <8 x i8> @smulh_v8i8(<8 x i8> %x, <8 x i8> %y) #0 {
  %r = call <8 x i8> @llvm.smulh.v8i8(<8 x i8> %x, <8 x i8> %y)
  %C = fcmp uno half 1.000000e+00, +inf
  store i1 %C, ptr @G.2, align 1
  store i1 %C, ptr @G.2, align 1
  ret <8 x i8> %r
}

; Function Attrs: nounwind
declare <4 x i16> @smulh_v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nounwind
declare <2 x i32> @smulh_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
declare <1 x i64> @smulh_v1i64(<1 x i64>, <1 x i64>) #0

; Function Attrs: nounwind
define <16 x i8> @smulh_v16i8(<16 x i8> %x, <16 x i8> %y) #0 {
  %LGV1 = load <8 x i8>, ptr @G.5, align 8
  %B = srem <8 x i8> %LGV1, zeroinitializer
  %A = alloca <16 x i1>, align 2
  store <16 x i1> poison, ptr %A, align 2
  %LGV = load <16 x i8>, ptr @G.4, align 16
  %C = icmp ule <16 x i8> %y, %LGV
  %r = call <16 x i8> @llvm.smulh.v16i8(<16 x i8> %x, <16 x i8> %y)
  store <16 x i1> %C, ptr %A, align 2
  store <8 x i8> %B, ptr @G.5, align 8
  ret <16 x i8> %r
}

; Function Attrs: nounwind
declare <8 x i16> @smulh_v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nounwind
declare <4 x i32> @smulh_v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nounwind
declare <2 x i64> @smulh_v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nounwind
declare <3 x i32> @smulh_v3i32(<3 x i32>, <3 x i32>) #0

; Function Attrs: nounwind
define <2 x i48> @smulh_v2i48(<2 x i48> %x, <2 x i48> %y) #0 {
  %r = call <2 x i48> @llvm.smulh.v2i48(<2 x i48> %x, <2 x i48> %y)
  %C1 = icmp sle <2 x i48> %x, splat (i48 -140737488355328)
  %B = shl <2 x i48> %y, %r
  store <2 x i1> %C1, ptr poison, align 1
  ret <2 x i48> %B
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

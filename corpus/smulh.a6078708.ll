; isel-diff-config: -mtriple=riscv32 -mattr=+m,+zbkb -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global bfloat +inf
@G.1 = global bfloat 1.000000e+00
@G.2 = global i1 false
@G.3 = global <2 x i48> zeroinitializer
@G.4 = global <2 x i48> splat (i48 42)
@G.5 = global <4 x i32> splat (i32 -2147483648)
@G.7 = global half +inf
@G.8 = global <8 x i8> zeroinitializer
@G.9 = global <2 x i64> splat (i64 -1)
@G.10 = global <2 x i1> zeroinitializer

; Function Attrs: nounwind
declare i16 @smulh_i16(i16, i16) #0

; Function Attrs: nounwind
define i32 @smulh_i32(i32 %x, i32 %y) #0 {
  %LGV1 = load bfloat, ptr @G.1, align 2
  %LGV = load bfloat, ptr @G, align 2
  %B = fsub bfloat %LGV, +qnan
  %C = fcmp olt bfloat %B, %LGV1
  %r = call i32 @llvm.smulh.i32(i32 %x, i32 %y)
  store i1 %C, ptr @G.2, align 1
  ret i32 %r
}

; Function Attrs: nounwind
declare i64 @smulh_i64(i64, i64) #0

; Function Attrs: nounwind
declare i96 @smulh_i96(i96, i96) #0

; Function Attrs: nounwind
define i128 @smulh_i128(i128 %x, i128 %y) #0 {
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %LGV1 = load <4 x i32>, ptr @G.5, align 16
  %S = shufflevector <4 x i32> splat (i32 42), <4 x i32> %LGV1, <4 x i32> poison
  %r = call i128 @llvm.smulh.i128(i128 %x, i128 %y)
  store <4 x i32> %S, ptr %A, align 16
  ret i128 %r
}

; Function Attrs: nounwind
declare <8 x i8> @smulh_v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nounwind
declare <4 x i16> @smulh_v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nounwind
declare <2 x i32> @smulh_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
define <1 x i64> @smulh_v1i64(<1 x i64> %x, <1 x i64> %y) #0 {
  %LGV = load <2 x i64>, ptr @G.9, align 16
  %A = alloca <1 x i1>, align 1
  %L = load <2 x i64>, ptr %A, align 16
  %C1 = icmp ule <2 x i64> %L, %LGV
  store <1 x i1> poison, ptr %A, align 1
  %C = icmp sle <1 x i64> %x, %y
  %r = call <1 x i64> @llvm.smulh.v1i64(<1 x i64> %x, <1 x i64> %y)
  store <1 x i1> %C, ptr %A, align 1
  store <2 x i1> %C1, ptr @G.10, align 1
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
  %LGV = load <8 x i8>, ptr @G.8, align 8
  %C = icmp slt <8 x i8> splat (i8 127), %LGV
  %r = call <2 x i64> @llvm.smulh.v2i64(<2 x i64> %x, <2 x i64> %y)
  store <8 x i1> %C, ptr poison, align 1
  ret <2 x i64> %r
}

; Function Attrs: nounwind
declare <3 x i32> @smulh_v3i32(<3 x i32>, <3 x i32>) #0

; Function Attrs: nounwind
define <2 x i48> @smulh_v2i48(<2 x i48> %x, <2 x i48> %y) #0 {
  %LGV = load <2 x i48>, ptr @G.3, align 16
  %r = call <2 x i48> @llvm.smulh.v2i48(<2 x i48> %x, <2 x i48> %y)
  %B = sub <2 x i48> %r, %LGV
  store <2 x i48> %B, ptr @G.4, align 16
  ret <2 x i48> %r
}

; Function Attrs: nounwind
define <2 x i128> @smulh_v2i128(<2 x i128> %x, <2 x i128> %y) #0 {
  %LGV1 = load half, ptr @G.7, align 2
  %C = fcmp une half 0.000000e+00, %LGV1
  %r = call <2 x i128> @llvm.smulh.v2i128(<2 x i128> %x, <2 x i128> %y)
  store i1 %C, ptr poison, align 1
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

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zba,+m -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 -1)
@G.1 = global i64 0
@G.2 = global i1 true
@G.3 = global <3 x i1> splat (i1 true)
@G.4 = global <2 x i48> zeroinitializer
@G.5 = global <2 x i48> zeroinitializer
@G.6 = global i1 false

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
  %A = alloca i128, align 8
  %G = getelementptr i128, ptr %A, i1 false
  store i128 poison, ptr %A, align 4
  %r = call i128 @llvm.smulh.i128(i128 %x, i128 %y)
  %C = icmp eq i128 %y, 42
  %B = lshr i128 %x, %r
  store i128 %B, ptr %G, align 4
  store i1 %C, ptr poison, align 1
  ret i128 %r
}

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
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i1, ptr @G.6, align 1
  %r = call <3 x i32> @llvm.smulh.v3i32(<3 x i32> %x, <3 x i32> %y)
  %C = icmp sgt <3 x i32> %y, %x
  store <3 x i1> %C, ptr @G.3, align 1
  switch i1 %LGV, label %SW_D [
    i1 false, label %SW_C
    i1 true, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_C, %SW_D
  ret <3 x i32> %r

SW_D:                                             ; preds = %SW_D, %0
  br i1 %LGV, label %BB, label %SW_D

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %SW_C1, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_C1, label %BB
}

; Function Attrs: nounwind
define <2 x i48> @smulh_v2i48(<2 x i48> %x, <2 x i48> %y) #0 {
  %A = alloca <2 x i48>, align 16
  store <2 x i48> poison, ptr %A, align 16
  %B3 = ashr <2 x i48> %x, %y
  %LGV1 = load <2 x i48>, ptr @G.4, align 16
  %r = call <2 x i48> @llvm.smulh.v2i48(<2 x i48> %x, <2 x i48> %y)
  %LGV = load i64, ptr @G.1, align 4
  %B = sdiv <2 x i48> %r, %LGV1
  %C = icmp ule i64 42, %LGV
  %S = shufflevector <2 x i48> %B, <2 x i48> zeroinitializer, <2 x i32> poison
  store i1 %C, ptr @G.2, align 1
  store <2 x i48> %S, ptr @G.5, align 16
  store <2 x i48> %B3, ptr %A, align 16
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

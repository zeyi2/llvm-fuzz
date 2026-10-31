; isel-diff-config: -mtriple=riscv32 -mattr=+zfinx -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -2147483648
@G.1 = global <1 x i64> splat (i64 1)
@G.2 = global <2 x i48> splat (i48 1)
@G.3 = global i1 false

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
declare <4 x i16> @umulh_v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nounwind
declare <2 x i32> @umulh_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
define <1 x i64> @umulh_v1i64(<1 x i64> %x, <1 x i64> %y) #0 {
  %A12 = alloca ptr, align 8
  store ptr poison, ptr %A12, align 8
  %A9 = alloca i1, align 1
  store i1 true, ptr %A9, align 1
  %A6 = alloca i1, align 1
  store i1 true, ptr %A6, align 1
  %A = alloca i32, align 4
  store i32 0, ptr %A, align 4
  %LGV = load i32, ptr @G, align 4
  %L = load i32, ptr %A, align 4
  switch i32 %L, label %SW_D [
    i32 833283803, label %SW_C
    i32 -1155926485, label %SW_C2
    i32 1686392671, label %SW_C3
    i32 1784498188, label %SW_C4
    i32 173291729, label %SW_C5
  ]

BB:                                               ; preds = %SW_C5, %SW_C4, %SW_C2, %SW_C, %SW_D
  %r = call <1 x i64> @llvm.umulh.v1i64(<1 x i64> %x, <1 x i64> %y)
  %B = add i32 %LGV, -2147483648
  store i32 %B, ptr poison, align 4
  ret <1 x i64> %r

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %G = getelementptr i8, ptr %A6, i32 %L
  store ptr %G, ptr %A12, align 8
  br label %BB

SW_C2:                                            ; preds = %SW_C2, %0
  %L7 = load i1, ptr %A6, align 1
  br i1 %L7, label %SW_C2, label %BB

SW_C3:                                            ; preds = %0
  %LGV8 = load <1 x i64>, ptr @G.1, align 8
  ret <1 x i64> %LGV8

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %SW_C5, %0
  %L10 = load i1, ptr %A9, align 1
  br i1 %L10, label %SW_C5, label %BB
}

; Function Attrs: nounwind
define <16 x i8> @umulh_v16i8(<16 x i8> %x, <16 x i8> %y) #0 {
  %C = fcmp ueq half 4.200000e+01, 4.200000e+01
  %r = call <16 x i8> @llvm.umulh.v16i8(<16 x i8> %x, <16 x i8> %y)
  store i1 %C, ptr @G.3, align 1
  ret <16 x i8> %r
}

; Function Attrs: nounwind
declare <8 x i16> @umulh_v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nounwind
declare <4 x i32> @umulh_v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nounwind
define <2 x i64> @umulh_v2i64(<2 x i64> %x, <2 x i64> %y) #0 {
  %B = srem <2 x i64> %y, zeroinitializer
  ret <2 x i64> %B
}

; Function Attrs: nounwind
declare <3 x i32> @umulh_v3i32(<3 x i32>, <3 x i32>) #0

; Function Attrs: nounwind
define <2 x i48> @umulh_v2i48(<2 x i48> %x, <2 x i48> %y) #0 {
  %B = and <2 x i48> %y, zeroinitializer
  %r = call <2 x i48> @llvm.umulh.v2i48(<2 x i48> %x, <2 x i48> %y)
  store <2 x i48> %B, ptr @G.2, align 16
  ret <2 x i48> %r
}

; Function Attrs: nounwind
define <2 x i128> @umulh_v2i128(<2 x i128> %x, <2 x i128> %y) #0 {
  %r = call <2 x i128> @llvm.umulh.v2i128(<2 x i128> %x, <2 x i128> %y)
  %B = and i32 0, 0
  store i32 %B, ptr poison, align 4
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

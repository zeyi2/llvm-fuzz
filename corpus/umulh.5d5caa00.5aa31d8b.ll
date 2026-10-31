; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx,+zihintpause -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i16> zeroinitializer
@G.1 = global <3 x i32> splat (i32 42)
@G.2 = global i32 65536
@G.3 = global i1 false
@G.4 = global <4 x float> splat (float 1.000000e+00)
@G.5 = global <4 x i1> splat (i1 true)
@G.6 = global i8 -1
@G.7 = global i1 false
@G.8 = global <2 x i1> zeroinitializer
@G.9 = global i1 true

; Function Attrs: nounwind
define i16 @umulh_i16(i16 %x, i16 %y) #0 {
  %r = call i16 @llvm.umulh.i16(i16 %x, i16 %y)
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = icmp ugt i16 %y, %r
  store i1 %C, ptr poison, align 1
  %C1 = icmp slt i16 %y, -1
  store i1 %C1, ptr %A, align 1
  ret i16 %r
}

; Function Attrs: nounwind
define i32 @umulh_i32(i32 %x, i32 %y) #0 {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV = load i32, ptr @G.2, align 4
  %C = icmp sgt i32 %x, %LGV
  %r = call i32 @llvm.umulh.i32(i32 %x, i32 %y)
  %C1 = icmp sgt i32 %x, 2147483647
  %C2 = icmp ne i32 %LGV, %LGV
  store i1 %C, ptr @G.3, align 1
  %B = urem i32 %y, %x
  store i1 %C1, ptr @G.7, align 1
  store i1 %C2, ptr @G.9, align 1
  store i32 %B, ptr %A, align 4
  ret i32 %r
}

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
declare <1 x i64> @umulh_v1i64(<1 x i64>, <1 x i64>) #0

; Function Attrs: nounwind
declare <16 x i8> @umulh_v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nounwind
declare <8 x i16> @umulh_v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nounwind
declare <4 x i32> @umulh_v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nounwind
define <2 x i64> @umulh_v2i64(<2 x i64> %x, <2 x i64> %y) #0 {
  %C = icmp ule <2 x i64> %y, splat (i64 4294967296)
  %r = call <2 x i64> @llvm.umulh.v2i64(<2 x i64> %x, <2 x i64> %y)
  store <2 x i1> %C, ptr @G.8, align 1
  %B = xor <2 x i64> %r, splat (i64 9223372036854775807)
  ret <2 x i64> %B
}

; Function Attrs: nounwind
define <3 x i32> @umulh_v3i32(<3 x i32> %x, <3 x i32> %y) #0 {
  %A11 = alloca i1, align 1
  store i1 true, ptr %A11, align 1
  %A7 = alloca i1, align 1
  store i1 false, ptr %A7, align 1
  %A = alloca i32, align 4
  store i32 42, ptr %A, align 4
  %B = or <3 x i32> %x, %y
  %r = call <3 x i32> @llvm.umulh.v3i32(<3 x i32> %x, <3 x i32> %y)
  store <3 x i32> %B, ptr @G.1, align 16
  %L = load i32, ptr %A, align 4
  switch i32 %L, label %SW_D [
    i32 -1734721419, label %SW_C
    i32 -1465928587, label %SW_C1
    i32 -499760008, label %SW_C2
    i32 -1575474128, label %SW_C3
    i32 -447759023, label %SW_C4
    i32 -1673524905, label %SW_C5
    i32 -1812393703, label %SW_C6
  ]

BB:                                               ; preds = %SW_C5, %SW_C4, %SW_C3, %SW_C, %SW_D
  ret <3 x i32> %r

SW_D:                                             ; preds = %SW_D, %0
  %L8 = load i1, ptr %A7, align 1
  br i1 %L8, label %BB, label %SW_D

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  %B13 = sub <3 x i32> %x, splat (i32 2147483647)
  store <3 x i32> %B13, ptr %A11, align 16
  ret <3 x i32> %x

SW_C2:                                            ; preds = %0
  ret <3 x i32> %B

SW_C3:                                            ; preds = %SW_C3, %0
  %LGV10 = load i1, ptr @G.9, align 1
  br i1 %LGV10, label %SW_C3, label %BB

SW_C4:                                            ; preds = %SW_C4, %0
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %SW_C4, label %BB

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  ret <3 x i32> %x
}

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

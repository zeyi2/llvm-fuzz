; isel-diff-config: -mtriple=riscv64 -mattr=+zdinx,+zihintpause -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 2147483647)
@G.1 = global <4 x i1> splat (i1 true)
@G.2 = global <4 x i32> splat (i32 42)
@G.3 = global i32 0
@G.4 = global <8 x i8> splat (i8 1)
@G.5 = global i96 281474976710656
@G.6 = global i16 256
@G.7 = global i1 false

; Function Attrs: nounwind
define i16 @smulh_i16(i16 %x, i16 %y) #0 {
  %LGV = load <4 x i32>, ptr @G.2, align 16
  %B = udiv <4 x i32> splat (i32 65536), %LGV
  %r = call i16 @llvm.smulh.i16(i16 %x, i16 %y)
  store <4 x i32> %B, ptr @G, align 16
  ret i16 %r
}

; Function Attrs: nounwind
define i32 @smulh_i32(i32 %x, i32 %y) #0 {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV = load i32, ptr @G.3, align 4
  %r = call i32 @llvm.smulh.i32(i32 %x, i32 %y)
  %B = urem i32 2147483647, %r
  %B1 = srem i32 %x, %LGV
  store i32 %B1, ptr %A, align 4
  ret i32 %B
}

; Function Attrs: nounwind
declare i64 @smulh_i64(i64, i64) #0

; Function Attrs: nounwind
define i96 @smulh_i96(i96 %x, i96 %y) #0 {
  %B = add i96 %x, %x
  %r = call i96 @llvm.smulh.i96(i96 %x, i96 %y)
  store i96 %B, ptr @G.5, align 4
  ret i96 %r
}

; Function Attrs: nounwind
define i128 @smulh_i128(i128 %x, i128 %y) #0 {
  %r = call i128 @llvm.smulh.i128(i128 %x, i128 %y)
  %B = add <8 x i8> zeroinitializer, splat (i8 1)
  store <8 x i8> %B, ptr @G.4, align 8
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
define <4 x i32> @smulh_v4i32(<4 x i32> %x, <4 x i32> %y) #0 {
  %LGV = load <4 x i32>, ptr @G, align 16
  %C = icmp sle <4 x i32> %y, %LGV
  %r = call <4 x i32> @llvm.smulh.v4i32(<4 x i32> %x, <4 x i32> %y)
  store <4 x i1> %C, ptr @G.1, align 1
  ret <4 x i32> %r
}

; Function Attrs: nounwind
declare <2 x i64> @smulh_v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nounwind
define <3 x i32> @smulh_v3i32(<3 x i32> %x, <3 x i32> %y) #0 {
  %r = call <3 x i32> @llvm.smulh.v3i32(<3 x i32> %x, <3 x i32> %y)
  %C = icmp slt <3 x i32> %y, %x
  store <3 x i1> %C, ptr poison, align 1
  ret <3 x i32> %r
}

; Function Attrs: nounwind
define <2 x i48> @smulh_v2i48(<2 x i48> %x, <2 x i48> %y) #0 {
  %LGV = load i16, ptr @G.6, align 2
  switch i16 %LGV, label %SW_D [
    i16 12099, label %SW_C
    i16 -26351, label %SW_C1
    i16 4835, label %SW_C2
    i16 7771, label %SW_C3
  ]

BB:                                               ; preds = %SW_C3, %SW_C, %SW_D
  %r = call <2 x i48> @llvm.smulh.v2i48(<2 x i48> %x, <2 x i48> %y)
  ret <2 x i48> %r

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %LGV4 = load i1, ptr @G.7, align 1
  br i1 %LGV4, label %BB, label %SW_C

SW_C1:                                            ; preds = %0
  ret <2 x i48> %y

SW_C2:                                            ; preds = %0
  ret <2 x i48> splat (i48 -140737488355328)

SW_C3:                                            ; preds = %0
  br label %BB
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

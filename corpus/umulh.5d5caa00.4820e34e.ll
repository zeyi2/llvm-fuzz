; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx,+zihintpause,+zvbb -O0
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
@G.8 = global <2 x i64> splat (i64 -1)
@G.9 = global <2 x i64> splat (i64 -9223372036854775808)

; Function Attrs: nounwind
define i16 @umulh_i16(i16 %x, i16 %y) #0 {
  %LGV = load <2 x i64>, ptr @G.8, align 16
  %A = alloca i1, align 1
  %L = load <2 x i64>, ptr %A, align 16
  store i1 poison, ptr %A, align 1
  %r = call i16 @llvm.umulh.i16(i16 %x, i16 %y)
  %C = icmp ugt i16 %y, %r
  store i1 %C, ptr poison, align 1
  %C1 = icmp slt i16 %y, -1
  store i1 %C1, ptr %A, align 1
  %B = and <2 x i64> %L, %LGV
  %G = getelementptr <2 x i64>, ptr %A, i16 %r
  store <2 x i64> %B, ptr @G.8, align 16
  store ptr %G, ptr poison, align 8
  ret i16 %r
}

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
declare <1 x i64> @umulh_v1i64(<1 x i64>, <1 x i64>) #0

; Function Attrs: nounwind
define <16 x i8> @umulh_v16i8(<16 x i8> %x, <16 x i8> %y) #0 {
  %LGV1 = load i8, ptr @G.6, align 1
  switch i8 %LGV1, label %SW_D [
    i8 -70, label %SW_C
    i8 86, label %SW_C2
  ]

BB:                                               ; preds = %SW_C2, %SW_C, %SW_D
  %LGV = load <4 x float>, ptr @G.4, align 16
  %C = fcmp ord <4 x float> splat (float +qnan), %LGV
  %r = call <16 x i8> @llvm.umulh.v16i8(<16 x i8> %x, <16 x i8> %y)
  store <4 x i1> %C, ptr @G.5, align 1
  ret <16 x i8> %r

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %LGV3 = load i1, ptr @G.7, align 1
  %C3 = icmp sgt i1 %LGV3, %LGV3
  br i1 %C3, label %SW_C, label %BB

SW_C2:                                            ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
define <8 x i16> @umulh_v8i16(<8 x i16> %x, <8 x i16> %y) #0 {
  %r = call <8 x i16> @llvm.umulh.v8i16(<8 x i16> %x, <8 x i16> %y)
  %LGV = load <8 x i16>, ptr @G, align 16
  %B = lshr <8 x i16> %r, %LGV
  ret <8 x i16> %B
}

; Function Attrs: nounwind
declare <4 x i32> @umulh_v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nounwind
define <2 x i64> @umulh_v2i64(<2 x i64> %x, <2 x i64> %y) #0 {
  %r = call <2 x i64> @llvm.umulh.v2i64(<2 x i64> %x, <2 x i64> %y)
  %B1 = xor <2 x i64> %r, %r
  %B2 = or <2 x i64> %B1, %r
  %B = xor <2 x i64> %r, splat (i64 9223372036854775807)
  store <2 x i64> %B2, ptr @G.9, align 16
  ret <2 x i64> %B
}

; Function Attrs: nounwind
define <3 x i32> @umulh_v3i32(<3 x i32> %x, <3 x i32> %y) #0 {
  %A = alloca <4 x float>, align 16
  store <4 x float> poison, ptr %A, align 16
  %B = or <3 x i32> %x, %y
  %r = call <3 x i32> @llvm.umulh.v3i32(<3 x i32> %x, <3 x i32> %y)
  store <3 x i32> %B, ptr @G.1, align 16
  %B1 = fdiv <4 x float> splat (float +qnan), splat (float 4.200000e+01)
  store <4 x float> %B1, ptr %A, align 16
  ret <3 x i32> %r
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

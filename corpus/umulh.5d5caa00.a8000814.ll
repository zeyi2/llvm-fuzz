; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx,+zihintpause -O2
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
@G.8 = global <2 x i1> splat (i1 true)
@G.9 = global <4 x float> splat (float 1.401300e-45)
@G.10 = global <4 x i1> splat (i1 true)

; Function Attrs: nounwind
declare i16 @umulh_i16(i16, i16) #0

; Function Attrs: nounwind
define i32 @umulh_i32(i32 %x, i32 %y) #0 {
  %r = call i32 @llvm.umulh.i32(i32 %x, i32 %y)
  %LGV = load i32, ptr @G.2, align 4
  %C1 = icmp ule i32 %LGV, 1
  store i1 %C1, ptr @G.3, align 1
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
define <16 x i8> @umulh_v16i8(<16 x i8> %x, <16 x i8> %y) #0 {
  %LGV1 = load i8, ptr @G.6, align 1
  switch i8 %LGV1, label %SW_D [
    i8 -70, label %SW_C
    i8 86, label %SW_C2
  ]

BB:                                               ; preds = %SW_C2, %SW_C, %SW_D
  %LGV4 = load <4 x float>, ptr @G.9, align 16
  %LGV = load <4 x float>, ptr @G.4, align 16
  %C = fcmp ord <4 x float> splat (float +qnan), %LGV
  %r = call <16 x i8> @llvm.umulh.v16i8(<16 x i8> %x, <16 x i8> %y)
  %C5 = fcmp ord <4 x float> splat (float +inf), %LGV4
  store <4 x i1> %C, ptr @G.5, align 1
  store <4 x i1> %C5, ptr @G.10, align 1
  ret <16 x i8> %r

SW_D:                                             ; preds = %0
  %C1 = icmp uge <2 x i64> splat (i64 -1), splat (i64 -9223372036854775808)
  store <2 x i1> %C1, ptr @G.8, align 1
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %LGV3 = load i1, ptr @G.7, align 1
  br i1 %LGV3, label %SW_C, label %BB

SW_C2:                                            ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare <8 x i16> @umulh_v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nounwind
declare <4 x i32> @umulh_v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nounwind
declare <2 x i64> @umulh_v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nounwind
define <3 x i32> @umulh_v3i32(<3 x i32> %x, <3 x i32> %y) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i1, ptr @G.7, align 1
  %B = or <3 x i32> %x, %y
  %r = call <3 x i32> @llvm.umulh.v3i32(<3 x i32> %x, <3 x i32> %y)
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  store <3 x i32> %B, ptr @G.1, align 16
  ret <3 x i32> %r

T:                                                ; preds = %T, %0
  br i1 %LGV, label %BB, label %T

F:                                                ; preds = %0
  br label %BB
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

; isel-diff-config: -mtriple=riscv32 -mattr=+m,+zfinx -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i32> splat (i32 65536)
@G.1 = global i1 false
@G.2 = global i16 -32768
@G.3 = global i1 false
@G.4 = global i64 1
@G.5 = global <2 x i1> splat (i1 true)
@G.6 = global <4 x i32> zeroinitializer

; Function Attrs: nounwind
define i16 @umulh_i16(i16 %x, i16 %y) #0 {
  %LGV = load i16, ptr @G.2, align 2
  %C = icmp ugt i16 %y, %LGV
  %r = call i16 @llvm.umulh.i16(i16 %x, i16 %y)
  store i1 %C, ptr @G.3, align 1
  ret i16 %r
}

; Function Attrs: nounwind
declare i32 @umulh_i32(i32, i32) #0

; Function Attrs: nounwind
declare i64 @umulh_i64(i64, i64) #0

; Function Attrs: nounwind
define i96 @umulh_i96(i96 %x, i96 %y) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i1, ptr @G.1, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %r = call i96 @llvm.umulh.i96(i96 %x, i96 %y)
  ret i96 %r

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %LGV1 = load i1, ptr @G.1, align 1
  br i1 %LGV, label %BB, label %F
}

; Function Attrs: nounwind
declare i128 @umulh_i128(i128, i128) #0

; Function Attrs: nounwind
declare <8 x i8> @umulh_v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nounwind
declare <4 x i16> @umulh_v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nounwind
define <2 x i32> @umulh_v2i32(<2 x i32> %x, <2 x i32> %y) #0 {
  %LGV = load <2 x i32>, ptr @G, align 8
  %B = lshr <2 x i32> %y, %LGV
  ret <2 x i32> %B
}

; Function Attrs: nounwind
declare <1 x i64> @umulh_v1i64(<1 x i64>, <1 x i64>) #0

; Function Attrs: nounwind
declare <16 x i8> @umulh_v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nounwind
define <8 x i16> @umulh_v8i16(<8 x i16> %x, <8 x i16> %y) #0 {
  %r = call <8 x i16> @llvm.umulh.v8i16(<8 x i16> %x, <8 x i16> %y)
  %B = lshr <4 x i32> zeroinitializer, splat (i32 -1)
  store <4 x i32> %B, ptr @G.6, align 16
  ret <8 x i16> %r
}

; Function Attrs: nounwind
define <4 x i32> @umulh_v4i32(<4 x i32> %x, <4 x i32> %y) #0 {
  %LGV = load i64, ptr @G.4, align 4
  %r = call <4 x i32> @llvm.umulh.v4i32(<4 x i32> %x, <4 x i32> %y)
  %E = extractelement <4 x i32> %r, i64 %LGV
  store i32 %E, ptr poison, align 4
  ret <4 x i32> %r
}

; Function Attrs: nounwind
declare <2 x i64> @umulh_v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nounwind
define <3 x i32> @umulh_v3i32(<3 x i32> %x, <3 x i32> %y) #0 {
  %r = call <3 x i32> @llvm.umulh.v3i32(<3 x i32> %x, <3 x i32> %y)
  %C = fcmp ule float 4.200000e+01, 0.000000e+00
  store i1 %C, ptr @G.1, align 1
  ret <3 x i32> %r
}

; Function Attrs: nounwind
define <2 x i48> @umulh_v2i48(<2 x i48> %x, <2 x i48> %y) #0 {
  %r = call <2 x i48> @llvm.umulh.v2i48(<2 x i48> %x, <2 x i48> %y)
  %C = icmp ugt <2 x i48> %y, %x
  store <2 x i1> %C, ptr @G.5, align 1
  ret <2 x i48> %r
}

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

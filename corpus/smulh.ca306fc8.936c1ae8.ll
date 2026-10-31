; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zfinx,+zicsr -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 -128)
@G.1 = global i96 281474976710656
@G.2 = global i96 0
@G.3 = global <2 x i64> splat (i64 -9223372036854775808)
@G.4 = global i1 true
@G.5 = global <2 x i128> zeroinitializer
@G.6 = global half 4.200000e+01
@G.7 = global float +inf
@G.8 = global i1 true

; Function Attrs: nounwind
declare i16 @smulh_i16(i16, i16) #0

; Function Attrs: nounwind
define i32 @smulh_i32(i32 %x, i32 %y) #0 {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV1 = load i1, ptr @G.4, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %LGV = load i1, ptr @G.4, align 1
  %r = call i32 @llvm.smulh.i32(i32 %x, i32 %y)
  %B = or i1 true, %LGV
  store i1 %B, ptr poison, align 1
  ret i32 %r

T:                                                ; preds = %T, %0
  br i1 %LGV1, label %T, label %BB

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare i64 @smulh_i64(i64, i64) #0

; Function Attrs: nounwind
declare i96 @smulh_i96(i96, i96) #0

; Function Attrs: nounwind
declare i128 @smulh_i128(i128, i128) #0

; Function Attrs: nounwind
define <8 x i8> @smulh_v8i8(<8 x i8> %x, <8 x i8> %y) #0 {
  %LGV1 = load float, ptr @G.7, align 4
  %LGV = load <8 x i8>, ptr @G, align 8
  %B = xor <8 x i8> %x, %LGV
  %C = fcmp une float 4.200000e+01, %LGV1
  store i1 %C, ptr @G.8, align 1
  ret <8 x i8> %B
}

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
define <2 x i64> @smulh_v2i64(<2 x i64> %x, <2 x i64> %y) #0 {
  %LGV1 = load half, ptr @G.6, align 2
  %LGV = load <2 x i64>, ptr @G.3, align 16
  %C = icmp sge <2 x i64> %y, %LGV
  %r = call <2 x i64> @llvm.smulh.v2i64(<2 x i64> %x, <2 x i64> %y)
  store <2 x i1> %C, ptr poison, align 1
  %C2 = fcmp uge half 6.550400e+04, %LGV1
  store i1 %C2, ptr poison, align 1
  ret <2 x i64> %r
}

; Function Attrs: nounwind
declare <3 x i32> @smulh_v3i32(<3 x i32>, <3 x i32>) #0

; Function Attrs: nounwind
declare <2 x i48> @smulh_v2i48(<2 x i48>, <2 x i48>) #0

; Function Attrs: nounwind
define <2 x i128> @smulh_v2i128(<2 x i128> %x, <2 x i128> %y) #0 {
  %B = srem <2 x i128> %x, zeroinitializer
  %LGV = load <2 x i128>, ptr @G.5, align 32
  %C = icmp slt <2 x i128> %y, %LGV
  %r = call <2 x i128> @llvm.smulh.v2i128(<2 x i128> %x, <2 x i128> %y)
  store <2 x i1> %C, ptr poison, align 1
  store <2 x i128> %B, ptr poison, align 32
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

; isel-diff-config: -mtriple=riscv32 -mattr=+zfinx -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 1.000000e+00
@G.1 = global i1 false
@G.2 = global <2 x i48> zeroinitializer
@G.3 = global i96 -39614081257132168796771975168
@G.4 = global <2 x i1> splat (i1 true)
@G.5 = global i128 0

; Function Attrs: nounwind
declare i16 @smulh_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @smulh_i32(i32, i32) #0

; Function Attrs: nounwind
declare i64 @smulh_i64(i64, i64) #0

; Function Attrs: nounwind
define i96 @smulh_i96(i96 %x, i96 %y) #0 {
  %A = alloca i96, align 8
  store i96 poison, ptr %A, align 4
  %LGV2 = load i96, ptr @G.3, align 4
  %B = udiv i96 %y, 39614081257132168796771975167
  %LGV = load double, ptr @G, align 8
  %C = fcmp ult double %LGV, 4.940660e-324
  %C3 = icmp slt i96 %x, %LGV2
  %r = call i96 @llvm.smulh.i96(i96 %x, i96 %y)
  store i1 %C, ptr @G.1, align 1
  store i1 %C3, ptr @G.1, align 1
  store i96 %B, ptr %A, align 4
  ret i96 %r
}

; Function Attrs: nounwind
define i128 @smulh_i128(i128 %x, i128 %y) #0 {
  %r = call i128 @llvm.smulh.i128(i128 %x, i128 %y)
  store i128 %r, ptr @G.5, align 4
  ret i128 %r
}

; Function Attrs: nounwind
declare <8 x i8> @smulh_v8i8(<8 x i8>, <8 x i8>) #0

; Function Attrs: nounwind
declare <4 x i16> @smulh_v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nounwind
define <2 x i32> @smulh_v2i32(<2 x i32> %x, <2 x i32> %y) #0 {
  %r = call <2 x i32> @llvm.smulh.v2i32(<2 x i32> %x, <2 x i32> %y)
  %C = icmp sgt <2 x i32> %y, splat (i32 1)
  store <2 x i1> %C, ptr @G.4, align 1
  ret <2 x i32> %r
}

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
declare <3 x i32> @smulh_v3i32(<3 x i32>, <3 x i32>) #0

; Function Attrs: nounwind
define <2 x i48> @smulh_v2i48(<2 x i48> %x, <2 x i48> %y) #0 {
  %I = insertelement <2 x i48> %y, i48 -140737488355328, i64 -1
  %r = call <2 x i48> @llvm.smulh.v2i48(<2 x i48> %x, <2 x i48> %y)
  store <2 x i48> %I, ptr @G.2, align 16
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

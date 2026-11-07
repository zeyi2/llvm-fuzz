; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i8> splat (i8 127)
@G.1 = global i1 false
@G.2 = global i64 -1

; Function Attrs: nounwind
declare <1 x i32> @clmul_v1i32(<1 x i32>, <1 x i32>) #0

; Function Attrs: nounwind
declare <2 x i32> @clmul_v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nounwind
define <4 x i32> @clmul_v4i32(<4 x i32> %x, <4 x i32> %y) #0 {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i64, ptr @G.2, align 4
  %a = call <4 x i32> @llvm.clmul.v4i32(<4 x i32> %x, <4 x i32> %y)
  switch i64 %LGV, label %SW_D [
    i64 941696160316988379, label %SW_C
    i64 5080249132197867557, label %SW_C1
    i64 2907112424793309580, label %SW_C2
    i64 -4276489804639074152, label %SW_C3
  ]

BB:                                               ; preds = %SW_C3, %SW_C2, %SW_C1, %SW_D
  ret <4 x i32> %a

SW_D:                                             ; preds = %SW_D, %0
  %LGV4 = load i1, ptr @G.1, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  ret <4 x i32> splat (i32 65536)

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare <8 x i32> @clmul_v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nounwind
declare <16 x i32> @clmul_v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nounwind
declare <1 x i64> @clmul_v1i64(<1 x i64>, <1 x i64>) #0

; Function Attrs: nounwind
define <2 x i64> @clmul_v2i64(<2 x i64> %x, <2 x i64> %y) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %B = or i1 false, true
  %a = call <2 x i64> @llvm.clmul.v2i64(<2 x i64> %x, <2 x i64> %y)
  store i1 %B, ptr %A, align 1
  ret <2 x i64> %a
}

; Function Attrs: nounwind
declare <4 x i64> @clmul_v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nounwind
define <8 x i64> @clmul_v8i64(<8 x i64> %x, <8 x i64> %y) #0 {
  %a = call <8 x i64> @llvm.clmul.v8i64(<8 x i64> %x, <8 x i64> %y)
  %C = icmp slt i64 -9223372036854775808, 0
  store i1 %C, ptr @G.1, align 1
  ret <8 x i64> %a
}

; Function Attrs: nounwind
define <4 x i8> @clmul_v4i8(<4 x i8> %a, <4 x i8> %b) #0 {
  %B = add <4 x i8> %b, splat (i8 16)
  %res = call <4 x i8> @llvm.clmul.v4i8(<4 x i8> %a, <4 x i8> %b)
  store <4 x i8> %B, ptr @G, align 4
  ret <4 x i8> %res
}

; Function Attrs: nounwind
declare <4 x i16> @clmul_v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nounwind
declare <4 x i8> @clmulr_v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.clmul.v16i32(<16 x i32>, <16 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i32> @llvm.clmul.v1i32(<1 x i32>, <1 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.clmul.v1i64(<1 x i64>, <1 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.clmul.v2i32(<2 x i32>, <2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.clmul.v2i64(<2 x i64>, <2 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.clmul.v4i16(<4 x i16>, <4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.clmul.v4i32(<4 x i32>, <4 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.clmul.v4i64(<4 x i64>, <4 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.clmul.v4i8(<4 x i8>, <4 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.clmul.v8i32(<8 x i32>, <8 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.clmul.v8i64(<8 x i64>, <8 x i64>) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

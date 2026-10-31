; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+experimental-p,+m,+zbkb,+zhinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true

define <4 x i8> @test_bitreverse_v4i8(<4 x i8> %a) {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %res = call <4 x i8> @llvm.bitreverse.v4i8(<4 x i8> %a)
  %C = icmp slt <4 x i8> %a, %a
  store <4 x i1> %C, ptr %A, align 1
  ret <4 x i8> %res
}

define <2 x i16> @test_bitreverse_v2i16(<2 x i16> %a) {
  %LGV = load i1, ptr @G, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  %res = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> %a)
  ret <2 x i16> %res

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

declare <8 x i8> @test_bitreverse_v8i8(<8 x i8>)

declare <4 x i16> @test_bitreverse_v4i16(<4 x i16>)

declare <2 x i32> @test_bitreverse_v2i32(<2 x i32>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.bitreverse.v2i16(<2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.bitreverse.v2i32(<2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.bitreverse.v4i16(<4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.bitreverse.v4i8(<4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.bitreverse.v8i8(<8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

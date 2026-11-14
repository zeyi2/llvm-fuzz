; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+m,+zbb,+zbkb,+a,+zhinx -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 42
@G.1 = global <8 x i8> zeroinitializer

declare <4 x i8> @test_bitreverse_v4i8(<4 x i8>)

declare <2 x i16> @test_bitreverse_v2i16(<2 x i16>)

define <8 x i8> @test_bitreverse_v8i8(<8 x i8> %a) {
  %res = call <8 x i8> @llvm.bitreverse.v8i8(<8 x i8> %a)
  store <8 x i8> %res, ptr @G.1, align 8
  ret <8 x i8> %res
}

define <4 x i16> @test_bitreverse_v4i16(<4 x i16> %a) {
  %LGV = load i128, ptr @G, align 4
  %res = call <4 x i16> @llvm.bitreverse.v4i16(<4 x i16> %a)
  %B = mul i128 -1, %LGV
  store i128 %B, ptr @G, align 4
  ret <4 x i16> %res
}

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

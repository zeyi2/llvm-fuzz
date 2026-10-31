; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+zbb,+zdinx -O3 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -1

define <8 x i8> @test_pnzip_v8i8(<4 x i16> %a, <4 x i16> %b) {
  %ca = bitcast <4 x i16> %a to <8 x i8>
  %cb = bitcast <4 x i16> %b to <8 x i8>
  %r = shufflevector <8 x i8> %ca, <8 x i8> %cb, <8 x i32> <i32 0, i32 8, i32 2, i32 10, i32 4, i32 12, i32 6, i32 14>
  %B = shl i32 -2147483648, 65536
  store i32 %B, ptr @G, align 4
  ret <8 x i8> %r
}

declare <8 x i8> @test_pnziph_v8i8(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pnzip_v4i16(<2 x i32>, <2 x i32>)

declare <4 x i16> @test_pnziph_v4i16(<2 x i32>, <2 x i32>)

declare <4 x i8> @test_pnzip_v4i8(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_pnziph_v4i8(<2 x i16>, <2 x i16>)

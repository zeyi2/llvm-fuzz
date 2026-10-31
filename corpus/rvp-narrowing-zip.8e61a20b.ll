; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m,+zbb,+zdinx -O2 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global bfloat 9.183550e-41

declare <8 x i8> @test_pnzip_v8i8(<4 x i16>, <4 x i16>)

declare <8 x i8> @test_pnziph_v8i8(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pnzip_v4i16(<2 x i32>, <2 x i32>)

define <4 x i16> @test_pnziph_v4i16(<2 x i32> %a, <2 x i32> %b) {
  %ca = bitcast <2 x i32> %a to <4 x i16>
  %cb = bitcast <2 x i32> %b to <4 x i16>
  %r = shufflevector <4 x i16> %ca, <4 x i16> %cb, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %B = frem bfloat 3.389530e+38, +qnan
  store bfloat %B, ptr @G, align 2
  ret <4 x i16> %r
}

declare <4 x i8> @test_pnzip_v4i8(<2 x i16>, <2 x i16>)

define <4 x i8> @test_pnziph_v4i8(<2 x i16> %a, <2 x i16> %b) {
  %A = alloca <4 x i8>, align 4
  store <4 x i8> poison, ptr %A, align 4
  %ca = bitcast <2 x i16> %a to <4 x i8>
  %cb = bitcast <2 x i16> %b to <4 x i8>
  %B = sdiv <4 x i8> %cb, %cb
  %r = shufflevector <4 x i8> %ca, <4 x i8> %cb, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  store <4 x i8> %B, ptr %A, align 4
  ret <4 x i8> %r
}

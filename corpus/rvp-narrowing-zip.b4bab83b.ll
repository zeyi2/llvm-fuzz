; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+m,+zbb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 0

define <8 x i8> @test_pnzip_v8i8(<4 x i16> %a, <4 x i16> %b) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C1 = icmp ule <4 x i16> %a, splat (i16 1)
  %LGV = load i64, ptr @G, align 4
  %ca = bitcast <4 x i16> %a to <8 x i8>
  %C = icmp ule i64 0, %LGV
  %cb = bitcast <4 x i16> %b to <8 x i8>
  %r = shufflevector <8 x i8> %ca, <8 x i8> %cb, <8 x i32> <i32 0, i32 8, i32 2, i32 10, i32 4, i32 12, i32 6, i32 14>
  store i1 %C, ptr %A, align 1
  store <4 x i1> %C1, ptr poison, align 1
  ret <8 x i8> %r
}

declare <8 x i8> @test_pnziph_v8i8(<4 x i16>, <4 x i16>)

declare <4 x i16> @test_pnzip_v4i16(<2 x i32>, <2 x i32>)

define <4 x i16> @test_pnziph_v4i16(<2 x i32> %a, <2 x i32> %b) {
  %ca = bitcast <2 x i32> %a to <4 x i16>
  %cb = bitcast <2 x i32> %b to <4 x i16>
  %r = shufflevector <4 x i16> %ca, <4 x i16> %cb, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  ret <4 x i16> %ca
}

declare <4 x i8> @test_pnzip_v4i8(<2 x i16>, <2 x i16>)

declare <4 x i8> @test_pnziph_v4i8(<2 x i16>, <2 x i16>)

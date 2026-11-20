; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zbb,+zvbb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float +inf
@G.1 = global float 1.401300e-45
@G.2 = global i1 false
@G.3 = global float +inf
@G.4 = global <4 x float> zeroinitializer

declare <4 x i16> @test_pwcvt_v4i8(<4 x i8>)

define <2 x i32> @test_pwcvt_v2i16(<2 x i16> %a) {
  %LGV = load float, ptr @G.3, align 4
  %A = alloca <2 x i16>, align 4
  %L2 = load i1, ptr %A, align 1
  %I = insertelement <4 x float> splat (float +inf), float %LGV, i1 %L2
  store <2 x i16> poison, ptr %A, align 4
  %B = mul <2 x i16> %a, splat (i16 42)
  %res = sext <2 x i16> %B to <2 x i32>
  %B1 = or <2 x i16> %B, zeroinitializer
  store <2 x i16> %B1, ptr %A, align 4
  store <4 x float> %I, ptr @G.4, align 16
  ret <2 x i32> %res
}

declare <4 x i16> @test_pwcvtu_v4i8(<4 x i8>)

define <2 x i32> @test_pwcvtu_v2i16(<2 x i16> %a) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load float, ptr @G, align 4
  %res = zext <2 x i16> %a to <2 x i32>
  %C = fcmp olt float %LGV, 0.000000e+00
  store i1 %C, ptr %A, align 1
  ret <2 x i32> %res
}

declare <4 x i16> @test_pwcvth_v4i8(<4 x i8>)

define <2 x i32> @test_pwcvth_v2i16(<2 x i16> %a) {
  %LGV = load float, ptr @G.1, align 4
  %shuffle = shufflevector <2 x i16> zeroinitializer, <2 x i16> %a, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %C = fcmp ole float 1.000000e+00, %LGV
  %res = bitcast <4 x i16> %shuffle to <2 x i32>
  store i1 %C, ptr @G.2, align 1
  ret <2 x i32> %res
}

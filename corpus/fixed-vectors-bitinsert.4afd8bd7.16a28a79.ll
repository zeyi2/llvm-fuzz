; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zvkb,+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <16 x i4> splat (i4 -1)
@G.1 = global <8 x i8> splat (i8 16)
@G.2 = global <8 x i1> zeroinitializer
@G.3 = global <2 x ptr> poison
@G.4 = global <16 x i4> zeroinitializer
@G.5 = global i64 0
@G.6 = global <8 x i1> zeroinitializer

declare <4 x b32> @test_bitinsert_v4i8_const(<4 x b32>, <4 x i8>)

declare <4 x b32> @test_bitinsert_v4i8_var(<4 x b32>, <4 x i8>, <4 x i32>)

declare <2 x b64> @test_bitinsert_v2f32(<2 x b64>, <2 x float>)

declare <2 x b64> @test_bitinsert_v2ptr(<2 x b64>, <2 x ptr>)

declare <2 x b128> @test_bitinsert_v2ptr_b128(<2 x b128>, <2 x ptr>)

define <16 x b8> @test_bitinsert_v16i4_var(<16 x b8> %base, <16 x i4> %val, <16 x i32> %off) {
  %B8 = shl <16 x i4> %val, splat (i4 7)
  %A = alloca <16 x i1>, align 2
  store <16 x i1> poison, ptr %A, align 2
  %LGV1 = load <8 x i1>, ptr @G.6, align 1
  %LGV = load <8 x i8>, ptr @G.1, align 8
  %B = mul <16 x i4> %val, %B8
  %C = icmp sge <8 x i8> %LGV, splat (i8 -128)
  %I = insertelement <16 x b8> %base, b8 poison, i8 127
  %B2 = srem <8 x i1> %C, %LGV1
  %C5 = icmp eq <16 x i4> %val, %val
  %C7 = icmp slt <8 x i8> splat (i8 42), %LGV
  %B4 = urem i16 1, 32767
  store <16 x i4> %B, ptr @G, align 8
  %B3 = xor <16 x i4> %val, splat (i4 1)
  store <8 x i1> %B2, ptr @G.2, align 1
  store <16 x i4> %B3, ptr @G.4, align 8
  store i16 %B4, ptr poison, align 2
  store <16 x i1> %C5, ptr %A, align 2
  store <8 x i1> %C7, ptr poison, align 1
  ret <16 x b8> %I
}

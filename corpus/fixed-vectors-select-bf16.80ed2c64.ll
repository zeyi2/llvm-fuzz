; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+d,+zfbfmin,+zvfbfmin,+zbb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half 6.550400e+04
@G.1 = global <8 x i1> splat (i1 true)
@G.2 = global half +qnan
@G.3 = global i1 true
@G.4 = global i128 170141183460469231731687303715884105727
@G.5 = global i16 0
@G.6 = global i1 false

define <2 x bfloat> @select_v2bf16(i1 zeroext %c, <2 x bfloat> %a, <2 x bfloat> %b) {
  %LGV1 = load half, ptr @G.2, align 2
  %LGV = load half, ptr @G, align 2
  %v = select i1 %c, <2 x bfloat> %a, <2 x bfloat> %b
  %C = fcmp ord half %LGV, %LGV1
  %B = frem half %LGV, 1.000000e+00
  store half %B, ptr poison, align 2
  store i1 %C, ptr @G.3, align 1
  ret <2 x bfloat> %v
}

define <2 x bfloat> @selectcc_v2bf16(bfloat %a, bfloat %b, <2 x bfloat> %c, <2 x bfloat> %d) {
  %C = icmp ugt <8 x i8> splat (i8 1), zeroinitializer
  %cmp = fcmp oeq bfloat %a, %b
  %v = select i1 %cmp, <2 x bfloat> %c, <2 x bfloat> %d
  store <8 x i1> %C, ptr @G.1, align 1
  ret <2 x bfloat> %v
}

define <4 x bfloat> @select_v4bf16(i1 zeroext %c, <4 x bfloat> %a, <4 x bfloat> %b) {
  %v = select i1 %c, <4 x bfloat> %a, <4 x bfloat> %b
  %C = icmp ugt i1 %c, %c
  store i1 %C, ptr poison, align 1
  ret <4 x bfloat> %v
}

define <4 x bfloat> @selectcc_v4bf16(bfloat %a, bfloat %b, <4 x bfloat> %c, <4 x bfloat> %d) {
  %LGV = load i16, ptr @G.5, align 2
  %C = icmp ugt i16 %LGV, 42
  %cmp = fcmp oeq bfloat %a, %b
  %v = select i1 %cmp, <4 x bfloat> %c, <4 x bfloat> %d
  store i1 %C, ptr @G.6, align 1
  ret <4 x bfloat> %v
}

declare <8 x bfloat> @select_v8bf16(i1 zeroext, <8 x bfloat>, <8 x bfloat>)

define <8 x bfloat> @selectcc_v8bf16(bfloat %a, bfloat %b, <8 x bfloat> %c, <8 x bfloat> %d) {
  %A = alloca <8 x i1>, align 1
  store <8 x i1> poison, ptr %A, align 1
  %C = fcmp ugt <8 x bfloat> %d, splat (bfloat +qnan)
  %cmp = fcmp oeq bfloat %a, %b
  %v = select i1 %cmp, <8 x bfloat> %c, <8 x bfloat> %d
  store <8 x i1> %C, ptr %A, align 1
  ret <8 x bfloat> %v
}

declare <16 x bfloat> @select_v16bf16(i1 zeroext, <16 x bfloat>, <16 x bfloat>)

declare <16 x bfloat> @selectcc_v16bf16(bfloat, bfloat, <16 x bfloat>, <16 x bfloat>)

define <8 x bfloat> @vselect_vf_v8bf16(bfloat %a, <8 x bfloat> %vb, <8 x i1> %cc) {
  %A = alloca <8 x i1>, align 1
  store <8 x i1> poison, ptr %A, align 1
  %insert = insertelement <8 x bfloat> poison, bfloat %a, i32 0
  %va = shufflevector <8 x bfloat> %insert, <8 x bfloat> poison, <8 x i32> zeroinitializer
  %C = icmp sgt <8 x i1> %cc, %cc
  %vsel = select <8 x i1> %cc, <8 x bfloat> %va, <8 x bfloat> %vb
  store <8 x i1> %C, ptr %A, align 1
  ret <8 x bfloat> %vsel
}

define <16 x bfloat> @vselect_vf_v16bf16(bfloat %a, <16 x bfloat> %vb, <16 x i1> %cc) {
  %B = xor i128 1, 1
  %insert = insertelement <16 x bfloat> poison, bfloat %a, i32 0
  %va = shufflevector <16 x bfloat> %insert, <16 x bfloat> poison, <16 x i32> zeroinitializer
  %vsel = select <16 x i1> %cc, <16 x bfloat> %va, <16 x bfloat> %vb
  store i128 %B, ptr @G.4, align 4
  ret <16 x bfloat> %vsel
}

declare <8 x bfloat> @vselect_vfpzero_v8bf16(<8 x bfloat>, <8 x i1>)

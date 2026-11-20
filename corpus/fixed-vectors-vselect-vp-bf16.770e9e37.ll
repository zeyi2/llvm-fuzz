; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+d,+m,+zvfbfmin -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i1> splat (i1 true)
@G.1 = global <4 x i1> zeroinitializer
@G.2 = global <2 x i64> zeroinitializer
@G.3 = global <2 x i64> splat (i64 42)

define <2 x bfloat> @select_v2bf16(<2 x i1> %a, <2 x bfloat> %b, <2 x bfloat> %c, i32 zeroext %evl) {
  %B = sdiv <2 x i64> splat (i64 1), splat (i64 4294967296)
  %v = select <2 x i1> %a, <2 x bfloat> %b, <2 x bfloat> %c
  store <2 x i64> %B, ptr @G.2, align 16
  %B1 = lshr <2 x i64> %B, splat (i64 -1)
  store <2 x i64> %B1, ptr @G.3, align 16
  ret <2 x bfloat> %v
}

define <4 x bfloat> @select_v4bf16(<4 x i1> %a, <4 x bfloat> %b, <4 x bfloat> %c, i32 zeroext %evl) {
  %C1 = fcmp ule <4 x bfloat> %c, splat (bfloat 3.389530e+38)
  %v = select <4 x i1> %a, <4 x bfloat> %b, <4 x bfloat> %c
  %C = fcmp olt <4 x bfloat> %b, %v
  store <4 x i1> %C, ptr @G, align 1
  store <4 x i1> %C1, ptr @G.1, align 1
  ret <4 x bfloat> %v
}

declare <8 x bfloat> @select_v8bf16(<8 x i1>, <8 x bfloat>, <8 x bfloat>, i32 zeroext)

declare <16 x bfloat> @select_v16bf16(<16 x i1>, <16 x bfloat>, <16 x bfloat>, i32 zeroext)

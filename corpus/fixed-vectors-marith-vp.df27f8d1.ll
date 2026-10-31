; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> zeroinitializer
@G.1 = global <2 x i64> splat (i64 42)
@G.3 = global <16 x i1> splat (i1 true)
@G.4 = global <16 x i1> zeroinitializer
@G.5 = global <1 x i1> zeroinitializer
@G.6 = global <8 x i8> splat (i8 42)
@G.7 = global <8 x i8> splat (i8 -1)
@G.8 = global half 6.550400e+04
@G.9 = global <2 x i1> splat (i1 true)

define <1 x i1> @and_v1i1(<1 x i1> %b, <1 x i1> %c, <1 x i1> %a, i32 zeroext %evl) {
  %B = sub <8 x i8> splat (i8 127), splat (i8 127)
  %v = and <1 x i1> %b, %c
  store <8 x i8> %B, ptr @G.6, align 8
  ret <1 x i1> %v
}

define <2 x i1> @and_v2i1(<2 x i1> %b, <2 x i1> %c, <2 x i1> %a, i32 zeroext %evl) {
  %v = and <2 x i1> %b, %c
  %B = urem <2 x i1> %v, %c
  store <2 x i1> %B, ptr @G.9, align 1
  ret <2 x i1> %v
}

define <4 x i1> @and_v4i1(<4 x i1> %b, <4 x i1> %c, <4 x i1> %a, i32 zeroext %evl) {
  %v = and <4 x i1> %c, %b
  ret <4 x i1> %v
}

declare <8 x i1> @and_v8i1(<8 x i1>, <8 x i1>, <8 x i1>, i32 zeroext)

declare <16 x i1> @and_v16i1(<16 x i1>, <16 x i1>, <16 x i1>, i32 zeroext)

declare <1 x i1> @or_v1i1(<1 x i1>, <1 x i1>, <1 x i1>, i32 zeroext)

declare <2 x i1> @or_v2i1(<2 x i1>, <2 x i1>, <2 x i1>, i32 zeroext)

declare <4 x i1> @or_v4i1(<4 x i1>, <4 x i1>, <4 x i1>, i32 zeroext)

define <8 x i1> @or_v8i1(<8 x i1> %b, <8 x i1> %c, <8 x i1> %a, i32 zeroext %evl) {
  %LGV = load <8 x i8>, ptr @G.7, align 8
  %B = add <8 x i8> %LGV, zeroinitializer
  %v = or <8 x i1> %b, %c
  store <8 x i8> %B, ptr @G.7, align 8
  ret <8 x i1> %v
}

declare <16 x i1> @or_v16i1(<16 x i1>, <16 x i1>, <16 x i1>, i32 zeroext)

define <1 x i1> @xor_v1i1(<1 x i1> %b, <1 x i1> %c, <1 x i1> %a, i32 zeroext %evl) {
  %LGV1 = load <2 x i64>, ptr @G.1, align 16
  %LGV = load <2 x i64>, ptr @G, align 16
  %v = xor <1 x i1> %b, %c
  %C = icmp sgt <1 x i1> %b, splat (i1 true)
  %S = shufflevector <2 x i64> %LGV, <2 x i64> %LGV1, <2 x i32> poison
  store <2 x i64> %S, ptr @G, align 16
  store <1 x i1> %C, ptr @G.5, align 1
  ret <1 x i1> %v
}

define <2 x i1> @xor_v2i1(<2 x i1> %b, <2 x i1> %c, <2 x i1> %a, i32 zeroext %evl) {
  %v = xor <2 x i1> %b, %c
  %B = fsub half +inf, 4.200000e+01
  store half %B, ptr @G.8, align 2
  ret <2 x i1> %v
}

declare <4 x i1> @xor_v4i1(<4 x i1>, <4 x i1>, <4 x i1>, i32 zeroext)

declare <8 x i1> @xor_v8i1(<8 x i1>, <8 x i1>, <8 x i1>, i32 zeroext)

define <16 x i1> @xor_v16i1(<16 x i1> %b, <16 x i1> %c, <16 x i1> %a, i32 zeroext %evl) {
  %LGV = load <16 x i1>, ptr @G.3, align 2
  %C = icmp eq <16 x i1> %c, %LGV
  %v = xor <16 x i1> %b, %c
  store <16 x i1> %C, ptr @G.4, align 2
  ret <16 x i1> %v
}

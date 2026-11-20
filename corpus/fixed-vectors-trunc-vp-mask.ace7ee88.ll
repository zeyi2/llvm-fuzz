; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+xtheadba -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global bfloat 3.389530e+38
@G.1 = global bfloat 1.000000e+00
@G.2 = global <2 x i1> splat (i1 true)

declare <2 x i1> @vtrunc_v2i1_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

define <2 x i1> @vtrunc_v2i1_v2i16_unmasked(<2 x i16> %a, i32 zeroext %vl) {
  %v = trunc <2 x i16> %a to <2 x i1>
  %C = icmp sgt <2 x i1> %v, %v
  store <2 x i1> %C, ptr @G.2, align 1
  ret <2 x i1> %v
}

define <2 x i1> @vtrunc_v2i1_v2i32(<2 x i32> %a, <2 x i1> %m, i32 zeroext %vl) {
  %LGV1 = load bfloat, ptr @G.1, align 2
  %LGV = load bfloat, ptr @G, align 2
  %C = fcmp ueq bfloat %LGV, %LGV1
  %v = trunc <2 x i32> %a to <2 x i1>
  store i1 %C, ptr poison, align 1
  ret <2 x i1> %v
}

declare <2 x i1> @vtrunc_v2i1_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <2 x i1> @vtrunc_v2i1_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

define <2 x i1> @vtrunc_v2i1_v2i64_unmasked(<2 x i64> %a, i32 zeroext %vl) {
  %v = trunc <2 x i64> %a to <2 x i1>
  %B = shl <2 x i1> %v, splat (i1 true)
  ret <2 x i1> %B
}

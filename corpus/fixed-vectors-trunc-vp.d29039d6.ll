; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -1
@G.1 = global i1 true
@G.2 = global <128 x i1> splat (i1 true)
@G.3 = global <2 x i1> zeroinitializer

declare <2 x i7> @vtrunc_v2i7_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

define <2 x i8> @vtrunc_v2i8_v2i15(<2 x i15> %a, <2 x i1> %m, i32 zeroext %vl) {
  %v = trunc <2 x i15> %a to <2 x i8>
  %B = udiv <2 x i8> %v, %v
  %C = icmp eq <2 x i15> %a, %a
  store <2 x i1> %C, ptr @G.3, align 1
  ret <2 x i8> %B
}

declare <2 x i8> @vtrunc_v2i8_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

define <2 x i8> @vtrunc_v2i8_v2i16_unmasked(<2 x i16> %a, i32 zeroext %vl) {
  %LGV = load i32, ptr @G, align 4
  %v = trunc <2 x i16> %a to <2 x i8>
  %C = icmp ugt i32 %vl, %LGV
  store i1 %C, ptr @G.1, align 1
  ret <2 x i8> %v
}

declare <128 x i7> @vtrunc_v128i7_v128i16(<128 x i16>, <128 x i1>, i32 zeroext)

declare <2 x i8> @vtrunc_v2i8_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vtrunc_v2i8_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <2 x i8> @vtrunc_v2i8_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vtrunc_v2i8_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <2 x i16> @vtrunc_v2i16_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vtrunc_v2i16_v2i32_unmasked(<2 x i32>, i32 zeroext)

define <2 x i16> @vtrunc_v2i16_v2i64(<2 x i64> %a, <2 x i1> %m, i32 zeroext %vl) {
  %v = trunc <2 x i64> %a to <2 x i16>
  %B = sdiv i32 %vl, %vl
  store i32 %B, ptr poison, align 4
  ret <2 x i16> %v
}

declare <2 x i16> @vtrunc_v2i16_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <15 x i16> @vtrunc_v15i16_v15i64(<15 x i64>, <15 x i1>, i32 zeroext)

declare <2 x i32> @vtrunc_v2i32_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i32> @vtrunc_v2i32_v2i64_unmasked(<2 x i64>, i32 zeroext)

define <128 x i32> @vtrunc_v128i32_v128i64(<128 x i64> %a, <128 x i1> %m, i32 zeroext %vl) {
  %v = trunc <128 x i64> %a to <128 x i32>
  %C = icmp sge <128 x i1> %m, %m
  store <128 x i1> %C, ptr @G.2, align 16
  ret <128 x i32> %v
}

declare <32 x i32> @vtrunc_v32i32_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <2 x i7> @vtrunc_v2i7_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

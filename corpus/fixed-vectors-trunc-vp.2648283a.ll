; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i32> splat (i32 1)
@G.1 = global i1 false
@G.2 = global i64 9223372036854775807
@G.3 = global i1 false

define <2 x i7> @vtrunc_v2i7_v2i16(<2 x i16> %a, <2 x i1> %m, i32 zeroext %vl) {
  %v = trunc <2 x i16> %a to <2 x i7>
  %B = urem <2 x i7> %v, splat (i7 -64)
  ret <2 x i7> %B
}

declare <2 x i8> @vtrunc_v2i8_v2i15(<2 x i15>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vtrunc_v2i8_v2i16(<2 x i16>, <2 x i1>, i32 zeroext)

define <2 x i8> @vtrunc_v2i8_v2i16_unmasked(<2 x i16> %a, i32 zeroext %vl) {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i1, ptr @G.3, align 1
  %LGV1 = load i64, ptr @G.2, align 4
  %C2 = icmp slt i64 0, %LGV1
  %C = icmp slt i32 %vl, %vl
  %v = trunc <2 x i16> %a to <2 x i8>
  store i1 %C, ptr @G.1, align 1
  br i1 %C2, label %T, label %F

BB:                                               ; preds = %F, %T
  store i1 %C2, ptr @G.3, align 1
  ret <2 x i8> %v

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %F
}

declare <128 x i7> @vtrunc_v128i7_v128i16(<128 x i16>, <128 x i1>, i32 zeroext)

declare <2 x i8> @vtrunc_v2i8_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vtrunc_v2i8_v2i32_unmasked(<2 x i32>, i32 zeroext)

declare <2 x i8> @vtrunc_v2i8_v2i64(<2 x i64>, <2 x i1>, i32 zeroext)

declare <2 x i8> @vtrunc_v2i8_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <2 x i16> @vtrunc_v2i16_v2i32(<2 x i32>, <2 x i1>, i32 zeroext)

declare <2 x i16> @vtrunc_v2i16_v2i32_unmasked(<2 x i32>, i32 zeroext)

define <2 x i16> @vtrunc_v2i16_v2i64(<2 x i64> %a, <2 x i1> %m, i32 zeroext %vl) {
  %A = alloca <2 x i1>, align 1
  store <2 x i1> poison, ptr %A, align 1
  %C = icmp eq <2 x i64> %a, splat (i64 -1)
  %v = trunc <2 x i64> %a to <2 x i16>
  store <2 x i1> %C, ptr %A, align 1
  ret <2 x i16> %v
}

declare <2 x i16> @vtrunc_v2i16_v2i64_unmasked(<2 x i64>, i32 zeroext)

declare <15 x i16> @vtrunc_v15i16_v15i64(<15 x i64>, <15 x i1>, i32 zeroext)

define <2 x i32> @vtrunc_v2i32_v2i64(<2 x i64> %a, <2 x i1> %m, i32 zeroext %vl) {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %v = trunc <2 x i64> %a to <2 x i32>
  switch i32 %vl, label %SW_D [
    i32 622427070, label %SW_C
    i32 -2076047055, label %SW_C1
    i32 1494238062, label %SW_C2
  ]

BB:                                               ; preds = %SW_C2, %SW_C1, %SW_D
  ret <2 x i32> %v

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  ret <2 x i32> splat (i32 -1)

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %SW_C2, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %SW_C2
}

define <2 x i32> @vtrunc_v2i32_v2i64_unmasked(<2 x i64> %a, i32 zeroext %vl) {
  %v = trunc <2 x i64> %a to <2 x i32>
  store <2 x i32> %v, ptr @G, align 8
  ret <2 x i32> %v
}

declare <128 x i32> @vtrunc_v128i32_v128i64(<128 x i64>, <128 x i1>, i32 zeroext)

declare <32 x i32> @vtrunc_v32i32_v32i64(<32 x i64>, <32 x i1>, i32 zeroext)

declare <2 x i7> @vtrunc_v2i7_v2i8(<2 x i8>, <2 x i1>, i32 zeroext)

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.401300e-45
@G.1 = global float +inf
@G.2 = global float 0.000000e+00
@G.3 = global <4 x i32> splat (i32 42)
@G.4 = global <4 x i32> splat (i32 2147483647)
@G.6 = global <8 x i1> splat (i1 true)

declare <1 x i32> @select_addsub_v1i32(<1 x i1>, <1 x i32>, <1 x i32>)

declare <2 x i32> @select_addsub_v2i32(<2 x i1>, <2 x i32>, <2 x i32>)

declare <4 x i32> @select_addsub_v4i32(<4 x i1>, <4 x i32>, <4 x i32>)

declare <4 x i32> @select_addsub_v4i32_select_swapped(<4 x i1>, <4 x i32>, <4 x i32>)

declare <4 x i32> @select_addsub_v4i32_add_swapped(<4 x i1>, <4 x i32>, <4 x i32>)

declare <4 x i32> @select_addsub_v4i32_both_swapped(<4 x i1>, <4 x i32>, <4 x i32>)

define <4 x i32> @select_addsub_v4i32_sub_swapped(<4 x i1> %cc, <4 x i32> %a, <4 x i32> %b) {
  %sub = sub <4 x i32> %b, %a
  %add = add <4 x i32> %a, %b
  %S = shufflevector <4 x i1> %cc, <4 x i1> splat (i1 true), <4 x i32> poison
  %res = select <4 x i1> %S, <4 x i32> %sub, <4 x i32> %add
  ret <4 x i32> %res
}

declare <8 x i32> @select_addsub_v8i32(<8 x i1>, <8 x i32>, <8 x i32>)

declare <16 x i32> @select_addsub_v16i32(<16 x i1>, <16 x i32>, <16 x i32>)

declare <32 x i32> @select_addsub_v32i32(<32 x i1>, <32 x i32>, <32 x i32>)

define <64 x i32> @select_addsub_v64i32(<64 x i1> %cc, <64 x i32> %a, <64 x i32> %b) {
  %LGV1 = load float, ptr @G.1, align 4
  %LGV = load float, ptr @G, align 4
  %sub = sub <64 x i32> %a, %b
  %B = fadd float %LGV, %LGV1
  %add = add <64 x i32> %a, %b
  %res = select <64 x i1> %cc, <64 x i32> %sub, <64 x i32> %add
  store float %B, ptr @G.2, align 4
  ret <64 x i32> %res
}

define <8 x i64> @select_addsub_v8i64(<8 x i1> %cc, <8 x i64> %a, <8 x i64> %b) {
  %LGV = load <8 x i1>, ptr @G.6, align 1
  %sub = sub <8 x i64> %a, %b
  %add = add <8 x i64> %a, %b
  %res = select <8 x i1> %cc, <8 x i64> %sub, <8 x i64> %add
  %B = sdiv <8 x i1> %cc, %LGV
  store <8 x i1> %B, ptr @G.6, align 1
  ret <8 x i64> %res
}

declare <8 x i16> @select_addsub_v8i16(<8 x i1>, <8 x i16>, <8 x i16>)

declare <8 x i8> @select_addsub_v8i8(<8 x i1>, <8 x i8>, <8 x i8>)

declare <8 x i1> @select_addsub_v8i1(<8 x i1>, <8 x i1>, <8 x i1>)

define <8 x i2> @select_addsub_v8i2(<8 x i1> %cc, <8 x i2> %a, <8 x i2> %b) {
  %sub = sub <8 x i2> %a, %b
  %B = lshr <8 x i2> %sub, splat (i2 -2)
  ret <8 x i2> %B
}

declare <4 x i32> @select_addsub_v4i32_constmask(<4 x i32>, <4 x i32>)

declare <4 x i32> @select_addsub_v4i32_constmask2(<4 x i32>, <4 x i32>)

define <4 x i32> @select_addsub_v4i32_as_shuffle(<4 x i32> %a, <4 x i32> %b) {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load <4 x i32>, ptr @G.3, align 16
  %sub = sub <4 x i32> %a, %b
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %T
  %add = add <4 x i32> %a, %b
  %res = shufflevector <4 x i32> %sub, <4 x i32> %add, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %B = and <4 x i32> %res, %LGV
  ret <4 x i32> %B

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  ret <4 x i32> splat (i32 2147483647)
}

declare <4 x i32> @select_addsub_v4i32_as_shuffle2(<4 x i32>, <4 x i32>)

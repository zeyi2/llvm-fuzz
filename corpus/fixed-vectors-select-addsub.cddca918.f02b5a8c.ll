; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx,+zbs -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -1
@G.1 = global i1 true
@G.2 = global <4 x i32> splat (i32 -2147483648)
@G.3 = global <2 x i32> splat (i32 1)
@G.4 = global <64 x i1> zeroinitializer
@G.5 = global <4 x i32> splat (i32 42)
@G.6 = global i64 -9223372036854775808
@G.7 = global i64 4294967296
@G.8 = global i8 -128
@G.9 = global <64 x i1> splat (i1 true)
@G.10 = global <4 x i32> splat (i32 1)
@G.11 = global <4 x i1> splat (i1 true)

declare <1 x i32> @select_addsub_v1i32(<1 x i1>, <1 x i32>, <1 x i32>)

define <2 x i32> @select_addsub_v2i32(<2 x i1> %cc, <2 x i32> %a, <2 x i32> %b) {
  %LGV = load i64, ptr @G.6, align 4
  %sub = sub <2 x i32> %a, %b
  %add = add <2 x i32> %a, %b
  %B = lshr <2 x i32> %add, %a
  %res = select <2 x i1> %cc, <2 x i32> %sub, <2 x i32> %add
  %B1 = xor i64 4294967296, %LGV
  store <2 x i32> %B, ptr @G.3, align 8
  store i64 %B1, ptr @G.7, align 4
  ret <2 x i32> %res
}

declare <4 x i32> @select_addsub_v4i32(<4 x i1>, <4 x i32>, <4 x i32>)

declare <4 x i32> @select_addsub_v4i32_select_swapped(<4 x i1>, <4 x i32>, <4 x i32>)

define <4 x i32> @select_addsub_v4i32_add_swapped(<4 x i1> %cc, <4 x i32> %a, <4 x i32> %b) {
  %LGV = load i32, ptr @G, align 4
  %sub = sub <4 x i32> %a, %b
  %B = and <4 x i32> %b, splat (i32 1)
  %C = icmp uge <4 x i32> %b, %a
  %add = add <4 x i32> %b, %a
  %I = insertelement <4 x i32> %add, i32 %LGV, i16 -1
  %res = select <4 x i1> %cc, <4 x i32> %sub, <4 x i32> %I
  store <4 x i32> %B, ptr @G.10, align 16
  store <4 x i1> %C, ptr @G.11, align 1
  ret <4 x i32> %res
}

declare <4 x i32> @select_addsub_v4i32_both_swapped(<4 x i1>, <4 x i32>, <4 x i32>)

declare <4 x i32> @select_addsub_v4i32_sub_swapped(<4 x i1>, <4 x i32>, <4 x i32>)

declare <8 x i32> @select_addsub_v8i32(<8 x i1>, <8 x i32>, <8 x i32>)

declare <16 x i32> @select_addsub_v16i32(<16 x i1>, <16 x i32>, <16 x i32>)

declare <32 x i32> @select_addsub_v32i32(<32 x i1>, <32 x i32>, <32 x i32>)

define <64 x i32> @select_addsub_v64i32(<64 x i1> %cc, <64 x i32> %a, <64 x i32> %b) {
  %B = shl <64 x i1> %cc, splat (i1 true)
  %sub = sub <64 x i32> %a, %b
  %C = icmp slt <64 x i32> %sub, splat (i32 42)
  %add = add <64 x i32> %a, %b
  %res = select <64 x i1> %cc, <64 x i32> %sub, <64 x i32> %add
  store <64 x i1> %C, ptr @G.4, align 8
  store <64 x i1> %B, ptr @G.9, align 8
  ret <64 x i32> %res
}

declare <8 x i64> @select_addsub_v8i64(<8 x i1>, <8 x i64>, <8 x i64>)

declare <8 x i16> @select_addsub_v8i16(<8 x i1>, <8 x i16>, <8 x i16>)

declare <8 x i8> @select_addsub_v8i8(<8 x i1>, <8 x i8>, <8 x i8>)

define <8 x i1> @select_addsub_v8i1(<8 x i1> %cc, <8 x i1> %a, <8 x i1> %b) {
  %sub = sub <8 x i1> %a, %b
  %add = add <8 x i1> %a, %b
  %C = icmp ugt i1 false, true
  %res = select <8 x i1> %cc, <8 x i1> %sub, <8 x i1> %add
  store i1 %C, ptr @G.1, align 1
  store <8 x i1> %res, ptr poison, align 1
  ret <8 x i1> %res
}

declare <8 x i2> @select_addsub_v8i2(<8 x i1>, <8 x i2>, <8 x i2>)

declare <4 x i32> @select_addsub_v4i32_constmask(<4 x i32>, <4 x i32>)

define <4 x i32> @select_addsub_v4i32_constmask2(<4 x i32> %a, <4 x i32> %b) {
  %sub = sub <4 x i32> %b, %a
  %add = add <4 x i32> %a, %b
  %B1 = ashr <4 x i32> %sub, %add
  %res = select <4 x i1> <i1 true, i1 false, i1 true, i1 false>, <4 x i32> %add, <4 x i32> %sub
  %B = xor <4 x i32> %b, %add
  store <4 x i32> %B, ptr @G.2, align 16
  store <4 x i32> %B1, ptr @G.5, align 16
  ret <4 x i32> %res
}

declare <4 x i32> @select_addsub_v4i32_as_shuffle(<4 x i32>, <4 x i32>)

define <4 x i32> @select_addsub_v4i32_as_shuffle2(<4 x i32> %a, <4 x i32> %b) {
  %LGV2 = load i8, ptr @G.8, align 1
  %A = alloca <4 x i32>, align 16
  %L = load i8, ptr %A, align 1
  store <4 x i32> poison, ptr %A, align 16
  %sub = sub <4 x i32> %b, %a
  %B1 = srem <4 x i32> %sub, splat (i32 1)
  %add = add <4 x i32> %a, %b
  %res = shufflevector <4 x i32> %add, <4 x i32> %sub, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %B = udiv <4 x i32> %sub, %res
  %C = icmp ult i8 %L, %LGV2
  store <4 x i32> %B1, ptr %A, align 16
  store i1 %C, ptr @G.1, align 1
  ret <4 x i32> %B
}

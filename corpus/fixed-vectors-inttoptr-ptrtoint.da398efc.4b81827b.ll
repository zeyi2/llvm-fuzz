; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zdinx,+zicond -O1 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 2147483647
@G.1 = global ptr poison
@G.2 = global half 0.000000e+00
@G.3 = global <2 x i64> splat (i64 -1)
@G.4 = global <8 x i1> splat (i1 true)
@G.5 = global <4 x i32> zeroinitializer
@G.6 = global <4 x i1> splat (i1 true)
@G.7 = global <4 x i1> zeroinitializer
@G.8 = global ptr poison

define <4 x ptr> @inttoptr_v4p0_v4i32(<4 x i32> %va, <4 x i1> %m, i32 zeroext %evl) {
  %LGV1 = load half, ptr @G.2, align 2
  %A = alloca bfloat, align 2
  %L1 = load <4 x i32>, ptr %A, align 16
  %G = getelementptr <4 x i1>, ptr %A, i32 %evl
  %L = load half, ptr %G, align 2
  store bfloat poison, ptr %A, align 2
  %S = shufflevector <4 x i32> %L1, <4 x i32> splat (i32 65536), <4 x i32> poison
  %v = inttoptr <4 x i32> %va to <4 x ptr>
  %C = fcmp oge half %L, %LGV1
  %B = fdiv bfloat 0.000000e+00, 4.200000e+01
  store bfloat %B, ptr %A, align 2
  store ptr %G, ptr @G.1, align 8
  store i1 %C, ptr poison, align 1
  store <4 x i32> %S, ptr @G.5, align 16
  ret <4 x ptr> %v
}

define <4 x ptr> @inttoptr_v4p0_v4i64(<4 x i64> %va, <4 x i1> %m, i32 zeroext %evl) {
  %v = inttoptr <4 x i64> %va to <4 x ptr>
  %B = sub i32 %evl, 2147483647
  %C = icmp sgt <4 x i1> %m, %m
  store i32 %B, ptr @G, align 4
  %B1 = srem <4 x i1> %m, zeroinitializer
  store <4 x i1> %B1, ptr poison, align 1
  %C2 = icmp sge <8 x i8> splat (i8 1), splat (i8 -128)
  store <4 x i1> %C, ptr poison, align 1
  store <8 x i1> %C2, ptr @G.4, align 1
  ret <4 x ptr> %v
}

define <4 x i32> @ptrtoint_v4i32_v4p0(<4 x ptr> %va, <4 x i1> %m, i32 zeroext %evl) {
  %E = extractelement <4 x ptr> %va, i32 %evl
  %LGV2 = load <4 x i1>, ptr @G.6, align 1
  %LGV = load <2 x i64>, ptr @G.3, align 16
  %B1 = shl <2 x i64> %LGV, splat (i64 9223372036854775807)
  %v = ptrtoint <4 x ptr> %va to <4 x i32>
  %B = or <4 x i1> %m, %LGV2
  store <2 x i64> %B1, ptr @G.3, align 16
  store <4 x i1> %B, ptr @G.7, align 1
  store ptr %E, ptr @G.8, align 8
  ret <4 x i32> %v
}

declare <4 x i64> @ptrtoint_v4i64_v4p0(<4 x ptr>, <4 x i1>, i32 zeroext)

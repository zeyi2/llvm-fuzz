; isel-diff-config: -mtriple=riscv64 -O2 -code-model=small -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 42
@G.1 = global <4 x ptr> poison
@G.2 = global double 4.940660e-324
@G.3 = global i1 false
@G.4 = global i1 false

define <4 x ptr> @inttoptr_v4p0_v4i32(<4 x i32> %va, <4 x i1> %m, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i64, ptr @G, align 4
  %v = inttoptr <4 x i32> %va to <4 x ptr>
  switch i64 %LGV, label %SW_D [
    i64 -2183284240954497286, label %SW_C
    i64 830245578616402821, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_D
  ret <4 x ptr> %v

SW_D:                                             ; preds = %SW_D, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %SW_D

SW_C:                                             ; preds = %0
  %LGV2 = load <4 x ptr>, ptr @G.1, align 32
  ret <4 x ptr> %LGV2

SW_C1:                                            ; preds = %0
  br label %BB
}

define <4 x ptr> @inttoptr_v4p0_v4i64(<4 x i64> %va, <4 x i1> %m, i32 zeroext %evl) {
  %LGV1 = load double, ptr @G.2, align 8
  %v = inttoptr <4 x i64> %va to <4 x ptr>
  %C = fcmp uge double 4.200000e+01, %LGV1
  store i1 %C, ptr poison, align 1
  ret <4 x ptr> %v
}

define <4 x i32> @ptrtoint_v4i32_v4p0(<4 x ptr> %va, <4 x i1> %m, i32 zeroext %evl) {
  %LGV = load i1, ptr @G.3, align 1
  %v = ptrtoint <4 x ptr> %va to <4 x i32>
  %C = icmp sle i1 false, %LGV
  %B = xor i1 false, %LGV
  store i1 %B, ptr @G.4, align 1
  store i1 %C, ptr poison, align 1
  ret <4 x i32> %v
}

define <4 x i64> @ptrtoint_v4i64_v4p0(<4 x ptr> %va, <4 x i1> %m, i32 zeroext %evl) {
  %B = or <4 x i1> %m, %m
  %v = ptrtoint <4 x ptr> %va to <4 x i64>
  store <4 x i1> %B, ptr poison, align 1
  ret <4 x i64> %v
}

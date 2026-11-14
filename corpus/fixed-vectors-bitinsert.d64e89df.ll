; isel-diff-config: -mtriple=riscv64 -mattr=+zfinx -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.000000e+00
@G.1 = global i1 true
@G.2 = global i16 32767
@G.3 = global i1 false
@G.4 = global <2 x b128> poison
@G.5 = global i32 0
@G.7 = global <4 x i32> splat (i32 1)

define <4 x b32> @test_bitinsert_v4i8_const(<4 x b32> %base, <4 x i8> %val) {
  %A3 = alloca i1, align 1
  store i1 true, ptr %A3, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i32, ptr @G.5, align 4
  %result = bitinsert <4 x b32> %base, <4 x i8> %val, <4 x i32> splat (i32 8)
  switch i32 %LGV, label %SW_D [
    i32 -505073497, label %SW_C
    i32 2139480414, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_C, %SW_D
  ret <4 x b32> %result

SW_D:                                             ; preds = %SW_D, %0
  %LGV2 = load i1, ptr @G.3, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_D, label %BB

SW_C:                                             ; preds = %SW_C, %0
  %L4 = load i1, ptr %A3, align 1
  br i1 %L4, label %SW_C, label %BB

SW_C1:                                            ; preds = %0
  br label %BB
}

declare <4 x b32> @test_bitinsert_v4i8_var(<4 x b32>, <4 x i8>, <4 x i32>)

define <2 x b64> @test_bitinsert_v2f32(<2 x b64> %base, <2 x float> %val) {
  %A5 = alloca i1, align 1
  store i1 true, ptr %A5, align 1
  %A3 = alloca i1, align 1
  store i1 true, ptr %A3, align 1
  %A = alloca i8, align 1
  store i8 16, ptr %A, align 1
  %L = load i8, ptr %A, align 1
  switch i8 %L, label %SW_D [
    i8 62, label %SW_C
    i8 -7, label %SW_C1
    i8 42, label %SW_C2
  ]

BB:                                               ; preds = %SW_C2, %SW_C1, %SW_D
  %result = bitinsert <2 x b64> %base, <2 x float> %val, <2 x i32> <i32 0, i32 32>
  ret <2 x b64> %result

SW_D:                                             ; preds = %0
  %C = icmp ugt i8 %L, 42
  store i1 %C, ptr @G.3, align 1
  br label %BB

SW_C:                                             ; preds = %0
  ret <2 x b64> %base

SW_C1:                                            ; preds = %SW_C1, %0
  %L4 = load i1, ptr %A3, align 1
  br i1 %L4, label %BB, label %SW_C1

SW_C2:                                            ; preds = %SW_C2, %0
  %L6 = load i1, ptr %A5, align 1
  br i1 %L6, label %BB, label %SW_C2
}

define <2 x b64> @test_bitinsert_v2ptr(<2 x b64> %base, <2 x ptr> %val) {
  %LGV = load float, ptr @G, align 4
  %result = bitinsert <2 x b64> %base, <2 x ptr> %val, <2 x i32> zeroinitializer
  %C = fcmp ueq float 1.401300e-45, %LGV
  store i1 %C, ptr @G.1, align 1
  ret <2 x b64> %result
}

define <2 x b128> @test_bitinsert_v2ptr_b128(<2 x b128> %base, <2 x ptr> %val) {
  %LGV1 = load <2 x b128>, ptr @G.4, align 32
  %S = shufflevector <2 x b128> %base, <2 x b128> %LGV1, <2 x i32> poison
  %S2 = shufflevector <4 x i32> zeroinitializer, <4 x i32> splat (i32 -1), <4 x i32> poison
  store <4 x i32> %S2, ptr @G.7, align 16
  ret <2 x b128> %S
}

define <16 x b8> @test_bitinsert_v16i4_var(<16 x b8> %base, <16 x i4> %val, <16 x i32> %off) {
  %LGV = load i16, ptr @G.2, align 2
  %result = bitinsert <16 x b8> %base, <16 x i4> %val, <16 x i32> %off
  %C = icmp uge i16 %LGV, 32767
  store i1 %C, ptr poison, align 1
  ret <16 x b8> %result
}

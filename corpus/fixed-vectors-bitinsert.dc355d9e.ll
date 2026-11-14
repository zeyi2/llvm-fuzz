; isel-diff-config: -mtriple=riscv64 -mattr=+zhinx -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i64 0
@G.2 = global i1 false
@G.3 = global i128 0

declare <4 x b32> @test_bitinsert_v4i8_const(<4 x b32>, <4 x i8>)

declare <4 x b32> @test_bitinsert_v4i8_var(<4 x b32>, <4 x i8>, <4 x i32>)

declare <2 x b64> @test_bitinsert_v2f32(<2 x b64>, <2 x float>)

define <2 x b64> @test_bitinsert_v2ptr(<2 x b64> %base, <2 x ptr> %val) {
  %LGV = load i64, ptr @G.1, align 4
  %result = bitinsert <2 x b64> %base, <2 x ptr> %val, <2 x i32> zeroinitializer
  %C = icmp ugt i64 -9223372036854775808, %LGV
  store i1 %C, ptr @G.2, align 1
  ret <2 x b64> %result
}

define <2 x b128> @test_bitinsert_v2ptr_b128(<2 x b128> %base, <2 x ptr> %val) {
  %C = fcmp false double f0x7FEFFFFFFFFFFFFF, 1.000000e+00
  %result = bitinsert <2 x b128> %base, <2 x ptr> %val, <2 x i32> splat (i32 32)
  store i1 %C, ptr @G, align 1
  ret <2 x b128> %result
}

define <16 x b8> @test_bitinsert_v16i4_var(<16 x b8> %base, <16 x i4> %val, <16 x i32> %off) {
  %LGV = load i128, ptr @G.3, align 4
  %result = bitinsert <16 x b8> %base, <16 x i4> %val, <16 x i32> %off
  switch i128 %LGV, label %SW_D [
    i128 13922711794055915682, label %SW_C
    i128 14167126829495177370, label %SW_C1
    i128 14470823016439591829, label %SW_C2
  ]

BB:                                               ; preds = %SW_C2, %SW_C1, %SW_C, %SW_D
  ret <16 x b8> %result

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  br label %BB
}

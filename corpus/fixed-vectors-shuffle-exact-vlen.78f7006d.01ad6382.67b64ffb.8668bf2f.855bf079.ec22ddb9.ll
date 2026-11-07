; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zve32x,+zba,+zicond,+m -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 -9223372036854775808)
@G.1 = global <2 x i1> zeroinitializer
@G.2 = global i16 256
@G.3 = global i1 false
@G.4 = global <4 x i256> zeroinitializer
@G.5 = global i256 340282366920938463463374607431768211456
@G.6 = global <4 x i256> splat (i256 340282366920938463463374607431768211456)
@G.7 = global double 4.200000e+01
@G.8 = global i1 false
@G.9 = global i16 32767
@G.10 = global i128 170141183460469231731687303715884105727
@G.11 = global i128 -170141183460469231731687303715884105728
@G.12 = global <4 x i64> splat (i64 42)
@G.13 = global ptr poison
@G.14 = global i256 -57896044618658097711785492504343953926634992332820282019728792003956564819968
@G.15 = global i8 0
@G.16 = global i1 true
@G.17 = global i1 true

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_splat_0(<4 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_splat_in_chunks(<4 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare <8 x i64> @m4_splat_in_chunks(<8 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_splat_with_tail(<4 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_pair_swap_vl4(<4 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare <8 x i32> @m2_pair_swap_vl8(<8 x i32>) #0

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_splat_into_identity(<4 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_broadcast_i128(<4 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare <8 x i64> @m4_broadcast_i128(<8 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_splat_two_source(<4 x i64>, <4 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_splat_into_identity_two_source_v2_hi(<4 x i64>, <4 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_splat_into_slide_two_source_v2_lo(<4 x i64>, <4 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_splat_into_slide_two_source(<4 x i64>, <4 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare void @shuffle1(ptr, ptr) #0

; Function Attrs: vscale_range(2,2)
declare <16 x float> @shuffle2(<4 x float>) #0

; Function Attrs: vscale_range(2,2)
declare i64 @extract_any_extend_vector_inreg_v16i64(<16 x i64>, i32) #0

; Function Attrs: vscale_range(2,2)
declare <4 x double> @shuffles_add(<4 x double>, <4 x double>) #0

; Function Attrs: vscale_range(2,2)
declare <16 x i32> @m4_square_num_of_shuffles_in_chunks(<16 x i32>) #0

; Function Attrs: vscale_range(2,2)
declare <16 x i32> @m4_linear_num_of_shuffles_in_chunks(<16 x i32>) #0

; Function Attrs: vscale_range(8,8)
declare i64 @multi_chunks_shuffle(<32 x i32>) #1

; Function Attrs: vscale_range(2,2)
declare void @shuffle_i128_ldst(ptr) #0

; Function Attrs: vscale_range(2,2)
define void @shuffle_i256_ldst(ptr %p) #0 {
  %LGV16 = load i1, ptr @G.3, align 1
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %LGV4 = load i8, ptr @G.15, align 1
  %C24 = icmp eq i1 %LGV16, %LGV16
  %LGV1 = load i128, ptr @G.10, align 4
  %C5 = icmp sle i8 16, %LGV4
  %LGV = load i256, ptr @G.5, align 4
  %B8 = and i8 127, 16
  %B3 = lshr i128 %LGV1, 18446744073709551616
  %a = load <4 x i256>, ptr %p, align 128
  %res = shufflevector <4 x i256> %a, <4 x i256> poison, <4 x i32> <i32 0, i32 0, i32 3, i32 2>
  %B2 = shl i128 42, %LGV1
  %G3 = getelementptr <4 x i256>, ptr %p, i128 %B3
  %G = getelementptr <4 x i256>, ptr %p, i32 0
  %L14 = load i32, ptr %G, align 4
  %L = load i128, ptr %G, align 4
  store <4 x i256> %res, ptr %p, align 128
  %B = and <4 x i256> %res, splat (i256 -57896044618658097711785492504343953926634992332820282019728792003956564819968)
  %E = extractelement <4 x i256> %B, i128 %B2
  %C = icmp sgt i128 %L, %LGV1
  %B10 = or i128 %B2, 170141183460469231731687303715884105727
  %B11 = shl <4 x i256> %B, %B
  %G15 = getelementptr i128, ptr %G, i32 %L14
  %I = insertelement <4 x i256> %B, i256 %LGV, i16 -1
  store <4 x i256> %B, ptr @G.4, align 128
  %B7 = xor i1 %C, false
  store <4 x i256> %B11, ptr @G.6, align 128
  store i128 %B10, ptr @G.11, align 4
  %B5 = sub i128 %B3, -170141183460469231731687303715884105728
  store <4 x i256> %I, ptr poison, align 128
  store ptr %G, ptr @G.13, align 8
  store i1 %C, ptr @G.8, align 1
  store i256 %E, ptr @G.14, align 4
  store i1 %B7, ptr @G.8, align 1
  store i128 %B3, ptr %G, align 4
  store i1 %C5, ptr @G.16, align 1
  store ptr %G3, ptr @G.13, align 8
  store i128 %B5, ptr poison, align 4
  store i8 %B8, ptr %G, align 1
  store ptr %G15, ptr %A, align 8
  store i1 %C24, ptr @G.17, align 1
  switch i1 %C, label %SW_D [
    i1 true, label %SW_C
    i1 false, label %SW_C17
  ]

BB:                                               ; preds = %BB19, %SW_C, %SW_D
  ret void

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  br i1 %LGV16, label %BB, label %SW_C

SW_C17:                                           ; preds = %0
  switch i32 %L14, label %SW_D20 [
    i32 -467554216, label %SW_C21
    i32 -6311385, label %SW_C22
  ]

BB19:                                             ; preds = %SW_C21, %SW_D20
  br label %BB

SW_D20:                                           ; preds = %SW_C17
  br label %BB19

SW_C21:                                           ; preds = %SW_C21, %SW_C17
  br i1 %LGV16, label %BB19, label %SW_C21

SW_C22:                                           ; preds = %SW_C17
  ret void
}

; Function Attrs: vscale_range(4,4)
declare void @shuffle_3_input_vectors() #2

attributes #0 = { vscale_range(2,2) }
attributes #1 = { vscale_range(8,8) }
attributes #2 = { vscale_range(4,4) }

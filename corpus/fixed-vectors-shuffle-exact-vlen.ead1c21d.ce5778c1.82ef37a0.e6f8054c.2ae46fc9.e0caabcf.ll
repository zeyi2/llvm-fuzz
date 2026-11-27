; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zba,+zve32x,+zbkb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 127
@G.1 = global double +qnan
@G.2 = global <4 x i256> zeroinitializer
@G.3 = global <4 x i128> splat (i128 18446744073709551616)
@G.4 = global <4 x i256> splat (i256 340282366920938463463374607431768211456)
@G.5 = global i32 -1
@G.6 = global <4 x i64> splat (i64 9223372036854775807)
@G.7 = global half +inf
@G.8 = global i1 true
@G.9 = global ptr poison
@G.10 = global i32 0
@G.11 = global <4 x i1> zeroinitializer
@G.12 = global i16 1
@G.13 = global <4 x i32> splat (i32 65536)
@G.14 = global i1 false
@G.15 = global ptr poison

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
define <4 x i64> @m2_splat_into_slide_two_source(<4 x i64> %v1, <4 x i64> %v2) #0 {
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %LGV4 = load <4 x i32>, ptr @G.13, align 16
  %LGV6 = load i16, ptr @G.12, align 2
  %LGV3 = load i32, ptr @G.10, align 4
  %B5 = lshr <4 x i32> splat (i32 42), %LGV4
  %LGV1 = load i32, ptr @G.5, align 4
  %B3 = lshr <4 x i64> %v2, %v2
  %B4 = sub i32 %LGV1, %LGV3
  %LGV = load double, ptr @G.1, align 8
  %B1 = mul <4 x i64> %v2, zeroinitializer
  %B = frem double %LGV, +inf
  %res = shufflevector <4 x i64> %v1, <4 x i64> %B1, <4 x i32> <i32 0, i32 0, i32 5, i32 6>
  %C = icmp slt i128 -1, 42
  store double %B, ptr poison, align 8
  %B2 = sub i32 0, %B4
  %C5 = icmp eq <4 x i64> %v2, %B1
  store i32 %B2, ptr @G.5, align 4
  store <4 x i32> %B5, ptr %A, align 16
  switch i16 %LGV6, label %SW_D [
    i16 -24696, label %SW_C
    i16 10999, label %SW_C7
    i16 -11907, label %SW_C8
  ]

BB:                                               ; preds = %SW_C8, %SW_C
  store <4 x i64> %B3, ptr @G.6, align 32
  store i1 %C, ptr poison, align 1
  store <4 x i1> %C5, ptr @G.11, align 1
  ret <4 x i64> %res

SW_D:                                             ; preds = %0
  ret <4 x i64> splat (i64 4294967296)

SW_C:                                             ; preds = %0
  br label %BB

SW_C7:                                            ; preds = %0
  ret <4 x i64> %v2

SW_C8:                                            ; preds = %0
  br label %BB
}

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
  %A = alloca i16, align 2
  %L7 = load i8, ptr %A, align 1
  store i16 poison, ptr %A, align 2
  %G17 = getelementptr i8, ptr %p, i8 %L7
  %a = load <4 x i256>, ptr %p, align 128
  %res = shufflevector <4 x i256> %a, <4 x i256> poison, <4 x i32> <i32 0, i32 0, i32 3, i32 2>
  store <4 x i256> %res, ptr %p, align 128
  %LGV = load <4 x i256>, ptr @G.4, align 128
  %B1 = add <4 x i256> %a, %LGV
  %B = or <4 x i256> %LGV, %res
  %B7 = and <4 x i256> %B, splat (i256 340282366920938463463374607431768211456)
  %G3 = getelementptr <4 x i256>, ptr %p, i1 true
  %L2 = load i16, ptr %G3, align 2
  %L1 = load i16, ptr %G3, align 2
  %C6 = icmp sge i16 %L2, 0
  store <4 x i256> %B7, ptr @G.4, align 128
  %L = load <4 x i256>, ptr %G3, align 128
  %LGV1 = load half, ptr @G.7, align 2
  %C = fcmp ueq half 5.960460e-08, %LGV1
  %B5 = sdiv <4 x i256> %B, %L
  %G = getelementptr half, ptr %p, i1 %C
  %B3 = sub i16 %L1, %L2
  store <4 x i256> %B5, ptr @G.4, align 128
  store i1 %C6, ptr @G.8, align 1
  store ptr %G, ptr @G.9, align 8
  store ptr %G17, ptr @G.15, align 8
  switch i8 %L7, label %SW_D [
    i8 64, label %SW_C
    i8 98, label %SW_C8
    i8 -95, label %SW_C9
    i8 -74, label %SW_C10
    i8 110, label %SW_C11
    i8 51, label %SW_C12
    i8 94, label %SW_C13
  ]

BB:                                               ; preds = %SW_C12, %SW_C11, %SW_C10, %SW_C9, %SW_C8, %SW_C
  store <4 x i256> %B1, ptr @G.4, align 128
  store <4 x i256> %B, ptr @G.2, align 128
  store ptr %G3, ptr %G, align 8
  store i16 %B3, ptr %A, align 2
  ret void

SW_D:                                             ; preds = %0
  ret void

SW_C:                                             ; preds = %SW_C, %0
  %B15 = xor <4 x i256> %B5, %B7
  %LGV14 = load i1, ptr @G.14, align 1
  store <4 x i256> %B15, ptr poison, align 128
  br i1 %LGV14, label %SW_C, label %BB

SW_C8:                                            ; preds = %SW_C8, %0
  br i1 %C, label %BB, label %SW_C8

SW_C9:                                            ; preds = %0
  br label %BB

SW_C10:                                           ; preds = %0
  br label %BB

SW_C11:                                           ; preds = %0
  br label %BB

SW_C12:                                           ; preds = %0
  br label %BB

SW_C13:                                           ; preds = %0
  ret void
}

; Function Attrs: vscale_range(4,4)
declare void @shuffle_3_input_vectors() #2

attributes #0 = { vscale_range(2,2) }
attributes #1 = { vscale_range(8,8) }
attributes #2 = { vscale_range(4,4) }

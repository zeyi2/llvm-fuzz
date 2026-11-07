; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zve32x,+zbb,+zfh,+xtheadba -O2
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
@G.14 = global i8 127
@G.15 = global i128 0
@G.16 = global ptr poison
@G.17 = global ptr poison
@G.18 = global ptr poison
@G.19 = global i128 1
@G.20 = global <2 x i1> splat (i1 true)
@G.21 = global double +qnan
@G.22 = global half +qnan
@G.23 = global i1 false
@G.24 = global i8 127

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
  %LGV19 = load i1, ptr @G.23, align 1
  %LGV14 = load i8, ptr @G.24, align 1
  %LGV2 = load i128, ptr @G.15, align 4
  %G6 = getelementptr ptr, ptr %p, i128 -170141183460469231731687303715884105728
  %B13 = sdiv i128 %LGV2, 1
  %A = alloca ptr, align 8
  %L13 = load i8, ptr %A, align 1
  %L3 = load <2 x i64>, ptr %A, align 16
  %G7 = getelementptr i128, ptr %p, i128 %LGV2
  %L1 = load i1, ptr %A, align 1
  store ptr poison, ptr %A, align 8
  %B15 = ashr i8 %L13, %LGV14
  %G14 = getelementptr ptr, ptr %p, i128 %LGV2
  %L21 = load i1, ptr %G14, align 1
  %L4 = load <2 x i64>, ptr %G14, align 16
  %LGV1 = load i128, ptr @G.10, align 4
  %LGV = load i256, ptr @G.5, align 4
  %a = load <4 x i256>, ptr %p, align 128
  %res = shufflevector <4 x i256> %a, <4 x i256> poison, <4 x i32> <i32 0, i32 0, i32 3, i32 2>
  %B2 = shl i128 42, %LGV1
  %B12 = shl i1 %L1, false
  %C = icmp uge i128 %B2, %LGV1
  br i1 %L21, label %T17, label %F18

BB16:                                             ; preds = %F18, %T17
  %G = getelementptr <4 x i256>, ptr %p, i32 0
  %G15 = getelementptr ptr, ptr %p, i128 %LGV2
  %G11 = getelementptr i128, ptr %p, i64 0
  %C5 = icmp sgt <2 x i64> %L3, %L4
  %L = load i8, ptr %G, align 1
  store <4 x i256> %res, ptr %p, align 128
  store ptr %G11, ptr %G7, align 8
  store ptr %G15, ptr %G11, align 8
  store i128 %LGV1, ptr @G.19, align 4
  store <2 x i1> %C5, ptr @G.20, align 1
  store i128 %B13, ptr @G.15, align 4
  store i8 %B15, ptr %G15, align 1
  br i1 %B12, label %T, label %F

BB:                                               ; preds = %F
  %LGV15 = load half, ptr @G.22, align 2
  %B = and <4 x i256> %res, splat (i256 -57896044618658097711785492504343953926634992332820282019728792003956564819968)
  %G3 = getelementptr <4 x i256>, ptr %G, i8 %L
  %L5 = load i128, ptr %G3, align 4
  %B6 = srem i128 %LGV1, %L5
  %L7 = load double, ptr %G3, align 8
  %I = insertelement <4 x i256> %B, i256 %LGV, i16 -1
  store <4 x i256> %B, ptr @G.4, align 128
  %G18 = getelementptr ptr, ptr %p, i16 0
  %C9 = fcmp olt double %L7, 0.000000e+00
  store <4 x i256> %I, ptr @G.6, align 128
  store i128 %B6, ptr @G.11, align 4
  store <4 x i256> %I, ptr poison, align 128
  %G24 = getelementptr i32, ptr %G5, i64 0
  store ptr %G, ptr @G.13, align 8
  store ptr %G3, ptr %A, align 8
  %B4 = lshr i128 %LGV2, -1
  %C8 = icmp slt i128 %L5, %B2
  store i128 %B4, ptr poison, align 4
  %G13 = getelementptr ptr, ptr %p, i32 42
  %G8 = getelementptr ptr, ptr %p, i128 %LGV2
  %L14 = load half, ptr %G8, align 2
  %L2 = load i8, ptr %G8, align 1
  store i1 %C, ptr @G.8, align 1
  store i1 %C9, ptr @G.8, align 1
  %C16 = fcmp ule half %L14, %LGV15
  %B7 = xor <4 x i256> %I, %a
  store ptr %G13, ptr @G.16, align 8
  %B3 = and i8 %L, %L2
  store ptr %G14, ptr @G.16, align 8
  store ptr %G18, ptr %G13, align 8
  store ptr %G8, ptr @G.13, align 8
  store i8 %B3, ptr %G5, align 1
  store i1 %C8, ptr @G.3, align 1
  store <4 x i256> %B7, ptr @G.6, align 128
  store i1 %C16, ptr @G.23, align 1
  store ptr %G24, ptr %G5, align 8
  ret void

T:                                                ; preds = %BB16
  %LGV8 = load double, ptr @G.21, align 8
  %G4 = getelementptr ptr, ptr %p, i128 -1
  store ptr %G4, ptr @G.17, align 8
  %G1 = getelementptr i128, ptr %G4, i256 %LGV
  %G2 = getelementptr ptr, ptr %G4, i256 %LGV
  %L20 = load i16, ptr %G1, align 2
  %L18 = load i16, ptr %G1, align 2
  %B21 = srem i16 %L18, %L20
  %L10 = load double, ptr %G1, align 8
  %C11 = fcmp olt double %LGV8, %L10
  %G19 = getelementptr <4 x i256>, ptr %G4, i8 %L
  store ptr %G19, ptr @G.18, align 8
  %G10 = getelementptr ptr, ptr %p, i16 -1
  store ptr %G1, ptr %G19, align 8
  store ptr %G10, ptr poison, align 8
  store i1 %C11, ptr @G.8, align 1
  store i16 %B21, ptr %G6, align 2
  store ptr %G2, ptr @G.16, align 8
  ret void

F:                                                ; preds = %BB16
  %G5 = getelementptr ptr, ptr %G6, i64 -1
  br label %BB

T17:                                              ; preds = %T17, %0
  br i1 %LGV19, label %BB16, label %T17

F18:                                              ; preds = %0
  br label %BB16
}

; Function Attrs: vscale_range(4,4)
declare void @shuffle_3_input_vectors() #2

attributes #0 = { vscale_range(2,2) }
attributes #1 = { vscale_range(8,8) }
attributes #2 = { vscale_range(4,4) }

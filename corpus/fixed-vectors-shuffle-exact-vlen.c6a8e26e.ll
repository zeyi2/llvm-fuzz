; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+v,+zicsr -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i1> zeroinitializer
@G.1 = global <4 x i32> splat (i32 42)
@G.2 = global i8 1
@G.3 = global i8 0
@G.4 = global double 0.000000e+00
@G.5 = global double 4.940660e-324
@G.6 = global i1 false
@G.7 = global <4 x i256> zeroinitializer

; Function Attrs: vscale_range(2,2)
define <4 x i64> @m2_splat_0(<4 x i64> %v1) #0 {
  %LGV1 = load double, ptr @G.5, align 8
  %LGV = load double, ptr @G.4, align 8
  %C = fcmp uno double %LGV, %LGV1
  %res = shufflevector <4 x i64> %v1, <4 x i64> poison, <4 x i32> zeroinitializer
  store i1 %C, ptr @G.6, align 1
  ret <4 x i64> %res
}

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
define <8 x i64> @m4_broadcast_i128(<8 x i64> %v1) #0 {
  %C = icmp slt <4 x i32> splat (i32 42), splat (i32 65536)
  %B = srem <8 x i64> %v1, splat (i64 -1)
  %res = shufflevector <8 x i64> %B, <8 x i64> poison, <8 x i32> <i32 0, i32 1, i32 0, i32 1, i32 0, i32 1, i32 0, i32 1>
  store <4 x i1> %C, ptr poison, align 1
  ret <8 x i64> %res
}

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_splat_two_source(<4 x i64>, <4 x i64>) #0

; Function Attrs: vscale_range(2,2)
define <4 x i64> @m2_splat_into_identity_two_source_v2_hi(<4 x i64> %v1, <4 x i64> %v2) #0 {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %res = shufflevector <4 x i64> %v1, <4 x i64> %v2, <4 x i32> <i32 0, i32 0, i32 6, i32 7>
  %C = icmp uge <4 x i64> %v1, splat (i64 9223372036854775807)
  store <4 x i1> %C, ptr %A, align 1
  ret <4 x i64> %res
}

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
define void @shuffle_i128_ldst(ptr %p) #0 {
  %a = load <4 x i128>, ptr %p, align 64
  %B = ashr <4 x i32> zeroinitializer, zeroinitializer
  %res = shufflevector <4 x i128> %a, <4 x i128> poison, <4 x i32> <i32 0, i32 0, i32 3, i32 2>
  store <4 x i128> %res, ptr %p, align 64
  store <4 x i32> %B, ptr @G.1, align 16
  ret void
}

; Function Attrs: vscale_range(2,2)
define void @shuffle_i256_ldst(ptr %p) #0 {
  %a = load <4 x i256>, ptr %p, align 128
  %res = shufflevector <4 x i256> %a, <4 x i256> poison, <4 x i32> <i32 0, i32 0, i32 3, i32 2>
  %B = shl <4 x i256> %res, %res
  store <4 x i256> %res, ptr %p, align 128
  store <4 x i256> %B, ptr @G.7, align 128
  ret void
}

; Function Attrs: vscale_range(4,4)
define void @shuffle_3_input_vectors() #2 {
  %LGV1 = load i8, ptr @G.2, align 1
  %1 = shufflevector <32 x i64> zeroinitializer, <32 x i64> splat (i64 1), <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 poison, i32 poison, i32 33, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %B = shl i8 1, %LGV1
  %2 = icmp slt <32 x i64> zeroinitializer, %1
  %3 = bitcast <32 x i1> %2 to i32
  %4 = trunc i32 %3 to i8
  store i8 %4, ptr null, align 1
  %C = fcmp ueq <4 x float> splat (float f0x7F7FFFFF), splat (float +qnan)
  store <4 x i1> %C, ptr @G, align 1
  store i8 %B, ptr @G.3, align 1
  ret void
}

attributes #0 = { vscale_range(2,2) }
attributes #1 = { vscale_range(8,8) }
attributes #2 = { vscale_range(4,4) }

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+v,+zfhmin -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i1> zeroinitializer
@G.1 = global <4 x i64> splat (i64 9223372036854775807)
@G.2 = global <4 x i64> splat (i64 42)
@G.3 = global <4 x i1> splat (i1 true)

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
define <4 x i64> @m2_splat_into_identity(<4 x i64> %v1) #0 {
  %res = shufflevector <4 x i64> %v1, <4 x i64> poison, <4 x i32> <i32 0, i32 0, i32 2, i32 3>
  %B = lshr <4 x i64> %v1, splat (i64 -1)
  store <4 x i64> %B, ptr @G.1, align 32
  ret <4 x i64> %res
}

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_broadcast_i128(<4 x i64>) #0

; Function Attrs: vscale_range(2,2)
declare <8 x i64> @m4_broadcast_i128(<8 x i64>) #0

; Function Attrs: vscale_range(2,2)
define <4 x i64> @m2_splat_two_source(<4 x i64> %v1, <4 x i64> %v2) #0 {
  %C = icmp ne <4 x i64> %v1, %v1
  %res = shufflevector <4 x i64> %v1, <4 x i64> %v2, <4 x i32> <i32 0, i32 0, i32 7, i32 7>
  store <4 x i1> %C, ptr @G, align 1
  ret <4 x i64> %res
}

; Function Attrs: vscale_range(2,2)
define <4 x i64> @m2_splat_into_identity_two_source_v2_hi(<4 x i64> %v1, <4 x i64> %v2) #0 {
  %LGV = load <4 x i64>, ptr @G.2, align 32
  %C = icmp ult <4 x i64> %v2, %LGV
  %res = shufflevector <4 x i64> %v1, <4 x i64> %v2, <4 x i32> <i32 0, i32 0, i32 6, i32 7>
  store <4 x i1> %C, ptr @G.3, align 1
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
declare void @shuffle_i128_ldst(ptr) #0

; Function Attrs: vscale_range(2,2)
define void @shuffle_i256_ldst(ptr %p) #0 {
  %a = load <4 x i256>, ptr %p, align 128
  %res = shufflevector <4 x i256> %a, <4 x i256> poison, <4 x i32> <i32 0, i32 0, i32 3, i32 2>
  %B = sdiv <4 x i256> %res, splat (i256 42)
  store <4 x i256> %res, ptr %p, align 128
  store <4 x i256> %B, ptr poison, align 128
  ret void
}

; Function Attrs: vscale_range(4,4)
declare void @shuffle_3_input_vectors() #2

attributes #0 = { vscale_range(2,2) }
attributes #1 = { vscale_range(8,8) }
attributes #2 = { vscale_range(4,4) }

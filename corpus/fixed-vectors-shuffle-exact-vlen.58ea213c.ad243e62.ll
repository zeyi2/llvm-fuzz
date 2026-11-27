; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 -1
@G.1 = global bfloat +qnan
@G.2 = global <4 x i256> splat (i256 -57896044618658097711785492504343953926634992332820282019728792003956564819968)
@G.3 = global <4 x i64> splat (i64 1)
@G.4 = global <4 x i1> zeroinitializer
@G.5 = global i1 true

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
define <4 x i64> @m2_splat_two_source(<4 x i64> %v1, <4 x i64> %v2) #0 {
  %LGV = load <4 x i64>, ptr @G.3, align 32
  %res = shufflevector <4 x i64> %v1, <4 x i64> %v2, <4 x i32> <i32 0, i32 0, i32 7, i32 7>
  %B = lshr i16 1, 0
  store i16 %B, ptr @G, align 2
  %C2 = icmp eq <4 x i64> %LGV, %v2
  store <4 x i1> %C2, ptr @G.4, align 1
  ret <4 x i64> %res
}

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
define <16 x i32> @m4_square_num_of_shuffles_in_chunks(<16 x i32> %0) #0 {
entry:
  %A3 = alloca <16 x i32>, align 64
  store <16 x i32> poison, ptr %A3, align 64
  %A = alloca bfloat, align 2
  %B2 = and <16 x i32> %0, %0
  store bfloat poison, ptr %A, align 2
  %1 = shufflevector <16 x i32> %0, <16 x i32> poison, <16 x i32> <i32 0, i32 5, i32 8, i32 12, i32 1, i32 4, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>
  %B = fsub bfloat 1.000000e+00, 4.200000e+01
  %B1 = frem bfloat %B, +inf
  %C = fcmp uge bfloat %B1, %B1
  store bfloat %B, ptr @G.1, align 2
  store bfloat %B1, ptr %A, align 2
  store <16 x i32> %B2, ptr %A3, align 64
  store i1 %C, ptr @G.5, align 1
  ret <16 x i32> %1
}

; Function Attrs: vscale_range(2,2)
declare <16 x i32> @m4_linear_num_of_shuffles_in_chunks(<16 x i32>) #0

; Function Attrs: vscale_range(8,8)
declare i64 @multi_chunks_shuffle(<32 x i32>) #1

; Function Attrs: vscale_range(2,2)
declare void @shuffle_i128_ldst(ptr) #0

; Function Attrs: vscale_range(2,2)
define void @shuffle_i256_ldst(ptr %p) #0 {
  %LGV = load <4 x i256>, ptr @G.2, align 128
  %A = alloca <4 x i256>, align 128
  store <4 x i256> poison, ptr %A, align 128
  %a = load <4 x i256>, ptr %p, align 128
  %S = shufflevector <4 x i256> %a, <4 x i256> %LGV, <4 x i32> poison
  store <4 x i256> %S, ptr %A, align 128
  %res = shufflevector <4 x i256> %a, <4 x i256> poison, <4 x i32> <i32 0, i32 0, i32 3, i32 2>
  store <4 x i256> %res, ptr %p, align 128
  ret void
}

; Function Attrs: vscale_range(4,4)
define void @shuffle_3_input_vectors() #2 {
  %A = alloca <8 x i1>, align 1
  store <8 x i1> poison, ptr %A, align 1
  %C = icmp ult <8 x i8> splat (i8 16), splat (i8 42)
  store <8 x i1> %C, ptr %A, align 1
  %1 = shufflevector <32 x i64> zeroinitializer, <32 x i64> splat (i64 1), <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 poison, i32 poison, i32 33, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %2 = icmp slt <32 x i64> zeroinitializer, %1
  %3 = bitcast <32 x i1> %2 to i32
  %4 = trunc i32 %3 to i8
  store i8 %4, ptr null, align 1
  ret void
}

attributes #0 = { vscale_range(2,2) }
attributes #1 = { vscale_range(8,8) }
attributes #2 = { vscale_range(4,4) }

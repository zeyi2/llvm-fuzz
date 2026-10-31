; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+zve32x -O0
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

; Function Attrs: vscale_range(2,2)
declare <4 x i64> @m2_splat_0(<4 x i64>) #0

; Function Attrs: vscale_range(2,2)
define <4 x i64> @m2_splat_in_chunks(<4 x i64> %v1) #0 {
  %LGV1 = load double, ptr @G.7, align 8
  %C2 = fcmp ule double %LGV1, f0x7FEFFFFFFFFFFFFF
  %LGV = load i16, ptr @G.2, align 2
  %res = shufflevector <4 x i64> %v1, <4 x i64> poison, <4 x i32> <i32 0, i32 0, i32 2, i32 2>
  %C = icmp sgt i16 32767, %LGV
  store i1 %C, ptr @G.3, align 1
  store i1 %C2, ptr @G.8, align 1
  ret <4 x i64> %res
}

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
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %C1 = icmp sge <4 x i64> %v2, %v1
  %LGV = load <2 x i64>, ptr @G, align 16
  %C = icmp ugt <2 x i64> %LGV, splat (i64 4294967296)
  %res = shufflevector <4 x i64> %v1, <4 x i64> %v2, <4 x i32> <i32 0, i32 0, i32 7, i32 7>
  store <2 x i1> %C, ptr @G.1, align 1
  store <4 x i1> %C1, ptr %A, align 1
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
define <16 x float> @shuffle2(<4 x float> %a) #0 {
  %b = extractelement <4 x float> %a, i32 2
  %b1 = extractelement <4 x float> %a, i32 0
  %C = fcmp ueq <4 x float> %a, %a
  %A = alloca <4 x i1>, align 1
  %c = insertelement <16 x float> <float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float poison, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, float %b, i32 5
  store <4 x i1> poison, ptr %A, align 1
  %c1 = insertelement <16 x float> %c, float %b1, i32 6
  store <4 x i1> %C, ptr %A, align 1
  ret <16 x float> %c1
}

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
  %LGV = load i256, ptr @G.5, align 4
  %a = load <4 x i256>, ptr %p, align 128
  %res = shufflevector <4 x i256> %a, <4 x i256> poison, <4 x i32> <i32 0, i32 0, i32 3, i32 2>
  store <4 x i256> %res, ptr %p, align 128
  %B = and <4 x i256> %res, splat (i256 -57896044618658097711785492504343953926634992332820282019728792003956564819968)
  %I = insertelement <4 x i256> %B, i256 %LGV, i16 -1
  store <4 x i256> %B, ptr @G.4, align 128
  store <4 x i256> %I, ptr @G.6, align 128
  ret void
}

; Function Attrs: vscale_range(4,4)
declare void @shuffle_3_input_vectors() #2

attributes #0 = { vscale_range(2,2) }
attributes #1 = { vscale_range(8,8) }
attributes #2 = { vscale_range(4,4) }

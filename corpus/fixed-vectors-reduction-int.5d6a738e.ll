; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global float 1.000000e+00

declare i8 @vreduce_add_v1i8(<1 x i8>)

declare i8 @vreduce_add_v2i8(ptr)

declare i8 @vreduce_add_v3i8(ptr)

declare i8 @vreduce_add_v4i8(ptr)

declare i8 @vreduce_add_v8i8(ptr)

declare i8 @vreduce_add_v16i8(ptr)

declare i8 @vreduce_add_v32i8(ptr)

declare i8 @vreduce_add_v64i8(ptr)

declare i8 @vreduce_add_v128i8(ptr)

declare i8 @vreduce_add_v256i8(ptr)

declare i16 @vreduce_add_v1i16(<1 x i16>)

declare i16 @vwreduce_add_v1i16(<1 x i8>)

declare i16 @vwreduce_uadd_v1i16(<1 x i8>)

declare i16 @vreduce_add_v2i16(ptr)

declare i16 @vwreduce_add_v2i16(ptr)

declare i16 @vwreduce_uadd_v2i16(ptr)

declare i16 @vreduce_add_v4i16(ptr)

declare i16 @vwreduce_add_v4i16(ptr)

declare i16 @vwreduce_uadd_v4i16(ptr)

declare i16 @vreduce_add_v8i16(ptr)

declare i16 @vwreduce_add_v8i16(ptr)

declare i16 @vwreduce_uadd_v8i16(ptr)

declare i16 @vreduce_add_v16i16(ptr)

declare i16 @vwreduce_add_v16i16(ptr)

declare i16 @vwreduce_uadd_v16i16(ptr)

declare i16 @vreduce_add_v32i16(ptr)

declare i16 @vwreduce_add_v32i16(ptr)

declare i16 @vwreduce_uadd_v32i16(ptr)

declare i16 @vreduce_add_v64i16(ptr)

declare i16 @vwreduce_add_v64i16(ptr)

declare i16 @vwreduce_uadd_v64i16(ptr)

declare i16 @vreduce_add_v128i16(ptr)

declare i16 @vwreduce_add_v128i16(ptr)

declare i16 @vwreduce_uadd_v128i16(ptr)

declare i32 @vreduce_add_v1i32(<1 x i32>)

declare i32 @vwreduce_add_v1i32(<1 x i16>)

declare i32 @vwreduce_uadd_v1i32(<1 x i16>)

declare i32 @vreduce_add_v2i32(ptr)

declare i32 @vwreduce_add_v2i32(ptr)

declare i32 @vwreduce_uadd_v2i32(ptr)

declare i32 @vreduce_add_v4i32(ptr)

declare i32 @vwreduce_add_v4i32(ptr)

define i32 @vwreduce_uadd_v4i32(ptr %x) {
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %LGV = load i1, ptr @G, align 1
  %G = getelementptr i8, ptr %x, i1 %LGV
  %v = load <4 x i16>, ptr %x, align 8
  %e = zext <4 x i16> %v to <4 x i32>
  %red = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %e)
  store ptr %G, ptr %A, align 8
  ret i32 %red
}

declare i32 @vreduce_add_v8i32(ptr)

declare i32 @vwreduce_add_v8i32(ptr)

declare i32 @vwreduce_uadd_v8i32(ptr)

declare i32 @vreduce_add_v16i32(ptr)

declare i32 @vwreduce_add_v16i32(ptr)

declare i32 @vwreduce_uadd_v16i32(ptr)

declare i32 @vreduce_add_v32i32(ptr)

declare i32 @vwreduce_add_v32i32(ptr)

declare i32 @vwreduce_uadd_v32i32(ptr)

declare i32 @vreduce_add_v64i32(ptr)

declare i32 @vwreduce_add_v64i32(ptr)

declare i32 @vwreduce_uadd_v64i32(ptr)

declare i64 @vreduce_add_v1i64(<1 x i64>)

declare i64 @vwreduce_add_v1i64(<1 x i32>)

declare i64 @vwreduce_uadd_v1i64(<1 x i32>)

declare i64 @vreduce_add_v2i64(ptr)

declare i64 @vwreduce_add_v2i64(ptr)

declare i64 @vwreduce_uadd_v2i64(ptr)

declare i64 @vreduce_add_v4i64(ptr)

declare i64 @vwreduce_add_v4i64(ptr)

declare i64 @vwreduce_uadd_v4i64(ptr)

declare i64 @vreduce_add_v8i64(ptr)

declare i64 @vwreduce_add_v8i64(ptr)

declare i64 @vwreduce_uadd_v8i64(ptr)

declare i64 @vreduce_add_v16i64(ptr)

declare i64 @vwreduce_add_v16i64(ptr)

declare i64 @vwreduce_uadd_v16i64(ptr)

declare i64 @vreduce_add_v32i64(ptr)

declare i64 @vwreduce_add_v32i64(ptr)

declare i64 @vwreduce_uadd_v32i64(ptr)

; Function Attrs: nounwind
declare i64 @vreduce_add_v64i64(ptr) #0

declare i64 @vwreduce_add_v64i64(ptr)

declare i64 @vwreduce_uadd_v64i64(ptr)

declare i8 @vreduce_and_v1i8(<1 x i8>)

declare i8 @vreduce_and_v2i8(ptr)

declare i8 @vreduce_and_v3i8(ptr)

declare i8 @vreduce_and_v4i8(ptr)

declare i8 @vreduce_and_v8i8(ptr)

declare i8 @vreduce_and_v16i8(ptr)

declare i8 @vreduce_and_v32i8(ptr)

declare i8 @vreduce_and_v64i8(ptr)

declare i8 @vreduce_and_v128i8(ptr)

declare i8 @vreduce_and_v256i8(ptr)

declare i16 @vreduce_and_v1i16(<1 x i16>)

declare i16 @vreduce_and_v2i16(ptr)

declare i16 @vreduce_and_v4i16(ptr)

declare i16 @vreduce_and_v8i16(ptr)

declare i16 @vreduce_and_v16i16(ptr)

declare i16 @vreduce_and_v32i16(ptr)

declare i16 @vreduce_and_v64i16(ptr)

declare i16 @vreduce_and_v128i16(ptr)

declare i32 @vreduce_and_v1i32(<1 x i32>)

declare i32 @vreduce_and_v2i32(ptr)

declare i32 @vreduce_and_v4i32(ptr)

declare i32 @vreduce_and_v8i32(ptr)

declare i32 @vreduce_and_v16i32(ptr)

declare i32 @vreduce_and_v32i32(ptr)

declare i32 @vreduce_and_v64i32(ptr)

declare i64 @vreduce_and_v1i64(<1 x i64>)

declare i64 @vreduce_and_v2i64(ptr)

declare i64 @vreduce_and_v4i64(ptr)

declare i64 @vreduce_and_v8i64(ptr)

declare i64 @vreduce_and_v16i64(ptr)

declare i64 @vreduce_and_v32i64(ptr)

; Function Attrs: nounwind
declare i64 @vreduce_and_v64i64(ptr) #0

declare i8 @vreduce_or_v1i8(<1 x i8>)

declare i8 @vreduce_or_v2i8(ptr)

declare i8 @vreduce_or_v3i8(ptr)

declare i8 @vreduce_or_v4i8(ptr)

declare i8 @vreduce_or_v8i8(ptr)

declare i8 @vreduce_or_v16i8(ptr)

declare i8 @vreduce_or_v32i8(ptr)

declare i8 @vreduce_or_v64i8(ptr)

declare i8 @vreduce_or_v128i8(ptr)

declare i8 @vreduce_or_v256i8(ptr)

declare i16 @vreduce_or_v1i16(<1 x i16>)

declare i16 @vreduce_or_v2i16(ptr)

declare i16 @vreduce_or_v4i16(ptr)

declare i16 @vreduce_or_v8i16(ptr)

declare i16 @vreduce_or_v16i16(ptr)

declare i16 @vreduce_or_v32i16(ptr)

declare i16 @vreduce_or_v64i16(ptr)

declare i16 @vreduce_or_v128i16(ptr)

declare i32 @vreduce_or_v1i32(<1 x i32>)

declare i32 @vreduce_or_v2i32(ptr)

declare i32 @vreduce_or_v4i32(ptr)

declare i32 @vreduce_or_v8i32(ptr)

declare i32 @vreduce_or_v16i32(ptr)

declare i32 @vreduce_or_v32i32(ptr)

declare i32 @vreduce_or_v64i32(ptr)

declare i64 @vreduce_or_v1i64(<1 x i64>)

declare i64 @vreduce_or_v2i64(ptr)

declare i64 @vreduce_or_v4i64(ptr)

declare i64 @vreduce_or_v8i64(ptr)

declare i64 @vreduce_or_v16i64(ptr)

declare i64 @vreduce_or_v32i64(ptr)

; Function Attrs: nounwind
declare i64 @vreduce_or_v64i64(ptr) #0

declare i8 @vreduce_xor_v1i8(<1 x i8>)

declare i8 @vreduce_xor_v2i8(ptr)

declare i8 @vreduce_xor_v3i8(ptr)

declare i8 @vreduce_xor_v4i8(ptr)

declare i8 @vreduce_xor_v8i8(ptr)

declare i8 @vreduce_xor_v16i8(ptr)

declare i8 @vreduce_xor_v32i8(ptr)

declare i8 @vreduce_xor_v64i8(ptr)

declare i8 @vreduce_xor_v128i8(ptr)

declare i8 @vreduce_xor_v256i8(ptr)

declare i16 @vreduce_xor_v1i16(<1 x i16>)

declare i16 @vreduce_xor_v2i16(ptr)

declare i16 @vreduce_xor_v4i16(ptr)

declare i16 @vreduce_xor_v8i16(ptr)

declare i16 @vreduce_xor_v16i16(ptr)

declare i16 @vreduce_xor_v32i16(ptr)

declare i16 @vreduce_xor_v64i16(ptr)

declare i16 @vreduce_xor_v128i16(ptr)

declare i32 @vreduce_xor_v1i32(<1 x i32>)

declare i32 @vreduce_xor_v2i32(ptr)

declare i32 @vreduce_xor_v4i32(ptr)

declare i32 @vreduce_xor_v8i32(ptr)

declare i32 @vreduce_xor_v16i32(ptr)

declare i32 @vreduce_xor_v32i32(ptr)

declare i32 @vreduce_xor_v64i32(ptr)

declare i64 @vreduce_xor_v1i64(<1 x i64>)

declare i64 @vreduce_xor_v2i64(ptr)

declare i64 @vreduce_xor_v4i64(ptr)

declare i64 @vreduce_xor_v8i64(ptr)

declare i64 @vreduce_xor_v16i64(ptr)

declare i64 @vreduce_xor_v32i64(ptr)

; Function Attrs: nounwind
declare i64 @vreduce_xor_v64i64(ptr) #0

declare i8 @vreduce_smin_v1i8(<1 x i8>)

declare i8 @vreduce_smin_v2i8(ptr)

declare i8 @vreduce_smin_v3i8(ptr)

declare i8 @vreduce_smin_v4i8(ptr)

declare i8 @vreduce_smin_v8i8(ptr)

declare i8 @vreduce_smin_v16i8(ptr)

declare i8 @vreduce_smin_v32i8(ptr)

declare i8 @vreduce_smin_v64i8(ptr)

declare i8 @vreduce_smin_v128i8(ptr)

declare i8 @vreduce_smin_v256i8(ptr)

declare i16 @vreduce_smin_v1i16(<1 x i16>)

declare i16 @vreduce_smin_v2i16(ptr)

declare i16 @vreduce_smin_v4i16(ptr)

declare i16 @vreduce_smin_v8i16(ptr)

declare i16 @vreduce_smin_v16i16(ptr)

declare i16 @vreduce_smin_v32i16(ptr)

declare i16 @vreduce_smin_v64i16(ptr)

declare i16 @vreduce_smin_v128i16(ptr)

declare i32 @vreduce_smin_v1i32(<1 x i32>)

declare i32 @vreduce_smin_v2i32(ptr)

declare i32 @vreduce_smin_v4i32(ptr)

declare i32 @vreduce_smin_v8i32(ptr)

declare i32 @vreduce_smin_v16i32(ptr)

declare i32 @vreduce_smin_v32i32(ptr)

declare i32 @vreduce_smin_v64i32(ptr)

declare i64 @vreduce_smin_v1i64(<1 x i64>)

declare i64 @vreduce_smin_v2i64(ptr)

declare i64 @vreduce_smin_v4i64(ptr)

declare i64 @vreduce_smin_v8i64(ptr)

declare i64 @vreduce_smin_v16i64(ptr)

declare i64 @vreduce_smin_v32i64(ptr)

; Function Attrs: nounwind
declare i64 @vreduce_smin_v64i64(ptr) #0

declare i8 @vreduce_smax_v1i8(<1 x i8>)

declare i8 @vreduce_smax_v2i8(ptr)

declare i8 @vreduce_smax_v3i8(ptr)

declare i8 @vreduce_smax_v4i8(ptr)

declare i8 @vreduce_smax_v8i8(ptr)

declare i8 @vreduce_smax_v16i8(ptr)

declare i8 @vreduce_smax_v32i8(ptr)

declare i8 @vreduce_smax_v64i8(ptr)

declare i8 @vreduce_smax_v128i8(ptr)

declare i8 @vreduce_smax_v256i8(ptr)

declare i16 @vreduce_smax_v1i16(<1 x i16>)

declare i16 @vreduce_smax_v2i16(ptr)

declare i16 @vreduce_smax_v4i16(ptr)

declare i16 @vreduce_smax_v8i16(ptr)

declare i16 @vreduce_smax_v16i16(ptr)

declare i16 @vreduce_smax_v32i16(ptr)

declare i16 @vreduce_smax_v64i16(ptr)

declare i16 @vreduce_smax_v128i16(ptr)

declare i32 @vreduce_smax_v1i32(<1 x i32>)

declare i32 @vreduce_smax_v2i32(ptr)

declare i32 @vreduce_smax_v4i32(ptr)

declare i32 @vreduce_smax_v8i32(ptr)

declare i32 @vreduce_smax_v16i32(ptr)

declare i32 @vreduce_smax_v32i32(ptr)

declare i32 @vreduce_smax_v64i32(ptr)

declare i64 @vreduce_smax_v1i64(<1 x i64>)

declare i64 @vreduce_smax_v2i64(ptr)

declare i64 @vreduce_smax_v4i64(ptr)

declare i64 @vreduce_smax_v8i64(ptr)

declare i64 @vreduce_smax_v16i64(ptr)

declare i64 @vreduce_smax_v32i64(ptr)

; Function Attrs: nounwind
declare i64 @vreduce_smax_v64i64(ptr) #0

declare i8 @vreduce_umin_v1i8(<1 x i8>)

declare i8 @vreduce_umin_v2i8(ptr)

declare i8 @vreduce_umin_v3i8(ptr)

declare i8 @vreduce_umin_v4i8(ptr)

declare i8 @vreduce_umin_v8i8(ptr)

declare i8 @vreduce_umin_v16i8(ptr)

declare i8 @vreduce_umin_v32i8(ptr)

declare i8 @vreduce_umin_v64i8(ptr)

declare i8 @vreduce_umin_v128i8(ptr)

declare i8 @vreduce_umin_v256i8(ptr)

declare i16 @vreduce_umin_v1i16(<1 x i16>)

declare i16 @vreduce_umin_v2i16(ptr)

declare i16 @vreduce_umin_v4i16(ptr)

declare i16 @vreduce_umin_v8i16(ptr)

declare i16 @vreduce_umin_v16i16(ptr)

declare i16 @vreduce_umin_v32i16(ptr)

declare i16 @vreduce_umin_v64i16(ptr)

declare i16 @vreduce_umin_v128i16(ptr)

define i32 @vreduce_umin_v1i32(<1 x i32> %v) {
  %A = alloca <1 x i32>, align 4
  store <1 x i32> poison, ptr %A, align 4
  %red = call i32 @llvm.vector.reduce.umin.v1i32(<1 x i32> %v)
  %B = ashr <1 x i32> %v, %v
  store <1 x i32> %B, ptr %A, align 4
  ret i32 %red
}

declare i32 @vreduce_umin_v2i32(ptr)

declare i32 @vreduce_umin_v4i32(ptr)

declare i32 @vreduce_umin_v8i32(ptr)

declare i32 @vreduce_umin_v16i32(ptr)

declare i32 @vreduce_umin_v32i32(ptr)

declare i32 @vreduce_umin_v64i32(ptr)

declare i64 @vreduce_umin_v1i64(<1 x i64>)

declare i64 @vreduce_umin_v2i64(ptr)

declare i64 @vreduce_umin_v4i64(ptr)

define i64 @vreduce_umin_v8i64(ptr %x) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load float, ptr @G.1, align 4
  %v = load <8 x i64>, ptr %x, align 64
  %C = fcmp une float %LGV, 1.401300e-45
  %red = call i64 @llvm.vector.reduce.umin.v8i64(<8 x i64> %v)
  store i1 %C, ptr %A, align 1
  ret i64 %red
}

declare i64 @vreduce_umin_v16i64(ptr)

declare i64 @vreduce_umin_v32i64(ptr)

; Function Attrs: nounwind
declare i64 @vreduce_umin_v64i64(ptr) #0

declare i8 @vreduce_umax_v1i8(<1 x i8>)

declare i8 @vreduce_umax_v2i8(ptr)

declare i8 @vreduce_umax_v3i8(ptr)

declare i8 @vreduce_umax_v4i8(ptr)

declare i8 @vreduce_umax_v8i8(ptr)

declare i8 @vreduce_umax_v16i8(ptr)

declare i8 @vreduce_umax_v32i8(ptr)

declare i8 @vreduce_umax_v64i8(ptr)

declare i8 @vreduce_umax_v128i8(ptr)

declare i8 @vreduce_umax_v256i8(ptr)

declare i16 @vreduce_umax_v1i16(<1 x i16>)

declare i16 @vreduce_umax_v2i16(ptr)

declare i16 @vreduce_umax_v4i16(ptr)

declare i16 @vreduce_umax_v8i16(ptr)

declare i16 @vreduce_umax_v16i16(ptr)

declare i16 @vreduce_umax_v32i16(ptr)

declare i16 @vreduce_umax_v64i16(ptr)

declare i16 @vreduce_umax_v128i16(ptr)

declare i32 @vreduce_umax_v1i32(<1 x i32>)

declare i32 @vreduce_umax_v2i32(ptr)

declare i32 @vreduce_umax_v4i32(ptr)

declare i32 @vreduce_umax_v8i32(ptr)

declare i32 @vreduce_umax_v16i32(ptr)

declare i32 @vreduce_umax_v32i32(ptr)

declare i32 @vreduce_umax_v64i32(ptr)

declare i64 @vreduce_umax_v1i64(<1 x i64>)

declare i64 @vreduce_umax_v2i64(ptr)

declare i64 @vreduce_umax_v4i64(ptr)

declare i64 @vreduce_umax_v8i64(ptr)

declare i64 @vreduce_umax_v16i64(ptr)

declare i64 @vreduce_umax_v32i64(ptr)

; Function Attrs: nounwind
declare i64 @vreduce_umax_v64i64(ptr) #0

declare i8 @vreduce_mul_v1i8(<1 x i8>)

declare i8 @vreduce_mul_v2i8(ptr)

declare i8 @vreduce_mul_v3i8(ptr)

declare i8 @vreduce_mul_v4i8(ptr)

declare i8 @vreduce_mul_v8i8(ptr)

declare i8 @vreduce_mul_v16i8(ptr)

declare i8 @vreduce_mul_v32i8(ptr)

declare i8 @vreduce_mul_v64i8(ptr)

declare i8 @vreduce_mul_v128i8(ptr)

declare i8 @vreduce_mul_v256i8(ptr)

declare i16 @vreduce_mul_v1i16(<1 x i16>)

declare i16 @vreduce_mul_v2i16(ptr)

declare i16 @vreduce_mul_v4i16(ptr)

declare i16 @vreduce_mul_v8i16(ptr)

declare i16 @vreduce_mul_v16i16(ptr)

declare i16 @vreduce_mul_v32i16(ptr)

declare i16 @vreduce_mul_v64i16(ptr)

declare i16 @vreduce_mul_v128i16(ptr)

declare i32 @vreduce_mul_v1i32(<1 x i32>)

declare i32 @vreduce_mul_v2i32(ptr)

declare i32 @vreduce_mul_v4i32(ptr)

declare i32 @vreduce_mul_v8i32(ptr)

declare i32 @vreduce_mul_v16i32(ptr)

declare i32 @vreduce_mul_v32i32(ptr)

declare i32 @vreduce_mul_v64i32(ptr)

declare i64 @vreduce_mul_v1i64(<1 x i64>)

declare i64 @vreduce_mul_v2i64(ptr)

declare i64 @vreduce_mul_v4i64(ptr)

declare i64 @vreduce_mul_v8i64(ptr)

declare i64 @vreduce_mul_v16i64(ptr)

declare i64 @vreduce_mul_v32i64(ptr)

; Function Attrs: nounwind
declare i64 @vreduce_mul_v64i64(ptr) #0

; Function Attrs: nounwind vscale_range(4,1024)
declare i64 @vreduce_mul_v32i64_vscale4(ptr) #1

; Function Attrs: nounwind vscale_range(8,1024)
declare i64 @vreduce_mul_v32i64_vscale8(ptr) #2

; Function Attrs: nounwind vscale_range(16,1024)
declare i64 @vreduce_mul_v32i64_vscale16(ptr) #3

; Function Attrs: nounwind vscale_range(4,4)
declare i64 @vreduce_mul_v32i64_vscale4_exact(ptr) #4

; Function Attrs: nounwind vscale_range(8,8)
declare i64 @vreduce_mul_v32i64_vscale8_exact(ptr) #5

; Function Attrs: nounwind vscale_range(16,16)
declare i64 @vreduce_mul_v32i64_vscale16_exact(ptr) #6

; Function Attrs: nounwind vscale_range(2,2)
declare i64 @vreduce_mul_v64i64_vscale2_exact(ptr) #7

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v128i16(<128 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.add.v128i8(<128 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v16i16(<16 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v16i32(<16 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.add.v16i64(<16 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.add.v16i8(<16 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v1i16(<1 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v1i32(<1 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.add.v1i64(<1 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.add.v1i8(<1 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.add.v256i8(<256 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v2i16(<2 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v2i32(<2 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.add.v2i64(<2 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.add.v2i8(<2 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v32i16(<32 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v32i32(<32 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.add.v32i64(<32 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.add.v32i8(<32 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.add.v3i8(<3 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v4i16(<4 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.add.v4i64(<4 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.add.v4i8(<4 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v64i16(<64 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v64i32(<64 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.add.v64i64(<64 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.add.v64i8(<64 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v8i16(<8 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.add.v8i64(<8 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.add.v8i8(<8 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.and.v128i16(<128 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.and.v128i8(<128 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.and.v16i16(<16 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.and.v16i32(<16 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.and.v16i64(<16 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.and.v16i8(<16 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.and.v1i16(<1 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.and.v1i32(<1 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.and.v1i64(<1 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.and.v1i8(<1 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.and.v256i8(<256 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.and.v2i16(<2 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.and.v2i32(<2 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.and.v2i64(<2 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.and.v2i8(<2 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.and.v32i16(<32 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.and.v32i32(<32 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.and.v32i64(<32 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.and.v32i8(<32 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.and.v3i8(<3 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.and.v4i16(<4 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.and.v4i32(<4 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.and.v4i64(<4 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.and.v4i8(<4 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.and.v64i16(<64 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.and.v64i32(<64 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.and.v64i64(<64 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.and.v64i8(<64 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.and.v8i16(<8 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.and.v8i32(<8 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.and.v8i64(<8 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.and.v8i8(<8 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.mul.v128i16(<128 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.mul.v128i8(<128 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.mul.v16i16(<16 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.mul.v16i32(<16 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.mul.v16i64(<16 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.mul.v16i8(<16 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.mul.v1i16(<1 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.mul.v1i32(<1 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.mul.v1i64(<1 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.mul.v1i8(<1 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.mul.v256i8(<256 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.mul.v2i16(<2 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.mul.v2i32(<2 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.mul.v2i64(<2 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.mul.v2i8(<2 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.mul.v32i16(<32 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.mul.v32i32(<32 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.mul.v32i64(<32 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.mul.v32i8(<32 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.mul.v3i8(<3 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.mul.v4i16(<4 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.mul.v4i32(<4 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.mul.v4i64(<4 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.mul.v4i8(<4 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.mul.v64i16(<64 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.mul.v64i32(<64 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.mul.v64i64(<64 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.mul.v64i8(<64 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.mul.v8i16(<8 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.mul.v8i32(<8 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.mul.v8i64(<8 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.mul.v8i8(<8 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.or.v128i16(<128 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.or.v128i8(<128 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.or.v16i16(<16 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.or.v16i32(<16 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.or.v16i64(<16 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.or.v16i8(<16 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.or.v1i16(<1 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.or.v1i32(<1 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.or.v1i64(<1 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.or.v1i8(<1 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.or.v256i8(<256 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.or.v2i16(<2 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.or.v2i32(<2 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.or.v2i64(<2 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.or.v2i8(<2 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.or.v32i16(<32 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.or.v32i32(<32 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.or.v32i64(<32 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.or.v32i8(<32 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.or.v3i8(<3 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.or.v4i16(<4 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.or.v4i32(<4 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.or.v4i64(<4 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.or.v4i8(<4 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.or.v64i16(<64 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.or.v64i32(<64 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.or.v64i64(<64 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.or.v64i8(<64 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.or.v8i16(<8 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.or.v8i32(<8 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.or.v8i64(<8 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.or.v8i8(<8 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smax.v128i16(<128 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smax.v128i8(<128 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smax.v16i16(<16 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smax.v16i32(<16 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smax.v16i64(<16 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smax.v16i8(<16 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smax.v1i16(<1 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smax.v1i32(<1 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smax.v1i64(<1 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smax.v1i8(<1 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smax.v256i8(<256 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smax.v2i16(<2 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smax.v2i32(<2 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smax.v2i64(<2 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smax.v2i8(<2 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smax.v32i16(<32 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smax.v32i32(<32 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smax.v32i64(<32 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smax.v32i8(<32 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smax.v3i8(<3 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smax.v4i16(<4 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smax.v4i32(<4 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smax.v4i64(<4 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smax.v4i8(<4 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smax.v64i16(<64 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smax.v64i32(<64 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smax.v64i64(<64 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smax.v64i8(<64 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smax.v8i16(<8 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smax.v8i32(<8 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smax.v8i64(<8 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smax.v8i8(<8 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smin.v128i16(<128 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smin.v128i8(<128 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smin.v16i16(<16 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smin.v16i32(<16 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smin.v16i64(<16 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smin.v16i8(<16 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smin.v1i16(<1 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smin.v1i32(<1 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smin.v1i64(<1 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smin.v1i8(<1 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smin.v256i8(<256 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smin.v2i16(<2 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smin.v2i32(<2 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smin.v2i64(<2 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smin.v2i8(<2 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smin.v32i16(<32 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smin.v32i32(<32 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smin.v32i64(<32 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smin.v32i8(<32 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smin.v3i8(<3 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smin.v4i16(<4 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smin.v4i32(<4 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smin.v4i64(<4 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smin.v4i8(<4 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smin.v64i16(<64 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smin.v64i32(<64 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smin.v64i64(<64 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smin.v64i8(<64 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.smin.v8i16(<8 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smin.v8i32(<8 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.smin.v8i64(<8 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.smin.v8i8(<8 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umax.v128i16(<128 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umax.v128i8(<128 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umax.v16i16(<16 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umax.v16i32(<16 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umax.v16i64(<16 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umax.v16i8(<16 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umax.v1i16(<1 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umax.v1i32(<1 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umax.v1i64(<1 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umax.v1i8(<1 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umax.v256i8(<256 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umax.v2i16(<2 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umax.v2i32(<2 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umax.v2i64(<2 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umax.v2i8(<2 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umax.v32i16(<32 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umax.v32i32(<32 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umax.v32i64(<32 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umax.v32i8(<32 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umax.v3i8(<3 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umax.v4i16(<4 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umax.v4i32(<4 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umax.v4i64(<4 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umax.v4i8(<4 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umax.v64i16(<64 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umax.v64i32(<64 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umax.v64i64(<64 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umax.v64i8(<64 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umax.v8i16(<8 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umax.v8i32(<8 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umax.v8i64(<8 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umax.v8i8(<8 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umin.v128i16(<128 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umin.v128i8(<128 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umin.v16i16(<16 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umin.v16i32(<16 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umin.v16i64(<16 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umin.v16i8(<16 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umin.v1i16(<1 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umin.v1i32(<1 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umin.v1i64(<1 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umin.v1i8(<1 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umin.v256i8(<256 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umin.v2i16(<2 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umin.v2i32(<2 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umin.v2i64(<2 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umin.v2i8(<2 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umin.v32i16(<32 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umin.v32i32(<32 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umin.v32i64(<32 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umin.v32i8(<32 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umin.v3i8(<3 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umin.v4i16(<4 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umin.v4i32(<4 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umin.v4i64(<4 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umin.v4i8(<4 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umin.v64i16(<64 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umin.v64i32(<64 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umin.v64i64(<64 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umin.v64i8(<64 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.umin.v8i16(<8 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.umin.v8i32(<8 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.umin.v8i64(<8 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umin.v8i8(<8 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.xor.v128i16(<128 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.xor.v128i8(<128 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.xor.v16i16(<16 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.xor.v16i32(<16 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.xor.v16i64(<16 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.xor.v16i8(<16 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.xor.v1i16(<1 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.xor.v1i32(<1 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.xor.v1i64(<1 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.xor.v1i8(<1 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.xor.v256i8(<256 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.xor.v2i16(<2 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.xor.v2i32(<2 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.xor.v2i64(<2 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.xor.v2i8(<2 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.xor.v32i16(<32 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.xor.v32i32(<32 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.xor.v32i64(<32 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.xor.v32i8(<32 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.xor.v3i8(<3 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.xor.v4i16(<4 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.xor.v4i32(<4 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.xor.v4i64(<4 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.xor.v4i8(<4 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.xor.v64i16(<64 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.xor.v64i32(<64 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.xor.v64i64(<64 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.xor.v64i8(<64 x i8>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.xor.v8i16(<8 x i16>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.xor.v8i32(<8 x i32>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.xor.v8i64(<8 x i64>) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.xor.v8i8(<8 x i8>) #8

attributes #0 = { nounwind }
attributes #1 = { nounwind vscale_range(4,1024) }
attributes #2 = { nounwind vscale_range(8,1024) }
attributes #3 = { nounwind vscale_range(16,1024) }
attributes #4 = { nounwind vscale_range(4,4) }
attributes #5 = { nounwind vscale_range(8,8) }
attributes #6 = { nounwind vscale_range(16,16) }
attributes #7 = { nounwind vscale_range(2,2) }
attributes #8 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

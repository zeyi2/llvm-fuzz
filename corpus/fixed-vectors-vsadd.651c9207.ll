; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half 1.000000e+00
@G.1 = global half 0.000000e+00
@G.2 = global i1 true
@G.3 = global <8 x i8> splat (i8 -128)

declare <2 x i8> @sadd_v2i8_vv(<2 x i8>, <2 x i8>)

declare <2 x i8> @sadd_v2i8_vx(<2 x i8>, i8)

declare <2 x i8> @sadd_v2i8_vi(<2 x i8>)

declare <4 x i8> @sadd_v4i8_vv(<4 x i8>, <4 x i8>)

declare <4 x i8> @sadd_v4i8_vx(<4 x i8>, i8)

declare <4 x i8> @sadd_v4i8_vi(<4 x i8>)

declare <8 x i8> @sadd_v8i8_vv(<8 x i8>, <8 x i8>)

declare <8 x i8> @sadd_v8i8_vx(<8 x i8>, i8)

declare <8 x i8> @sadd_v8i8_vi(<8 x i8>)

declare <16 x i8> @sadd_v16i8_vv(<16 x i8>, <16 x i8>)

declare <16 x i8> @sadd_v16i8_vx(<16 x i8>, i8)

declare <16 x i8> @sadd_v16i8_vi(<16 x i8>)

declare <2 x i16> @sadd_v2i16_vv(<2 x i16>, <2 x i16>)

declare <2 x i16> @sadd_v2i16_vx(<2 x i16>, i16)

declare <2 x i16> @sadd_v2i16_vi(<2 x i16>)

declare <4 x i16> @sadd_v4i16_vv(<4 x i16>, <4 x i16>)

declare <4 x i16> @sadd_v4i16_vx(<4 x i16>, i16)

declare <4 x i16> @sadd_v4i16_vi(<4 x i16>)

declare <8 x i16> @sadd_v8i16_vv(<8 x i16>, <8 x i16>)

define <8 x i16> @sadd_v8i16_vx(<8 x i16> %va, i16 %b) {
  %LGV1 = load half, ptr @G.1, align 2
  %LGV = load half, ptr @G, align 2
  %elt.head = insertelement <8 x i16> poison, i16 %b, i32 0
  %vb = shufflevector <8 x i16> %elt.head, <8 x i16> poison, <8 x i32> zeroinitializer
  %C = fcmp ugt half %LGV, %LGV1
  %v = call <8 x i16> @llvm.sadd.sat.v8i16(<8 x i16> %va, <8 x i16> %vb)
  store i1 %C, ptr @G.2, align 1
  ret <8 x i16> %v
}

declare <8 x i16> @sadd_v8i16_vi(<8 x i16>)

declare <16 x i16> @sadd_v16i16_vv(<16 x i16>, <16 x i16>)

declare <16 x i16> @sadd_v16i16_vx(<16 x i16>, i16)

declare <16 x i16> @sadd_v16i16_vi(<16 x i16>)

declare <2 x i32> @sadd_v2i32_vv(<2 x i32>, <2 x i32>)

declare <2 x i32> @sadd_v2i32_vx(<2 x i32>, i32)

declare <2 x i32> @sadd_v2i32_vx_commute(<2 x i32>, i32)

declare <2 x i32> @sadd_v2i32_vi(<2 x i32>)

declare <4 x i32> @sadd_v4i32_vv(<4 x i32>, <4 x i32>)

declare <4 x i32> @sadd_v4i32_vx(<4 x i32>, i32)

declare <4 x i32> @sadd_v4i32_vi(<4 x i32>)

declare <8 x i32> @sadd_v8i32_vv(<8 x i32>, <8 x i32>)

declare <8 x i32> @sadd_v8i32_vx(<8 x i32>, i32)

define <8 x i32> @sadd_v8i32_vi(<8 x i32> %va) {
  %B = udiv i64 -9223372036854775808, 0
  %v = call <8 x i32> @llvm.sadd.sat.v8i32(<8 x i32> %va, <8 x i32> splat (i32 5))
  store i64 %B, ptr poison, align 4
  ret <8 x i32> %v
}

declare <16 x i32> @sadd_v16i32_vv(<16 x i32>, <16 x i32>)

declare <16 x i32> @sadd_v16i32_vx(<16 x i32>, i32)

declare <16 x i32> @sadd_v16i32_vi(<16 x i32>)

declare <2 x i64> @sadd_v2i64_vv(<2 x i64>, <2 x i64>)

declare <2 x i64> @sadd_v2i64_vx(<2 x i64>, i64)

declare <2 x i64> @sadd_v2i64_vi(<2 x i64>)

declare <4 x i64> @sadd_v4i64_vv(<4 x i64>, <4 x i64>)

declare <4 x i64> @sadd_v4i64_vx(<4 x i64>, i64)

declare <4 x i64> @sadd_v4i64_vi(<4 x i64>)

define <8 x i64> @sadd_v8i64_vv(<8 x i64> %va, <8 x i64> %b) {
  %v = call <8 x i64> @llvm.sadd.sat.v8i64(<8 x i64> %va, <8 x i64> %b)
  %B = sub <8 x i8> splat (i8 1), zeroinitializer
  store <8 x i8> %B, ptr @G.3, align 8
  ret <8 x i64> %v
}

declare <8 x i64> @sadd_v8i64_vx(<8 x i64>, i64)

declare <8 x i64> @sadd_v8i64_vi(<8 x i64>)

declare <16 x i64> @sadd_v16i64_vv(<16 x i64>, <16 x i64>)

declare <16 x i64> @sadd_v16i64_vx(<16 x i64>, i64)

declare <16 x i64> @sadd_v16i64_vi(<16 x i64>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.sadd.sat.v16i16(<16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.sadd.sat.v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.sadd.sat.v16i64(<16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.sadd.sat.v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.sadd.sat.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.sadd.sat.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.sadd.sat.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.sadd.sat.v2i8(<2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.sadd.sat.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.sadd.sat.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.sadd.sat.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.sadd.sat.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.sadd.sat.v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.sadd.sat.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.sadd.sat.v8i64(<8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.sadd.sat.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

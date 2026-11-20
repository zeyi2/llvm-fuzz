; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 16
@G.1 = global i8 0
@G.2 = global i1 true
@G.3 = global i1 true
@G.4 = global <2 x i8> zeroinitializer
@G.5 = global i128 18446744073709551616
@G.6 = global i1 true
@G.7 = global <16 x i16> zeroinitializer
@G.8 = global i1 false

define <2 x i8> @uadd_v2i8_vv(<2 x i8> %va, <2 x i8> %b) {
  %v = call <2 x i8> @llvm.uadd.sat.v2i8(<2 x i8> %va, <2 x i8> %b)
  store <2 x i8> %v, ptr @G.4, align 2
  ret <2 x i8> %v
}

declare <2 x i8> @uadd_v2i8_vx(<2 x i8>, i8)

declare <2 x i8> @uadd_v2i8_vi(<2 x i8>)

declare <4 x i8> @uadd_v4i8_vv(<4 x i8>, <4 x i8>)

declare <4 x i8> @uadd_v4i8_vx(<4 x i8>, i8)

declare <4 x i8> @uadd_v4i8_vi(<4 x i8>)

declare <8 x i8> @uadd_v8i8_vv(<8 x i8>, <8 x i8>)

declare <8 x i8> @uadd_v8i8_vx(<8 x i8>, i8)

declare <8 x i8> @uadd_v8i8_vi(<8 x i8>)

declare <16 x i8> @uadd_v16i8_vv(<16 x i8>, <16 x i8>)

declare <16 x i8> @uadd_v16i8_vx(<16 x i8>, i8)

declare <16 x i8> @uadd_v16i8_vi(<16 x i8>)

define <2 x i16> @uadd_v2i16_vv(<2 x i16> %va, <2 x i16> %b) {
  %v = call <2 x i16> @llvm.uadd.sat.v2i16(<2 x i16> %va, <2 x i16> %b)
  %I = insertelement <2 x i16> %v, i16 42, i64 4294967296
  store <2 x i16> %I, ptr poison, align 4
  ret <2 x i16> %v
}

declare <2 x i16> @uadd_v2i16_vx(<2 x i16>, i16)

define <2 x i16> @uadd_v2i16_vi(<2 x i16> %va) {
  %LGV1 = load i1, ptr @G.2, align 1
  %v = call <2 x i16> @llvm.uadd.sat.v2i16(<2 x i16> %va, <2 x i16> splat (i16 8))
  %B = xor i1 true, %LGV1
  store i1 %B, ptr @G.3, align 1
  ret <2 x i16> %v
}

declare <4 x i16> @uadd_v4i16_vv(<4 x i16>, <4 x i16>)

declare <4 x i16> @uadd_v4i16_vx(<4 x i16>, i16)

declare <4 x i16> @uadd_v4i16_vi(<4 x i16>)

declare <8 x i16> @uadd_v8i16_vv(<8 x i16>, <8 x i16>)

declare <8 x i16> @uadd_v8i16_vx(<8 x i16>, i16)

declare <8 x i16> @uadd_v8i16_vi(<8 x i16>)

declare <16 x i16> @uadd_v16i16_vv(<16 x i16>, <16 x i16>)

define <16 x i16> @uadd_v16i16_vx(<16 x i16> %va, i16 %b) {
  %LGV = load <16 x i16>, ptr @G.7, align 32
  %elt.head = insertelement <16 x i16> poison, i16 %b, i32 0
  %B = srem <16 x i16> %elt.head, %LGV
  ret <16 x i16> %B
}

declare <16 x i16> @uadd_v16i16_vi(<16 x i16>)

declare <2 x i32> @uadd_v2i32_vv(<2 x i32>, <2 x i32>)

declare <2 x i32> @uadd_v2i32_vx(<2 x i32>, i32)

declare <2 x i32> @uadd_v2i32_vx_commute(<2 x i32>, i32)

define <2 x i32> @uadd_v2i32_vi(<2 x i32> %va) {
  %v = call <2 x i32> @llvm.uadd.sat.v2i32(<2 x i32> %va, <2 x i32> splat (i32 8))
  %C = fcmp ult bfloat 0.000000e+00, 0.000000e+00
  store i1 %C, ptr @G.6, align 1
  ret <2 x i32> %v
}

declare <4 x i32> @uadd_v4i32_vv(<4 x i32>, <4 x i32>)

declare <4 x i32> @uadd_v4i32_vx(<4 x i32>, i32)

declare <4 x i32> @uadd_v4i32_vi(<4 x i32>)

declare <8 x i32> @uadd_v8i32_vv(<8 x i32>, <8 x i32>)

declare <8 x i32> @uadd_v8i32_vx(<8 x i32>, i32)

declare <8 x i32> @uadd_v8i32_vi(<8 x i32>)

declare <16 x i32> @uadd_v16i32_vv(<16 x i32>, <16 x i32>)

declare <16 x i32> @uadd_v16i32_vx(<16 x i32>, i32)

define <16 x i32> @uadd_v16i32_vi(<16 x i32> %va) {
  %v = call <16 x i32> @llvm.uadd.sat.v16i32(<16 x i32> %va, <16 x i32> splat (i32 8))
  %C = icmp sgt i16 32767, 256
  store i1 %C, ptr @G.8, align 1
  ret <16 x i32> %v
}

declare <2 x i64> @uadd_v2i64_vv(<2 x i64>, <2 x i64>)

declare <2 x i64> @uadd_v2i64_vx(<2 x i64>, i64)

declare <2 x i64> @uadd_v2i64_vi(<2 x i64>)

declare <4 x i64> @uadd_v4i64_vv(<4 x i64>, <4 x i64>)

declare <4 x i64> @uadd_v4i64_vx(<4 x i64>, i64)

define <4 x i64> @uadd_v4i64_vi(<4 x i64> %va) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load i8, ptr @G.1, align 1
  %LGV = load i8, ptr @G, align 1
  %v = call <4 x i64> @llvm.uadd.sat.v4i64(<4 x i64> %va, <4 x i64> splat (i64 8))
  %C = icmp ule i8 %LGV, %LGV1
  store i1 %C, ptr %A, align 1
  ret <4 x i64> %v
}

declare <8 x i64> @uadd_v8i64_vv(<8 x i64>, <8 x i64>)

declare <8 x i64> @uadd_v8i64_vx(<8 x i64>, i64)

define <8 x i64> @uadd_v8i64_vi(<8 x i64> %va) {
  %LGV = load i128, ptr @G.5, align 4
  %B = sub i128 42, %LGV
  %v = call <8 x i64> @llvm.uadd.sat.v8i64(<8 x i64> %va, <8 x i64> splat (i64 8))
  store i128 %B, ptr poison, align 4
  ret <8 x i64> %v
}

declare <16 x i64> @uadd_v16i64_vv(<16 x i64>, <16 x i64>)

declare <16 x i64> @uadd_v16i64_vx(<16 x i64>, i64)

declare <16 x i64> @uadd_v16i64_vi(<16 x i64>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.uadd.sat.v16i16(<16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.uadd.sat.v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.uadd.sat.v16i64(<16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.uadd.sat.v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.uadd.sat.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.uadd.sat.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.uadd.sat.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.uadd.sat.v2i8(<2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.uadd.sat.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.uadd.sat.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.uadd.sat.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.uadd.sat.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.uadd.sat.v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.uadd.sat.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.uadd.sat.v8i64(<8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.uadd.sat.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 42
@G.1 = global i1 true
@G.2 = global i32 0
@G.3 = global i32 42
@G.4 = global i32 2147483647
@G.5 = global i16 0
@G.6 = global i16 32767
@G.7 = global i1 true

declare <2 x i8> @ssub_v2i8_vv(<2 x i8>, <2 x i8>)

define <2 x i8> @ssub_v2i8_vx(<2 x i8> %va, i8 %b) {
  %elt.head = insertelement <2 x i8> poison, i8 %b, i32 0
  %vb = shufflevector <2 x i8> %elt.head, <2 x i8> poison, <2 x i32> zeroinitializer
  %B = mul <2 x i8> %va, %vb
  ret <2 x i8> %B
}

declare <2 x i8> @ssub_v2i8_vi(<2 x i8>)

declare <4 x i8> @ssub_v4i8_vv(<4 x i8>, <4 x i8>)

define <4 x i8> @ssub_v4i8_vx(<4 x i8> %va, i8 %b) {
  %LGV = load i32, ptr @G.4, align 4
  %elt.head = insertelement <4 x i8> poison, i8 %b, i32 0
  %vb = shufflevector <4 x i8> %elt.head, <4 x i8> poison, <4 x i32> zeroinitializer
  %C = icmp eq i32 42, %LGV
  %v = call <4 x i8> @llvm.ssub.sat.v4i8(<4 x i8> %va, <4 x i8> %vb)
  store i1 %C, ptr poison, align 1
  ret <4 x i8> %v
}

declare <4 x i8> @ssub_v4i8_vi(<4 x i8>)

declare <8 x i8> @ssub_v8i8_vv(<8 x i8>, <8 x i8>)

declare <8 x i8> @ssub_v8i8_vx(<8 x i8>, i8)

declare <8 x i8> @ssub_v8i8_vi(<8 x i8>)

declare <16 x i8> @ssub_v16i8_vv(<16 x i8>, <16 x i8>)

declare <16 x i8> @ssub_v16i8_vx(<16 x i8>, i8)

define <16 x i8> @ssub_v16i8_vi(<16 x i8> %va) {
  %LGV = load i16, ptr @G.5, align 2
  %B = ashr i16 %LGV, -1
  %v = call <16 x i8> @llvm.ssub.sat.v16i8(<16 x i8> %va, <16 x i8> splat (i8 1))
  store i16 %B, ptr @G.6, align 2
  ret <16 x i8> %v
}

declare <2 x i16> @ssub_v2i16_vv(<2 x i16>, <2 x i16>)

declare <2 x i16> @ssub_v2i16_vx(<2 x i16>, i16)

declare <2 x i16> @ssub_v2i16_vi(<2 x i16>)

declare <4 x i16> @ssub_v4i16_vv(<4 x i16>, <4 x i16>)

declare <4 x i16> @ssub_v4i16_vx(<4 x i16>, i16)

declare <4 x i16> @ssub_v4i16_vi(<4 x i16>)

declare <8 x i16> @ssub_v8i16_vv(<8 x i16>, <8 x i16>)

declare <8 x i16> @ssub_v8i16_vx(<8 x i16>, i16)

declare <8 x i16> @ssub_v8i16_vi(<8 x i16>)

declare <16 x i16> @ssub_v16i16_vv(<16 x i16>, <16 x i16>)

declare <16 x i16> @ssub_v16i16_vx(<16 x i16>, i16)

declare <16 x i16> @ssub_v16i16_vi(<16 x i16>)

define <2 x i32> @ssub_v2i32_vv(<2 x i32> %va, <2 x i32> %b) {
  %v = call <2 x i32> @llvm.ssub.sat.v2i32(<2 x i32> %va, <2 x i32> %b)
  %C = fcmp ueq float 4.200000e+01, 1.000000e+00
  store i1 %C, ptr @G.7, align 1
  ret <2 x i32> %v
}

declare <2 x i32> @ssub_v2i32_vx(<2 x i32>, i32)

declare <2 x i32> @ssub_v2i32_vi(<2 x i32>)

declare <4 x i32> @ssub_v4i32_vv(<4 x i32>, <4 x i32>)

define <4 x i32> @ssub_v4i32_vx(<4 x i32> %va, i32 %b) {
  %LGV = load i16, ptr @G, align 2
  %C = icmp sge i16 %LGV, -32768
  %elt.head = insertelement <4 x i32> poison, i32 %b, i32 0
  %vb = shufflevector <4 x i32> %elt.head, <4 x i32> poison, <4 x i32> zeroinitializer
  %v = call <4 x i32> @llvm.ssub.sat.v4i32(<4 x i32> %va, <4 x i32> %vb)
  store i1 %C, ptr @G.1, align 1
  ret <4 x i32> %v
}

declare <4 x i32> @ssub_v4i32_vi(<4 x i32>)

declare <8 x i32> @ssub_v8i32_vv(<8 x i32>, <8 x i32>)

declare <8 x i32> @ssub_v8i32_vx(<8 x i32>, i32)

declare <8 x i32> @ssub_v8i32_vi(<8 x i32>)

declare <16 x i32> @ssub_v16i32_vv(<16 x i32>, <16 x i32>)

declare <16 x i32> @ssub_v16i32_vx(<16 x i32>, i32)

declare <16 x i32> @ssub_v16i32_vi(<16 x i32>)

declare <2 x i64> @ssub_v2i64_vv(<2 x i64>, <2 x i64>)

declare <2 x i64> @ssub_v2i64_vx(<2 x i64>, i64)

declare <2 x i64> @ssub_v2i64_vi(<2 x i64>)

declare <4 x i64> @ssub_v4i64_vv(<4 x i64>, <4 x i64>)

declare <4 x i64> @ssub_v4i64_vx(<4 x i64>, i64)

declare <4 x i64> @ssub_v4i64_vi(<4 x i64>)

declare <8 x i64> @ssub_v8i64_vv(<8 x i64>, <8 x i64>)

declare <8 x i64> @ssub_v8i64_vx(<8 x i64>, i64)

declare <8 x i64> @ssub_v8i64_vi(<8 x i64>)

declare <16 x i64> @ssub_v16i64_vv(<16 x i64>, <16 x i64>)

declare <16 x i64> @ssub_v16i64_vx(<16 x i64>, i64)

define <16 x i64> @ssub_v16i64_vi(<16 x i64> %va) {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV1 = load i32, ptr @G.3, align 4
  %LGV = load i32, ptr @G.2, align 4
  %v = call <16 x i64> @llvm.ssub.sat.v16i64(<16 x i64> %va, <16 x i64> splat (i64 1))
  %B = or i32 %LGV, %LGV1
  store i32 %B, ptr %A, align 4
  ret <16 x i64> %v
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.ssub.sat.v16i16(<16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.ssub.sat.v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.ssub.sat.v16i64(<16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.ssub.sat.v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.ssub.sat.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.ssub.sat.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.ssub.sat.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.ssub.sat.v2i8(<2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.ssub.sat.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.ssub.sat.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.ssub.sat.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.ssub.sat.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.ssub.sat.v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.ssub.sat.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.ssub.sat.v8i64(<8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.ssub.sat.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

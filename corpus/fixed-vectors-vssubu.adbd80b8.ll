; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx -O2 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 0
@G.1 = global i1 true
@G.2 = global <2 x i16> splat (i16 256)
@G.3 = global <4 x i1> splat (i1 true)
@G.4 = global bfloat +inf
@G.5 = global i8 16
@G.6 = global i8 -1

define <2 x i8> @usub_v2i8_vv(<2 x i8> %va, <2 x i8> %b) {
  %LGV = load i8, ptr @G.5, align 1
  %v = call <2 x i8> @llvm.usub.sat.v2i8(<2 x i8> %va, <2 x i8> %b)
  %B = udiv i8 42, %LGV
  store i8 %B, ptr @G.6, align 1
  ret <2 x i8> %v
}

declare <2 x i8> @usub_v2i8_vx(<2 x i8>, i8)

declare <2 x i8> @usub_v2i8_vi(<2 x i8>)

declare <4 x i8> @usub_v4i8_vv(<4 x i8>, <4 x i8>)

declare <4 x i8> @usub_v4i8_vx(<4 x i8>, i8)

declare <4 x i8> @usub_v4i8_vi(<4 x i8>)

declare <8 x i8> @usub_v8i8_vv(<8 x i8>, <8 x i8>)

declare <8 x i8> @usub_v8i8_vx(<8 x i8>, i8)

declare <8 x i8> @usub_v8i8_vi(<8 x i8>)

define <16 x i8> @usub_v16i8_vv(<16 x i8> %va, <16 x i8> %b) {
  %v = call <16 x i8> @llvm.usub.sat.v16i8(<16 x i8> %va, <16 x i8> %b)
  %B = xor <16 x i8> %b, splat (i8 16)
  store <16 x i8> %B, ptr poison, align 16
  ret <16 x i8> %v
}

declare <16 x i8> @usub_v16i8_vx(<16 x i8>, i8)

declare <16 x i8> @usub_v16i8_vi(<16 x i8>)

declare <2 x i16> @usub_v2i16_vv(<2 x i16>, <2 x i16>)

declare <2 x i16> @usub_v2i16_vx(<2 x i16>, i16)

define <2 x i16> @usub_v2i16_vi(<2 x i16> %va) {
  %v = call <2 x i16> @llvm.usub.sat.v2i16(<2 x i16> %va, <2 x i16> splat (i16 2))
  %B = and <2 x i16> %v, %v
  store <2 x i16> %B, ptr @G.2, align 4
  ret <2 x i16> %v
}

define <4 x i16> @usub_v4i16_vv(<4 x i16> %va, <4 x i16> %b) {
  %v = call <4 x i16> @llvm.usub.sat.v4i16(<4 x i16> %va, <4 x i16> %b)
  %C = icmp ult <4 x i16> %b, zeroinitializer
  store <4 x i1> %C, ptr @G.3, align 1
  ret <4 x i16> %v
}

declare <4 x i16> @usub_v4i16_vx(<4 x i16>, i16)

declare <4 x i16> @usub_v4i16_vi(<4 x i16>)

declare <8 x i16> @usub_v8i16_vv(<8 x i16>, <8 x i16>)

declare <8 x i16> @usub_v8i16_vx(<8 x i16>, i16)

declare <8 x i16> @usub_v8i16_vi(<8 x i16>)

declare <16 x i16> @usub_v16i16_vv(<16 x i16>, <16 x i16>)

declare <16 x i16> @usub_v16i16_vx(<16 x i16>, i16)

declare <16 x i16> @usub_v16i16_vi(<16 x i16>)

declare <2 x i32> @usub_v2i32_vv(<2 x i32>, <2 x i32>)

declare <2 x i32> @usub_v2i32_vx(<2 x i32>, i32)

define <2 x i32> @usub_v2i32_vi(<2 x i32> %va) {
  %LGV = load i1, ptr @G.1, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F
  %v = call <2 x i32> @llvm.usub.sat.v2i32(<2 x i32> %va, <2 x i32> splat (i32 2))
  ret <2 x i32> %v

T:                                                ; preds = %0
  ret <2 x i32> splat (i32 2147483647)

F:                                                ; preds = %0
  br label %BB
}

declare <4 x i32> @usub_v4i32_vv(<4 x i32>, <4 x i32>)

declare <4 x i32> @usub_v4i32_vx(<4 x i32>, i32)

declare <4 x i32> @usub_v4i32_vi(<4 x i32>)

declare <8 x i32> @usub_v8i32_vv(<8 x i32>, <8 x i32>)

declare <8 x i32> @usub_v8i32_vx(<8 x i32>, i32)

declare <8 x i32> @usub_v8i32_vi(<8 x i32>)

declare <16 x i32> @usub_v16i32_vv(<16 x i32>, <16 x i32>)

declare <16 x i32> @usub_v16i32_vx(<16 x i32>, i32)

declare <16 x i32> @usub_v16i32_vi(<16 x i32>)

declare <2 x i64> @usub_v2i64_vv(<2 x i64>, <2 x i64>)

declare <2 x i64> @usub_v2i64_vx(<2 x i64>, i64)

declare <2 x i64> @usub_v2i64_vi(<2 x i64>)

declare <4 x i64> @usub_v4i64_vv(<4 x i64>, <4 x i64>)

declare <4 x i64> @usub_v4i64_vx(<4 x i64>, i64)

declare <4 x i64> @usub_v4i64_vi(<4 x i64>)

define <8 x i64> @usub_v8i64_vv(<8 x i64> %va, <8 x i64> %b) {
  %LGV = load i64, ptr @G, align 4
  %v = call <8 x i64> @llvm.usub.sat.v8i64(<8 x i64> %va, <8 x i64> %b)
  %B = lshr i64 -9223372036854775808, %LGV
  store i64 %B, ptr @G, align 4
  ret <8 x i64> %v
}

declare <8 x i64> @usub_v8i64_vx(<8 x i64>, i64)

declare <8 x i64> @usub_v8i64_vi(<8 x i64>)

declare <16 x i64> @usub_v16i64_vv(<16 x i64>, <16 x i64>)

define <16 x i64> @usub_v16i64_vx(<16 x i64> %va, i64 %b) {
  %LGV = load bfloat, ptr @G.4, align 2
  %C = fcmp uge bfloat %LGV, +inf
  %elt.head = insertelement <16 x i64> poison, i64 %b, i32 0
  %vb = shufflevector <16 x i64> %elt.head, <16 x i64> poison, <16 x i32> zeroinitializer
  %v = call <16 x i64> @llvm.usub.sat.v16i64(<16 x i64> %va, <16 x i64> %vb)
  store i1 %C, ptr @G.1, align 1
  ret <16 x i64> %v
}

declare <16 x i64> @usub_v16i64_vi(<16 x i64>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.usub.sat.v16i16(<16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.usub.sat.v16i32(<16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i64> @llvm.usub.sat.v16i64(<16 x i64>, <16 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.usub.sat.v16i8(<16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.usub.sat.v2i16(<2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.usub.sat.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.usub.sat.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.usub.sat.v2i8(<2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.usub.sat.v4i16(<4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.usub.sat.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.usub.sat.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.usub.sat.v4i8(<4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.usub.sat.v8i16(<8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.usub.sat.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.usub.sat.v8i64(<8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.usub.sat.v8i8(<8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

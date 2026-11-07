; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 127)
@G.1 = global <8 x i8> splat (i8 16)
@G.2 = global <8 x i1> splat (i1 true)
@G.3 = global i128 0
@G.4 = global <4 x i32> zeroinitializer
@G.5 = global float 1.401300e-45
@G.6 = global <2 x i64> zeroinitializer
@G.7 = global <2 x i64> splat (i64 1)

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

define <4 x i16> @sadd_v4i16_vi(<4 x i16> %va) {
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %LGV1 = load <8 x i8>, ptr @G.1, align 8
  %LGV = load <8 x i8>, ptr @G, align 8
  %E = extractelement <8 x i8> %LGV1, i16 1
  %v = call <4 x i16> @llvm.sadd.sat.v4i16(<4 x i16> %va, <4 x i16> splat (i16 5))
  %C = icmp sgt <8 x i8> %LGV, %LGV1
  store <8 x i1> %C, ptr @G.2, align 1
  store i8 %E, ptr %A, align 1
  ret <4 x i16> %v
}

declare <8 x i16> @sadd_v8i16_vv(<8 x i16>, <8 x i16>)

declare <8 x i16> @sadd_v8i16_vx(<8 x i16>, i16)

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

define <8 x i32> @sadd_v8i32_vv(<8 x i32> %va, <8 x i32> %b) {
  %v = call <8 x i32> @llvm.sadd.sat.v8i32(<8 x i32> %va, <8 x i32> %b)
  %C1 = icmp sge <8 x i32> %va, splat (i32 -1)
  store <8 x i1> %C1, ptr @G.2, align 1
  ret <8 x i32> %v
}

declare <8 x i32> @sadd_v8i32_vx(<8 x i32>, i32)

declare <8 x i32> @sadd_v8i32_vi(<8 x i32>)

declare <16 x i32> @sadd_v16i32_vv(<16 x i32>, <16 x i32>)

declare <16 x i32> @sadd_v16i32_vx(<16 x i32>, i32)

declare <16 x i32> @sadd_v16i32_vi(<16 x i32>)

declare <2 x i64> @sadd_v2i64_vv(<2 x i64>, <2 x i64>)

declare <2 x i64> @sadd_v2i64_vx(<2 x i64>, i64)

define <2 x i64> @sadd_v2i64_vi(<2 x i64> %va) {
  %A7 = alloca i128, align 8
  store i128 poison, ptr %A7, align 4
  %LGV = load float, ptr @G.5, align 4
  %A1 = alloca i1, align 1
  store i1 true, ptr %A1, align 1
  %A = alloca <2 x i1>, align 1
  store <2 x i1> poison, ptr %A, align 1
  %v = call <2 x i64> @llvm.sadd.sat.v2i64(<2 x i64> %va, <2 x i64> splat (i64 5))
  %C = icmp uge <2 x i64> %v, %va
  store <2 x i1> %C, ptr %A, align 1
  %L2 = load i1, ptr %A1, align 1
  br i1 %L2, label %T, label %F

BB:                                               ; preds = %F, %T
  %B6 = urem i128 0, -1
  store i128 %B6, ptr %A7, align 4
  ret <2 x i64> %v

T:                                                ; preds = %0
  %1 = phi float [ %LGV, %0 ]
  store float %1, ptr %A1, align 4
  %B = ashr <2 x i64> %va, splat (i64 42)
  store <2 x i64> %B, ptr @G.6, align 16
  br label %BB

F:                                                ; preds = %0
  %LGV3 = load <2 x i64>, ptr @G.7, align 16
  %B4 = udiv <2 x i64> %va, %LGV3
  store <2 x i64> %B4, ptr %A1, align 16
  br label %BB
}

declare <4 x i64> @sadd_v4i64_vv(<4 x i64>, <4 x i64>)

declare <4 x i64> @sadd_v4i64_vx(<4 x i64>, i64)

declare <4 x i64> @sadd_v4i64_vi(<4 x i64>)

declare <8 x i64> @sadd_v8i64_vv(<8 x i64>, <8 x i64>)

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

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zvkb,+zicond,+zvfh -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> zeroinitializer
@G.1 = global i16 42
@G.2 = global i32 65536
@G.3 = global i1 false
@G.4 = global i8 42
@G.5 = global i64 9223372036854775807

declare <1 x i8> @vrol_vv_v1i8(<1 x i8>, <1 x i8>)

declare <1 x i8> @vrol_vx_v1i8(<1 x i8>, i8)

declare <2 x i8> @vrol_vv_v2i8(<2 x i8>, <2 x i8>)

declare <2 x i8> @vrol_vx_v2i8(<2 x i8>, i8)

declare <4 x i8> @vrol_vv_v4i8(<4 x i8>, <4 x i8>)

declare <4 x i8> @vrol_vx_v4i8(<4 x i8>, i8)

define <8 x i8> @vrol_vv_v8i8(<8 x i8> %a, <8 x i8> %b) {
  %C = icmp ule <8 x i8> %b, %a
  %x = call <8 x i8> @llvm.fshl.v8i8(<8 x i8> %a, <8 x i8> %a, <8 x i8> %b)
  %A = alloca <8 x i1>, align 1
  %L3 = load i64, ptr %A, align 4
  store <8 x i1> %C, ptr %A, align 1
  %L = load i64, ptr %A, align 4
  store <8 x i1> poison, ptr %A, align 1
  %C2 = icmp ule i64 %L, -9223372036854775808
  store i1 %C2, ptr @G.3, align 1
  %B = or i64 %L, %L3
  store i64 %B, ptr @G.5, align 4
  store i64 %B, ptr poison, align 4
  ret <8 x i8> %x
}

declare <8 x i8> @vrol_vx_v8i8(<8 x i8>, i8)

declare <16 x i8> @vrol_vv_v16i8(<16 x i8>, <16 x i8>)

declare <16 x i8> @vrol_vx_v16i8(<16 x i8>, i8)

declare <32 x i8> @vrol_vv_v32i8(<32 x i8>, <32 x i8>)

declare <32 x i8> @vrol_vx_v32i8(<32 x i8>, i8)

declare <64 x i8> @vrol_vv_v64i8(<64 x i8>, <64 x i8>)

declare <64 x i8> @vrol_vx_v64i8(<64 x i8>, i8)

declare <1 x i16> @vrol_vv_v1i16(<1 x i16>, <1 x i16>)

declare <1 x i16> @vrol_vx_v1i16(<1 x i16>, i16)

declare <2 x i16> @vrol_vv_v2i16(<2 x i16>, <2 x i16>)

declare <2 x i16> @vrol_vx_v2i16(<2 x i16>, i16)

declare <4 x i16> @vrol_vv_v4i16(<4 x i16>, <4 x i16>)

declare <4 x i16> @vrol_vx_v4i16(<4 x i16>, i16)

declare <8 x i16> @vrol_vv_v8i16(<8 x i16>, <8 x i16>)

declare <8 x i16> @vrol_vx_v8i16(<8 x i16>, i16)

declare <16 x i16> @vrol_vv_v16i16(<16 x i16>, <16 x i16>)

declare <16 x i16> @vrol_vx_v16i16(<16 x i16>, i16)

declare <32 x i16> @vrol_vv_v32i16(<32 x i16>, <32 x i16>)

declare <32 x i16> @vrol_vx_v32i16(<32 x i16>, i16)

define <1 x i32> @vrol_vv_v1i32(<1 x i32> %a, <1 x i32> %b) {
  %B = add i8 127, 42
  store i8 %B, ptr @G.4, align 1
  %x = call <1 x i32> @llvm.fshl.v1i32(<1 x i32> %a, <1 x i32> %a, <1 x i32> %b)
  %LGV = load <4 x i32>, ptr @G, align 16
  %LGV1 = load i16, ptr @G.1, align 2
  %E = extractelement <4 x i32> %LGV, i16 %LGV1
  store i32 %E, ptr @G.2, align 4
  ret <1 x i32> %x
}

declare <1 x i32> @vrol_vx_v1i32(<1 x i32>, i32)

declare <2 x i32> @vrol_vv_v2i32(<2 x i32>, <2 x i32>)

declare <2 x i32> @vrol_vx_v2i32(<2 x i32>, i32)

declare <4 x i32> @vrol_vv_v4i32(<4 x i32>, <4 x i32>)

declare <4 x i32> @vrol_vx_v4i32(<4 x i32>, i32)

declare <8 x i32> @vrol_vv_v8i32(<8 x i32>, <8 x i32>)

declare <8 x i32> @vrol_vx_v8i32(<8 x i32>, i32)

declare <16 x i32> @vrol_vv_v16i32(<16 x i32>, <16 x i32>)

declare <16 x i32> @vrol_vx_v16i32(<16 x i32>, i32)

declare <1 x i64> @vrol_vv_v1i64(<1 x i64>, <1 x i64>)

declare <1 x i64> @vrol_vx_v1i64(<1 x i64>, i64)

declare <2 x i64> @vrol_vv_v2i64(<2 x i64>, <2 x i64>)

declare <2 x i64> @vrol_vx_v2i64(<2 x i64>, i64)

declare <4 x i64> @vrol_vv_v4i64(<4 x i64>, <4 x i64>)

declare <4 x i64> @vrol_vx_v4i64(<4 x i64>, i64)

declare <8 x i64> @vrol_vv_v8i64(<8 x i64>, <8 x i64>)

declare <8 x i64> @vrol_vx_v8i64(<8 x i64>, i64)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.fshl.v16i16(<16 x i16>, <16 x i16>, <16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.fshl.v16i32(<16 x i32>, <16 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.fshl.v16i8(<16 x i8>, <16 x i8>, <16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i16> @llvm.fshl.v1i16(<1 x i16>, <1 x i16>, <1 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i32> @llvm.fshl.v1i32(<1 x i32>, <1 x i32>, <1 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i64> @llvm.fshl.v1i64(<1 x i64>, <1 x i64>, <1 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x i8> @llvm.fshl.v1i8(<1 x i8>, <1 x i8>, <1 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.fshl.v2i16(<2 x i16>, <2 x i16>, <2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.fshl.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.fshl.v2i64(<2 x i64>, <2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i8> @llvm.fshl.v2i8(<2 x i8>, <2 x i8>, <2 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i16> @llvm.fshl.v32i16(<32 x i16>, <32 x i16>, <32 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i8> @llvm.fshl.v32i8(<32 x i8>, <32 x i8>, <32 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.fshl.v4i16(<4 x i16>, <4 x i16>, <4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.fshl.v4i32(<4 x i32>, <4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.fshl.v4i64(<4 x i64>, <4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.fshl.v4i8(<4 x i8>, <4 x i8>, <4 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <64 x i8> @llvm.fshl.v64i8(<64 x i8>, <64 x i8>, <64 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.fshl.v8i16(<8 x i16>, <8 x i16>, <8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.fshl.v8i32(<8 x i32>, <8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i64> @llvm.fshl.v8i64(<8 x i64>, <8 x i64>, <8 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.fshl.v8i8(<8 x i8>, <8 x i8>, <8 x i8>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zvfh,+zihintpause -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float +qnan
@G.1 = global <4 x i8> splat (i8 -1)
@G.2 = global i32 65536
@G.3 = global i32 42

declare <vscale x 16 x i1> @match_nxv16i8_v1i8(<vscale x 16 x i8>, <1 x i8>, <vscale x 16 x i1>)

declare <vscale x 16 x i1> @match_nxv16i8_v2i8(<vscale x 16 x i8>, <2 x i8>, <vscale x 16 x i1>)

define <vscale x 16 x i1> @match_nxv16i8_v4i8(<vscale x 16 x i8> %op1, <4 x i8> %op2, <vscale x 16 x i1> %mask) {
  %LGV = load <4 x i8>, ptr @G.1, align 4
  %r = tail call <vscale x 16 x i1> @llvm.experimental.vector.match.nxv16i8.v4i8(<vscale x 16 x i8> %op1, <4 x i8> %op2, <vscale x 16 x i1> %mask)
  %S = shufflevector <4 x i8> %op2, <4 x i8> %LGV, <4 x i32> poison
  store <4 x i8> %S, ptr @G.1, align 4
  ret <vscale x 16 x i1> %r
}

declare <vscale x 16 x i1> @match_nxv16i8_v8i8(<vscale x 16 x i8>, <8 x i8>, <vscale x 16 x i1>)

declare <vscale x 16 x i1> @match_nxv16i8_v16i8(<vscale x 16 x i8>, <16 x i8>, <vscale x 16 x i1>)

declare <16 x i1> @match_v16i8_v1i8(<16 x i8>, <1 x i8>, <16 x i1>)

define <16 x i1> @match_v16i8_v2i8(<16 x i8> %op1, <2 x i8> %op2, <16 x i1> %mask) {
  %LGV = load float, ptr @G, align 4
  %C = fcmp ord float %LGV, 1.401300e-45
  %r = tail call <16 x i1> @llvm.experimental.vector.match.v16i8.v2i8(<16 x i8> %op1, <2 x i8> %op2, <16 x i1> %mask)
  store i1 %C, ptr poison, align 1
  ret <16 x i1> %r
}

define <16 x i1> @match_v16i8_v4i8(<16 x i8> %op1, <4 x i8> %op2, <16 x i1> %mask) {
  %r = tail call <16 x i1> @llvm.experimental.vector.match.v16i8.v4i8(<16 x i8> %op1, <4 x i8> %op2, <16 x i1> %mask)
  store <16 x i1> %r, ptr poison, align 2
  ret <16 x i1> %r
}

declare <16 x i1> @match_v16i8_v8i8(<16 x i8>, <8 x i8>, <16 x i1>)

declare <16 x i1> @match_v16i8_v16i8(<16 x i8>, <16 x i8>, <16 x i1>)

declare <8 x i1> @match_v8i8_v8i8(<8 x i8>, <8 x i8>, <8 x i1>)

define <vscale x 8 x i1> @match_nxv8i16_v8i16(<vscale x 8 x i16> %op1, <8 x i16> %op2, <vscale x 8 x i1> %mask) {
  %B = sub <8 x i16> %op2, %op2
  %r = tail call <vscale x 8 x i1> @llvm.experimental.vector.match.nxv8i16.v8i16(<vscale x 8 x i16> %op1, <8 x i16> %B, <vscale x 8 x i1> %mask)
  ret <vscale x 8 x i1> %r
}

declare <8 x i1> @match_v8i16(<8 x i16>, <8 x i16>, <8 x i1>)

define <8 x i1> @match_v8i8_v16i8(<8 x i8> %op1, <16 x i8> %op2, <8 x i1> %mask) {
  %C = icmp sle i16 0, 32767
  %r = tail call <8 x i1> @llvm.experimental.vector.match.v8i8.v16i8(<8 x i8> %op1, <16 x i8> %op2, <8 x i1> %mask)
  store i1 %C, ptr poison, align 1
  ret <8 x i1> %r
}

declare <vscale x 16 x i1> @match_nxv16i8_v32i8(<vscale x 16 x i8>, <32 x i8>, <vscale x 16 x i1>)

declare <16 x i1> @match_v16i8_v32i8(<16 x i8>, <32 x i8>, <16 x i1>)

declare <vscale x 4 x i1> @match_nxv4xi32_v4i32(<vscale x 4 x i32>, <4 x i32>, <vscale x 4 x i1>)

declare <vscale x 2 x i1> @match_nxv2xi64_v2i64(<vscale x 2 x i64>, <2 x i64>, <vscale x 2 x i1>)

declare <4 x i1> @match_v4xi32_v4i32(<4 x i32>, <4 x i32>, <4 x i1>)

define <2 x i1> @match_v2xi64_v2i64(<2 x i64> %op1, <2 x i64> %op2, <2 x i1> %mask) {
  %LGV1 = load i32, ptr @G.2, align 4
  %B = xor i32 0, %LGV1
  %r = tail call <2 x i1> @llvm.experimental.vector.match.v2i64.v2i64(<2 x i64> %op1, <2 x i64> %op2, <2 x i1> %mask)
  store i32 %B, ptr @G.3, align 4
  ret <2 x i1> %r
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i1> @llvm.experimental.vector.match.v2i64.v2i64(<2 x i64>, <2 x i64>, <2 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i1> @llvm.experimental.vector.match.v4i32.v4i32(<4 x i32>, <4 x i32>, <4 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i1> @llvm.experimental.vector.match.nxv2i64.v2i64(<vscale x 2 x i64>, <2 x i64>, <vscale x 2 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i1> @llvm.experimental.vector.match.nxv4i32.v4i32(<vscale x 4 x i32>, <4 x i32>, <vscale x 4 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i1> @llvm.experimental.vector.match.v16i8.v32i8(<16 x i8>, <32 x i8>, <16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i1> @llvm.experimental.vector.match.nxv16i8.v32i8(<vscale x 16 x i8>, <32 x i8>, <vscale x 16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i1> @llvm.experimental.vector.match.v8i8.v16i8(<8 x i8>, <16 x i8>, <8 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i1> @llvm.experimental.vector.match.v8i16.v8i16(<8 x i16>, <8 x i16>, <8 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i1> @llvm.experimental.vector.match.nxv8i16.v8i16(<vscale x 8 x i16>, <8 x i16>, <vscale x 8 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i1> @llvm.experimental.vector.match.v8i8.v8i8(<8 x i8>, <8 x i8>, <8 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i1> @llvm.experimental.vector.match.v16i8.v16i8(<16 x i8>, <16 x i8>, <16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i1> @llvm.experimental.vector.match.v16i8.v8i8(<16 x i8>, <8 x i8>, <16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i1> @llvm.experimental.vector.match.v16i8.v4i8(<16 x i8>, <4 x i8>, <16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i1> @llvm.experimental.vector.match.v16i8.v2i8(<16 x i8>, <2 x i8>, <16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i1> @llvm.experimental.vector.match.v16i8.v1i8(<16 x i8>, <1 x i8>, <16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i1> @llvm.experimental.vector.match.nxv16i8.v16i8(<vscale x 16 x i8>, <16 x i8>, <vscale x 16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i1> @llvm.experimental.vector.match.nxv16i8.v8i8(<vscale x 16 x i8>, <8 x i8>, <vscale x 16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i1> @llvm.experimental.vector.match.nxv16i8.v4i8(<vscale x 16 x i8>, <4 x i8>, <vscale x 16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i1> @llvm.experimental.vector.match.nxv16i8.v2i8(<vscale x 16 x i8>, <2 x i8>, <vscale x 16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i1> @llvm.experimental.vector.match.nxv16i8.v1i8(<vscale x 16 x i8>, <1 x i8>, <vscale x 16 x i1>) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

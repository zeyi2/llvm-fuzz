; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zfinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <16 x i8> splat (i8 1)
@G.1 = global <4 x float> splat (float +qnan)
@G.2 = global <4 x i32> splat (i32 1)
@G.3 = global <2 x i64> splat (i64 9223372036854775807)
@G.4 = global <16 x i8> zeroinitializer
@G.5 = global <8 x i16> splat (i16 1)
@G.6 = global i8 42
@G.7 = global <8 x i8> splat (i8 16)

; Function Attrs: nounwind
define <2 x i64> @vec_v2i64(<2 x i64> %x, <2 x i64> %y) #0 {
  %tmp = call <2 x i64> @llvm.sshl.sat.v2i64(<2 x i64> %x, <2 x i64> %y)
  %B = and <2 x i64> %x, zeroinitializer
  %LGV = load <2 x i64>, ptr @G.3, align 16
  %A1 = alloca <2 x i1>, align 1
  %C = icmp slt <2 x i64> %tmp, %LGV
  %A = alloca <2 x i64>, align 16
  store <2 x i1> %C, ptr %A1, align 1
  store <2 x i64> %B, ptr %A, align 16
  store <2 x i1> poison, ptr %A1, align 1
  store <2 x i64> poison, ptr %A, align 16
  ret <2 x i64> %tmp
}

; Function Attrs: nounwind
define <4 x i32> @vec_v4i32(<4 x i32> %x, <4 x i32> %y) #0 {
  %LGV4 = load <8 x i8>, ptr @G.7, align 8
  %B5 = sub <8 x i8> splat (i8 16), %LGV4
  %A = alloca i1, align 1
  %L = load <4 x i32>, ptr %A, align 16
  store i1 poison, ptr %A, align 1
  %LGV = load <4 x float>, ptr @G.1, align 16
  %B = fdiv <4 x float> splat (float 1.401300e-45), %LGV
  %tmp = call <4 x i32> @llvm.sshl.sat.v4i32(<4 x i32> %x, <4 x i32> %y)
  %B3 = ashr <4 x i32> %L, zeroinitializer
  %C = icmp sgt i16 32767, 42
  store <4 x float> %B, ptr poison, align 16
  store <4 x i32> %B3, ptr @G.2, align 16
  store i1 %C, ptr %A, align 1
  store <8 x i8> %B5, ptr %A, align 8
  ret <4 x i32> %tmp
}

; Function Attrs: nounwind
define <8 x i16> @vec_v8i16(<8 x i16> %x, <8 x i16> %y) #0 {
  %tmp = call <8 x i16> @llvm.sshl.sat.v8i16(<8 x i16> %x, <8 x i16> %y)
  %B1 = shl <8 x i16> %x, %x
  %B = xor <8 x i16> %y, splat (i16 -1)
  store <8 x i16> %B, ptr poison, align 16
  store <8 x i16> %B1, ptr @G.5, align 16
  ret <8 x i16> %tmp
}

; Function Attrs: nounwind
define <16 x i8> @vec_v16i8(<16 x i8> %x, <16 x i8> %y) #0 {
  %A = alloca <16 x i8>, align 16
  store <16 x i8> poison, ptr %A, align 16
  %LGV1 = load <16 x i8>, ptr @G.4, align 16
  %LGV = load <16 x i8>, ptr @G, align 16
  %E = extractelement <16 x i8> %x, i32 -1
  %B = xor <16 x i8> %y, %LGV
  %tmp = call <16 x i8> @llvm.sshl.sat.v16i8(<16 x i8> %B, <16 x i8> %y)
  %B3 = add <16 x i8> %y, %LGV
  %C = icmp eq <16 x i8> %y, %LGV1
  store <16 x i1> %C, ptr poison, align 2
  store i8 %E, ptr @G.6, align 1
  store <16 x i8> %B3, ptr %A, align 16
  ret <16 x i8> %tmp
}

; Function Attrs: nounwind
declare <vscale x 2 x i64> @vec_nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>) #0

; Function Attrs: nounwind
declare <vscale x 4 x i32> @vec_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>) #0

; Function Attrs: nounwind
declare <vscale x 8 x i16> @vec_nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>) #0

; Function Attrs: nounwind
declare <vscale x 16 x i8> @vec_nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i8> @llvm.sshl.sat.nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i64> @llvm.sshl.sat.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i32> @llvm.sshl.sat.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i16> @llvm.sshl.sat.nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.sshl.sat.v16i8(<16 x i8>, <16 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.sshl.sat.v2i64(<2 x i64>, <2 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.sshl.sat.v4i32(<4 x i32>, <4 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.sshl.sat.v8i16(<8 x i16>, <8 x i16>) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

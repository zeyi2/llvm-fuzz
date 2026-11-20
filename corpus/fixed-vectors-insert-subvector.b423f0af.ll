; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zvfhmin,+zvfbfmin -O1 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 2147483647
@G.1 = global i32 0
@G.2 = global <2 x bfloat> splat (bfloat 9.183550e-41)

declare <vscale x 8 x i32> @insert_nxv8i32_v2i32_0(<vscale x 8 x i32>, ptr)

declare <vscale x 8 x i32> @insert_nxv8i32_v2i32_2(<vscale x 8 x i32>, ptr)

declare <vscale x 8 x i32> @insert_nxv8i32_v2i32_6(<vscale x 8 x i32>, ptr)

declare <vscale x 8 x i32> @insert_nxv8i32_v8i32_0(<vscale x 8 x i32>, ptr)

declare <vscale x 8 x i32> @insert_nxv8i32_v8i32_8(<vscale x 8 x i32>, ptr)

declare <vscale x 8 x i32> @insert_nxv8i32_undef_v2i32_0(ptr)

declare <vscale x 2 x i32> @insert_nxv8i32_v4i32_0(<vscale x 2 x i32>, <4 x i32>)

define <4 x i32> @insert_v4i32_v4i32_0(<4 x i32> %vec, <4 x i32> %subvec) {
  %LGV = load i32, ptr @G, align 4
  %v = call <4 x i32> @llvm.vector.insert.v4i32.v4i32(<4 x i32> %vec, <4 x i32> %subvec, i64 0)
  %B = sub i32 %LGV, 0
  store i32 %B, ptr @G.1, align 4
  ret <4 x i32> %v
}

declare void @insert_v4i32_v2i32_0(ptr, ptr)

declare void @insert_v4i32_v2i32_2(ptr, ptr)

declare void @insert_v4i32_undef_v2i32_0(ptr, ptr)

declare <4 x i32> @insert_v4i32_undef_v2i32_0_phi(<2 x i32>, i1)

declare void @insert_v8i32_v2i32_0(ptr, ptr)

declare void @insert_v8i32_v2i32_2(ptr, ptr)

declare void @insert_v8i32_v2i32_6(ptr, ptr)

declare void @insert_v8i32_undef_v2i32_6(ptr, ptr)

declare void @insert_v4i16_v2i16_0(ptr, ptr)

declare void @insert_v4i16_v2i16_2(ptr, ptr)

declare void @insert_v32i1_v8i1_0(ptr, ptr)

declare void @insert_v32i1_v8i1_16(ptr, ptr)

declare void @insert_v8i1_v4i1_0(ptr, ptr)

declare void @insert_v8i1_v4i1_4(ptr, ptr)

declare <vscale x 2 x i16> @insert_nxv2i16_v2i16_0(<vscale x 2 x i16>, ptr)

declare <vscale x 2 x i16> @insert_nxv2i16_v2i16_2(<vscale x 2 x i16>, ptr)

declare <vscale x 2 x i1> @insert_nxv2i1_v4i1_0(<vscale x 2 x i1>, ptr)

declare <vscale x 8 x i1> @insert_nxv8i1_v4i1_0(<vscale x 8 x i1>, ptr)

declare <vscale x 8 x i1> @insert_nxv8i1_v8i1_16(<vscale x 8 x i1>, ptr)

declare void @insert_v2i64_nxv16i64(ptr, ptr, ptr)

declare void @insert_v2i64_nxv16i64_lo0(ptr, ptr)

declare void @insert_v2i64_nxv16i64_lo2(ptr, ptr)

declare void @insert_v2i64_nxv16i64_hi(ptr, ptr)

define <vscale x 8 x bfloat> @insert_nxv8bf16_v2bf16_0(<vscale x 8 x bfloat> %vec, ptr %svp) {
  %sv = load <2 x bfloat>, ptr %svp, align 4
  %v = call <vscale x 8 x bfloat> @llvm.vector.insert.nxv8bf16.v2bf16(<vscale x 8 x bfloat> %vec, <2 x bfloat> %sv, i64 0)
  %I = insertelement <2 x bfloat> %sv, bfloat +qnan, i1 true
  store <2 x bfloat> %I, ptr @G.2, align 4
  ret <vscale x 8 x bfloat> %v
}

declare <vscale x 8 x bfloat> @insert_nxv8bf16_v2bf16_2(<vscale x 8 x bfloat>, ptr)

declare <vscale x 8 x half> @insert_nxv8f16_v2f16_0(<vscale x 8 x half>, ptr)

declare <vscale x 8 x half> @insert_nxv8f16_v2f16_2(<vscale x 8 x half>, ptr)

declare <4 x i32> @insert_extract_v8i32_v2i32_0(<2 x i32>)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.vector.extract.v4i32.v8i32(<8 x i32>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i32> @llvm.vector.insert.nxv2i32.v4i32(<vscale x 2 x i32>, <4 x i32>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x bfloat> @llvm.vector.insert.nxv8bf16.v2bf16(<vscale x 8 x bfloat>, <2 x bfloat>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x half> @llvm.vector.insert.nxv8f16.v2f16(<vscale x 8 x half>, <2 x half>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i16> @llvm.vector.insert.nxv2i16.v2i16(<vscale x 2 x i16>, <2 x i16>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.vector.insert.v4i16.v2i16(<4 x i16>, <2 x i16>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i32> @llvm.vector.insert.nxv8i32.v2i32(<vscale x 8 x i32>, <2 x i32>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.vector.insert.v4i32.v2i32(<4 x i32>, <2 x i32>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.vector.insert.v8i32.v2i32(<8 x i32>, <2 x i32>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i64> @llvm.vector.insert.nxv16i64.v2i64(<vscale x 16 x i64>, <2 x i64>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i1> @llvm.vector.insert.nxv2i1.v4i1(<vscale x 2 x i1>, <4 x i1>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i1> @llvm.vector.insert.v8i1.v4i1(<8 x i1>, <4 x i1>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.vector.insert.v4i32.v4i32(<4 x i32>, <4 x i32>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i1> @llvm.vector.insert.nxv8i1.v8i1(<vscale x 8 x i1>, <8 x i1>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i1> @llvm.vector.insert.v32i1.v8i1(<32 x i1>, <8 x i1>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i32> @llvm.vector.insert.nxv8i32.v8i32(<vscale x 8 x i32>, <8 x i32>, i64 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

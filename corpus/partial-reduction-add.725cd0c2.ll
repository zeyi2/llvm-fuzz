; isel-diff-config: -mtriple=riscv32 -mattr=+zhinx -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 256
@G.1 = global i1 false

declare <4 x i32> @partial_reduce_add_v4i32_v4i32(<4 x i32>, <4 x i32>)

declare <4 x i32> @partial_reduce_add_v4i32_v8i32(<4 x i32>, <8 x i32>)

declare <vscale x 4 x i32> @partial_reduce_add_nvx4i32_nvx4i32(<vscale x 4 x i32>, <vscale x 4 x i32>)

declare <vscale x 4 x i32> @partial_reduce_add_nvx4i32_nvx8i32(<vscale x 4 x i32>, <vscale x 8 x i32>)

declare <vscale x 4 x i32> @partial_reduce_add_nvx4i32_nvx16i32(<vscale x 4 x i32>, <vscale x 16 x i32>)

declare <vscale x 8 x i32> @partial_reduce_add_nvx8i32_nvx16i32(<vscale x 8 x i32>, <vscale x 16 x i32>)

define <4 x i32> @partial_reduce_add_constants() {
  %A = alloca i16, align 2
  store i16 poison, ptr %A, align 2
  %LGV = load i16, ptr @G, align 2
  %B = srem i16 %LGV, -1
  %partial.reduce = call <4 x i32> @llvm.vector.partial.reduce.add.v4i32.v16i32(<4 x i32> <i32 100, i32 200, i32 300, i32 400>, <16 x i32> <i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16>)
  store i16 %B, ptr %A, align 2
  ret <4 x i32> %partial.reduce
}

define <2 x i32> @partial_reduce_add_constants_wraparound() {
  %partial.reduce = call <2 x i32> @llvm.vector.partial.reduce.add.v2i32.v4i32(<2 x i32> <i32 2147483647, i32 -2147483648>, <4 x i32> splat (i32 1))
  %C = icmp sgt i32 0, 1
  store i1 %C, ptr @G.1, align 1
  ret <2 x i32> %partial.reduce
}

declare i32 @partial_reduce_add_constants_input_poison()

declare i32 @partial_reduce_add_constants_accumulator_poison()

declare <vscale x 4 x i32> @partial_reduce_add_nxv4i32_splat_constants()

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i32> @llvm.vector.partial.reduce.add.nxv4i32.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.vector.partial.reduce.add.v2i32.v4i32(<2 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.vector.partial.reduce.add.v4i32.v16i32(<4 x i32>, <16 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i32> @llvm.vector.partial.reduce.add.nxv8i32.nxv16i32(<vscale x 8 x i32>, <vscale x 16 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i32> @llvm.vector.partial.reduce.add.nxv4i32.nxv16i32(<vscale x 4 x i32>, <vscale x 16 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i32> @llvm.vector.partial.reduce.add.nxv4i32.nxv8i32(<vscale x 4 x i32>, <vscale x 8 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.vector.partial.reduce.add.v4i32.v8i32(<4 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.vector.partial.reduce.add.v4i32.v4i32(<4 x i32>, <4 x i32>) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+zvfh,+experimental-zvfbfa,+f,+d,+zbkb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 42)
@G.1 = global <2 x float> splat (float 1.000000e+00)
@G.2 = global ptr poison

declare void @fp2si_v2f32_v2i32(ptr, ptr)

declare void @fp2ui_v2f32_v2i32(ptr, ptr)

declare <2 x i1> @fp2si_v2f32_v2i1(<2 x float>)

declare <2 x i15> @fp2si_v2f32_v2i15(<2 x float>)

declare <2 x i15> @fp2ui_v2f32_v2i15(<2 x float>)

define <2 x i1> @fp2ui_v2f32_v2i1(<2 x float> %x) {
  %LGV = load <2 x float>, ptr @G.1, align 8
  %C = fcmp ugt <2 x float> %x, %LGV
  ret <2 x i1> %C
}

declare void @fp2si_v3f32_v3i32(ptr, ptr)

declare void @fp2ui_v3f32_v3i32(ptr, ptr)

declare <3 x i1> @fp2si_v3f32_v3i1(<3 x float>)

declare <3 x i15> @fp2si_v3f32_v3i15(<3 x float>)

declare <3 x i15> @fp2ui_v3f32_v3i15(<3 x float>)

declare <3 x i1> @fp2ui_v3f32_v3i1(<3 x float>)

declare void @fp2si_v8f32_v8i32(ptr, ptr)

declare void @fp2ui_v8f32_v8i32(ptr, ptr)

declare <8 x i1> @fp2si_v8f32_v8i1(<8 x float>)

define <8 x i1> @fp2ui_v8f32_v8i1(<8 x float> %x) {
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %LGV = load <4 x i32>, ptr @G, align 16
  %B = xor <4 x i32> %LGV, splat (i32 1)
  %z = fptoui <8 x float> %x to <8 x i1>
  store <4 x i32> %B, ptr %A, align 16
  ret <8 x i1> %z
}

declare void @fp2si_v2f32_v2i64(ptr, ptr)

declare void @fp2ui_v2f32_v2i64(ptr, ptr)

declare void @fp2si_v8f32_v8i64(ptr, ptr)

declare void @fp2ui_v8f32_v8i64(ptr, ptr)

declare void @fp2si_v2bf16_v2i64(ptr, ptr)

declare void @fp2ui_v2bf16_v2i64(ptr, ptr)

declare <2 x i1> @fp2si_v2bf16_v2i1(<2 x bfloat>)

define <2 x i1> @fp2ui_v2bf16_v2i1(<2 x bfloat> %x) {
  %z = fptoui <2 x bfloat> %x to <2 x i1>
  %B = shl <2 x i1> %z, splat (i1 true)
  ret <2 x i1> %B
}

declare void @fp2si_v64bf16_v64i16(ptr, ptr)

declare void @fp2ui_v64bf16_v64i16(ptr, ptr)

declare void @fp2si_v2bf16_v2i8(ptr, ptr)

declare void @fp2ui_v2bf16_v2i8(ptr, ptr)

declare void @fp2si_v2f16_v2i64(ptr, ptr)

declare void @fp2ui_v2f16_v2i64(ptr, ptr)

declare <2 x i1> @fp2si_v2f16_v2i1(<2 x half>)

declare <2 x i1> @fp2ui_v2f16_v2i1(<2 x half>)

declare void @fp2si_v64f16_v64i16(ptr, ptr)

define void @fp2ui_v64f16_v64i16(ptr %x, ptr %y) {
  %a = load <64 x half>, ptr %x, align 128
  %G = getelementptr i8, ptr %x, i16 0
  %d = fptoui <64 x half> %a to <64 x i16>
  store <64 x i16> %d, ptr %y, align 128
  store ptr %G, ptr @G.2, align 8
  ret void
}

declare void @fp2si_v2f64_v2i8(ptr, ptr)

declare void @fp2ui_v2f64_v2i8(ptr, ptr)

declare <2 x i1> @fp2si_v2f64_v2i1(<2 x double>)

declare <2 x i1> @fp2ui_v2f64_v2i1(<2 x double>)

declare void @fp2si_v8f64_v8i8(ptr, ptr)

declare void @fp2ui_v8f64_v8i8(ptr, ptr)

declare <8 x i1> @fp2si_v8f64_v8i1(<8 x double>)

declare <8 x i1> @fp2ui_v8f64_v8i1(<8 x double>)

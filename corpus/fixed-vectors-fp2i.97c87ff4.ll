; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+zvfh,+zvfbfmin,+f,+d -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 4294967296)
@G.1 = global <3 x float> splat (float +qnan)
@G.2 = global <3 x i1> splat (i1 true)
@G.3 = global <2 x i1> splat (i1 true)

declare void @fp2si_v2f32_v2i32(ptr, ptr)

declare void @fp2ui_v2f32_v2i32(ptr, ptr)

declare <2 x i1> @fp2si_v2f32_v2i1(<2 x float>)

define <2 x i15> @fp2si_v2f32_v2i15(<2 x float> %x) {
  %A = alloca <2 x i64>, align 16
  store <2 x i64> poison, ptr %A, align 16
  %LGV = load <2 x i64>, ptr @G, align 16
  %z = fptosi <2 x float> %x to <2 x i15>
  %B = srem <2 x i64> %LGV, splat (i64 4294967296)
  store <2 x i64> %B, ptr %A, align 16
  ret <2 x i15> %z
}

declare <2 x i15> @fp2ui_v2f32_v2i15(<2 x float>)

declare <2 x i1> @fp2ui_v2f32_v2i1(<2 x float>)

declare void @fp2si_v3f32_v3i32(ptr, ptr)

declare void @fp2ui_v3f32_v3i32(ptr, ptr)

declare <3 x i1> @fp2si_v3f32_v3i1(<3 x float>)

define <3 x i15> @fp2si_v3f32_v3i15(<3 x float> %x) {
  %LGV = load <3 x float>, ptr @G.1, align 16
  %C = fcmp uge <3 x float> %x, %LGV
  %z = fptosi <3 x float> %x to <3 x i15>
  store <3 x i1> %C, ptr @G.2, align 1
  ret <3 x i15> %z
}

declare <3 x i15> @fp2ui_v3f32_v3i15(<3 x float>)

declare <3 x i1> @fp2ui_v3f32_v3i1(<3 x float>)

declare void @fp2si_v8f32_v8i32(ptr, ptr)

declare void @fp2ui_v8f32_v8i32(ptr, ptr)

declare <8 x i1> @fp2si_v8f32_v8i1(<8 x float>)

declare <8 x i1> @fp2ui_v8f32_v8i1(<8 x float>)

declare void @fp2si_v2f32_v2i64(ptr, ptr)

declare void @fp2ui_v2f32_v2i64(ptr, ptr)

declare void @fp2si_v8f32_v8i64(ptr, ptr)

declare void @fp2ui_v8f32_v8i64(ptr, ptr)

declare void @fp2si_v2bf16_v2i64(ptr, ptr)

declare void @fp2ui_v2bf16_v2i64(ptr, ptr)

declare <2 x i1> @fp2si_v2bf16_v2i1(<2 x bfloat>)

declare <2 x i1> @fp2ui_v2bf16_v2i1(<2 x bfloat>)

declare void @fp2si_v64bf16_v64i16(ptr, ptr)

define void @fp2ui_v64bf16_v64i16(ptr %x, ptr %y) {
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %S = shufflevector <4 x i32> zeroinitializer, <4 x i32> splat (i32 1), <4 x i32> poison
  %a = load <64 x bfloat>, ptr %x, align 128
  %d = fptoui <64 x bfloat> %a to <64 x i16>
  store <64 x i16> %d, ptr %y, align 128
  store <4 x i32> %S, ptr %A, align 16
  ret void
}

declare void @fp2si_v2bf16_v2i8(ptr, ptr)

declare void @fp2ui_v2bf16_v2i8(ptr, ptr)

declare void @fp2si_v2f16_v2i64(ptr, ptr)

declare void @fp2ui_v2f16_v2i64(ptr, ptr)

declare <2 x i1> @fp2si_v2f16_v2i1(<2 x half>)

declare <2 x i1> @fp2ui_v2f16_v2i1(<2 x half>)

declare void @fp2si_v64f16_v64i16(ptr, ptr)

define void @fp2ui_v64f16_v64i16(ptr %x, ptr %y) {
  %C = icmp ugt <2 x i64> splat (i64 4294967296), zeroinitializer
  %a = load <64 x half>, ptr %x, align 128
  %d = fptoui <64 x half> %a to <64 x i16>
  store <64 x i16> %d, ptr %y, align 128
  store <2 x i1> %C, ptr @G.3, align 1
  ret void
}

declare void @fp2si_v2f64_v2i8(ptr, ptr)

declare void @fp2ui_v2f64_v2i8(ptr, ptr)

declare <2 x i1> @fp2si_v2f64_v2i1(<2 x double>)

define <2 x i1> @fp2ui_v2f64_v2i1(<2 x double> %x) {
  %C = fcmp uno <2 x double> %x, splat (double +inf)
  %z = fptoui <2 x double> %x to <2 x i1>
  store <2 x i1> %C, ptr @G.3, align 1
  ret <2 x i1> %z
}

declare void @fp2si_v8f64_v8i8(ptr, ptr)

declare void @fp2ui_v8f64_v8i8(ptr, ptr)

declare <8 x i1> @fp2si_v8f64_v8i1(<8 x double>)

declare <8 x i1> @fp2ui_v8f64_v8i1(<8 x double>)

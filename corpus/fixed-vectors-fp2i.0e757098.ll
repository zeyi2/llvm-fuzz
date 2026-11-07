; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+zvfhmin,+zvfbfmin,+f,+d,+zfhmin -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float +inf
@G.1 = global i1 true
@G.2 = global i8 16
@G.3 = global <4 x float> splat (float 1.000000e+00)
@G.4 = global <4 x i1> zeroinitializer

declare void @fp2si_v2f32_v2i32(ptr, ptr)

declare void @fp2ui_v2f32_v2i32(ptr, ptr)

declare <2 x i1> @fp2si_v2f32_v2i1(<2 x float>)

define <2 x i15> @fp2si_v2f32_v2i15(<2 x float> %x) {
  %z = fptosi <2 x float> %x to <2 x i15>
  %B = lshr <2 x i15> %z, %z
  ret <2 x i15> %B
}

define <2 x i15> @fp2ui_v2f32_v2i15(<2 x float> %x) {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV = load i8, ptr @G.2, align 1
  %z = fptoui <2 x float> %x to <2 x i15>
  %B = and i8 127, %LGV
  store i8 %B, ptr @G.2, align 1
  %C = fcmp ult <4 x float> splat (float +qnan), splat (float +qnan)
  store <4 x i1> %C, ptr %A, align 1
  ret <2 x i15> %z
}

declare <2 x i1> @fp2ui_v2f32_v2i1(<2 x float>)

declare void @fp2si_v3f32_v3i32(ptr, ptr)

declare void @fp2ui_v3f32_v3i32(ptr, ptr)

declare <3 x i1> @fp2si_v3f32_v3i1(<3 x float>)

define <3 x i15> @fp2si_v3f32_v3i15(<3 x float> %x) {
  %LGV = load <4 x float>, ptr @G.3, align 16
  %z = fptosi <3 x float> %x to <3 x i15>
  %C = fcmp one <4 x float> %LGV, splat (float +inf)
  store <4 x i1> %C, ptr @G.4, align 1
  ret <3 x i15> %z
}

declare <3 x i15> @fp2ui_v3f32_v3i15(<3 x float>)

define <3 x i1> @fp2ui_v3f32_v3i1(<3 x float> %x) {
  %A = alloca <3 x i1>, align 1
  store <3 x i1> poison, ptr %A, align 1
  %C = fcmp ogt <3 x float> %x, splat (float 4.200000e+01)
  %z = fptoui <3 x float> %x to <3 x i1>
  store <3 x i1> %C, ptr %A, align 1
  ret <3 x i1> %z
}

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

declare void @fp2ui_v64bf16_v64i16(ptr, ptr)

define void @fp2si_v2bf16_v2i8(ptr %x, ptr %y) {
  %LGV = load float, ptr @G, align 4
  %a = load <2 x bfloat>, ptr %x, align 4
  %d = fptosi <2 x bfloat> %a to <2 x i8>
  %C = fcmp false float 1.000000e+00, %LGV
  store <2 x i8> %d, ptr %y, align 2
  store i1 %C, ptr @G.1, align 1
  ret void
}

declare void @fp2ui_v2bf16_v2i8(ptr, ptr)

declare void @fp2si_v2f16_v2i64(ptr, ptr)

declare void @fp2ui_v2f16_v2i64(ptr, ptr)

declare <2 x i1> @fp2si_v2f16_v2i1(<2 x half>)

declare <2 x i1> @fp2ui_v2f16_v2i1(<2 x half>)

declare void @fp2si_v64f16_v64i16(ptr, ptr)

declare void @fp2ui_v64f16_v64i16(ptr, ptr)

declare void @fp2si_v2f64_v2i8(ptr, ptr)

declare void @fp2ui_v2f64_v2i8(ptr, ptr)

declare <2 x i1> @fp2si_v2f64_v2i1(<2 x double>)

declare <2 x i1> @fp2ui_v2f64_v2i1(<2 x double>)

declare void @fp2si_v8f64_v8i8(ptr, ptr)

declare void @fp2ui_v8f64_v8i8(ptr, ptr)

declare <8 x i1> @fp2si_v8f64_v8i1(<8 x double>)

declare <8 x i1> @fp2ui_v8f64_v8i1(<8 x double>)

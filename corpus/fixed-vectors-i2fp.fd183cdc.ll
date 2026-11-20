; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+zvfh,+zvfbfmin,+f,+d,+zicond -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 4294967296)
@G.1 = global <2 x i64> splat (i64 42)
@G.2 = global <8 x i8> splat (i8 1)
@G.3 = global <2 x i1> zeroinitializer
@G.4 = global <2 x float> splat (float +qnan)
@G.5 = global <8 x i1> zeroinitializer
@G.6 = global <3 x i1> splat (i1 true)
@G.7 = global <3 x i1> zeroinitializer

declare void @si2fp_v2i32_v2f32(ptr, ptr)

declare void @ui2fp_v2i32_v2f32(ptr, ptr)

declare <2 x float> @si2fp_v2i1_v2f32(<2 x i1>)

define <2 x float> @si2fp_v2i7_v2f32(<2 x i7> %x) {
  %LGV = load <2 x float>, ptr @G.4, align 8
  %z = sitofp <2 x i7> %x to <2 x float>
  %C = fcmp ord <2 x float> %z, %LGV
  store <2 x i1> %C, ptr poison, align 1
  ret <2 x float> %z
}

declare <2 x float> @ui2fp_v2i7_v2f32(<2 x i7>)

declare <2 x float> @ui2fp_v2i1_v2f32(<2 x i1>)

declare void @si2fp_v3i32_v3f32(ptr, ptr)

declare void @ui2fp_v3i32_v3f32(ptr, ptr)

declare <3 x float> @si2fp_v3i1_v3f32(<3 x i1>)

declare <3 x float> @si2fp_v3i7_v3f32(<3 x i7>)

declare <3 x float> @ui2fp_v3i7_v3f32(<3 x i7>)

define <3 x float> @ui2fp_v3i1_v3f32(<3 x i1> %x) {
  %LGV = load <3 x i1>, ptr @G.6, align 1
  %C = icmp ne <3 x i1> %x, %LGV
  %z = uitofp <3 x i1> %x to <3 x float>
  store <3 x i1> %C, ptr @G.7, align 1
  ret <3 x float> %z
}

declare void @si2fp_v8i32_v8f32(ptr, ptr)

declare void @ui2fp_v8i32_v8f32(ptr, ptr)

define <8 x float> @si2fp_v8i1_v8f32(<8 x i1> %x) {
  %z = sitofp <8 x i1> %x to <8 x float>
  %B = or <8 x i8> zeroinitializer, splat (i8 1)
  store <8 x i8> %B, ptr @G.2, align 8
  ret <8 x float> %z
}

define <8 x float> @ui2fp_v8i1_v8f32(<8 x i1> %x) {
  %LGV = load <2 x i64>, ptr @G, align 16
  %B = xor <2 x i64> %LGV, zeroinitializer
  %z = uitofp <8 x i1> %x to <8 x float>
  store <2 x i64> %B, ptr @G.1, align 16
  ret <8 x float> %z
}

declare void @si2fp_v2i16_v2f64(ptr, ptr)

declare void @ui2fp_v2i16_v2f64(ptr, ptr)

declare void @si2fp_v8i16_v8f64(ptr, ptr)

declare void @ui2fp_v8i16_v8f64(ptr, ptr)

declare <8 x double> @si2fp_v8i1_v8f64(<8 x i1>)

declare <8 x double> @ui2fp_v8i1_v8f64(<8 x i1>)

declare void @si2fp_v2i64_v2bf16(ptr, ptr)

declare void @ui2fp_v2i64_v2bf16(ptr, ptr)

declare <2 x bfloat> @si2fp_v2i1_v2bf16(<2 x i1>)

declare <2 x bfloat> @ui2fp_v2i1_v2bf16(<2 x i1>)

declare void @si2fp_v8i64_v8bf16(ptr, ptr)

declare void @ui2fp_v8i64_v8bf16(ptr, ptr)

declare <8 x bfloat> @si2fp_v8i1_v8bf16(<8 x i1>)

declare <8 x bfloat> @ui2fp_v8i1_v8bf16(<8 x i1>)

declare void @si2fp_v64i16_v64bf16(ptr, ptr)

declare void @ui2fp_v64i16_v64bf16(ptr, ptr)

declare void @si2fp_v2i8_v2bf16(ptr, ptr)

define void @ui2fp_v2i8_v2bf16(ptr %x, ptr %y) {
  %a = load <2 x i8>, ptr %x, align 2
  %C = icmp sge <2 x i8> %a, %a
  %d = uitofp <2 x i8> %a to <2 x bfloat>
  store <2 x bfloat> %d, ptr %y, align 4
  store <2 x i1> %C, ptr @G.3, align 1
  ret void
}

declare void @si2fp_v4i8_v4bf16(ptr, ptr)

declare void @ui2fp_v4i8_v4bf16(ptr, ptr)

declare void @si2fp_v8i8_v8bf16(ptr, ptr)

declare void @ui2fp_v8i8_v8bf16(ptr, ptr)

declare void @si2fp_v2i64_v2f16(ptr, ptr)

declare void @ui2fp_v2i64_v2f16(ptr, ptr)

declare <2 x half> @si2fp_v2i1_v2f16(<2 x i1>)

declare <2 x half> @ui2fp_v2i1_v2f16(<2 x i1>)

declare void @si2fp_v8i64_v8f16(ptr, ptr)

declare void @ui2fp_v8i64_v8f16(ptr, ptr)

declare <8 x half> @si2fp_v8i1_v8f16(<8 x i1>)

define <8 x half> @ui2fp_v8i1_v8f16(<8 x i1> %x) {
  %A = alloca <8 x i1>, align 1
  store <8 x i1> poison, ptr %A, align 1
  %LGV = load <8 x i1>, ptr @G.5, align 1
  %B = and <8 x i1> %x, %LGV
  %z = uitofp <8 x i1> %x to <8 x half>
  store <8 x i1> %B, ptr %A, align 1
  ret <8 x half> %z
}

declare void @si2fp_v64i16_v64f16(ptr, ptr)

declare void @ui2fp_v64i16_v64f16(ptr, ptr)

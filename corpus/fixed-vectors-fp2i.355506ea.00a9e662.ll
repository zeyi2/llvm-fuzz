; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+zvfh,+experimental-zvfbfa,+f,+d,+zbkb -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 42)
@G.1 = global <2 x float> splat (float 1.000000e+00)
@G.2 = global ptr poison
@G.3 = global <8 x float> splat (float +qnan)
@G.4 = global <8 x float> splat (float 1.401300e-45)

declare void @fp2si_v2f32_v2i32(ptr, ptr)

declare void @fp2ui_v2f32_v2i32(ptr, ptr)

declare <2 x i1> @fp2si_v2f32_v2i1(<2 x float>)

declare <2 x i15> @fp2si_v2f32_v2i15(<2 x float>)

declare <2 x i15> @fp2ui_v2f32_v2i15(<2 x float>)

define <2 x i1> @fp2ui_v2f32_v2i1(<2 x float> %x) {
  %C2 = fcmp ugt <2 x float> %x, splat (float +inf)
  %LGV = load <2 x float>, ptr @G.1, align 8
  %C = fcmp ugt <2 x float> %x, %LGV
  store <2 x i1> %C2, ptr poison, align 1
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
  %LGV5 = load <8 x float>, ptr @G.4, align 32
  %A3 = alloca <8 x i1>, align 1
  store <8 x i1> poison, ptr %A3, align 1
  %LGV1 = load <8 x float>, ptr @G.3, align 32
  %B6 = fmul <8 x float> %x, %LGV5
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %LGV = load <4 x i32>, ptr @G, align 16
  %B = xor <4 x i32> %LGV, splat (i32 1)
  %z = fptoui <8 x float> %x to <8 x i1>
  %C = icmp uge <4 x i32> splat (i32 42), %LGV
  store <4 x i32> %B, ptr %A, align 16
  store <4 x i1> %C, ptr poison, align 1
  %C2 = fcmp uno <8 x float> %x, %LGV1
  store <8 x i1> %C2, ptr %A3, align 1
  store <8 x float> %B6, ptr %A, align 32
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
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %z = fptoui <2 x bfloat> %x to <2 x i1>
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %T
  %B = shl <2 x i1> %z, splat (i1 true)
  ret <2 x i1> %B

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  ret <2 x i1> %z
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

declare void @fp2ui_v64f16_v64i16(ptr, ptr)

declare void @fp2si_v2f64_v2i8(ptr, ptr)

declare void @fp2ui_v2f64_v2i8(ptr, ptr)

declare <2 x i1> @fp2si_v2f64_v2i1(<2 x double>)

declare <2 x i1> @fp2ui_v2f64_v2i1(<2 x double>)

declare void @fp2si_v8f64_v8i8(ptr, ptr)

declare void @fp2ui_v8f64_v8i8(ptr, ptr)

declare <8 x i1> @fp2si_v8f64_v8i1(<8 x double>)

declare <8 x i1> @fp2ui_v8f64_v8i1(<8 x double>)

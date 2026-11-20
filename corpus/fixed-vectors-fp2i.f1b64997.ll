; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+zvfh,+f,+d -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 4294967296)
@G.1 = global i8 127
@G.2 = global <8 x i1> splat (i1 true)
@G.3 = global <3 x i1> zeroinitializer

declare void @fp2si_v2f32_v2i32(ptr, ptr)

declare void @fp2ui_v2f32_v2i32(ptr, ptr)

define <2 x i1> @fp2si_v2f32_v2i1(<2 x float> %x) {
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %LGV1 = load i8, ptr @G.1, align 1
  %LGV = load <2 x i64>, ptr @G, align 16
  %E = extractelement <2 x i64> %LGV, i8 %LGV1
  %z = fptosi <2 x float> %x to <2 x i1>
  store i64 %E, ptr %A, align 4
  ret <2 x i1> %z
}

declare <2 x i15> @fp2si_v2f32_v2i15(<2 x float>)

declare <2 x i15> @fp2ui_v2f32_v2i15(<2 x float>)

declare <2 x i1> @fp2ui_v2f32_v2i1(<2 x float>)

declare void @fp2si_v3f32_v3i32(ptr, ptr)

declare void @fp2ui_v3f32_v3i32(ptr, ptr)

define <3 x i1> @fp2si_v3f32_v3i1(<3 x float> %x) {
  %z = fptosi <3 x float> %x to <3 x i1>
  %C = icmp uge <3 x i1> %z, %z
  store <3 x i1> %C, ptr @G.3, align 1
  ret <3 x i1> %z
}

declare <3 x i15> @fp2si_v3f32_v3i15(<3 x float>)

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
  %a = load <64 x bfloat>, ptr %x, align 128
  %d = fptoui <64 x bfloat> %a to <64 x i16>
  store <64 x i16> %d, ptr %y, align 128
  %I = insertelement <64 x i16> %d, i16 0, i16 1
  store <64 x i16> %I, ptr poison, align 128
  ret void
}

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

define <2 x i1> @fp2si_v2f64_v2i1(<2 x double> %x) {
  %A = alloca i8, align 1
  store i8 -1, ptr %A, align 1
  %z = fptosi <2 x double> %x to <2 x i1>
  %L = load i8, ptr %A, align 1
  switch i8 %L, label %SW_D [
    i8 -97, label %SW_C
    i8 -37, label %SW_C1
    i8 17, label %SW_C2
    i8 -57, label %SW_C3
  ]

BB:                                               ; preds = %SW_C2
  ret <2 x i1> %z

SW_D:                                             ; preds = %0
  ret <2 x i1> %z

SW_C:                                             ; preds = %0
  ret <2 x i1> splat (i1 true)

SW_C1:                                            ; preds = %0
  ret <2 x i1> %z

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  ret <2 x i1> %z
}

declare <2 x i1> @fp2ui_v2f64_v2i1(<2 x double>)

define void @fp2si_v8f64_v8i8(ptr %x, ptr %y) {
  %a = load <8 x double>, ptr %x, align 64
  %C = fcmp une <8 x double> %a, %a
  %d = fptosi <8 x double> %a to <8 x i8>
  store <8 x i8> %d, ptr %y, align 8
  store <8 x i1> %C, ptr @G.2, align 1
  ret void
}

declare void @fp2ui_v8f64_v8i8(ptr, ptr)

declare <8 x i1> @fp2si_v8f64_v8i1(<8 x double>)

declare <8 x i1> @fp2ui_v8f64_v8i1(<8 x double>)

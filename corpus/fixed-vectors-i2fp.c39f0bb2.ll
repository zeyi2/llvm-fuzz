; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zvfh,+f,+d,+m -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i16 1
@G.2 = global ptr poison
@G.3 = global <2 x i64> splat (i64 -1)
@G.4 = global i64 1
@G.5 = global i64 9223372036854775807
@G.6 = global ptr poison

declare void @si2fp_v2i32_v2f32(ptr, ptr)

declare void @ui2fp_v2i32_v2f32(ptr, ptr)

declare <2 x float> @si2fp_v2i1_v2f32(<2 x i1>)

declare <2 x float> @si2fp_v2i7_v2f32(<2 x i7>)

declare <2 x float> @ui2fp_v2i7_v2f32(<2 x i7>)

declare <2 x float> @ui2fp_v2i1_v2f32(<2 x i1>)

declare void @si2fp_v3i32_v3f32(ptr, ptr)

declare void @ui2fp_v3i32_v3f32(ptr, ptr)

define <3 x float> @si2fp_v3i1_v3f32(<3 x i1> %x) {
  %A = alloca <3 x i1>, align 1
  store <3 x i1> poison, ptr %A, align 1
  %C = icmp sle <3 x i1> %x, %x
  %z = sitofp <3 x i1> %x to <3 x float>
  store <3 x i1> %C, ptr %A, align 1
  ret <3 x float> %z
}

declare <3 x float> @si2fp_v3i7_v3f32(<3 x i7>)

declare <3 x float> @ui2fp_v3i7_v3f32(<3 x i7>)

declare <3 x float> @ui2fp_v3i1_v3f32(<3 x i1>)

declare void @si2fp_v8i32_v8f32(ptr, ptr)

declare void @ui2fp_v8i32_v8f32(ptr, ptr)

declare <8 x float> @si2fp_v8i1_v8f32(<8 x i1>)

declare <8 x float> @ui2fp_v8i1_v8f32(<8 x i1>)

define void @si2fp_v2i16_v2f64(ptr %x, ptr %y) {
  %a = load <2 x i16>, ptr %x, align 4
  %d = sitofp <2 x i16> %a to <2 x double>
  store <2 x double> %d, ptr %y, align 16
  %G = getelementptr <2 x i16>, ptr %x, i32 65536
  store ptr %G, ptr @G.6, align 8
  ret void
}

declare void @ui2fp_v2i16_v2f64(ptr, ptr)

define void @si2fp_v8i16_v8f64(ptr %x, ptr %y) {
  %A = alloca i64, align 8
  store i64 4294967296, ptr %A, align 4
  %L = load i64, ptr %A, align 4
  switch i64 %L, label %SW_D [
    i64 -2064751742087894898, label %SW_C
    i64 1703483737590493284, label %SW_C1
    i64 -6912616421949757814, label %SW_C2
    i64 -2959624301472170717, label %SW_C3
    i64 -6360727689031188709, label %SW_C4
  ]

BB:                                               ; preds = %SW_C4, %SW_C3, %SW_C1, %SW_D
  %a = load <8 x i16>, ptr %x, align 16
  %d = sitofp <8 x i16> %a to <8 x double>
  store <8 x double> %d, ptr %y, align 64
  ret void

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  ret void

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  ret void

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %SW_C4, %0
  %LGV = load i1, ptr @G, align 1
  br i1 %LGV, label %BB, label %SW_C4
}

declare void @ui2fp_v8i16_v8f64(ptr, ptr)

declare <8 x double> @si2fp_v8i1_v8f64(<8 x i1>)

declare <8 x double> @ui2fp_v8i1_v8f64(<8 x i1>)

declare void @si2fp_v2i64_v2bf16(ptr, ptr)

declare void @ui2fp_v2i64_v2bf16(ptr, ptr)

declare <2 x bfloat> @si2fp_v2i1_v2bf16(<2 x i1>)

declare <2 x bfloat> @ui2fp_v2i1_v2bf16(<2 x i1>)

declare void @si2fp_v8i64_v8bf16(ptr, ptr)

declare void @ui2fp_v8i64_v8bf16(ptr, ptr)

define <8 x bfloat> @si2fp_v8i1_v8bf16(<8 x i1> %x) {
  %LGV1 = load i64, ptr @G.5, align 4
  %LGV = load i64, ptr @G.4, align 4
  %B = udiv i64 %LGV, %LGV1
  %z = sitofp <8 x i1> %x to <8 x bfloat>
  store i64 %B, ptr @G.5, align 4
  ret <8 x bfloat> %z
}

declare <8 x bfloat> @ui2fp_v8i1_v8bf16(<8 x i1>)

declare void @si2fp_v64i16_v64bf16(ptr, ptr)

declare void @ui2fp_v64i16_v64bf16(ptr, ptr)

declare void @si2fp_v2i8_v2bf16(ptr, ptr)

declare void @ui2fp_v2i8_v2bf16(ptr, ptr)

declare void @si2fp_v4i8_v4bf16(ptr, ptr)

declare void @ui2fp_v4i8_v4bf16(ptr, ptr)

define void @si2fp_v8i8_v8bf16(ptr %x, ptr %y) {
  %LGV = load <2 x i64>, ptr @G.3, align 16
  %a = load <8 x i8>, ptr %x, align 8
  %d = sitofp <8 x i8> %a to <8 x bfloat>
  %C = icmp ule <2 x i64> %LGV, splat (i64 9223372036854775807)
  store <8 x bfloat> %d, ptr %y, align 16
  store <2 x i1> %C, ptr poison, align 1
  ret void
}

declare void @ui2fp_v8i8_v8bf16(ptr, ptr)

declare void @si2fp_v2i64_v2f16(ptr, ptr)

declare void @ui2fp_v2i64_v2f16(ptr, ptr)

declare <2 x half> @si2fp_v2i1_v2f16(<2 x i1>)

define <2 x half> @ui2fp_v2i1_v2f16(<2 x i1> %x) {
  %A = alloca <2 x half>, align 4
  store <2 x half> poison, ptr %A, align 4
  %z = uitofp <2 x i1> %x to <2 x half>
  %B = fdiv <2 x half> %z, %z
  store <2 x half> %B, ptr %A, align 4
  ret <2 x half> %z
}

define void @si2fp_v8i64_v8f16(ptr %x, ptr %y) {
  %LGV = load i16, ptr @G.1, align 2
  %a = load <8 x i64>, ptr %x, align 64
  %G = getelementptr <8 x i64>, ptr %x, i16 %LGV
  %d = sitofp <8 x i64> %a to <8 x half>
  store <8 x half> %d, ptr %y, align 16
  store ptr %G, ptr @G.2, align 8
  ret void
}

declare void @ui2fp_v8i64_v8f16(ptr, ptr)

declare <8 x half> @si2fp_v8i1_v8f16(<8 x i1>)

declare <8 x half> @ui2fp_v8i1_v8f16(<8 x i1>)

declare void @si2fp_v64i16_v64f16(ptr, ptr)

declare void @ui2fp_v64i16_v64f16(ptr, ptr)

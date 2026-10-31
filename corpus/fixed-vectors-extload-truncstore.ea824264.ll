; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 0
@G.1 = global ptr poison
@G.2 = global <2 x i64> zeroinitializer

declare <2 x i16> @sextload_v2i1_v2i16(ptr)

declare <2 x i16> @sextload_v2i8_v2i16(ptr)

declare <2 x i16> @zextload_v2i8_v2i16(ptr)

declare <2 x i32> @sextload_v2i8_v2i32(ptr)

declare <2 x i32> @zextload_v2i8_v2i32(ptr)

declare <2 x i64> @sextload_v2i8_v2i64(ptr)

define <2 x i64> @zextload_v2i8_v2i64(ptr %x) {
  %y = load <2 x i8>, ptr %x, align 2
  %z = zext <2 x i8> %y to <2 x i64>
  %B = urem <2 x i64> %z, %z
  store <2 x i64> %B, ptr @G.2, align 16
  ret <2 x i64> %z
}

declare <4 x i16> @sextload_v4i8_v4i16(ptr)

declare <4 x i16> @zextload_v4i8_v4i16(ptr)

declare <4 x i32> @sextload_v4i8_v4i32(ptr)

declare <4 x i32> @zextload_v4i8_v4i32(ptr)

declare <4 x i64> @sextload_v4i8_v4i64(ptr)

declare <4 x i64> @zextload_v4i8_v4i64(ptr)

declare <8 x i16> @sextload_v8i8_v8i16(ptr)

declare <8 x i16> @zextload_v8i8_v8i16(ptr)

declare <8 x i32> @sextload_v8i8_v8i32(ptr)

declare <8 x i32> @zextload_v8i8_v8i32(ptr)

declare <8 x i64> @sextload_v8i8_v8i64(ptr)

declare <8 x i64> @zextload_v8i8_v8i64(ptr)

declare <16 x i16> @sextload_v16i8_v16i16(ptr)

declare <16 x i16> @zextload_v16i8_v16i16(ptr)

declare <16 x i32> @sextload_v16i8_v16i32(ptr)

declare <16 x i32> @zextload_v16i8_v16i32(ptr)

declare <16 x i64> @sextload_v16i8_v16i64(ptr)

declare <16 x i64> @zextload_v16i8_v16i64(ptr)

declare void @truncstore_v2i8_v2i1(<2 x i8>, ptr)

declare void @truncstore_v2i16_v2i8(<2 x i16>, ptr)

declare <2 x i32> @sextload_v2i16_v2i32(ptr)

declare <2 x i32> @zextload_v2i16_v2i32(ptr)

declare <2 x i64> @sextload_v2i16_v2i64(ptr)

declare <2 x i64> @zextload_v2i16_v2i64(ptr)

declare void @truncstore_v4i16_v4i8(<4 x i16>, ptr)

declare <4 x i32> @sextload_v4i16_v4i32(ptr)

declare <4 x i32> @zextload_v4i16_v4i32(ptr)

declare <4 x i64> @sextload_v4i16_v4i64(ptr)

declare <4 x i64> @zextload_v4i16_v4i64(ptr)

declare void @truncstore_v8i16_v8i8(<8 x i16>, ptr)

declare <8 x i32> @sextload_v8i16_v8i32(ptr)

declare <8 x i32> @zextload_v8i16_v8i32(ptr)

declare <8 x i64> @sextload_v8i16_v8i64(ptr)

declare <8 x i64> @zextload_v8i16_v8i64(ptr)

declare void @truncstore_v16i16_v16i8(<16 x i16>, ptr)

declare <16 x i32> @sextload_v16i16_v16i32(ptr)

declare <16 x i32> @zextload_v16i16_v16i32(ptr)

declare <16 x i64> @sextload_v16i16_v16i64(ptr)

declare <16 x i64> @zextload_v16i16_v16i64(ptr)

define void @truncstore_v2i32_v2i8(<2 x i32> %x, ptr %z) {
  %y = trunc <2 x i32> %x to <2 x i8>
  store <2 x i8> %y, ptr %z, align 2
  %C = icmp sle i8 1, -128
  store i1 %C, ptr poison, align 1
  ret void
}

define void @truncstore_v2i32_v2i16(<2 x i32> %x, ptr %z) {
  %LGV = load i128, ptr @G, align 4
  %y = trunc <2 x i32> %x to <2 x i16>
  store <2 x i16> %y, ptr %z, align 4
  %B = ashr i128 1, %LGV
  store i128 %B, ptr poison, align 4
  ret void
}

declare <2 x i64> @sextload_v2i32_v2i64(ptr)

declare <2 x i64> @zextload_v2i32_v2i64(ptr)

declare void @truncstore_v4i32_v4i8(<4 x i32>, ptr)

declare void @truncstore_v4i32_v4i16(<4 x i32>, ptr)

declare <4 x i64> @sextload_v4i32_v4i64(ptr)

declare <4 x i64> @zextload_v4i32_v4i64(ptr)

declare void @truncstore_v8i32_v8i8(<8 x i32>, ptr)

declare void @truncstore_v8i32_v8i16(<8 x i32>, ptr)

define <8 x i64> @sextload_v8i32_v8i64(ptr %x) {
  %G = getelementptr i32, ptr %x, i32 1
  %y = load <8 x i32>, ptr %x, align 32
  %z = sext <8 x i32> %y to <8 x i64>
  store ptr %G, ptr @G.1, align 8
  ret <8 x i64> %z
}

declare <8 x i64> @zextload_v8i32_v8i64(ptr)

declare void @truncstore_v16i32_v16i8(<16 x i32>, ptr)

declare void @truncstore_v16i32_v16i16(<16 x i32>, ptr)

declare <16 x i64> @sextload_v16i32_v16i64(ptr)

declare <16 x i64> @zextload_v16i32_v16i64(ptr)

declare void @truncstore_v2i64_v2i8(<2 x i64>, ptr)

declare void @truncstore_v2i64_v2i16(<2 x i64>, ptr)

declare void @truncstore_v2i64_v2i32(<2 x i64>, ptr)

declare void @truncstore_v4i64_v4i8(<4 x i64>, ptr)

declare void @truncstore_v4i64_v4i16(<4 x i64>, ptr)

declare void @truncstore_v4i64_v4i32(<4 x i64>, ptr)

declare void @truncstore_v8i64_v8i8(<8 x i64>, ptr)

declare void @truncstore_v8i64_v8i16(<8 x i64>, ptr)

declare void @truncstore_v8i64_v8i32(<8 x i64>, ptr)

declare void @truncstore_v16i64_v16i8(<16 x i64>, ptr)

declare void @truncstore_v16i64_v16i16(<16 x i64>, ptr)

declare void @truncstore_v16i64_v16i32(<16 x i64>, ptr)

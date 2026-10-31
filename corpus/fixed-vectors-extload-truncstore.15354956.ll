; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zdinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <16 x i1> splat (i1 true)
@G.1 = global <2 x i16> splat (i16 42)
@G.2 = global i1 false

declare <2 x i16> @sextload_v2i1_v2i16(ptr)

declare <2 x i16> @sextload_v2i8_v2i16(ptr)

declare <2 x i16> @zextload_v2i8_v2i16(ptr)

declare <2 x i32> @sextload_v2i8_v2i32(ptr)

declare <2 x i32> @zextload_v2i8_v2i32(ptr)

declare <2 x i64> @sextload_v2i8_v2i64(ptr)

declare <2 x i64> @zextload_v2i8_v2i64(ptr)

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

define <16 x i64> @sextload_v16i8_v16i64(ptr %x) {
  %y = load <16 x i8>, ptr %x, align 16
  %C = icmp ule <16 x i8> %y, %y
  %z = sext <16 x i8> %y to <16 x i64>
  store <16 x i1> %C, ptr @G, align 2
  ret <16 x i64> %z
}

declare <16 x i64> @zextload_v16i8_v16i64(ptr)

declare void @truncstore_v2i8_v2i1(<2 x i8>, ptr)

declare void @truncstore_v2i16_v2i8(<2 x i16>, ptr)

declare <2 x i32> @sextload_v2i16_v2i32(ptr)

declare <2 x i32> @zextload_v2i16_v2i32(ptr)

declare <2 x i64> @sextload_v2i16_v2i64(ptr)

define <2 x i64> @zextload_v2i16_v2i64(ptr %x) {
  %y = load <2 x i16>, ptr %x, align 4
  %z = zext <2 x i16> %y to <2 x i64>
  %B = sub <2 x i16> %y, zeroinitializer
  store <2 x i16> %B, ptr @G.1, align 4
  ret <2 x i64> %z
}

define void @truncstore_v4i16_v4i8(<4 x i16> %x, ptr %z) {
  %G = getelementptr <4 x i16>, ptr %z, i64 -1
  %y = trunc <4 x i16> %x to <4 x i8>
  store <4 x i8> %y, ptr %G, align 4
  ret void
}

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

declare void @truncstore_v2i32_v2i8(<2 x i32>, ptr)

declare void @truncstore_v2i32_v2i16(<2 x i32>, ptr)

declare <2 x i64> @sextload_v2i32_v2i64(ptr)

declare <2 x i64> @zextload_v2i32_v2i64(ptr)

declare void @truncstore_v4i32_v4i8(<4 x i32>, ptr)

declare void @truncstore_v4i32_v4i16(<4 x i32>, ptr)

declare <4 x i64> @sextload_v4i32_v4i64(ptr)

declare <4 x i64> @zextload_v4i32_v4i64(ptr)

declare void @truncstore_v8i32_v8i8(<8 x i32>, ptr)

declare void @truncstore_v8i32_v8i16(<8 x i32>, ptr)

declare <8 x i64> @sextload_v8i32_v8i64(ptr)

declare <8 x i64> @zextload_v8i32_v8i64(ptr)

declare void @truncstore_v16i32_v16i8(<16 x i32>, ptr)

declare void @truncstore_v16i32_v16i16(<16 x i32>, ptr)

declare <16 x i64> @sextload_v16i32_v16i64(ptr)

declare <16 x i64> @zextload_v16i32_v16i64(ptr)

declare void @truncstore_v2i64_v2i8(<2 x i64>, ptr)

define void @truncstore_v2i64_v2i16(<2 x i64> %x, ptr %z) {
  %B = fsub <4 x float> splat (float 1.401300e-45), splat (float f0x7F7FFFFF)
  %y = trunc <2 x i64> %x to <2 x i16>
  store <2 x i16> %y, ptr %z, align 4
  store <4 x float> %B, ptr poison, align 16
  ret void
}

define void @truncstore_v2i64_v2i32(<2 x i64> %x, ptr %z) {
  %LGV = load i1, ptr @G.2, align 1
  %y = trunc <2 x i64> %x to <2 x i32>
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F
  store <2 x i32> %y, ptr %z, align 8
  ret void

T:                                                ; preds = %0
  ret void

F:                                                ; preds = %0
  br label %BB
}

declare void @truncstore_v4i64_v4i8(<4 x i64>, ptr)

declare void @truncstore_v4i64_v4i16(<4 x i64>, ptr)

declare void @truncstore_v4i64_v4i32(<4 x i64>, ptr)

declare void @truncstore_v8i64_v8i8(<8 x i64>, ptr)

declare void @truncstore_v8i64_v8i16(<8 x i64>, ptr)

declare void @truncstore_v8i64_v8i32(<8 x i64>, ptr)

declare void @truncstore_v16i64_v16i8(<16 x i64>, ptr)

declare void @truncstore_v16i64_v16i16(<16 x i64>, ptr)

declare void @truncstore_v16i64_v16i32(<16 x i64>, ptr)

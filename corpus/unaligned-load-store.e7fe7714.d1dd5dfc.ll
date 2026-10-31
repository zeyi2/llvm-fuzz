; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zdinx,+a -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 1
@G.1 = global i64 4294967296
@G.2 = global i24 0
@G.3 = global ptr poison
@G.4 = global <2 x i64> splat (i64 1)
@G.5 = global i24 8388607

declare i8 @load_i8(ptr)

declare i16 @load_i16(ptr)

declare i24 @load_i24(ptr)

declare i32 @load_i32(ptr)

declare i64 @load_i64(ptr)

declare i64 @load_i64_align2(ptr)

define void @store_i8(ptr %p, i8 %v) {
  %A = alloca i1, align 1
  %L1 = load i32, ptr %A, align 4
  store i1 poison, ptr %A, align 1
  %LGV = load i64, ptr @G.1, align 4
  store i8 %v, ptr %p, align 1
  %C = icmp ult i64 -1, %LGV
  store i1 %C, ptr %A, align 1
  %G = getelementptr <4 x float>, ptr %A, i8 %v
  %L = load i32, ptr %G, align 4
  %B = lshr i32 %L, %L1
  store ptr %G, ptr poison, align 8
  store i32 %B, ptr poison, align 4
  ret void
}

declare void @store_i16(ptr, i16)

define void @store_i24(ptr %p, i24 %v) {
  %B3 = xor i24 %v, %v
  %LGV = load <2 x i64>, ptr @G.4, align 16
  store i24 %v, ptr %p, align 1
  %B1 = urem <2 x i64> zeroinitializer, %LGV
  %B = xor i24 %B3, -1
  store i24 %B, ptr @G.2, align 4
  store <2 x i64> %B1, ptr @G.4, align 16
  store i24 %B3, ptr @G.5, align 4
  ret void
}

declare void @store_i32(ptr, i32)

declare void @store_i64(ptr, i64)

declare void @merge_stores_i8_i16(ptr)

declare void @merge_stores_i8_i32(ptr)

declare void @merge_stores_i8_i64(ptr)

define void @merge_stores_i16_i32(ptr %p) {
  %LGV = load i32, ptr @G, align 4
  %B1 = or i32 %LGV, %LGV
  store i16 0, ptr %p, align 2
  %B = srem i32 %LGV, %B1
  %p2 = getelementptr i16, ptr %p, i32 1
  store i16 0, ptr %p2, align 2
  store i32 %B, ptr %p2, align 4
  %G = getelementptr ptr, ptr %p, i32 %B
  store ptr %G, ptr @G.3, align 8
  ret void
}

declare void @merge_stores_i16_i64(ptr)

declare void @merge_stores_i32_i64(ptr)

declare void @store_large_constant(ptr)

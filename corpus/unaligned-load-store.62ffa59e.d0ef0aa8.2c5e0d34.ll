; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zba,+zvfh -O2 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <8 x i8> splat (i8 127)
@G.2 = global ptr poison
@G.3 = global i128 0
@G.4 = global i1 true
@G.5 = global i1 true

declare i8 @load_i8(ptr)

declare i16 @load_i16(ptr)

declare i24 @load_i24(ptr)

declare i32 @load_i32(ptr)

declare i64 @load_i64(ptr)

declare i64 @load_i64_align2(ptr)

define void @store_i8(ptr %p, i8 %v) {
  store i8 %v, ptr %p, align 1
  %G = getelementptr <8 x i8>, ptr %p, i8 %v
  %L = load i32, ptr %G, align 4
  %G1 = getelementptr i8, ptr %p, i32 %L
  store ptr %G, ptr @G.2, align 8
  %C = icmp slt i32 %L, %L
  store ptr %G1, ptr @G.2, align 8
  store i1 %C, ptr @G.5, align 1
  ret void
}

declare void @store_i16(ptr, i16)

declare void @store_i24(ptr, i24)

declare void @store_i32(ptr, i32)

declare void @store_i64(ptr, i64)

declare void @merge_stores_i8_i16(ptr)

define void @merge_stores_i8_i32(ptr %p) {
  %LGV = load i1, ptr @G.4, align 1
  %LGV1 = load i128, ptr @G.3, align 4
  %B = add i128 170141183460469231731687303715884105727, %LGV1
  store i8 0, ptr %p, align 1
  %p2 = getelementptr inbounds i8, ptr %p, i32 1
  store i8 0, ptr %p2, align 1
  %p3 = getelementptr i8, ptr %p, i32 2
  %L = load i1, ptr %p3, align 1
  store i128 %B, ptr @G.3, align 4
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  %G = getelementptr bfloat, ptr %p, i1 false
  store i8 0, ptr %p3, align 1
  %p4 = getelementptr i8, ptr %p, i32 3
  store i8 0, ptr %p4, align 1
  store ptr %G, ptr %p4, align 8
  ret void

T:                                                ; preds = %0
  %1 = phi i1 [ %LGV, %0 ]
  store i1 %1, ptr %p2, align 1
  ret void

F:                                                ; preds = %0
  br label %BB
}

declare void @merge_stores_i8_i64(ptr)

declare void @merge_stores_i16_i32(ptr)

declare void @merge_stores_i16_i64(ptr)

declare void @merge_stores_i32_i64(ptr)

declare void @store_large_constant(ptr)

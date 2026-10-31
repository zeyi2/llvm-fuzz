; isel-diff-config: -verify-machineinstrs -mtriple=riscv32 -mattr=+a,+c -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true

; Function Attrs: nounwind
declare i32 @test_i8_s(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i8_z(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_s(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_z(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i32(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i8_s_store(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i8_z_store(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_s_store(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_z_store(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i32_store(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i64 @test_i8_s_1(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i8_z_1(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i16_s_1(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i16_z_1(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i32_z_1(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i64_1(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i8_s_store_64(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i8_z_store_64(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i16_s_store_64(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i16_z_store_64(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i32_z_store_64(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i64_store_64(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i32 @test_i8_s_volatile(ptr, i1 zeroext, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @test_i8_z_volatile(ptr, i1 zeroext, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @test_i16_s_volatile(ptr, i1 zeroext, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @test_i16_z_volatile(ptr, i1 zeroext, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @test_i32_volatile(ptr, i1 zeroext, i32, ptr) #0

; Function Attrs: nounwind
define i64 @test_i8_s_1_volatile(ptr %base, i1 zeroext %x, i64 %b, ptr %base1) #0 {
entry:
  %B = ashr i1 %x, false
  %addr = getelementptr i8, ptr %base, i64 4
  %val = load i8, ptr %addr, align 1
  %val1 = load volatile i64, ptr %base1, align 4
  %ext = sext i8 %val to i64
  %res = select i1 %x, i64 %ext, i64 %b
  %res1 = add i64 %res, %val1
  store i1 %B, ptr @G, align 1
  ret i64 %res1
}

; Function Attrs: nounwind
declare i64 @test_i8_z_1_volatile(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i16_s_1_volatile(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i16_z_1_volatile(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i32_z_1_volatile(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
define i64 @test_i64_1_volatile(ptr %base, i1 zeroext %x, i64 %b, ptr %base1) #0 {
entry:
  %addr = getelementptr i64, ptr %base, i64 4
  %L = load i1, ptr %addr, align 1
  %val = load i64, ptr %addr, align 4
  %B = ashr i1 %L, %x
  %val1 = load volatile i64, ptr %base1, align 4
  %res = select i1 %B, i64 %val, i64 %b
  %res1 = add i64 %res, %val1
  ret i64 %res1
}

; Function Attrs: nounwind
declare i32 @test_i8_s_op(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i8_z_op(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_s_op(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_z_op(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i32_op(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i8_s_store_op(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i8_z_store_op(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_s_store_op(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_z_store_op(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i32_store_op(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i64 @test_i8_s_1_op(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i8_z_1_op(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i16_s_1_op(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i16_z_1_op(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i32_z_1_op(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i64_1_op(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i8_s_store_64_op(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i8_z_store_64_op(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i16_s_store_64_op(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i16_z_store_64_op(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i32_z_store_64_op(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i64_store_64_op(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i32 @test_i8_s_volatile_op(ptr, i1 zeroext, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @test_i8_z_volatile_op(ptr, i1 zeroext, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @test_i16_s_volatile_op(ptr, i1 zeroext, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @test_i16_z_volatile_op(ptr, i1 zeroext, i32, ptr) #0

; Function Attrs: nounwind
declare i32 @test_i32_volatile_op(ptr, i1 zeroext, i32, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i8_s_1_volatile_op(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i8_z_1_volatile_op(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i16_s_1_volatile_op(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i16_z_1_volatile_op(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i32_z_1_volatile_op(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i64_1_volatile_op(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i32 @test_i8_s_2(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i8_z_2(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_s_2(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_z_2(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i32_2(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i8_s_store_2(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i8_z_store_2(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_s_store_2(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_z_store_2(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i32_store_2(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i64 @test_i8_s_1_2(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
define i64 @test_i8_z_1_2(ptr %base, i1 zeroext %x, i64 %b) #0 {
entry:
  %G = getelementptr ptr, ptr %base, i1 %x
  %val = load atomic i8, ptr %G monotonic, align 1
  %ext = zext i8 %val to i64
  %res = select i1 %x, i64 %ext, i64 %b
  ret i64 %res
}

; Function Attrs: nounwind
declare i64 @test_i16_s_1_2(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i16_z_1_2(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i32_z_1_2(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i64_1_2(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
declare i64 @test_i8_s_store_64_2(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i8_z_store_64_2(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i16_s_store_64_2(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i16_z_store_64_2(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i32_z_store_64_2(ptr, i1 zeroext, i64, ptr, i64) #0

; Function Attrs: nounwind
declare i64 @test_i64_store_64_2(ptr, i1 zeroext, i64, ptr, i64) #0

attributes #0 = { nounwind }

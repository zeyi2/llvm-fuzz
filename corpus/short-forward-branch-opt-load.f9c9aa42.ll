; isel-diff-config: -verify-machineinstrs -mtriple=riscv32 -mattr=+a,+short-forward-branch-ialu,+d -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 16)
@G.1 = global <8 x i8> splat (i8 -1)
@G.2 = global <8 x i1> zeroinitializer
@G.3 = global i16 -1

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
define i32 @test_i16_s_store(ptr %base, i1 zeroext %x, i32 %b, ptr %base1, i32 %c) #0 {
entry:
  %addr = getelementptr i16, ptr %base, i32 4
  %val = load i16, ptr %addr, align 2
  %ext = sext i16 %val to i32
  %C = icmp uge i16 %val, %val
  store i32 %c, ptr %base1, align 4
  %res = select i1 %C, i32 %ext, i32 %b
  ret i32 %res
}

; Function Attrs: nounwind
declare i32 @test_i16_z_store(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i32 @test_i32_store(ptr, i1 zeroext, i32, ptr, i32) #0

; Function Attrs: nounwind
declare i64 @test_i8_s_1(ptr, i1 zeroext, i64) #0

; Function Attrs: nounwind
define i64 @test_i8_z_1(ptr %base, i1 zeroext %x, i64 %b) #0 {
entry:
  %addr = getelementptr i8, ptr %base, i64 4
  %val = load i8, ptr %addr, align 1
  %ext = zext i8 %val to i64
  %G = getelementptr i64, ptr %base, i64 %ext
  %res = select i1 %x, i64 %ext, i64 %b
  store ptr %G, ptr poison, align 8
  ret i64 %res
}

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
declare i64 @test_i8_s_1_volatile(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i8_z_1_volatile(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i16_s_1_volatile(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i16_z_1_volatile(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i32_z_1_volatile(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i64 @test_i64_1_volatile(ptr, i1 zeroext, i64, ptr) #0

; Function Attrs: nounwind
declare i32 @test_i8_s_op(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i8_z_op(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_s_op(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
declare i32 @test_i16_z_op(ptr, i1 zeroext, i32) #0

; Function Attrs: nounwind
define i32 @test_i32_op(ptr %base, i1 zeroext %x, i32 %b) #0 {
entry:
  %G = getelementptr ptr, ptr %base, i1 %x
  %val = load i32, ptr %G, align 4
  %res = select i1 %x, i32 %b, i32 %val
  ret i32 %res
}

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
define i64 @test_i16_z_1_op(ptr %base, i1 zeroext %x, i64 %b) #0 {
entry:
  %addr = getelementptr i16, ptr %base, i64 4
  %L = load i1, ptr %addr, align 1
  %val = load i16, ptr %addr, align 2
  %ext = zext i16 %val to i64
  %res = select i1 %x, i64 %b, i64 %ext
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  ret i64 %res

T:                                                ; preds = %entry
  br label %BB

F:                                                ; preds = %entry
  %LGV = load i16, ptr @G.3, align 2
  %C = icmp ult i16 1, %LGV
  store i1 %C, ptr %addr, align 1
  br label %BB
}

; Function Attrs: nounwind
define i64 @test_i32_z_1_op(ptr %base, i1 zeroext %x, i64 %b) #0 {
entry:
  %addr = getelementptr i32, ptr %base, i64 4
  %L = load float, ptr %addr, align 4
  %val = load i32, ptr %addr, align 4
  %ext = zext i32 %val to i64
  %C = fcmp ueq float %L, 4.200000e+01
  %res = select i1 %C, i64 %b, i64 %ext
  ret i64 %res
}

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
define i32 @test_i8_z_volatile_op(ptr %base, i1 zeroext %x, i32 %b, ptr %base1) #0 {
entry:
  %LGV1 = load <8 x i8>, ptr @G.1, align 8
  %LGV = load <8 x i8>, ptr @G, align 8
  %addr = getelementptr i8, ptr %base, i32 4
  %val = load i8, ptr %addr, align 1
  %ext = zext i8 %val to i32
  %val1 = load volatile i32, ptr %base1, align 4
  %res = select i1 %x, i32 %b, i32 %ext
  %res1 = add i32 %res, %val1
  %C = icmp ule <8 x i8> %LGV, %LGV1
  store <8 x i1> %C, ptr @G.2, align 1
  ret i32 %res1
}

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
declare i64 @test_i8_z_1_2(ptr, i1 zeroext, i64) #0

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

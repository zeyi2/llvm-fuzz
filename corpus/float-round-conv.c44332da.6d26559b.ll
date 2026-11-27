; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f,+zba -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i32 -1
@G.2 = global i1 false
@G.3 = global float 1.000000e+00
@G.4 = global ptr poison

declare signext i8 @test_floor_si8(float)

declare signext i16 @test_floor_si16(float)

define signext i32 @test_floor_si32(float %x) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C1 = fcmp ole half +qnan, 4.200000e+01
  %a = call float @llvm.floor.f32(float %x)
  %B = ashr i1 false, %C1
  %b = fptosi float %a to i32
  store i1 %C1, ptr @G.2, align 1
  store i1 %B, ptr %A, align 1
  ret i32 %b
}

declare i64 @test_floor_si64(float)

declare zeroext i8 @test_floor_ui8(float)

declare zeroext i16 @test_floor_ui16(float)

declare signext i32 @test_floor_ui32(float)

declare i64 @test_floor_ui64(float)

declare signext i8 @test_ceil_si8(float)

declare signext i16 @test_ceil_si16(float)

declare signext i32 @test_ceil_si32(float)

declare i64 @test_ceil_si64(float)

declare zeroext i8 @test_ceil_ui8(float)

declare zeroext i16 @test_ceil_ui16(float)

declare signext i32 @test_ceil_ui32(float)

declare i64 @test_ceil_ui64(float)

declare signext i8 @test_trunc_si8(float)

declare signext i16 @test_trunc_si16(float)

declare signext i32 @test_trunc_si32(float)

declare i64 @test_trunc_si64(float)

declare zeroext i8 @test_trunc_ui8(float)

declare zeroext i16 @test_trunc_ui16(float)

declare signext i32 @test_trunc_ui32(float)

declare i64 @test_trunc_ui64(float)

define signext i8 @test_round_si8(float %x) {
  %LGV = load float, ptr @G.3, align 4
  %B = fmul float %x, %LGV
  %C = fcmp oge float %B, 1.401300e-45
  %a = call float @llvm.round.f32(float %x)
  %b = fptosi float %a to i8
  store i1 %C, ptr @G, align 1
  ret i8 %b
}

declare signext i16 @test_round_si16(float)

declare signext i32 @test_round_si32(float)

declare i64 @test_round_si64(float)

declare zeroext i8 @test_round_ui8(float)

declare zeroext i16 @test_round_ui16(float)

declare signext i32 @test_round_ui32(float)

declare i64 @test_round_ui64(float)

declare signext i8 @test_roundeven_si8(float)

declare signext i16 @test_roundeven_si16(float)

declare signext i32 @test_roundeven_si32(float)

declare i64 @test_roundeven_si64(float)

define zeroext i8 @test_roundeven_ui8(float %x) {
  %A = alloca i1, align 1
  %L = load i64, ptr %A, align 4
  store i1 poison, ptr %A, align 1
  %G = getelementptr ptr, ptr %A, i64 %L
  %C = fcmp ogt float %x, +inf
  %B1 = ashr i1 %C, %C
  %a = call float @llvm.roundeven.f32(float %x)
  %b = fptoui float %a to i8
  store i1 %C, ptr @G, align 1
  %B = fdiv float %x, +qnan
  store float %B, ptr @G.3, align 4
  store i1 %B1, ptr %A, align 1
  store ptr %G, ptr @G.4, align 8
  ret i8 %b
}

declare zeroext i16 @test_roundeven_ui16(float)

define signext i32 @test_roundeven_ui32(float %x) {
  %A1 = alloca i1, align 1
  store i1 true, ptr %A1, align 1
  %A = alloca <8 x i8>, align 8
  %L = load i128, ptr %A, align 4
  store <8 x i8> poison, ptr %A, align 8
  %a = call float @llvm.roundeven.f32(float %x)
  %b = fptoui float %a to i32
  %B = mul <8 x i8> zeroinitializer, splat (i8 42)
  store i32 %b, ptr @G.1, align 4
  switch i128 %L, label %SW_D [
    i128 4756742040325082931, label %SW_C
  ]

BB:                                               ; preds = %SW_C, %SW_D
  store <8 x i8> %B, ptr %A, align 8
  ret i32 %b

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %L2 = load i1, ptr %A1, align 1
  br i1 %L2, label %BB, label %SW_C
}

declare i64 @test_roundeven_ui64(float)

declare float @test_floor_float(float)

declare float @test_ceil_float(float)

declare float @test_trunc_float(float)

declare float @test_round_float(float)

declare float @test_roundeven_float(float)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.ceil.f32(float) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.floor.f32(float) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.round.f32(float) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.roundeven.f32(float) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.trunc.f32(float) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32 -mattr=+zvfh,+d -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x float> splat (float +qnan)
@G.1 = global i1 true
@G.2 = global i64 4294967296
@G.3 = global i1 false
@G.4 = global i1 false
@G.5 = global float 1.401300e-45

declare signext i8 @test_floor_si8(half)

declare signext i16 @test_floor_si16(half)

declare signext i32 @test_floor_si32(half)

declare i64 @test_floor_si64(half)

define zeroext i8 @test_floor_ui8(half %x) {
  %LGV = load float, ptr @G.5, align 4
  %LGV1 = load i1, ptr @G.4, align 1
  %C3 = fcmp ult double f0x7FEFFFFFFFFFFFFF, +inf
  %C1 = fcmp oge float +qnan, %LGV
  %A = alloca i1, align 1
  store i1 %C1, ptr %A, align 1
  %C = fcmp uge half %x, %x
  %a = call half @llvm.floor.f16(half %x)
  %C2 = fcmp uge half %x, %x
  %B = srem i1 %C, %LGV1
  %b = fptoui half %a to i8
  store i1 %B, ptr %A, align 1
  store i1 %C2, ptr @G.4, align 1
  store i1 %C3, ptr @G.4, align 1
  ret i8 %b
}

declare zeroext i16 @test_floor_ui16(half)

declare signext i32 @test_floor_ui32(half)

declare i64 @test_floor_ui64(half)

declare signext i8 @test_ceil_si8(half)

declare signext i16 @test_ceil_si16(half)

declare signext i32 @test_ceil_si32(half)

declare i64 @test_ceil_si64(half)

declare zeroext i8 @test_ceil_ui8(half)

declare zeroext i16 @test_ceil_ui16(half)

declare signext i32 @test_ceil_ui32(half)

declare i64 @test_ceil_ui64(half)

declare signext i8 @test_trunc_si8(half)

declare signext i16 @test_trunc_si16(half)

declare signext i32 @test_trunc_si32(half)

declare i64 @test_trunc_si64(half)

declare zeroext i8 @test_trunc_ui8(half)

declare zeroext i16 @test_trunc_ui16(half)

declare signext i32 @test_trunc_ui32(half)

declare i64 @test_trunc_ui64(half)

declare signext i8 @test_round_si8(half)

declare signext i16 @test_round_si16(half)

declare signext i32 @test_round_si32(half)

declare i64 @test_round_si64(half)

declare zeroext i8 @test_round_ui8(half)

declare zeroext i16 @test_round_ui16(half)

declare signext i32 @test_round_ui32(half)

declare i64 @test_round_ui64(half)

declare signext i8 @test_roundeven_si8(half)

declare signext i16 @test_roundeven_si16(half)

declare signext i32 @test_roundeven_si32(half)

define i64 @test_roundeven_si64(half %x) {
  %A16 = alloca i1, align 1
  store i1 false, ptr %A16, align 1
  %A13 = alloca i1, align 1
  store i1 false, ptr %A13, align 1
  %A10 = alloca i1, align 1
  store i1 false, ptr %A10, align 1
  %A = alloca i32, align 4
  store i32 0, ptr %A, align 4
  %C3 = fcmp ole double +qnan, +qnan
  %C = fcmp one half %x, 0.000000e+00
  store i1 %C, ptr @G.1, align 1
  %LGV = load i64, ptr @G.2, align 4
  %C2 = fcmp oge half %x, %x
  %a = call half @llvm.roundeven.f16(half %x)
  %L = load i32, ptr %A, align 4
  switch i32 %L, label %SW_D [
    i32 -605164577, label %SW_C
    i32 -1779604223, label %SW_C4
    i32 -304910640, label %SW_C5
    i32 -280642731, label %SW_C6
    i32 14030217, label %SW_C7
    i32 301189483, label %SW_C8
    i32 -560968715, label %SW_C9
  ]

BB:                                               ; preds = %SW_C9, %SW_C8, %SW_C7, %SW_C6, %SW_C5, %SW_C4, %SW_C, %SW_D
  %b = fptosi half %a to i64
  %C1 = icmp slt i64 %b, %LGV
  store i1 %C1, ptr @G.1, align 1
  store i1 %C2, ptr poison, align 1
  store i1 %C3, ptr @G.3, align 1
  ret i64 %b

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %L11 = load i1, ptr %A10, align 1
  br i1 %L11, label %BB, label %SW_C

SW_C4:                                            ; preds = %SW_C4, %0
  %LGV12 = load i1, ptr @G.1, align 1
  %L14 = load i1, ptr %A13, align 1
  br i1 %L14, label %SW_C4, label %BB

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %SW_C6, %0
  %LGV15 = load i1, ptr @G.3, align 1
  %L17 = load i1, ptr %A16, align 1
  br i1 %L17, label %BB, label %SW_C6

SW_C7:                                            ; preds = %0
  br label %BB

SW_C8:                                            ; preds = %0
  br label %BB

SW_C9:                                            ; preds = %0
  br label %BB
}

declare zeroext i8 @test_roundeven_ui8(half)

declare zeroext i16 @test_roundeven_ui16(half)

declare signext i32 @test_roundeven_ui32(half)

declare i64 @test_roundeven_ui64(half)

declare half @test_floor_half(half)

declare half @test_ceil_half(half)

declare half @test_trunc_half(half)

define half @test_round_half(half %x) {
  %A4 = alloca <2 x i64>, align 16
  store <2 x i64> poison, ptr %A4, align 16
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %B = fmul half %x, +qnan
  %a = call half @llvm.round.f16(half %x)
  store half %B, ptr poison, align 2
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %T
  %B2 = fsub half %x, %B
  %C1 = fcmp uno half %B2, +qnan
  %C = fcmp une half %x, %a
  store i1 %C, ptr @G.3, align 1
  store i1 %C1, ptr poison, align 1
  ret half %a

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  %B3 = urem <2 x i64> splat (i64 4294967296), splat (i64 42)
  store <2 x i64> %B3, ptr %A4, align 16
  ret half %B
}

declare half @test_roundeven_half(half)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.ceil.f16(half) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.floor.f16(half) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.round.f16(half) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.roundeven.f16(half) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.trunc.f16(half) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+zfh,+zvbb,+f -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 -32768
@G.1 = global i1 false
@G.2 = global i16 -32768

declare signext i8 @test_floor_si8(half)

declare signext i16 @test_floor_si16(half)

declare signext i32 @test_floor_si32(half)

declare i64 @test_floor_si64(half)

declare zeroext i8 @test_floor_ui8(half)

define zeroext i16 @test_floor_ui16(half %x) {
  %LGV = load i16, ptr @G, align 2
  switch i16 %LGV, label %SW_D [
    i16 -4111, label %SW_C
    i16 14947, label %SW_C1
    i16 10503, label %SW_C2
    i16 30028, label %SW_C3
    i16 16176, label %SW_C4
    i16 13493, label %SW_C5
    i16 -9200, label %SW_C6
  ]

BB:                                               ; preds = %SW_C6, %SW_C3, %SW_C2, %SW_D
  %a = call half @llvm.floor.f16(half %x)
  %b = fptoui half %a to i16
  ret i16 %b

SW_D:                                             ; preds = %SW_D, %0
  %LGV7 = load i1, ptr @G.1, align 1
  br i1 %LGV7, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  %LGV8 = load i16, ptr @G.2, align 2
  ret i16 %LGV8

SW_C1:                                            ; preds = %0
  ret i16 0

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  ret i16 %LGV

SW_C5:                                            ; preds = %0
  ret i16 %LGV

SW_C6:                                            ; preds = %0
  br label %BB
}

declare signext i32 @test_floor_ui32(half)

declare i64 @test_floor_ui64(half)

declare signext i8 @test_ceil_si8(half)

declare signext i16 @test_ceil_si16(half)

declare signext i32 @test_ceil_si32(half)

declare i64 @test_ceil_si64(half)

define zeroext i8 @test_ceil_ui8(half %x) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %a = call half @llvm.ceil.f16(half %x)
  %C = fcmp ole half %x, %x
  %b = fptoui half %a to i8
  store i1 %C, ptr %A, align 1
  ret i8 %b
}

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

declare i64 @test_roundeven_si64(half)

declare zeroext i8 @test_roundeven_ui8(half)

declare zeroext i16 @test_roundeven_ui16(half)

declare signext i32 @test_roundeven_ui32(half)

declare i64 @test_roundeven_ui64(half)

declare half @test_floor_half(half)

declare half @test_ceil_half(half)

declare half @test_trunc_half(half)

declare half @test_round_half(half)

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

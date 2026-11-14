; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+zfh,+f -O1 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 4294967296)
@G.1 = global half 1.000000e+00
@G.2 = global half 4.200000e+01
@G.3 = global i1 true
@G.4 = global i16 -1
@G.5 = global i1 false
@G.6 = global i16 0

declare signext i8 @test_floor_si8(half)

declare signext i16 @test_floor_si16(half)

declare signext i32 @test_floor_si32(half)

declare i64 @test_floor_si64(half)

define zeroext i8 @test_floor_ui8(half %x) {
  %B = udiv <2 x i64> zeroinitializer, zeroinitializer
  %a = call half @llvm.floor.f16(half %x)
  %b = fptoui half %a to i8
  store <2 x i64> %B, ptr @G, align 16
  ret i8 %b
}

define zeroext i16 @test_floor_ui16(half %x) {
  %a = call half @llvm.floor.f16(half %x)
  %b = fptoui half %a to i16
  %B = fmul half %x, 1.000000e+00
  store half %B, ptr @G.1, align 2
  ret i16 %b
}

declare signext i32 @test_floor_ui32(half)

declare i64 @test_floor_ui64(half)

declare signext i8 @test_ceil_si8(half)

define signext i16 @test_ceil_si16(half %x) {
  %A = alloca i128, align 8
  store i128 -170141183460469231731687303715884105728, ptr %A, align 4
  %a = call half @llvm.ceil.f16(half %x)
  %L = load i128, ptr %A, align 4
  switch i128 %L, label %SW_D [
    i128 8253680655567230128, label %SW_C
    i128 9525802319331092122, label %SW_C1
    i128 3816666615527746762, label %SW_C2
    i128 17842719611363103560, label %SW_C3
    i128 12987385739118294793, label %SW_C4
    i128 14915398928180630038, label %SW_C5
    i128 1486571997309872195, label %SW_C6
  ]

BB:                                               ; preds = %SW_C5, %SW_C3, %SW_C2, %SW_D
  %b = fptosi half %a to i16
  ret i16 %b

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  ret i16 0

SW_C1:                                            ; preds = %0
  %LGV = load i16, ptr @G.4, align 2
  ret i16 %LGV

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %SW_C3, %0
  %LGV7 = load i1, ptr @G.5, align 1
  br i1 %LGV7, label %BB, label %SW_C3

SW_C4:                                            ; preds = %0
  ret i16 1

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  %LGV8 = load i16, ptr @G.6, align 2
  ret i16 %LGV8
}

define signext i32 @test_ceil_si32(half %x) {
  %S = shufflevector <8 x i8> splat (i8 1), <8 x i8> zeroinitializer, <8 x i32> poison
  %a = call half @llvm.ceil.f16(half %x)
  %b = fptosi half %a to i32
  store <8 x i8> %S, ptr poison, align 8
  ret i32 %b
}

define i64 @test_ceil_si64(half %x) {
  %LGV = load half, ptr @G.2, align 2
  %C = fcmp false half %x, %LGV
  %a = call half @llvm.ceil.f16(half %x)
  %b = fptosi half %a to i64
  store i1 %C, ptr @G.3, align 1
  ret i64 %b
}

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

declare i64 @test_roundeven_si64(half)

declare zeroext i8 @test_roundeven_ui8(half)

declare zeroext i16 @test_roundeven_ui16(half)

declare signext i32 @test_roundeven_ui32(half)

declare i64 @test_roundeven_ui64(half)

declare half @test_floor_half(half)

declare half @test_ceil_half(half)

define half @test_trunc_half(half %x) {
  %C = fcmp une half %x, %x
  %a = call half @llvm.trunc.f16(half %x)
  store i1 %C, ptr poison, align 1
  ret half %a
}

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

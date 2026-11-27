; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32 -mattr=+zvfh,+d -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x float> splat (float +qnan)
@G.1 = global i1 true
@G.2 = global i64 4294967296
@G.3 = global i1 false
@G.4 = global i1 false

declare signext i8 @test_floor_si8(half)

declare signext i16 @test_floor_si16(half)

declare signext i32 @test_floor_si32(half)

declare i64 @test_floor_si64(half)

define zeroext i8 @test_floor_ui8(half %x) {
  %LGV1 = load i1, ptr @G.4, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp uge half %x, %x
  %a = call half @llvm.floor.f16(half %x)
  %C2 = fcmp uge half %x, %x
  %B = srem i1 %C, %LGV1
  %b = fptoui half %a to i8
  store i1 %B, ptr %A, align 1
  store i1 %C2, ptr @G.4, align 1
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
  %LGV4 = load i1, ptr @G.3, align 1
  %C = fcmp one half %x, 0.000000e+00
  %B = shl i1 %C, %LGV4
  store i1 %C, ptr @G.1, align 1
  %LGV = load i64, ptr @G.2, align 4
  %C2 = fcmp oge half %x, %x
  %a = call half @llvm.roundeven.f16(half %x)
  %b = fptosi half %a to i64
  %C1 = icmp slt i64 %b, %LGV
  store i1 %C1, ptr @G.1, align 1
  store i1 %C2, ptr poison, align 1
  store i1 %B, ptr @G.3, align 1
  ret i64 %b
}

declare zeroext i8 @test_roundeven_ui8(half)

declare zeroext i16 @test_roundeven_ui16(half)

declare signext i32 @test_roundeven_ui32(half)

declare i64 @test_roundeven_ui64(half)

declare half @test_floor_half(half)

declare half @test_ceil_half(half)

declare half @test_trunc_half(half)

define half @test_round_half(half %x) {
  %B = fmul half %x, +qnan
  %a = call half @llvm.round.f16(half %x)
  store half %B, ptr poison, align 2
  %C = fcmp une half %x, %a
  store i1 %C, ptr @G.3, align 1
  ret half %a
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

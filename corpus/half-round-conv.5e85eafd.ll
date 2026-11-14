; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+zfh -O3 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half 4.200000e+01
@G.1 = global i16 42
@G.2 = global i16 1
@G.3 = global i64 9223372036854775807
@G.4 = global ptr poison
@G.5 = global i1 true

declare signext i8 @test_floor_si8(half)

declare signext i16 @test_floor_si16(half)

declare signext i32 @test_floor_si32(half)

declare i64 @test_floor_si64(half)

define zeroext i8 @test_floor_ui8(half %x) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load half, ptr @G, align 2
  %G = getelementptr i64, ptr %A, i1 false
  %C = fcmp ueq half %x, %LGV
  %a = call half @llvm.floor.f16(half %x)
  %b = fptoui half %a to i8
  store i1 %C, ptr %A, align 1
  store ptr %G, ptr @G.4, align 8
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

define signext i8 @test_round_si8(half %x) {
  %a = call half @llvm.round.f16(half %x)
  %b = fptosi half %a to i8
  %C = icmp sle i8 %b, %b
  store i1 %C, ptr poison, align 1
  ret i8 %b
}

declare signext i16 @test_round_si16(half)

define signext i32 @test_round_si32(half %x) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = icmp sle i1 true, false
  %a = call half @llvm.round.f16(half %x)
  %b = fptosi half %a to i32
  store i1 %C, ptr %A, align 1
  ret i32 %b
}

declare i64 @test_round_si64(half)

declare zeroext i8 @test_round_ui8(half)

declare zeroext i16 @test_round_ui16(half)

declare signext i32 @test_round_ui32(half)

define i64 @test_round_ui64(half %x) {
  %a = call half @llvm.round.f16(half %x)
  %C = fcmp ult half %a, %a
  %b = fptoui half %a to i64
  store i1 %C, ptr @G.5, align 1
  ret i64 %b
}

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

define half @test_round_half(half %x) {
  %LGV1 = load i16, ptr @G.1, align 2
  %B = xor i16 32767, %LGV1
  %a = call half @llvm.round.f16(half %x)
  store i16 %B, ptr @G.2, align 2
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

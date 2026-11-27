; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+zfhmin,+a -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i8 16

declare signext i8 @test_floor_si8(half)

declare signext i16 @test_floor_si16(half)

define signext i32 @test_floor_si32(half %x) {
  %C = fcmp ueq half %x, 0.000000e+00
  %a = call half @llvm.floor.f16(half %x)
  %b = fptosi half %a to i32
  store i1 %C, ptr @G, align 1
  ret i32 %b
}

declare i64 @test_floor_si64(half)

declare zeroext i8 @test_floor_ui8(half)

declare zeroext i16 @test_floor_ui16(half)

declare signext i32 @test_floor_ui32(half)

define i64 @test_floor_ui64(half %x) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %a = call half @llvm.floor.f16(half %x)
  %b = fptoui half %a to i64
  %C = fcmp ord half %x, 4.200000e+01
  store i1 %C, ptr %A, align 1
  ret i64 %b
}

declare signext i8 @test_ceil_si8(half)

declare signext i16 @test_ceil_si16(half)

declare signext i32 @test_ceil_si32(half)

declare i64 @test_ceil_si64(half)

define zeroext i8 @test_ceil_ui8(half %x) {
  %a = call half @llvm.ceil.f16(half %x)
  %C = fcmp ule half +qnan, %a
  %b = fptoui half %a to i8
  store i1 %C, ptr @G, align 1
  ret i8 %b
}

declare zeroext i16 @test_ceil_ui16(half)

declare signext i32 @test_ceil_ui32(half)

declare i64 @test_ceil_ui64(half)

declare signext i8 @test_trunc_si8(half)

declare signext i16 @test_trunc_si16(half)

declare signext i32 @test_trunc_si32(half)

define i64 @test_trunc_si64(half %x) {
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %LGV = load i8, ptr @G.1, align 1
  %C = fcmp olt half %x, %x
  %a = call half @llvm.trunc.f16(half %x)
  %b = fptosi half %a to i64
  %B = or i8 16, %LGV
  store i8 %B, ptr %A, align 1
  store i1 %C, ptr poison, align 1
  ret i64 %b
}

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

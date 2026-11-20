; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+zfh,+a,+zfa,+zcb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i8 127
@G.2 = global <4 x float> zeroinitializer
@G.3 = global i1 true
@G.4 = global <4 x i1> zeroinitializer
@G.5 = global ptr poison
@G.6 = global half 6.550400e+04
@G.7 = global half +inf

declare signext i8 @test_floor_si8(half)

declare signext i16 @test_floor_si16(half)

declare signext i32 @test_floor_si32(half)

declare i64 @test_floor_si64(half)

define zeroext i8 @test_floor_ui8(half %x) {
  %LGV1 = load half, ptr @G.6, align 2
  %C2 = fcmp ueq half %x, %LGV1
  %a = call half @llvm.floor.f16(half %x)
  %b = fptoui half %a to i8
  store i1 %C2, ptr @G, align 1
  ret i8 %b
}

declare zeroext i16 @test_floor_ui16(half)

declare signext i32 @test_floor_ui32(half)

declare i64 @test_floor_ui64(half)

declare signext i8 @test_ceil_si8(half)

declare signext i16 @test_ceil_si16(half)

define signext i32 @test_ceil_si32(half %x) {
  %A = alloca i1, align 1
  %L = load i1, ptr %A, align 1
  %G = getelementptr half, ptr %A, i1 %L
  %L1 = load half, ptr %G, align 2
  %G4 = getelementptr i8, ptr %G, i1 %L
  store i1 poison, ptr %A, align 1
  %a = call half @llvm.ceil.f16(half %x)
  %b = fptosi half %a to i32
  %C2 = fcmp ueq half %x, %L1
  store i1 %C2, ptr %A, align 1
  store ptr %G, ptr poison, align 8
  store ptr %G4, ptr @G.5, align 8
  ret i32 %b
}

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

define zeroext i8 @test_round_ui8(half %x) {
  %C = fcmp oge half %x, %x
  %a = call half @llvm.round.f16(half %x)
  %b = fptoui half %a to i8
  store i1 %C, ptr @G, align 1
  %C1 = icmp ne i1 %C, %C
  store i1 %C1, ptr @G.3, align 1
  ret i8 %b
}

declare zeroext i16 @test_round_ui16(half)

declare signext i32 @test_round_ui32(half)

declare i64 @test_round_ui64(half)

declare signext i8 @test_roundeven_si8(half)

declare signext i16 @test_roundeven_si16(half)

define signext i32 @test_roundeven_si32(half %x) {
  %A4 = alloca i1, align 1
  store i1 poison, ptr %A4, align 1
  %A = alloca i1, align 1
  %L = load <4 x float>, ptr %A, align 16
  store i1 poison, ptr %A, align 1
  %C2 = fcmp ult <4 x float> %L, splat (float f0x7F7FFFFF)
  %C = fcmp ugt float 1.000000e+00, 1.401300e-45
  %a = call half @llvm.roundeven.f16(half %x)
  %b = fptosi half %a to i32
  store i1 %C, ptr %A, align 1
  store <4 x i1> %C2, ptr @G.4, align 1
  %C3 = fcmp false half %x, %a
  store i1 %C3, ptr %A4, align 1
  ret i32 %b
}

declare i64 @test_roundeven_si64(half)

declare zeroext i8 @test_roundeven_ui8(half)

declare zeroext i16 @test_roundeven_ui16(half)

declare signext i32 @test_roundeven_ui32(half)

define i64 @test_roundeven_ui64(half %x) {
  %LGV = load half, ptr @G.7, align 2
  %B = and i8 127, 42
  %a = call half @llvm.roundeven.f16(half %x)
  %b = fptoui half %a to i64
  store i8 %B, ptr @G.1, align 1
  %C = fcmp true half 6.550400e+04, %LGV
  store i1 %C, ptr @G.3, align 1
  ret i64 %b
}

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

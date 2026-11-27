; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+zfh,+zfa,+zbs -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i8 127
@G.2 = global <4 x float> zeroinitializer
@G.3 = global i1 true
@G.4 = global <2 x i64> zeroinitializer
@G.5 = global bfloat 9.183550e-41
@G.6 = global i1 true
@G.7 = global float +qnan
@G.8 = global i1 false
@G.9 = global half 1.000000e+00
@G.10 = global i128 170141183460469231731687303715884105727
@G.11 = global half 4.200000e+01

declare signext i8 @test_floor_si8(half)

declare signext i16 @test_floor_si16(half)

declare signext i32 @test_floor_si32(half)

declare i64 @test_floor_si64(half)

declare zeroext i8 @test_floor_ui8(half)

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

define zeroext i8 @test_round_ui8(half %x) {
  %A6 = alloca i1, align 1
  store i1 poison, ptr %A6, align 1
  %A = alloca half, align 2
  %L = load float, ptr %A, align 4
  %B4 = fadd half %x, 4.200000e+01
  store half poison, ptr %A, align 2
  %LGV3 = load half, ptr @G.9, align 2
  %LGV = load float, ptr @G.7, align 4
  %C = fcmp oge half %x, %x
  %B1 = fmul half %x, %x
  %C2 = fcmp uno float %LGV, %L
  %B = udiv i128 18446744073709551616, 1
  %a = call half @llvm.round.f16(half %x)
  br label %BB

BB:                                               ; preds = %0
  %C9 = fcmp true half %B4, %x
  %b = fptoui half %a to i8
  %C4 = fcmp uno half %x, %LGV3
  store i1 %C, ptr @G, align 1
  store i1 %C2, ptr @G, align 1
  store i1 %C4, ptr @G.8, align 1
  %C8 = fcmp uge half %x, %x
  store i128 %B, ptr @G.10, align 4
  store half %B1, ptr %A, align 2
  store half %B4, ptr @G.11, align 2
  store i1 %C8, ptr %A6, align 1
  store i1 %C9, ptr @G.6, align 1
  ret i8 %b
}

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

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+zvkb,+m -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 0.000000e+00
@G.1 = global i1 false
@G.2 = global <4 x i32> splat (i32 65536)
@G.3 = global i1 false
@G.4 = global i64 -1
@G.5 = global i64 -9223372036854775808
@G.6 = global i16 256
@G.7 = global i128 18446744073709551616

declare signext i8 @test_floor_si8(double)

declare signext i16 @test_floor_si16(double)

declare signext i32 @test_floor_si32(double)

declare i64 @test_floor_si64(double)

declare zeroext i8 @test_floor_ui8(double)

define zeroext i16 @test_floor_ui16(double %x) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %a = call double @llvm.floor.f64(double %x)
  %b = fptoui double %a to i16
  %C = fcmp ord double %x, 4.940660e-324
  %B = ashr i1 %C, %C
  store i1 %C, ptr @G.3, align 1
  store i1 %B, ptr %A, align 1
  ret i16 %b
}

declare signext i32 @test_floor_ui32(double)

declare i64 @test_floor_ui64(double)

declare signext i8 @test_ceil_si8(double)

declare signext i16 @test_ceil_si16(double)

declare signext i32 @test_ceil_si32(double)

declare i64 @test_ceil_si64(double)

declare zeroext i8 @test_ceil_ui8(double)

declare zeroext i16 @test_ceil_ui16(double)

declare signext i32 @test_ceil_ui32(double)

declare i64 @test_ceil_ui64(double)

declare signext i8 @test_trunc_si8(double)

declare signext i16 @test_trunc_si16(double)

declare signext i32 @test_trunc_si32(double)

declare i64 @test_trunc_si64(double)

declare zeroext i8 @test_trunc_ui8(double)

declare zeroext i16 @test_trunc_ui16(double)

declare signext i32 @test_trunc_ui32(double)

declare i64 @test_trunc_ui64(double)

declare signext i8 @test_round_si8(double)

declare signext i16 @test_round_si16(double)

declare signext i32 @test_round_si32(double)

declare i64 @test_round_si64(double)

declare zeroext i8 @test_round_ui8(double)

declare zeroext i16 @test_round_ui16(double)

declare signext i32 @test_round_ui32(double)

declare i64 @test_round_ui64(double)

declare signext i8 @test_roundeven_si8(double)

declare signext i16 @test_roundeven_si16(double)

declare signext i32 @test_roundeven_si32(double)

declare i64 @test_roundeven_si64(double)

declare zeroext i8 @test_roundeven_ui8(double)

declare zeroext i16 @test_roundeven_ui16(double)

declare signext i32 @test_roundeven_ui32(double)

declare i64 @test_roundeven_ui64(double)

declare double @test_floor_double(double)

declare double @test_ceil_double(double)

declare double @test_trunc_double(double)

declare double @test_round_double(double)

declare double @test_roundeven_double(double)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.ceil.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.floor.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.round.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.roundeven.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.trunc.f64(double) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

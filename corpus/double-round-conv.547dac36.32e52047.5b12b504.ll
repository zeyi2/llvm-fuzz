; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+zvkb,+m,+a -O2
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
  %a = call double @llvm.floor.f64(double %x)
  %b = fptoui double %a to i16
  %C = fcmp ord double %x, 4.940660e-324
  store i1 %C, ptr @G.3, align 1
  %C1 = fcmp oge double %x, %x
  store i1 %C1, ptr @G.1, align 1
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

define signext i16 @test_trunc_si16(double %x) {
  %C1 = fcmp true half 5.960460e-08, 1.000000e+00
  %LGV2 = load i16, ptr @G.6, align 2
  %LGV = load double, ptr @G, align 8
  %a = call double @llvm.trunc.f64(double %x)
  %b = fptosi double %a to i16
  %C = fcmp uno double %a, %LGV
  store i1 %C, ptr @G.1, align 1
  %C2 = fcmp ogt double %x, %x
  %B = ashr i16 %b, %LGV2
  store i1 %C1, ptr poison, align 1
  store i1 %C2, ptr @G.3, align 1
  ret i16 %B
}

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

define double @test_roundeven_double(double %x) {
  %C1 = fcmp ord double %x, %x
  %C2 = fcmp ule double %x, 0.000000e+00
  %a = call double @llvm.roundeven.f64(double %x)
  %C = fcmp uge <4 x float> splat (float f0x7F7FFFFF), splat (float 4.200000e+01)
  store <4 x i1> %C, ptr poison, align 1
  store i1 %C2, ptr @G.1, align 1
  store i1 %C1, ptr @G.1, align 1
  ret double %a
}

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

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+zvkb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 0.000000e+00
@G.1 = global i1 false
@G.2 = global <4 x i32> splat (i32 65536)
@G.3 = global i1 false
@G.4 = global <4 x i1> splat (i1 true)
@G.5 = global <4 x i1> zeroinitializer
@G.6 = global i64 0

declare signext i8 @test_floor_si8(double)

declare signext i16 @test_floor_si16(double)

declare signext i32 @test_floor_si32(double)

declare i64 @test_floor_si64(double)

declare zeroext i8 @test_floor_ui8(double)

define zeroext i16 @test_floor_ui16(double %x) {
  %A3 = alloca i1, align 1
  store i1 poison, ptr %A3, align 1
  %LGV = load <4 x i1>, ptr @G.5, align 1
  %A = alloca <4 x i1>, align 1
  %L = load double, ptr %A, align 8
  store <4 x i1> poison, ptr %A, align 1
  %C1 = fcmp one <4 x float> zeroinitializer, splat (float 1.401300e-45)
  %a = call double @llvm.floor.f64(double %x)
  %B = mul <4 x i1> %C1, %LGV
  %C = fcmp ord double %x, 4.940660e-324
  %b = fptoui double %a to i16
  store i1 %C, ptr @G.3, align 1
  store <4 x i1> %C1, ptr %A, align 1
  %C2 = fcmp ult double %x, %L
  store <4 x i1> %B, ptr @G.5, align 1
  store i1 %C2, ptr %A3, align 1
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
  %LGV = load double, ptr @G, align 8
  %a = call double @llvm.trunc.f64(double %x)
  %b = fptosi double %a to i16
  %C = fcmp uno double %a, %LGV
  store i1 %C, ptr @G.1, align 1
  %B = ashr i1 %C, %C
  store i1 %B, ptr @G.1, align 1
  ret i16 %b
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
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i64, ptr @G.6, align 4
  switch i64 %LGV, label %SW_D [
    i64 -779249402967118523, label %SW_C
    i64 -4735273133402650727, label %SW_C1
    i64 -9211990103963041059, label %SW_C2
    i64 -8527088339702910825, label %SW_C3
    i64 1966110067003100365, label %SW_C4
    i64 -2342979587402856285, label %SW_C5
    i64 -7075652168045167415, label %SW_C6
  ]

BB:                                               ; preds = %SW_C5, %SW_C4, %SW_C3, %SW_C2, %SW_C1, %SW_C, %SW_D
  %a = call double @llvm.roundeven.f64(double %x)
  %C = fcmp uge <4 x float> splat (float f0x7F7FFFFF), splat (float 4.200000e+01)
  %C1 = icmp sgt <4 x i1> %C, %C
  store <4 x i1> %C, ptr poison, align 1
  store <4 x i1> %C1, ptr @G.4, align 1
  ret double %a

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %SW_C1, %0
  %LGV7 = load i1, ptr @G.3, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %SW_C1

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  ret double %x
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

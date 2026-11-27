; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+zihintpause,+zvfh -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i1 true
@G.2 = global i16 42
@G.3 = global i1 false
@G.4 = global <8 x i8> splat (i8 1)
@G.5 = global <8 x i8> zeroinitializer
@G.6 = global <8 x i1> zeroinitializer
@G.7 = global i1 true

define signext i8 @test_floor_si8(double %x) {
  %A2 = alloca i1, align 1
  store i1 false, ptr %A2, align 1
  %LGV = load i16, ptr @G.2, align 2
  %A = alloca double, align 8
  store double poison, ptr %A, align 8
  %a = call double @llvm.floor.f64(double %x)
  switch i16 %LGV, label %SW_D [
    i16 13399, label %SW_C
  ]

BB:                                               ; preds = %SW_C, %SW_D
  %B = fadd double %x, %x
  %b = fptosi double %a to i8
  store double %B, ptr %A, align 8
  ret i8 %b

SW_D:                                             ; preds = %SW_D, %0
  %LGV1 = load i1, ptr @G.1, align 1
  %L = load i1, ptr %A2, align 1
  br i1 %L, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  br label %BB
}

declare signext i16 @test_floor_si16(double)

declare signext i32 @test_floor_si32(double)

declare i64 @test_floor_si64(double)

declare zeroext i8 @test_floor_ui8(double)

define zeroext i16 @test_floor_ui16(double %x) {
  %B = fadd double %x, 4.200000e+01
  %A = alloca i1, align 1
  %C2 = fcmp oge double %x, %B
  store i1 poison, ptr %A, align 1
  %C1 = fcmp uno double %x, 4.200000e+01
  %a = call double @llvm.floor.f64(double %x)
  %C = fcmp false double %a, %x
  %b = fptoui double %a to i16
  store i1 %C, ptr poison, align 1
  store i1 %C1, ptr %A, align 1
  store double %B, ptr %A, align 8
  store i1 %C2, ptr @G.7, align 1
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

define zeroext i8 @test_round_ui8(double %x) {
  %LGV1 = load <8 x i8>, ptr @G.5, align 8
  %LGV = load <8 x i8>, ptr @G.4, align 8
  %a = call double @llvm.round.f64(double %x)
  %b = fptoui double %a to i8
  %C2 = icmp ugt <8 x i8> %LGV, %LGV1
  %C = fcmp ult double %x, %a
  store i1 %C, ptr @G, align 1
  store <8 x i1> %C2, ptr @G.6, align 1
  ret i8 %b
}

declare zeroext i16 @test_round_ui16(double)

declare signext i32 @test_round_ui32(double)

declare i64 @test_round_ui64(double)

declare signext i8 @test_roundeven_si8(double)

declare signext i16 @test_roundeven_si16(double)

declare signext i32 @test_roundeven_si32(double)

declare i64 @test_roundeven_si64(double)

declare zeroext i8 @test_roundeven_ui8(double)

declare zeroext i16 @test_roundeven_ui16(double)

define signext i32 @test_roundeven_ui32(double %x) {
  %LGV = load i1, ptr @G.1, align 1
  %a = call double @llvm.roundeven.f64(double %x)
  br label %BB2

BB2:                                              ; preds = %0
  %b = fptoui double %a to i32
  switch i1 %LGV, label %SW_D [
    i1 false, label %SW_C
  ]

BB:                                               ; preds = %SW_C, %SW_D
  ret i32 %b

SW_D:                                             ; preds = %SW_D, %BB2
  br i1 %LGV, label %BB, label %SW_D

SW_C:                                             ; preds = %BB2
  br label %BB
}

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

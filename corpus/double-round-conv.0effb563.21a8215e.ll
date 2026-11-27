; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+zbs -O3 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i1 true
@G.2 = global double 4.940660e-324

declare signext i8 @test_floor_si8(double)

declare signext i16 @test_floor_si16(double)

declare signext i32 @test_floor_si32(double)

declare i64 @test_floor_si64(double)

declare zeroext i8 @test_floor_ui8(double)

define zeroext i16 @test_floor_ui16(double %x) {
  %LGV = load double, ptr @G.2, align 8
  %C1 = fcmp ord double %x, %LGV
  %a = call double @llvm.floor.f64(double %x)
  %C = fcmp false double %a, %x
  %b = fptoui double %a to i16
  store i1 %C, ptr poison, align 1
  store i1 %C1, ptr @G, align 1
  ret i16 %b
}

declare signext i32 @test_floor_ui32(double)

declare i64 @test_floor_ui64(double)

declare signext i8 @test_ceil_si8(double)

declare signext i16 @test_ceil_si16(double)

declare signext i32 @test_ceil_si32(double)

declare i64 @test_ceil_si64(double)

declare zeroext i8 @test_ceil_ui8(double)

define zeroext i16 @test_ceil_ui16(double %x) {
  %A = alloca i1, align 1
  %L = load double, ptr %A, align 8
  store i1 poison, ptr %A, align 1
  %a = call double @llvm.ceil.f64(double %x)
  %b = fptoui double %a to i16
  %C1 = fcmp ogt double %x, %L
  store i1 %C1, ptr %A, align 1
  ret i16 %b
}

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

define signext i32 @test_round_si32(double %x) {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i1, ptr @G, align 1
  switch i1 %LGV, label %SW_D [
    i1 false, label %SW_C
    i1 true, label %SW_C1
  ]

BB:                                               ; preds = %BB1, %SW_C, %SW_D
  %a = call double @llvm.round.f64(double %x)
  %b = fptosi double %a to i32
  ret i32 %b

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  %LGV2 = load i1, ptr @G.1, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB1:                                              ; preds = %F, %T
  br label %BB

T:                                                ; preds = %SW_C1
  br label %BB1

F:                                                ; preds = %SW_C1
  br label %BB1
}

declare i64 @test_round_si64(double)

define zeroext i8 @test_round_ui8(double %x) {
  %a = call double @llvm.round.f64(double %x)
  %b = fptoui double %a to i8
  %C1 = fcmp ord double %x, %x
  %C = fcmp ult double %x, %a
  store i1 %C, ptr @G, align 1
  store i1 %C1, ptr @G.1, align 1
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

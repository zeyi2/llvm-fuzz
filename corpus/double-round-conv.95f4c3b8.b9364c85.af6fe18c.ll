; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+c -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global double 1.000000e+00
@G.2 = global i32 2147483647
@G.3 = global i64 4294967296
@G.4 = global i1 true
@G.5 = global <2 x i64> splat (i64 -1)
@G.6 = global i32 0

declare signext i8 @test_floor_si8(double)

declare signext i16 @test_floor_si16(double)

declare signext i32 @test_floor_si32(double)

define i64 @test_floor_si64(double %x) {
  %LGV = load double, ptr @G.1, align 8
  %a = call double @llvm.floor.f64(double %x)
  %b = fptosi double %a to i64
  %C5 = fcmp olt bfloat 3.389530e+38, 1.000000e+00
  %C3 = fcmp one double %x, %LGV
  store i1 %C3, ptr poison, align 1
  store i1 %C3, ptr @G.4, align 1
  ret i64 %b
}

declare zeroext i8 @test_floor_ui8(double)

declare zeroext i16 @test_floor_ui16(double)

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

define signext i8 @test_trunc_si8(double %x) {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %a = call double @llvm.trunc.f64(double %x)
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %B = fadd double %x, 4.200000e+01
  br i1 %L, label %T3, label %F4

BB2:                                              ; preds = %T3
  %b = fptosi double %a to i8
  store double %B, ptr @G, align 8
  ret i8 %b

T:                                                ; preds = %0
  %B1 = add <2 x i64> splat (i64 42), splat (i64 -9223372036854775808)
  store <2 x i64> %B1, ptr @G.5, align 16
  br label %BB

F:                                                ; preds = %0
  br label %BB

T3:                                               ; preds = %BB
  br label %BB2

F4:                                               ; preds = %BB
  ret i8 -128
}

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

define i64 @test_roundeven_si64(double %x) {
  %LGV = load i32, ptr @G.2, align 4
  %a = call double @llvm.roundeven.f64(double %x)
  switch i32 %LGV, label %SW_D [
    i32 -1750344068, label %SW_C
    i32 1265060601, label %SW_C1
    i32 1352356223, label %SW_C2
  ]

BB:                                               ; preds = %SW_C2, %SW_C1
  %b = fptosi double %a to i64
  ret i64 %b

SW_D:                                             ; preds = %0
  %LGV3 = load i64, ptr @G.3, align 4
  ret i64 %LGV3

SW_C:                                             ; preds = %0
  %C2 = icmp eq i32 %LGV, %LGV
  store i1 %C2, ptr poison, align 1
  ret i64 1

SW_C1:                                            ; preds = %0
  %B = or i32 %LGV, %LGV
  store i32 %B, ptr @G.6, align 4
  br label %BB

SW_C2:                                            ; preds = %0
  %C = fcmp ult double %x, %a
  store i1 %C, ptr poison, align 1
  br label %BB
}

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

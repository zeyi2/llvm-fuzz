; isel-diff-config: -mtriple=riscv64 -mattr=+zdinx -O2 -code-model=small -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 2147483647
@G.1 = global fp128 0.000000e+00
@G.2 = global i1 true
@G.3 = global i1 false

; Function Attrs: nounwind
declare i32 @test_lrint_ixx_f16(half) #0

; Function Attrs: nounwind
declare i32 @test_llrint_ixx_f16(half) #0

; Function Attrs: nounwind
declare i32 @test_lrint_ixx_f32(float) #0

; Function Attrs: nounwind
define i32 @test_llrint_ixx_f32(float %x) #0 {
  %A12 = alloca i1, align 1
  store i1 true, ptr %A12, align 1
  %A9 = alloca i1, align 1
  store i1 true, ptr %A9, align 1
  %A = alloca i128, align 8
  store i128 -170141183460469231731687303715884105728, ptr %A, align 4
  %res = tail call i32 @llvm.llrint.i32.f32(float %x)
  %L = load i128, ptr %A, align 4
  switch i128 %L, label %SW_D [
    i128 18392030221825445815, label %SW_C
    i128 14532676280810816345, label %SW_C1
    i128 6710861268418782378, label %SW_C2
    i128 6336555626688331148, label %SW_C3
    i128 5129012862388082668, label %SW_C4
    i128 14277563396073945059, label %SW_C5
    i128 7489108477688226731, label %SW_C6
  ]

BB:                                               ; preds = %SW_C5, %SW_C4, %SW_C2, %SW_C1, %SW_C, %SW_D
  ret i32 %res

SW_D:                                             ; preds = %SW_D, %0
  %LGV = load i1, ptr @G.2, align 1
  br i1 %LGV, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %SW_C1, %0
  %LGV7 = load i1, ptr @G.3, align 1
  br i1 %LGV7, label %SW_C1, label %BB

SW_C2:                                            ; preds = %SW_C2, %0
  %LGV8 = load i1, ptr @G.3, align 1
  %L10 = load i1, ptr %A9, align 1
  br i1 %L10, label %BB, label %SW_C2

SW_C3:                                            ; preds = %0
  ret i32 0

SW_C4:                                            ; preds = %SW_C4, %0
  %LGV11 = load i1, ptr @G.2, align 1
  %L13 = load i1, ptr %A12, align 1
  br i1 %L13, label %SW_C4, label %BB

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  %LGV14 = load i32, ptr @G, align 4
  ret i32 42
}

; Function Attrs: nounwind
declare i32 @test_lrint_ixx_f64(double) #0

; Function Attrs: nounwind
define i32 @test_llrint_ixx_f64(double %x) #0 {
  %A = alloca i1, align 1
  %L = load double, ptr %A, align 8
  store i1 poison, ptr %A, align 1
  %C = fcmp ord double %x, %x
  %res = tail call i32 @llvm.llrint.i32.f64(double %x)
  store i1 %C, ptr %A, align 1
  %C1 = fcmp olt double %x, %L
  store i1 %C1, ptr poison, align 1
  ret i32 %res
}

; Function Attrs: nounwind
define i32 @test_lrint_ixx_f128(fp128 %x) #0 {
  %B = and i32 -2147483648, 2147483647
  %res = tail call i32 @llvm.lrint.i32.f128(fp128 %x)
  store i32 %B, ptr @G, align 4
  %C = fcmp ole fp128 %x, +inf
  store i1 %C, ptr @G.2, align 1
  ret i32 %res
}

; Function Attrs: nounwind
define i32 @test_llrint_ixx_f128(fp128 %x) #0 {
  %res = tail call i32 @llvm.llrint.i32.f128(fp128 %x)
  %B = fdiv fp128 %x, %x
  store fp128 %B, ptr @G.1, align 16
  ret i32 %res
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.llrint.i32.f128(fp128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.llrint.i32.f16(half) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.llrint.i32.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.llrint.i32.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lrint.i32.f128(fp128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lrint.i32.f16(half) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lrint.i32.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lrint.i32.f64(double) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32f -mattr=+zhinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -128
@G.1 = global i1 false
@G.2 = global i1 true
@G.3 = global i128 -1
@G.4 = global i128 170141183460469231731687303715884105727
@G.5 = global half 5.960460e-08
@G.6 = global i1 false

declare i32 @stest_f64i32(double)

declare i32 @utest_f64i32(double)

declare i32 @ustest_f64i32(double)

declare i32 @stest_f32i32(float)

declare i32 @utest_f32i32(float)

declare i32 @ustest_f32i32(float)

declare i32 @stest_f16i32(half)

declare i32 @utest_f16i32(half)

declare i32 @ustest_f16i32(half)

declare i16 @stest_f64i16(double)

declare i16 @utest_f64i16(double)

declare i16 @ustest_f64i16(double)

declare i16 @stest_f32i16(float)

declare i16 @utest_f32i16(float)

declare i16 @ustest_f32i16(float)

declare i16 @stest_f16i16(half)

declare i16 @utest_f16i16(half)

define i16 @ustest_f16i16(half %x) {
entry:
  %conv = fptosi half %x to i32
  %0 = icmp slt i32 %conv, 65535
  %spec.store.select = select i1 %0, i32 %conv, i32 65535
  %C = fcmp ueq half 6.550400e+04, +inf
  %spec.store.select7 = select i1 %C, i32 %spec.store.select, i32 0
  %conv6 = trunc i32 %spec.store.select7 to i16
  ret i16 %conv6
}

declare i64 @stest_f64i64(double)

declare i64 @utest_f64i64(double)

declare i64 @ustest_f64i64(double)

declare i64 @stest_f32i64(float)

declare i64 @utest_f32i64(float)

declare i64 @ustest_f32i64(float)

declare i64 @stest_f16i64(half)

declare i64 @utesth_f16i64(half)

declare i64 @ustest_f16i64(half)

declare i32 @stest_f64i32_mm(double)

declare i32 @utest_f64i32_mm(double)

declare i32 @ustest_f64i32_mm(double)

declare i32 @stest_f32i32_mm(float)

declare i32 @utest_f32i32_mm(float)

declare i32 @ustest_f32i32_mm(float)

declare i32 @stest_f16i32_mm(half)

define i32 @utesth_f16i32_mm(half %x) {
entry:
  %LGV = load half, ptr @G.5, align 2
  %conv = fptoui half %x to i64
  %spec.store.select = call i64 @llvm.umin.i64(i64 %conv, i64 4294967295)
  %conv6 = trunc i64 %spec.store.select to i32
  %C = fcmp uge half %x, %LGV
  store i1 %C, ptr poison, align 1
  ret i32 %conv6
}

declare i32 @ustest_f16i32_mm(half)

declare i16 @stest_f64i16_mm(double)

declare i16 @utest_f64i16_mm(double)

define i16 @ustest_f64i16_mm(double %x) {
entry:
  %A12 = alloca i1, align 1
  store i1 true, ptr %A12, align 1
  %A9 = alloca i1, align 1
  store i1 false, ptr %A9, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i8, ptr @G, align 1
  %conv = fptosi double %x to i32
  switch i8 %LGV, label %SW_D [
    i8 59, label %SW_C
    i8 72, label %SW_C1
    i8 120, label %SW_C2
    i8 -89, label %SW_C3
    i8 -104, label %SW_C4
    i8 119, label %SW_C5
    i8 -19, label %SW_C6
    i8 42, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C6, %SW_C5, %SW_C4, %SW_C3, %SW_C2, %SW_C1, %SW_C, %SW_D
  %spec.store.select = call i32 @llvm.smin.i32(i32 %conv, i32 65535)
  %spec.store.select7 = call i32 @llvm.smax.i32(i32 %spec.store.select, i32 0)
  %conv6 = trunc i32 %spec.store.select7 to i16
  ret i16 %conv6

SW_D:                                             ; preds = %entry
  br label %BB

SW_C:                                             ; preds = %SW_C, %entry
  %LGV8 = load i1, ptr @G.1, align 1
  br i1 %LGV8, label %SW_C, label %BB

SW_C1:                                            ; preds = %entry
  br label %BB

SW_C2:                                            ; preds = %SW_C2, %entry
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_C2, label %BB

SW_C3:                                            ; preds = %SW_C3, %entry
  %L10 = load i1, ptr %A9, align 1
  br i1 %L10, label %SW_C3, label %BB

SW_C4:                                            ; preds = %entry
  br label %BB

SW_C5:                                            ; preds = %SW_C5, %entry
  %LGV11 = load i1, ptr @G.2, align 1
  br i1 %LGV11, label %BB, label %SW_C5

SW_C6:                                            ; preds = %entry
  br label %BB

SW_C7:                                            ; preds = %SW_C7, %entry
  %L13 = load i1, ptr %A12, align 1
  br i1 %L13, label %BB, label %SW_C7
}

declare i16 @stest_f32i16_mm(float)

declare i16 @utest_f32i16_mm(float)

declare i16 @ustest_f32i16_mm(float)

declare i16 @stest_f16i16_mm(half)

declare i16 @utesth_f16i16_mm(half)

declare i16 @ustest_f16i16_mm(half)

declare i64 @stest_f64i64_mm(double)

declare i64 @utest_f64i64_mm(double)

define i64 @ustest_f64i64_mm(double %x) {
entry:
  %LGV = load i128, ptr @G.3, align 4
  %conv = fptosi double %x to i128
  %B = or i128 %conv, %LGV
  %spec.store.select = call i128 @llvm.smin.i128(i128 %conv, i128 18446744073709551616)
  %spec.store.select7 = call i128 @llvm.smax.i128(i128 %spec.store.select, i128 0)
  %conv6 = trunc i128 %spec.store.select7 to i64
  store i128 %B, ptr @G.4, align 4
  ret i64 %conv6
}

declare i64 @stest_f32i64_mm(float)

declare i64 @utest_f32i64_mm(float)

define i64 @ustest_f32i64_mm(float %x) {
entry:
  %conv = fptosi float %x to i128
  %spec.store.select = call i128 @llvm.smin.i128(i128 %conv, i128 18446744073709551616)
  %spec.store.select7 = call i128 @llvm.smax.i128(i128 %spec.store.select, i128 0)
  %conv6 = trunc i128 %spec.store.select7 to i64
  store i128 %spec.store.select7, ptr poison, align 4
  ret i64 %conv6
}

define i64 @stest_f16i64_mm(half %x) {
entry:
  %LGV1 = load i1, ptr @G.6, align 1
  %C = icmp ugt i1 false, %LGV1
  %conv = fptosi half %x to i128
  %spec.store.select = call i128 @llvm.smin.i128(i128 %conv, i128 9223372036854775807)
  %spec.store.select7 = call i128 @llvm.smax.i128(i128 %spec.store.select, i128 -9223372036854775808)
  %conv6 = trunc i128 %spec.store.select7 to i64
  store i1 %C, ptr @G.6, align 1
  ret i64 %conv6
}

declare i64 @utesth_f16i64_mm(half)

declare i64 @ustest_f16i64_mm(half)

declare i32 @ustest_f16i32_nsat(half)

declare i32 @utest_f32i32_zero(float)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.smax.i128(i128, i128) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.smin.i128(i128, i128) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.umin.i128(i128, i128) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

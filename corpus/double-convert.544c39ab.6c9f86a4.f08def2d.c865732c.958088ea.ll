; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32d -mattr=+d,+zvbb,+zfhmin -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 -1)
@G.1 = global i64 -9223372036854775808
@G.2 = global i8 -128
@G.3 = global i8 42
@G.4 = global i64 0
@G.5 = global i1 true
@G.6 = global i1 false
@G.7 = global i32 -2147483648
@G.8 = global float 0.000000e+00
@G.9 = global double 4.940660e-324
@G.10 = global ptr poison
@G.11 = global i16 42
@G.12 = global i16 256
@G.13 = global half +inf
@G.14 = global double 4.200000e+01
@G.15 = global i1 false
@G.16 = global i128 42
@G.17 = global i1 false
@G.18 = global double 4.200000e+01

; Function Attrs: nounwind
declare float @fcvt_s_d(double) #0

; Function Attrs: nounwind
declare double @fcvt_d_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_d(double) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_d_sat(double) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_d(double) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_d_multiple_use(double, ptr) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_d_sat(double) #0

; Function Attrs: nounwind
define double @fcvt_d_w(i32 %a) #0 {
  %A13 = alloca i1, align 1
  store i1 false, ptr %A13, align 1
  %A8 = alloca i1, align 1
  store i1 false, ptr %A8, align 1
  %A3 = alloca i1, align 1
  store i1 true, ptr %A3, align 1
  %A9 = alloca i1, align 1
  store i1 false, ptr %A9, align 1
  %A7 = alloca i1, align 1
  store i1 false, ptr %A7, align 1
  %A2 = alloca i8, align 1
  store i8 42, ptr %A2, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV2 = load float, ptr @G.8, align 4
  %LGV = load <2 x i64>, ptr @G, align 16
  %L3 = load i8, ptr %A2, align 1
  switch i8 %L3, label %SW_D [
    i8 -127, label %SW_C
    i8 -66, label %SW_C4
    i8 -27, label %SW_C5
    i8 -60, label %SW_C6
  ]

BB:                                               ; preds = %BB1, %SW_C4, %SW_C, %BB6
  %C = fcmp olt float 4.200000e+01, %LGV2
  %1 = sitofp i32 %a to double
  %E = extractelement <2 x i64> %LGV, i16 42
  store i64 %E, ptr @G.1, align 4
  %C5 = icmp sgt i1 %C, false
  store i1 %C5, ptr %A, align 1
  ret double %1

SW_D:                                             ; preds = %0
  %LGV7 = load i1, ptr @G.17, align 1
  %L9 = load i1, ptr %A8, align 1
  switch i1 %L9, label %SW_D10 [
    i1 false, label %SW_C11
    i1 true, label %SW_C12
  ]

BB6:                                              ; preds = %SW_C12, %SW_C11, %SW_D10
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %L8 = load i1, ptr %A7, align 1
  br i1 %L8, label %BB, label %SW_C

SW_C4:                                            ; preds = %SW_C4, %0
  %L10 = load i1, ptr %A9, align 1
  br i1 %L10, label %BB, label %SW_C4

SW_C5:                                            ; preds = %0
  %G = getelementptr double, ptr %A2, i128 0
  store ptr %G, ptr poison, align 8
  ret double +inf

SW_C6:                                            ; preds = %0
  %LGV3 = load half, ptr @G.13, align 2
  %C4 = fcmp ugt half +inf, %LGV3
  store i1 %C4, ptr poison, align 1
  %L = load i1, ptr %A3, align 1
  br i1 %L, label %T, label %F

BB1:                                              ; preds = %T
  br label %BB

T:                                                ; preds = %SW_C6
  br label %BB1

F:                                                ; preds = %SW_C6
  %LGV4 = load double, ptr @G.18, align 8
  ret double %LGV4

SW_D10:                                           ; preds = %SW_D10, %SW_D
  %L14 = load i1, ptr %A13, align 1
  br i1 %L14, label %BB6, label %SW_D10

SW_C11:                                           ; preds = %SW_D
  br label %BB6

SW_C12:                                           ; preds = %SW_D
  br label %BB6
}

; Function Attrs: nounwind
declare double @fcvt_d_w_load(ptr) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu(i32) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu_load(ptr) #0

; Function Attrs: nounwind
declare i64 @fcvt_l_d(double) #0

; Function Attrs: nounwind
declare i64 @fcvt_l_d_sat(double) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_d(double) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_d_sat(double) #0

; Function Attrs: nounwind
declare i64 @fmv_x_d(double, double) #0

; Function Attrs: nounwind
declare double @fcvt_d_l(i64) #0

; Function Attrs: nounwind
declare double @fcvt_d_lu(i64) #0

; Function Attrs: nounwind
declare double @fmv_d_x(i64, i64) #0

; Function Attrs: nounwind
declare double @fcvt_d_w_i8(i8 signext) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu_i8(i8 zeroext) #0

; Function Attrs: nounwind
declare double @fcvt_d_w_i16(i16 signext) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu_i16(i16 zeroext) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_d_w_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_d_wu_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_i16(double) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_sat_i16(double) #0

; Function Attrs: nounwind
define zeroext i16 @fcvt_wu_s_i16(double %a) #0 {
  %LGV = load i128, ptr @G.16, align 4
  %LGV3 = load double, ptr @G.14, align 8
  %C6 = fcmp uno double %a, %LGV3
  %LGV2 = load i16, ptr @G.12, align 2
  %LGV1 = load i16, ptr @G.11, align 2
  %C4 = fcmp ugt double %a, %LGV3
  %A3 = alloca i1, align 1
  store i1 poison, ptr %A3, align 1
  %A = alloca i16, align 2
  %B = fmul double %a, %a
  switch i128 %LGV, label %SW_D [
    i128 6395662138407026000, label %SW_C
    i128 16668821262428382996, label %SW_C6
    i128 457994555682791513, label %SW_C7
    i128 17188263085581952295, label %SW_C8
  ]

BB:                                               ; preds = %SW_C8, %SW_C, %SW_D
  store i16 poison, ptr %A, align 2
  %G = getelementptr ptr, ptr %A3, i16 42
  %1 = fptoui double %B to i16
  store i16 %1, ptr %A, align 2
  store i1 %C6, ptr @G.6, align 1
  %C3 = icmp ugt i16 %LGV1, %LGV2
  store i1 %C4, ptr %A3, align 1
  store i1 %C3, ptr @G.5, align 1
  store ptr %G, ptr %A3, align 8
  ret i16 %1

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  ret i16 256

SW_C7:                                            ; preds = %0
  ret i16 %LGV2

SW_C8:                                            ; preds = %SW_C8, %0
  %B8 = and i1 %C6, true
  br i1 %B8, label %BB, label %SW_C8
}

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(double) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(double) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(double) #0

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_i8(double) #0

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_sat_i8(double) #0

; Function Attrs: nounwind
declare zeroext i32 @fcvt_wu_d_sat_zext(double) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_w_d_sat_sext(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fptosi.sat.i16.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fptosi.sat.i32.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fptosi.sat.i64.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fptosi.sat.i8.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fptoui.sat.i16.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fptoui.sat.i32.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fptoui.sat.i64.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fptoui.sat.i8.f64(double) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

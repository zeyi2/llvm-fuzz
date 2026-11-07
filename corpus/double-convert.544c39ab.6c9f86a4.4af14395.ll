; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32d -mattr=+d -O3
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
@G.10 = global i16 0
@G.11 = global ptr poison
@G.12 = global i128 1
@G.13 = global i16 1

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
  %A5 = alloca i1, align 1
  store i1 poison, ptr %A5, align 1
  %LGV3 = load i16, ptr @G.10, align 2
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV2 = load float, ptr @G.8, align 4
  %LGV = load <2 x i64>, ptr @G, align 16
  %C = fcmp olt float 4.200000e+01, %LGV2
  %1 = sitofp i32 %a to double
  %E = extractelement <2 x i64> %LGV, i16 42
  %C4 = icmp sgt i16 1, %LGV3
  store i64 %E, ptr @G.1, align 4
  store i1 %C, ptr %A, align 1
  store i1 %C4, ptr %A5, align 1
  ret double %1
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
  %A18 = alloca i1, align 1
  store i1 false, ptr %A18, align 1
  %A16 = alloca i1, align 1
  store i1 true, ptr %A16, align 1
  %A12 = alloca i1, align 1
  store i1 false, ptr %A12, align 1
  %LGV = load i128, ptr @G.12, align 4
  %A3 = alloca i1, align 1
  %L2 = load i8, ptr %A3, align 1
  switch i128 %LGV, label %SW_D [
    i128 1999989436157616080, label %SW_C
    i128 6258997091237809186, label %SW_C3
    i128 10730762428462609210, label %SW_C4
    i128 5284503933370204882, label %SW_C5
    i128 1983333870502546539, label %SW_C6
    i128 2047869960501462256, label %SW_C7
    i128 8267119587544375007, label %SW_C8
    i128 8170102660834912899, label %SW_C9
  ]

BB:                                               ; preds = %SW_C9, %SW_C8, %SW_C7, %SW_C5, %SW_C4, %SW_D
  %G = getelementptr double, ptr %A3, i8 %L2
  %1 = fptoui double %a to i16
  %A = alloca i16, align 2
  store i1 poison, ptr %A3, align 1
  store i16 poison, ptr %A, align 2
  %L = load double, ptr %A, align 8
  %L1 = load float, ptr %A, align 4
  %C = fcmp uno float +inf, %L1
  store i16 %1, ptr %A, align 2
  store i1 %C, ptr @G.6, align 1
  %C1 = fcmp one double %a, %L
  store i1 %C1, ptr %A3, align 1
  store ptr %G, ptr @G.11, align 8
  ret i16 %1

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %LGV10 = load i16, ptr @G.10, align 2
  ret i16 0

SW_C3:                                            ; preds = %0
  %LGV11 = load i16, ptr @G.13, align 2
  ret i16 %LGV11

SW_C4:                                            ; preds = %SW_C4, %0
  %L13 = load i1, ptr %A12, align 1
  br i1 %L13, label %SW_C4, label %BB

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  %LGV14 = load i16, ptr @G.13, align 2
  ret i16 -1

SW_C7:                                            ; preds = %0
  br label %BB

SW_C8:                                            ; preds = %SW_C8, %0
  %LGV15 = load i1, ptr @G.5, align 1
  %L17 = load i1, ptr %A16, align 1
  br i1 %L17, label %BB, label %SW_C8

SW_C9:                                            ; preds = %SW_C9, %0
  %L19 = load i1, ptr %A18, align 1
  br i1 %L19, label %SW_C9, label %BB
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
define zeroext i32 @fcvt_wu_d_sat_zext(double %a) #0 {
start:
  %A12 = alloca i1, align 1
  store i1 false, ptr %A12, align 1
  %A10 = alloca i1, align 1
  %L1 = load float, ptr %A10, align 4
  store i1 false, ptr %A10, align 1
  %LGV2 = load i64, ptr @G.4, align 4
  %C5 = fcmp one float %L1, 1.000000e+00
  %A = alloca i8, align 1
  %L = load i64, ptr %A, align 4
  store i8 poison, ptr %A, align 1
  %LGV1 = load i8, ptr @G.3, align 1
  %C3 = icmp uge i64 %L, %LGV2
  switch i8 %LGV1, label %SW_D [
    i8 91, label %SW_C
    i8 -104, label %SW_C4
    i8 -58, label %SW_C5
    i8 -127, label %SW_C6
    i8 -64, label %SW_C7
    i8 126, label %SW_C8
  ]

BB:                                               ; preds = %SW_C8, %SW_C7, %SW_C6, %SW_C, %SW_D
  %LGV = load i8, ptr @G.2, align 1
  %C14 = icmp uge i128 18446744073709551616, -170141183460469231731687303715884105728
  %0 = tail call i32 @llvm.fptoui.sat.i32.f64(double %a)
  %C = icmp uge i1 %C14, true
  %B = lshr i8 %LGV, %LGV1
  store i1 %C, ptr poison, align 1
  store i8 %B, ptr %A, align 1
  store i1 %C3, ptr @G.5, align 1
  ret i32 %0

SW_D:                                             ; preds = %start
  br label %BB

SW_C:                                             ; preds = %SW_C, %start
  %G = getelementptr <8 x i8>, ptr %A10, i1 true
  store ptr %G, ptr %A12, align 8
  br i1 %C3, label %SW_C, label %BB

SW_C4:                                            ; preds = %start
  ret i32 65536

SW_C5:                                            ; preds = %start
  %LGV9 = load i32, ptr @G.7, align 4
  ret i32 %LGV9

SW_C6:                                            ; preds = %start
  br label %BB

SW_C7:                                            ; preds = %SW_C7, %start
  br i1 %C5, label %SW_C7, label %BB

SW_C8:                                            ; preds = %SW_C8, %start
  %L13 = load i1, ptr %A12, align 1
  br i1 %L13, label %BB, label %SW_C8
}

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

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32d -mattr=+v -O2
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
@G.10 = global i32 42

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
declare double @fcvt_d_w(i32) #0

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
  %A3 = alloca i1, align 1
  store i1 poison, ptr %A3, align 1
  %LGV = load double, ptr @G.9, align 8
  %A = alloca i16, align 2
  %L1 = load float, ptr %A, align 4
  store i16 poison, ptr %A, align 2
  %1 = fptoui double %a to i16
  %C = fcmp uno float +inf, %L1
  store i16 %1, ptr %A, align 2
  %C1 = fcmp oge double %a, %LGV
  store i1 %C, ptr @G.6, align 1
  store i1 %C1, ptr %A3, align 1
  ret i16 %1
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
  %A20 = alloca i1, align 1
  store i1 false, ptr %A20, align 1
  %A2 = alloca i32, align 4
  store i32 0, ptr %A2, align 4
  %A12 = alloca i1, align 1
  store i1 false, ptr %A12, align 1
  %A10 = alloca i1, align 1
  store i1 false, ptr %A10, align 1
  %LGV2 = load i64, ptr @G.4, align 4
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

BB:                                               ; preds = %SW_C8, %SW_C7, %BB1, %SW_C, %SW_D
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
  %L3 = load i32, ptr %A2, align 4
  switch i32 %L3, label %SW_D4 [
    i32 2111934976, label %SW_C9
    i32 885395561, label %SW_C10
    i32 1690656050, label %SW_C11
    i32 841629923, label %SW_C12
    i32 -1032453517, label %SW_C13
    i32 -1974094310, label %SW_C14
    i32 1438495983, label %SW_C15
    i32 -320925257, label %SW_C16
  ]

BB1:                                              ; preds = %SW_C13, %SW_C12, %SW_C11, %SW_C9, %SW_D4
  br label %BB

SW_C7:                                            ; preds = %SW_C7, %start
  %L11 = load i1, ptr %A10, align 1
  br i1 %L11, label %SW_C7, label %BB

SW_C8:                                            ; preds = %SW_C8, %start
  %L13 = load i1, ptr %A12, align 1
  br i1 %L13, label %BB, label %SW_C8

SW_D4:                                            ; preds = %SW_C6
  br label %BB1

SW_C9:                                            ; preds = %SW_C9, %SW_C6
  br i1 %C3, label %BB1, label %SW_C9

SW_C10:                                           ; preds = %SW_C6
  %LGV17 = load i32, ptr @G.10, align 4
  ret i32 %LGV17

SW_C11:                                           ; preds = %SW_C6
  br label %BB1

SW_C12:                                           ; preds = %SW_C12, %SW_C6
  %LGV18 = load i1, ptr @G.6, align 1
  br i1 %C3, label %BB1, label %SW_C12

SW_C13:                                           ; preds = %SW_C13, %SW_C6
  %LGV19 = load i1, ptr @G.5, align 1
  %L21 = load i1, ptr %A20, align 1
  br i1 %L21, label %SW_C13, label %BB1

SW_C14:                                           ; preds = %SW_C6
  ret i32 2147483647

SW_C15:                                           ; preds = %SW_C6
  %LGV22 = load i32, ptr @G.10, align 4
  ret i32 1

SW_C16:                                           ; preds = %SW_C6
  ret i32 -2147483648
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

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32d -mattr=+d,+zvkb -O1
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
@G.10 = global i1 false
@G.11 = global ptr poison
@G.12 = global i16 0

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
  %A6 = alloca ptr, align 8
  store ptr poison, ptr %A6, align 8
  %C3 = fcmp une double %a, %a
  %A3 = alloca i1, align 1
  switch i1 %C3, label %SW_D [
    i1 true, label %SW_C
  ]

BB:                                               ; preds = %SW_C
  store i1 poison, ptr %A3, align 1
  %LGV = load double, ptr @G.9, align 8
  %A = alloca i16, align 2
  %G = getelementptr double, ptr %A3, i1 %C3
  store i16 poison, ptr %A, align 2
  %1 = fptoui double %a to i16
  %C1 = fcmp false double 0.000000e+00, %a
  %C = fcmp oeq double %LGV, %a
  store i16 %1, ptr %A, align 2
  %C2 = fcmp oeq double %a, %LGV
  store i1 %C1, ptr @G.6, align 1
  store i1 %C2, ptr %A3, align 1
  store i1 %C, ptr @G.6, align 1
  store i1 %C3, ptr %A3, align 1
  store ptr %G, ptr %A6, align 8
  ret i16 %1

SW_D:                                             ; preds = %0
  %LGV7 = load i16, ptr @G.12, align 2
  ret i16 %LGV7

SW_C:                                             ; preds = %0
  br label %BB
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

BB:                                               ; preds = %SW_C8, %SW_C7, %SW_C6, %SW_C, %SW_D
  %LGV = load i8, ptr @G.2, align 1
  %C14 = icmp uge i128 18446744073709551616, -170141183460469231731687303715884105728
  %0 = tail call i32 @llvm.fptoui.sat.i32.f64(double %a)
  %C = icmp uge i1 %C14, true
  %C4 = fcmp ueq double %a, %a
  %B = lshr i8 %LGV, %LGV1
  store i1 %C, ptr poison, align 1
  store i8 %B, ptr %A, align 1
  store i1 %C3, ptr @G.5, align 1
  store i1 %C4, ptr @G.10, align 1
  ret i32 %0

SW_D:                                             ; preds = %start
  %C1 = icmp uge i1 false, %C3
  store i1 %C1, ptr %A12, align 1
  br label %BB

SW_C:                                             ; preds = %SW_C, %start
  %G = getelementptr <8 x i8>, ptr %A10, i1 true
  %G6 = getelementptr i32, ptr %A, i8 0
  store ptr %G, ptr %A12, align 8
  store ptr %G6, ptr @G.11, align 8
  br i1 %C3, label %SW_C, label %BB

SW_C4:                                            ; preds = %start
  ret i32 65536

SW_C5:                                            ; preds = %start
  %LGV9 = load i32, ptr @G.7, align 4
  %G1 = getelementptr ptr, ptr %A12, i64 %LGV2
  store ptr %G1, ptr %A12, align 8
  ret i32 %LGV9

SW_C6:                                            ; preds = %start
  %C2 = icmp ule i8 %LGV1, %LGV1
  store i1 %C2, ptr %A12, align 1
  br label %BB

SW_C7:                                            ; preds = %SW_C7, %start
  %L11 = load i1, ptr %A10, align 1
  br i1 %L11, label %SW_C7, label %BB

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

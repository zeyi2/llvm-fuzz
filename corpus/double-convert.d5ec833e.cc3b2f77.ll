; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32d -mattr=+d,+zihintpause -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half +inf
@G.1 = global i1 true
@G.2 = global double 0.000000e+00
@G.3 = global double +inf
@G.4 = global half +inf
@G.5 = global i16 -32768

; Function Attrs: nounwind
define float @fcvt_s_d(double %a) #0 {
  %A4 = alloca i1, align 1
  store i1 false, ptr %A4, align 1
  %A = alloca i1, align 1
  %L3 = load i8, ptr %A, align 1
  %G = getelementptr float, ptr %A, i8 %L3
  store i1 poison, ptr %A, align 1
  %LGV1 = load half, ptr @G.4, align 2
  %C = fcmp false half 4.200000e+01, %LGV1
  %1 = fptrunc double %a to float
  store i1 %C, ptr @G.1, align 1
  %C2 = icmp uge i1 true, false
  store i1 %C2, ptr %A, align 1
  br i1 %C2, label %T, label %F

BB:                                               ; preds = %F, %T
  store ptr %G, ptr poison, align 8
  ret float %1

T:                                                ; preds = %T, %0
  %L = load i1, ptr %A4, align 1
  %B = srem i1 %L, %L
  store i1 %B, ptr %A4, align 1
  br i1 %L, label %T, label %BB

F:                                                ; preds = %0
  br label %BB
}

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
  %A14 = alloca i1, align 1
  store i1 true, ptr %A14, align 1
  %A10 = alloca i1, align 1
  store i1 false, ptr %A10, align 1
  %A = alloca i8, align 1
  store i8 1, ptr %A, align 1
  %L = load i8, ptr %A, align 1
  switch i8 %L, label %SW_D [
    i8 118, label %SW_C
    i8 -55, label %SW_C1
    i8 -84, label %SW_C2
    i8 -125, label %SW_C3
    i8 43, label %SW_C4
    i8 45, label %SW_C5
    i8 -93, label %SW_C6
    i8 -96, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C6, %SW_C4, %SW_C3, %SW_C1, %SW_D
  %LGV = load double, ptr @G.2, align 8
  %C = fcmp ult double %a, %LGV
  %1 = fptoui double %a to i16
  store i1 %C, ptr @G.1, align 1
  ret i16 %1

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %LGV8 = load i16, ptr @G.5, align 2
  ret i16 %LGV8

SW_C1:                                            ; preds = %SW_C1, %0
  %L11 = load i1, ptr %A10, align 1
  br i1 %L11, label %BB, label %SW_C1

SW_C2:                                            ; preds = %0
  %G = getelementptr i8, ptr %A, i8 %L
  store ptr %G, ptr %A14, align 8
  ret i16 32767

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %0
  ret i16 42

SW_C6:                                            ; preds = %SW_C6, %0
  %L15 = load i1, ptr %A14, align 1
  br i1 %L15, label %BB, label %SW_C6

SW_C7:                                            ; preds = %0
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

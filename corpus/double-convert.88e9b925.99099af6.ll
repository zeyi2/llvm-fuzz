; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+zcb -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 1.000000e+00
@G.1 = global i1 true
@G.2 = global double 4.940660e-324

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
define i32 @fcvt_wu_d_sat(double %a) #0 {
start:
  %0 = tail call i32 @llvm.fptoui.sat.i32.f64(double %a)
  %B = lshr i32 %0, 65536
  %C = icmp ne i32 %B, -2147483648
  store i1 %C, ptr poison, align 1
  %C1 = fcmp olt double %a, 0.000000e+00
  store i1 %C1, ptr @G.1, align 1
  ret i32 %B
}

; Function Attrs: nounwind
declare double @fcvt_d_w(i32) #0

; Function Attrs: nounwind
declare double @fcvt_d_w_load(ptr) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu(i32) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu_load(ptr) #0

; Function Attrs: nounwind
define i64 @fcvt_l_d(double %a) #0 {
  %A10 = alloca i1, align 1
  store i1 true, ptr %A10, align 1
  %A8 = alloca i1, align 1
  store i1 true, ptr %A8, align 1
  %A = alloca i128, align 8
  store i128 0, ptr %A, align 4
  %1 = fptosi double %a to i64
  %L = load i128, ptr %A, align 4
  switch i128 %L, label %SW_D [
    i128 9494762973825310219, label %SW_C
    i128 15694892845393198319, label %SW_C1
    i128 16548257106864207290, label %SW_C2
    i128 18069070117257017810, label %SW_C3
    i128 6222219635820513856, label %SW_C4
    i128 4889569268742596136, label %SW_C5
    i128 15247840672320799775, label %SW_C6
    i128 2507433729619432998, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C5, %SW_C4, %SW_C2, %SW_C1, %SW_D
  %B = fsub double %a, %a
  store double %B, ptr @G, align 8
  ret i64 %1

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  ret i64 %1

SW_C1:                                            ; preds = %SW_C1, %0
  %L9 = load i1, ptr %A8, align 1
  br i1 %L9, label %SW_C1, label %BB

SW_C2:                                            ; preds = %SW_C2, %0
  %L11 = load i1, ptr %A10, align 1
  br i1 %L11, label %BB, label %SW_C2

SW_C3:                                            ; preds = %0
  ret i64 0

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  ret i64 42

SW_C7:                                            ; preds = %0
  br label %BB
}

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
declare zeroext i16 @fcvt_wu_s_i16(double) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(double) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(double) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(double) #0

; Function Attrs: nounwind
define zeroext i8 @fcvt_wu_s_i8(double %a) #0 {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %1 = fptoui double %a to i8
  ret i8 %1

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  %C = fcmp true bfloat 3.389530e+38, 1.000000e+00
  store i1 %C, ptr %A, align 1
  br label %BB
}

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

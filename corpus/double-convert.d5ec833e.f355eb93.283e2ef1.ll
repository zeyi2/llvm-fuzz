; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32d -mattr=+d,+zicond,+zcb -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half +inf
@G.1 = global i1 true
@G.2 = global double 0.000000e+00
@G.3 = global double +inf
@G.4 = global i64 9223372036854775807
@G.5 = global i1 false
@G.6 = global i1 false
@G.7 = global i64 0
@G.8 = global <2 x i64> zeroinitializer

; Function Attrs: nounwind
define float @fcvt_s_d(double %a) #0 {
  %A = alloca i1, align 1
  %L = load i1, ptr %A, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i64, ptr @G.4, align 4
  %LGV3 = load double, ptr @G.3, align 8
  %B = add i64 %LGV, %LGV
  %C4 = fcmp false double %a, %LGV3
  %1 = fptrunc double %a to float
  %B2 = mul i1 %C4, %L
  %C12 = fcmp oeq double %a, 1.000000e+00
  store i1 %C4, ptr @G.1, align 1
  store i64 %B, ptr @G.7, align 4
  store i1 %C12, ptr %A, align 1
  store i1 %B2, ptr @G.1, align 1
  switch i64 %LGV, label %SW_D [
    i64 5889813119160041790, label %SW_C
    i64 8589732583429339889, label %SW_C1
    i64 4848913322721487978, label %SW_C2
    i64 -5370311390448789403, label %SW_C3
    i64 -6234516350531601297, label %SW_C4
  ]

BB:                                               ; preds = %SW_C4, %SW_C1, %SW_C, %SW_D
  %C = fcmp uge double %a, %LGV3
  store i1 %C, ptr @G.6, align 1
  ret float %1

SW_D:                                             ; preds = %SW_D, %0
  %LGV9 = load <2 x i64>, ptr @G.8, align 16
  %B10 = shl <2 x i64> splat (i64 4294967296), %LGV9
  store <2 x i64> %B10, ptr @G.8, align 16
  br i1 %C4, label %SW_D, label %BB

SW_C:                                             ; preds = %SW_C, %0
  %LGV5 = load i1, ptr @G.5, align 1
  br i1 %LGV5, label %SW_C, label %BB

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  ret float %1

SW_C3:                                            ; preds = %0
  ret float %1

SW_C4:                                            ; preds = %0
  %B3 = add i1 %L, false
  store i1 %B3, ptr @G.1, align 1
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
  %A = alloca double, align 8
  %L = load double, ptr %A, align 8
  store double poison, ptr %A, align 8
  %LGV = load double, ptr @G.2, align 8
  %C = fcmp ult double %a, %LGV
  %1 = fptoui double %a to i16
  %B = frem double 4.200000e+01, 1.000000e+00
  store i1 %C, ptr @G.1, align 1
  %C1 = fcmp ule double %a, %L
  store i1 %C1, ptr @G.5, align 1
  store double %B, ptr %A, align 8
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

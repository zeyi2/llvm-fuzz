; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+f,+zicond,+zicsr -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <4 x i1> splat (i1 true)
@G.2 = global <4 x i32> splat (i32 -1)
@G.3 = global i32 42
@G.4 = global double 0.000000e+00
@G.5 = global i1 false
@G.6 = global i1 false
@G.7 = global i32 -2147483648

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
  %LGV2 = load double, ptr @G.4, align 8
  %A = alloca <4 x i32>, align 16
  %L = load i8, ptr %A, align 1
  %C = fcmp une double %a, %LGV2
  store <4 x i32> poison, ptr %A, align 16
  %LGV1 = load i32, ptr @G.3, align 4
  %LGV = load <4 x i32>, ptr @G.2, align 16
  %0 = tail call i32 @llvm.fptoui.sat.i32.f64(double %a)
  %I = insertelement <4 x i32> %LGV, i32 %LGV1, i1 false
  store <4 x i32> %I, ptr %A, align 16
  store i1 %C, ptr @G.5, align 1
  switch i8 %L, label %SW_D [
    i8 -73, label %SW_C
    i8 50, label %SW_C3
    i8 71, label %SW_C4
    i8 118, label %SW_C5
    i8 -69, label %SW_C6
    i8 29, label %SW_C7
    i8 55, label %SW_C8
    i8 30, label %SW_C9
  ]

BB:                                               ; preds = %SW_C6, %SW_C5, %SW_C4, %SW_C3, %SW_C, %SW_D
  ret i32 %0

SW_D:                                             ; preds = %start
  br label %BB

SW_C:                                             ; preds = %start
  br label %BB

SW_C3:                                            ; preds = %SW_C3, %start
  %LGV10 = load i1, ptr @G.6, align 1
  br i1 %LGV10, label %SW_C3, label %BB

SW_C4:                                            ; preds = %start
  %B = shl i8 %L, -128
  store i8 %B, ptr %A, align 1
  br label %BB

SW_C5:                                            ; preds = %start
  br label %BB

SW_C6:                                            ; preds = %SW_C6, %start
  br i1 %C, label %BB, label %SW_C6

SW_C7:                                            ; preds = %start
  ret i32 %0

SW_C8:                                            ; preds = %start
  %LGV12 = load i32, ptr @G.7, align 4
  ret i32 %LGV12

SW_C9:                                            ; preds = %start
  ret i32 %0
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
define signext i16 @fcvt_w_s_sat_i16(double %a) #0 {
start:
  %C1 = fcmp false double %a, %a
  %B2 = srem i1 %C1, %C1
  %C = fcmp uge <4 x float> splat (float 4.200000e+01), splat (float 1.401300e-45)
  %0 = tail call i16 @llvm.fptosi.sat.i16.f64(double %a)
  %B = fdiv double %a, 0.000000e+00
  store <4 x i1> %C, ptr @G.1, align 1
  store double %B, ptr poison, align 8
  store i1 %C1, ptr @G, align 1
  store i1 %B2, ptr @G.5, align 1
  ret i16 %0
}

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
  store i1 poison, ptr %A, align 1
  %C = fcmp true double %a, 4.940660e-324
  %C1 = fcmp one double %a, %a
  %1 = fptoui double %a to i8
  store i1 %C, ptr @G, align 1
  store i1 %C1, ptr %A, align 1
  ret i8 %1
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

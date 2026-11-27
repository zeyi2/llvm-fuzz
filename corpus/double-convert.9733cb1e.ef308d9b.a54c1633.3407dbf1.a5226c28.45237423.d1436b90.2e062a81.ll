; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+f,+zicond,+zvbb,+zba,+zfhmin,+zfh -O2
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
@G.8 = global double +inf
@G.9 = global <8 x i8> splat (i8 -128)
@G.10 = global i64 1
@G.11 = global i16 1
@G.12 = global i1 false
@G.13 = global i128 -170141183460469231731687303715884105728
@G.14 = global <4 x i32> splat (i32 65536)
@G.15 = global i1 false
@G.16 = global i8 1
@G.17 = global i1 false
@G.18 = global <4 x float> splat (float 4.200000e+01)
@G.19 = global i8 -128
@G.20 = global bfloat 0.000000e+00

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
define signext i16 @fcvt_w_s_sat_i16(double %a) #0 {
start:
  %A15 = alloca i1, align 1
  store i1 poison, ptr %A15, align 1
  %A8 = alloca i1, align 1
  store i1 false, ptr %A8, align 1
  %A9 = alloca i1, align 1
  store i1 poison, ptr %A9, align 1
  %A6 = alloca <4 x float>, align 16
  %L7 = load i1, ptr %A6, align 1
  %L = load i1, ptr %A6, align 1
  store <4 x float> poison, ptr %A6, align 16
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV2 = load i64, ptr @G.10, align 4
  %LGV = load <8 x i8>, ptr @G.9, align 8
  %B8 = urem i1 %L, %L7
  %C = fcmp uge <4 x float> splat (float 4.200000e+01), splat (float 1.401300e-45)
  %0 = tail call i16 @llvm.fptosi.sat.i16.f64(double %a)
  store i1 %B8, ptr %A9, align 1
  switch i64 %LGV2, label %SW_D [
    i64 3381726621194099071, label %SW_C
  ]

BB:                                               ; preds = %SW_C, %SW_D
  %LGV3 = load i8, ptr @G.19, align 1
  store <4 x i1> %C, ptr @G.1, align 1
  %B1 = shl <8 x i8> splat (i8 1), %LGV
  %B3 = urem i16 %0, -1
  %LGV4 = load <4 x float>, ptr @G.18, align 16
  %B = fdiv double %a, 0.000000e+00
  store <8 x i8> %B1, ptr @G.9, align 8
  %B5 = frem <4 x float> splat (float +inf), %LGV4
  store <4 x float> %B5, ptr %A6, align 16
  store double %B, ptr poison, align 8
  %C2 = fcmp one double %B, %a
  store i1 %C2, ptr poison, align 1
  %B4 = sdiv i1 %C2, false
  switch i8 %LGV3, label %SW_D4 [
    i8 -33, label %SW_C5
    i8 -9, label %SW_C6
    i8 -124, label %SW_C7
  ]

BB1:                                              ; preds = %SW_C7, %SW_C6, %SW_C5, %SW_D4
  %LGV11 = load bfloat, ptr @G.20, align 2
  %C12 = fcmp ogt bfloat 1.000000e+00, %LGV11
  store i1 %C12, ptr @G.12, align 1
  store i1 %B4, ptr @G.5, align 1
  ret i16 %B3

SW_D:                                             ; preds = %start
  %C5 = icmp ult i32 42, 65536
  store i1 %C5, ptr %A, align 1
  br label %BB

SW_C:                                             ; preds = %SW_C, %start
  %LGV1 = load i1, ptr @G.15, align 1
  %B2 = udiv i1 false, %LGV1
  %G = getelementptr i1, ptr %A, i32 65536
  %C1 = fcmp oge double %a, %a
  store ptr %G, ptr poison, align 8
  store i1 %B2, ptr @G.12, align 1
  %C3 = fcmp true double %a, %a
  store i1 %C3, ptr poison, align 1
  br i1 %C1, label %BB, label %SW_C

SW_D4:                                            ; preds = %BB
  %C14 = fcmp ule double %B, 4.200000e+01
  store i1 %C14, ptr %A15, align 1
  br label %BB1

SW_C5:                                            ; preds = %SW_C5, %BB
  %G10 = getelementptr double, ptr %A, i1 %B8
  %L9 = load i1, ptr %A8, align 1
  store ptr %G10, ptr %A8, align 8
  br i1 %L9, label %BB1, label %SW_C5

SW_C6:                                            ; preds = %BB
  br label %BB1

SW_C7:                                            ; preds = %BB
  br label %BB1
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
  %C6 = fcmp false double %a, +inf
  %B7 = sdiv i1 %C6, %C6
  %C4 = fcmp one double %a, 1.000000e+00
  %A3 = alloca i1, align 1
  store i1 poison, ptr %A3, align 1
  %A = alloca i1, align 1
  store i1 %B7, ptr %A, align 1
  %C = fcmp true double %a, 4.940660e-324
  br i1 %C, label %T, label %F

BB:                                               ; preds = %F, %T
  %1 = fptoui double %a to i8
  %B3 = fdiv double %a, %a
  %B = fdiv double %a, %a
  %C1 = fcmp ult double %B3, 0.000000e+00
  store i1 %C, ptr @G, align 1
  store double %B3, ptr @G.8, align 8
  store i1 %C4, ptr %A3, align 1
  store double %B, ptr @G.4, align 8
  %G = getelementptr double, ptr %A, i16 0
  store i1 %C1, ptr @G.17, align 1
  store ptr %G, ptr poison, align 8
  ret i8 %1

T:                                                ; preds = %T, %0
  %B4 = udiv i8 42, 127
  %L = load i1, ptr %A, align 1
  %B1 = or i1 %L, %C6
  store i8 %B4, ptr %A3, align 1
  br i1 %B1, label %T, label %BB

F:                                                ; preds = %0
  %B2 = srem <4 x i32> zeroinitializer, splat (i32 42)
  store <4 x i32> %B2, ptr poison, align 16
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

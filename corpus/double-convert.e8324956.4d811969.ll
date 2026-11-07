; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.401300e-45
@G.1 = global i8 16
@G.2 = global i128 -170141183460469231731687303715884105728
@G.3 = global i1 false
@G.4 = global i16 0
@G.5 = global double +inf
@G.6 = global bfloat 3.389530e+38
@G.7 = global double 4.940660e-324

; Function Attrs: nounwind
define float @fcvt_s_d(double %a) #0 {
  %A = alloca i1, align 1
  %B = fdiv double %a, %a
  store i1 poison, ptr %A, align 1
  %LGV = load float, ptr @G, align 4
  %1 = fptrunc double %a to float
  %C = fcmp ueq float 4.200000e+01, %LGV
  store i1 %C, ptr %A, align 1
  store double %B, ptr @G.5, align 8
  br i1 %C, label %T, label %F

BB:                                               ; preds = %F, %T
  ret float %1

T:                                                ; preds = %0
  br label %BB

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
define double @fcvt_d_w_i16(i16 signext %a) #0 {
  %A11 = alloca i1, align 1
  store i1 true, ptr %A11, align 1
  %A2 = alloca i128, align 8
  store i128 1, ptr %A2, align 4
  %A = alloca i1, align 1
  %L = load i128, ptr %A, align 4
  store i1 poison, ptr %A, align 1
  %LGV1 = load bfloat, ptr @G.6, align 2
  %LGV = load i16, ptr @G.4, align 2
  %1 = sitofp i16 %a to double
  %L3 = load i128, ptr %A2, align 4
  switch i128 %L3, label %SW_D [
    i128 10926337020951753767, label %SW_C
    i128 1994342868654027463, label %SW_C4
    i128 8878716763628889198, label %SW_C5
    i128 12105395906712934761, label %SW_C6
    i128 7358859794257692930, label %SW_C7
    i128 8255886018581489950, label %SW_C8
  ]

BB:                                               ; preds = %SW_C8, %SW_C7, %SW_C4, %SW_C, %SW_D
  %C = fcmp une bfloat 3.389530e+38, %LGV1
  %B = xor i16 %a, %LGV
  store i16 %B, ptr @G.4, align 2
  store i1 %C, ptr %A, align 1
  ret double %1

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %0
  %LGV9 = load double, ptr @G.5, align 8
  ret double 0.000000e+00

SW_C6:                                            ; preds = %0
  %LGV10 = load double, ptr @G.7, align 8
  ret double %LGV10

SW_C7:                                            ; preds = %SW_C7, %0
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %SW_C7, label %BB

SW_C8:                                            ; preds = %0
  br label %BB
}

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
define signext i8 @fcvt_w_s_i8(double %a) #0 {
  %C1 = fcmp uge double %a, %a
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %1 = fptosi double %a to i8
  %C = fcmp ult double %a, %a
  store i1 %C, ptr %A, align 1
  store i1 %C1, ptr @G.3, align 1
  ret i8 %1
}

; Function Attrs: nounwind
define signext i8 @fcvt_w_s_sat_i8(double %a) #0 {
start:
  %C2 = icmp slt <4 x i32> splat (i32 1), splat (i32 65536)
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp true float f0x7F7FFFFF, 0.000000e+00
  %B = urem i1 %C, %C
  %0 = tail call i8 @llvm.fptosi.sat.i8.f64(double %a)
  store i1 %B, ptr %A, align 1
  store <4 x i1> %C2, ptr %A, align 1
  ret i8 %0
}

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

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32d -mattr=+d -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 -1)
@G.1 = global i64 -9223372036854775808
@G.2 = global i128 -1
@G.3 = global i1 false
@G.4 = global i32 -1
@G.5 = global i128 1
@G.6 = global double 1.000000e+00
@G.7 = global i1 false
@G.8 = global i1 false
@G.9 = global ptr poison
@G.10 = global double +qnan

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
  %A2 = alloca i1, align 1
  %L = load i1, ptr %A2, align 1
  store i1 poison, ptr %A2, align 1
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %LGV1 = load i32, ptr @G.4, align 4
  %LGV = load <2 x i64>, ptr @G, align 16
  %1 = sitofp i32 %a to double
  %C = icmp eq i32 %a, %a
  %E = extractelement <2 x i64> %LGV, i16 42
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  store i64 %E, ptr @G.1, align 4
  %B = or i32 %a, %LGV1
  %C3 = icmp ult i128 -1, -1
  %C4 = fcmp true double %1, %1
  store i32 %B, ptr poison, align 4
  store i1 %C, ptr @G.7, align 1
  %B3 = or i64 %E, %E
  store i1 %C3, ptr @G.8, align 1
  store i64 %B3, ptr %A, align 4
  %B1 = sub i1 %C, %C3
  store i1 %C4, ptr poison, align 1
  store i1 %B1, ptr %A2, align 1
  ret double %1

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
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
  %LGV = load double, ptr @G.10, align 8
  %A = alloca i16, align 2
  %G = getelementptr double, ptr %A, i16 1
  store i16 poison, ptr %A, align 2
  %C = fcmp ogt double +inf, %a
  %1 = fptoui double %a to i16
  store i16 %1, ptr %A, align 2
  store i1 %C, ptr @G.3, align 1
  %B = fsub double %a, %LGV
  store ptr %G, ptr @G.9, align 8
  store double %B, ptr @G.10, align 8
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

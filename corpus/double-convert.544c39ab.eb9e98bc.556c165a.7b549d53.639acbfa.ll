; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32d -mattr=+d -O1 -code-model=medium
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
  %A = alloca i16, align 2
  %B = fadd double %a, %a
  %G = getelementptr double, ptr %A, i16 1
  store i16 poison, ptr %A, align 2
  %C = fcmp ogt double %B, %a
  %1 = fptoui double %a to i16
  store i16 %1, ptr %A, align 2
  store i1 %C, ptr @G.3, align 1
  store ptr %G, ptr @G.9, align 8
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
  %LGV8 = load double, ptr @G.6, align 8
  %B = fsub double %a, %LGV8
  %LGV5 = load i128, ptr @G.5, align 4
  %C7 = icmp ugt i32 0, 65536
  %0 = tail call i32 @llvm.fptoui.sat.i32.f64(double %a)
  %C2 = fcmp ogt double %LGV8, 4.200000e+01
  %C9 = fcmp ule double %a, %LGV8
  %C6 = icmp ne i128 -170141183460469231731687303715884105728, %LGV5
  store i1 %C2, ptr poison, align 1
  store i1 %C6, ptr poison, align 1
  store i1 %C7, ptr @G.3, align 1
  %C3 = fcmp ogt double %a, %a
  store i1 %C9, ptr @G.3, align 1
  store i1 %C3, ptr @G.8, align 1
  store double %B, ptr @G.6, align 8
  ret i32 %0
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

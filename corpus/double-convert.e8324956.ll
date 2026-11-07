; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.401300e-45
@G.1 = global i8 16
@G.2 = global i128 -170141183460469231731687303715884105728
@G.3 = global i1 false
@G.4 = global i16 0

; Function Attrs: nounwind
define float @fcvt_s_d(double %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load float, ptr @G, align 4
  %1 = fptrunc double %a to float
  %C = fcmp ueq float 4.200000e+01, %LGV
  store i1 %C, ptr %A, align 1
  ret float %1
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
define i64 @fcvt_l_d(double %a) #0 {
  %LGV = load i128, ptr @G.2, align 4
  %1 = fptosi double %a to i64
  %C = icmp ugt i128 %LGV, 42
  store i1 %C, ptr @G.3, align 1
  ret i64 %1
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
define double @fcvt_d_wu_i8(i8 zeroext %a) #0 {
  %1 = uitofp i8 %a to double
  %B = mul i8 -1, 0
  store i8 %B, ptr @G.1, align 1
  ret double %1
}

; Function Attrs: nounwind
define double @fcvt_d_w_i16(i16 signext %a) #0 {
  %LGV = load i16, ptr @G.4, align 2
  %1 = sitofp i16 %a to double
  %B = xor i16 %a, %LGV
  store i16 %B, ptr @G.4, align 2
  ret double %1
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
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %1 = fptosi double %a to i8
  %C = fcmp ult double %a, %a
  store i1 %C, ptr %A, align 1
  ret i8 %1
}

; Function Attrs: nounwind
define signext i8 @fcvt_w_s_sat_i8(double %a) #0 {
start:
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp true float f0x7F7FFFFF, 0.000000e+00
  %0 = tail call i8 @llvm.fptosi.sat.i8.f64(double %a)
  store i1 %C, ptr %A, align 1
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

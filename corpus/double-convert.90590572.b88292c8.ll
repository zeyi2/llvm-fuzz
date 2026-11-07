; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+zve64d -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 0
@G.1 = global i1 false
@G.2 = global i8 0
@G.3 = global i16 -32768
@G.4 = global i128 0
@G.5 = global i32 2147483647

; Function Attrs: nounwind
declare float @fcvt_s_d(double) #0

; Function Attrs: nounwind
define double @fcvt_d_s(float %a) #0 {
  %A4 = alloca i1, align 1
  store i1 poison, ptr %A4, align 1
  %LGV2 = load i32, ptr @G.5, align 4
  %LGV = load i128, ptr @G.4, align 4
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C1 = fcmp ueq double 0.000000e+00, 4.940660e-324
  %C = fcmp uge half 5.960460e-08, 5.960460e-08
  %1 = fpext float %a to double
  %B = xor i128 170141183460469231731687303715884105727, %LGV
  store i1 %C, ptr @G.1, align 1
  store i1 %C1, ptr %A, align 1
  store i128 %B, ptr poison, align 4
  %C3 = icmp ugt i32 1, %LGV2
  store i1 %C3, ptr %A4, align 1
  ret double %1
}

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
define double @fcvt_d_wu_load(ptr %p) #0 {
  %B2 = mul i1 false, true
  %B = or i8 -128, 16
  %a = load i32, ptr %p, align 4
  %1 = uitofp i32 %a to double
  store i8 %B, ptr @G.2, align 1
  %C = icmp ugt i1 %B2, %B2
  store i1 %C, ptr @G.1, align 1
  ret double %1
}

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
define double @fcvt_d_wu_i16(i16 zeroext %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i8, ptr @G, align 1
  %C = icmp sgt i8 %LGV, -128
  %B = add i1 %C, %C
  %1 = uitofp i16 %a to double
  store i1 %B, ptr %A, align 1
  ret double %1
}

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
  %L = load i1, ptr %A, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load i16, ptr @G.3, align 2
  %1 = fptosi double %a to i8
  %C = icmp uge i16 32767, %LGV1
  store i1 %C, ptr %A, align 1
  %C1 = icmp sge i1 %C, %L
  store i1 %C1, ptr @G.1, align 1
  ret i8 %1
}

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

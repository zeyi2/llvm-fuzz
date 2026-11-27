; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+f,+zicond,+zvbb,+zba,+zbb,+zcb,+a -O2
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
@G.15 = global i1 true
@G.16 = global ptr poison
@G.17 = global float 1.000000e+00

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
declare zeroext i16 @fcvt_wu_s_i16(double) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(double) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(double) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(double) #0

; Function Attrs: nounwind
define zeroext i8 @fcvt_wu_s_i8(double %a) #0 {
  %A10 = alloca ptr, align 8
  store ptr poison, ptr %A10, align 8
  %A3 = alloca i1, align 1
  %L6 = load float, ptr %A3, align 4
  %L5 = load float, ptr %A3, align 4
  %B7 = fadd float %L5, %L6
  store i1 poison, ptr %A3, align 1
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %C = fcmp true double %a, 4.940660e-324
  store float %B7, ptr %A, align 4
  store ptr %A, ptr %A10, align 8
  br i1 %C, label %T, label %F

BB:                                               ; preds = %BB3, %T
  %LGV1 = load float, ptr @G.17, align 4
  %B4 = fsub float %L6, %LGV1
  %C2 = fcmp oeq float f0x7F7FFFFF, 4.200000e+01
  %1 = fptoui double %a to i8
  %B = fdiv double %a, %a
  %C8 = fcmp one float %L6, 0.000000e+00
  store i1 %C, ptr @G, align 1
  store double %B, ptr @G.8, align 8
  store i1 %C2, ptr %A3, align 1
  %G2 = getelementptr double, ptr %A3, i8 %1
  store ptr %G2, ptr @G.16, align 8
  store i1 %C8, ptr %G2, align 1
  store float %B4, ptr @G.17, align 4
  store double %B, ptr %G2, align 8
  ret i8 %1

T:                                                ; preds = %T, %0
  %L = load i1, ptr %A, align 1
  %B1 = or i1 %L, %C
  br i1 %L, label %T, label %BB

F:                                                ; preds = %F, %0
  %LGV = load i1, ptr @G.15, align 1
  %G = getelementptr ptr, ptr %A, i1 %LGV
  %L7 = load double, ptr %G, align 8
  %B2 = srem <4 x i32> zeroinitializer, splat (i32 42)
  %B3 = udiv i1 %LGV, true
  store <4 x i32> %B2, ptr poison, align 16
  %C9 = fcmp ogt double %a, %L7
  store i1 %B3, ptr %G, align 1
  store i1 %C9, ptr %A3, align 1
  store i1 %C9, ptr %A10, align 1
  br i1 %LGV, label %F, label %BB3

BB3:                                              ; preds = %F
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

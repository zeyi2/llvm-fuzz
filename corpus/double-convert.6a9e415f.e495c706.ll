; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i64 -1
@G.2 = global i1 false
@G.3 = global half +qnan
@G.4 = global double +inf
@G.5 = global i1 false
@G.6 = global half 4.200000e+01
@G.7 = global i1 true
@G.8 = global i128 0
@G.9 = global i1 true

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
define i32 @fcvt_wu_d_multiple_use(double %x, ptr %y) #0 {
  %A2 = alloca i1, align 1
  store i1 poison, ptr %A2, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i1, ptr @G, align 1
  switch i1 %LGV, label %SW_D [
    i1 true, label %SW_C
    i1 false, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_C, %SW_D
  %a = fptoui double %x to i32
  %b = icmp eq i32 %a, 0
  %c = select i1 %b, i32 1, i32 %a
  ret i32 %c

SW_D:                                             ; preds = %SW_D, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %SW_D

SW_C:                                             ; preds = %0
  %LGV1 = load i1, ptr @G.9, align 1
  %C = icmp uge i1 %LGV, %LGV1
  store i1 %C, ptr %A2, align 1
  br label %BB

SW_C1:                                            ; preds = %0
  br label %BB
}

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
  %LGV1 = load half, ptr @G.6, align 2
  %LGV = load double, ptr @G.4, align 8
  %C = fcmp ule double %a, %LGV
  %1 = fptosi double %a to i64
  store i1 %C, ptr @G.5, align 1
  %C3 = fcmp false half %LGV1, 0.000000e+00
  store i1 %C3, ptr poison, align 1
  ret i64 %1
}

; Function Attrs: nounwind
declare i64 @fcvt_l_d_sat(double) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_d(double) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_d_sat(double) #0

; Function Attrs: nounwind
define i64 @fmv_x_d(double %a, double %b) #0 {
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %LGV = load i64, ptr @G.1, align 4
  %1 = fadd double %a, %b
  %C = icmp sgt i64 %LGV, 4294967296
  %2 = bitcast double %1 to i64
  store i1 %C, ptr @G, align 1
  %B = sub i64 %2, %2
  store i64 %B, ptr %A, align 4
  ret i64 %2
}

; Function Attrs: nounwind
declare double @fcvt_d_l(i64) #0

; Function Attrs: nounwind
declare double @fcvt_d_lu(i64) #0

; Function Attrs: nounwind
declare double @fmv_d_x(i64, i64) #0

; Function Attrs: nounwind
define double @fcvt_d_w_i8(i8 signext %a) #0 {
  %LGV1 = load i128, ptr @G.8, align 4
  %B = sdiv i128 0, %LGV1
  %C3 = fcmp oeq half 5.960460e-08, 0.000000e+00
  %1 = sitofp i8 %a to double
  store i1 %C3, ptr poison, align 1
  store i128 %B, ptr @G.8, align 4
  ret double %1
}

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
  %LGV = load i1, ptr @G.7, align 1
  %1 = fptoui double %a to i8
  %C = icmp ugt i8 %1, %1
  store i1 %C, ptr @G.2, align 1
  %C1 = icmp sgt i1 %C, %LGV
  store i1 %C1, ptr @G.7, align 1
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

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 1)
@G.1 = global <4 x i1> zeroinitializer
@G.2 = global double 1.000000e+00
@G.3 = global ptr poison
@G.4 = global i1 true
@G.5 = global double 4.940660e-324
@G.6 = global i1 true
@G.7 = global i32 1
@G.8 = global float 4.200000e+01

; Function Attrs: nounwind
declare float @fcvt_s_d(double) #0

; Function Attrs: nounwind
declare double @fcvt_d_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_d(double) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_d(double) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_d_multiple_use(double, ptr) #0

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
declare i64 @fcvt_lu_d(double) #0

; Function Attrs: nounwind
define i64 @fmv_x_d(double %a, double %b) #0 {
  %A4 = alloca i1, align 1
  store i1 poison, ptr %A4, align 1
  %LGV2 = load float, ptr @G.8, align 4
  %A = alloca i1, align 1
  %C3 = fcmp one float +qnan, %LGV2
  store i1 poison, ptr %A, align 1
  %LGV = load double, ptr @G.2, align 8
  %1 = fadd double %a, %b
  %C = fcmp ugt double %1, %LGV
  %2 = bitcast double %1 to i64
  store i1 %C, ptr %A, align 1
  store i1 %C3, ptr %A4, align 1
  ret i64 %2
}

; Function Attrs: nounwind
declare double @fcvt_d_l(i64) #0

; Function Attrs: nounwind
declare double @fcvt_d_lu(i64) #0

; Function Attrs: nounwind
define double @fmv_d_x(i64 %a, i64 %b) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV1 = load i1, ptr @G.6, align 1
  %LGV = load <4 x i32>, ptr @G, align 16
  %C = icmp uge <4 x i32> %LGV, splat (i32 2147483647)
  br i1 %LGV1, label %T, label %F

BB:                                               ; preds = %F, %T
  %1 = bitcast i64 %a to double
  %2 = bitcast i64 %b to double
  %3 = fadd double %1, %2
  store <4 x i1> %C, ptr @G.1, align 1
  ret double %3

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %LGV2 = load i1, ptr @G.6, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %F, label %BB
}

; Function Attrs: nounwind
declare double @fcvt_d_w_i8(i8 signext) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu_i8(i8 zeroext) #0

; Function Attrs: nounwind
define double @fcvt_d_w_i16(i16 signext %a) #0 {
  %I = insertelement <8 x i8> zeroinitializer, i8 127, i1 true
  %1 = sitofp i16 %a to double
  %C = fcmp true double %1, %1
  store <8 x i8> %I, ptr poison, align 8
  store i1 %C, ptr @G.4, align 1
  ret double %1
}

; Function Attrs: nounwind
declare double @fcvt_d_wu_i16(i16 zeroext) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_d_w_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
define signext i32 @fcvt_d_wu_demanded_bits(i32 signext %0, ptr %1) #0 {
  %A10 = alloca i1, align 1
  store i1 false, ptr %A10, align 1
  %A = alloca i128, align 8
  store i128 -1, ptr %A, align 4
  %3 = add i32 %0, 1
  %G = getelementptr i32, ptr %1, i32 %3
  %L = load i128, ptr %G, align 4
  %L1 = load i128, ptr %A, align 4
  switch i128 %L1, label %SW_D [
    i128 13222680846104559102, label %SW_C
    i128 6936763924601069210, label %SW_C2
    i128 13711606453579609600, label %SW_C3
    i128 6575246332931641473, label %SW_C4
    i128 13720277041328761560, label %SW_C5
    i128 17032938100142606652, label %SW_C6
    i128 16811145705364934816, label %SW_C7
    i128 12652953387072432049, label %SW_C8
  ]

BB:                                               ; preds = %SW_C8, %SW_C5, %SW_C3, %SW_C2
  %4 = uitofp i32 %3 to double
  store double %4, ptr %1, align 8
  store ptr %G, ptr @G.3, align 8
  ret i32 %3

SW_D:                                             ; preds = %2
  ret i32 2147483647

SW_C:                                             ; preds = %2
  %LGV = load i32, ptr @G.7, align 4
  ret i32 %LGV

SW_C2:                                            ; preds = %2
  br label %BB

SW_C3:                                            ; preds = %SW_C3, %2
  %LGV9 = load i1, ptr @G.6, align 1
  %L11 = load i1, ptr %A10, align 1
  br i1 %L11, label %SW_C3, label %BB

SW_C4:                                            ; preds = %2
  ret i32 %0

SW_C5:                                            ; preds = %2
  br label %BB

SW_C6:                                            ; preds = %2
  ret i32 %3

SW_C7:                                            ; preds = %2
  ret i32 %3

SW_C8:                                            ; preds = %2
  br label %BB
}

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_i16(double) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_i16(double) #0

; Function Attrs: nounwind
define signext i8 @fcvt_w_s_i8(double %a) #0 {
  %LGV1 = load double, ptr @G.5, align 8
  %1 = fptosi double %a to i8
  %C = icmp ugt i8 -1, %1
  %C2 = fcmp oge double %a, %LGV1
  store i1 %C, ptr @G.4, align 1
  store i1 %C2, ptr @G.4, align 1
  ret i8 %1
}

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_i8(double) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_d_sat(double) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_d_sat(double) #0

; Function Attrs: nounwind
declare i64 @fcvt_l_d_sat(double) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_d_sat(double) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_sat_i16(double) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(double) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(double) #0

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

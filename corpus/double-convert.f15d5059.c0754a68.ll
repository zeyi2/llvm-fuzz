; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+zbkb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 1)
@G.1 = global <4 x i1> zeroinitializer
@G.2 = global double 1.000000e+00
@G.3 = global ptr poison
@G.4 = global i1 true
@G.5 = global double 1.000000e+00
@G.6 = global i16 0
@G.7 = global i1 false

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
declare i64 @fmv_x_d(double, double) #0

; Function Attrs: nounwind
declare double @fcvt_d_l(i64) #0

; Function Attrs: nounwind
declare double @fcvt_d_lu(i64) #0

; Function Attrs: nounwind
define double @fmv_d_x(i64 %a, i64 %b) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load <4 x i32>, ptr @G, align 16
  %C2 = icmp sgt i64 %a, %b
  %C = icmp uge <4 x i32> %LGV, splat (i32 2147483647)
  %1 = bitcast i64 %a to double
  %2 = bitcast i64 %b to double
  %3 = fadd double %1, %2
  store <4 x i1> %C, ptr @G.1, align 1
  store i1 %C2, ptr %A, align 1
  ret double %3
}

; Function Attrs: nounwind
declare double @fcvt_d_w_i8(i8 signext) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu_i8(i8 zeroext) #0

; Function Attrs: nounwind
define double @fcvt_d_w_i16(i16 signext %a) #0 {
  %A = alloca i64, align 8
  store i64 0, ptr %A, align 4
  %LGV = load i16, ptr @G.6, align 2
  %I = insertelement <8 x i8> zeroinitializer, i8 127, i1 true
  %C = icmp eq i16 1, %LGV
  %1 = sitofp i16 %a to double
  store <8 x i8> %I, ptr poison, align 8
  store i1 %C, ptr @G.7, align 1
  %L = load i64, ptr %A, align 4
  switch i64 %L, label %SW_D [
    i64 -2316767624760001833, label %SW_C
    i64 5888828103888505594, label %SW_C1
    i64 -2885571699154979885, label %SW_C2
  ]

BB:                                               ; preds = %SW_C2, %SW_C1, %SW_C, %SW_D
  ret double %1

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare double @fcvt_d_wu_i16(i16 zeroext) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_d_w_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
define signext i32 @fcvt_d_wu_demanded_bits(i32 signext %0, ptr %1) #0 {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %3 = add i32 %0, 1
  %G = getelementptr i32, ptr %1, i32 %3
  %L = load i1, ptr %G, align 1
  %4 = uitofp i32 %3 to double
  switch i1 %L, label %SW_D [
    i1 false, label %SW_C
    i1 true, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_C, %SW_D
  store double %4, ptr %1, align 8
  store ptr %G, ptr @G.3, align 8
  ret i32 %3

SW_D:                                             ; preds = %2
  br label %BB

SW_C:                                             ; preds = %SW_C, %2
  %B = xor i32 %0, %3
  store i32 %B, ptr %A, align 4
  br i1 %L, label %BB, label %SW_C

SW_C1:                                            ; preds = %2
  br label %BB
}

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_i16(double) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_i16(double) #0

; Function Attrs: nounwind
define signext i8 @fcvt_w_s_i8(double %a) #0 {
  %LGV = load double, ptr @G.5, align 8
  %B = fsub double %a, %LGV
  %C1 = fcmp une double %a, %a
  %1 = fptosi double %a to i8
  %C = icmp ugt i8 -1, %1
  store i1 %C, ptr @G.4, align 1
  store double %B, ptr @G.2, align 8
  store i1 %C1, ptr @G.4, align 1
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

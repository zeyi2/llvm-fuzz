; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 1)
@G.1 = global <4 x i1> zeroinitializer
@G.2 = global double 1.000000e+00
@G.3 = global ptr poison
@G.4 = global i1 true
@G.5 = global <8 x i8> splat (i8 42)
@G.6 = global i1 true
@G.7 = global i8 0

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
  %A6 = alloca i1, align 1
  store i1 true, ptr %A6, align 1
  %A5 = alloca i1, align 1
  store i1 false, ptr %A5, align 1
  %LGV1 = load i8, ptr @G.7, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load double, ptr @G.2, align 8
  %1 = fadd double %a, %b
  %C = fcmp ugt double %1, %LGV
  switch i8 %LGV1, label %SW_D [
    i8 -38, label %SW_C
    i8 49, label %SW_C2
    i8 -61, label %SW_C3
    i8 72, label %SW_C4
  ]

BB:                                               ; preds = %SW_C4, %SW_C2, %SW_C, %SW_D
  %2 = bitcast double %1 to i64
  store i1 %C, ptr %A, align 1
  ret i64 %2

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %L = load i1, ptr %A5, align 1
  br i1 %L, label %BB, label %SW_C

SW_C2:                                            ; preds = %SW_C2, %0
  %L7 = load i1, ptr %A6, align 1
  br i1 %L7, label %BB, label %SW_C2

SW_C3:                                            ; preds = %0
  ret i64 0

SW_C4:                                            ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare double @fcvt_d_l(i64) #0

; Function Attrs: nounwind
declare double @fcvt_d_lu(i64) #0

; Function Attrs: nounwind
define double @fmv_d_x(i64 %a, i64 %b) #0 {
  %A = alloca <8 x i8>, align 8
  store <8 x i8> poison, ptr %A, align 8
  %LGV1 = load <8 x i8>, ptr @G.5, align 8
  %LGV = load <4 x i32>, ptr @G, align 16
  %B = shl <8 x i8> %LGV1, splat (i8 42)
  %C = icmp uge <4 x i32> %LGV, splat (i32 2147483647)
  %1 = bitcast i64 %a to double
  %2 = bitcast i64 %b to double
  %3 = fadd double %1, %2
  store <4 x i1> %C, ptr @G.1, align 1
  store <8 x i8> %B, ptr %A, align 8
  ret double %3
}

; Function Attrs: nounwind
declare double @fcvt_d_w_i8(i8 signext) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu_i8(i8 zeroext) #0

; Function Attrs: nounwind
define double @fcvt_d_w_i16(i16 signext %a) #0 {
  %C1 = icmp slt i16 %a, 42
  %I = insertelement <8 x i8> zeroinitializer, i8 127, i1 true
  %C = icmp ult i16 %a, -1
  store i1 %C, ptr @G.6, align 1
  store <8 x i8> %I, ptr poison, align 8
  %1 = sitofp i16 %a to double
  store i1 %C1, ptr @G.6, align 1
  ret double %1
}

; Function Attrs: nounwind
declare double @fcvt_d_wu_i16(i16 zeroext) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_d_w_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
define signext i32 @fcvt_d_wu_demanded_bits(i32 signext %0, ptr %1) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %3 = add i32 %0, 1
  %G = getelementptr inbounds i32, ptr %1, i32 %3
  %4 = uitofp i32 %3 to double
  store double %4, ptr %1, align 8
  store ptr %G, ptr @G.3, align 8
  %C = icmp slt i32 %3, %3
  store i1 %C, ptr %A, align 1
  ret i32 %3
}

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_i16(double) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_i16(double) #0

; Function Attrs: nounwind
define signext i8 @fcvt_w_s_i8(double %a) #0 {
  %1 = fptosi double %a to i8
  %C1 = icmp ugt i8 %1, %1
  %C = icmp ugt i8 -1, %1
  store i1 %C, ptr @G.4, align 1
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

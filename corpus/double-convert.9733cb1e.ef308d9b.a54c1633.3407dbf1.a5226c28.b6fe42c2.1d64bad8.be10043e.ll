; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+f,+zicond,+zvbb,+zvkb,+zfa,+v -O3
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
@G.15 = global i8 42
@G.16 = global <4 x i32> splat (i32 1)
@G.17 = global i16 42
@G.18 = global ptr poison
@G.19 = global <4 x i32> splat (i32 -2147483648)
@G.20 = global i32 0
@G.21 = global i1 false

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
define signext i16 @fcvt_w_s_sat_i16(double %a) #0 {
start:
  %A2 = alloca i32, align 4
  store i32 65536, ptr %A2, align 4
  %A4 = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A4, align 1
  %C = fcmp uge <4 x float> splat (float 4.200000e+01), splat (float 1.401300e-45)
  %A = alloca i1, align 1
  %LGV2 = load i64, ptr @G.10, align 4
  %LGV = load <8 x i8>, ptr @G.9, align 8
  store i1 true, ptr %A, align 1
  %0 = tail call i16 @llvm.fptosi.sat.i16.f64(double %a)
  switch i64 %LGV2, label %SW_D [
    i64 3381726621194099071, label %SW_C
  ]

BB:                                               ; preds = %SW_C, %SW_D
  %LGV1 = load <4 x i32>, ptr @G.16, align 16
  %B = fdiv double %a, 0.000000e+00
  %B3 = urem i16 %0, -1
  %C2 = fcmp one double %B, %a
  %C3 = icmp ult <4 x i32> splat (i32 1), %LGV1
  store <4 x i1> %C, ptr @G.1, align 1
  %B1 = shl <8 x i8> splat (i8 1), %LGV
  %L = load i32, ptr %A2, align 4
  switch i32 %L, label %SW_D3 [
    i32 -40162485, label %SW_C4
    i32 -1510553315, label %SW_C5
    i32 1828235951, label %SW_C6
    i32 -1054963950, label %SW_C7
    i32 -1158201345, label %SW_C8
    i32 1071865554, label %SW_C9
    i32 212968219, label %SW_C10
  ]

BB1:                                              ; preds = %SW_C8, %SW_C7, %SW_C6, %SW_C5, %SW_C4
  store double %B, ptr poison, align 8
  %C6 = icmp ne i16 -32768, -32768
  store <8 x i8> %B1, ptr @G.9, align 8
  store i1 %C2, ptr poison, align 1
  store <4 x i1> %C3, ptr %A4, align 1
  store i1 %C6, ptr poison, align 1
  ret i16 %B3

SW_D:                                             ; preds = %start
  %C5 = icmp ult i32 42, 65536
  store i1 %C5, ptr %A, align 1
  br label %BB

SW_C:                                             ; preds = %SW_C, %start
  %G = getelementptr i1, ptr %A, i32 65536
  %L9 = load <vscale x 2 x i32>, ptr %G, align 8
  %C1 = fcmp oge double %a, %a
  %B14 = fmul double %a, %a
  store ptr %G, ptr poison, align 8
  %C10 = icmp ult <vscale x 2 x i32> splat (i32 65536), %L9
  store double %B14, ptr @G.4, align 8
  store <vscale x 2 x i1> %C10, ptr %A2, align 1
  br i1 %C1, label %BB, label %SW_C

SW_D3:                                            ; preds = %BB
  %G15 = getelementptr i1, ptr %A2, i16 %B3
  %B12 = frem double %a, 4.940660e-324
  store double %B12, ptr %A2, align 8
  store ptr %G15, ptr %A2, align 8
  ret i16 -1

SW_C4:                                            ; preds = %BB
  %LGV14 = load i32, ptr @G.20, align 4
  %B4 = fmul double %a, 0.000000e+00
  %B13 = sub <4 x i32> %LGV1, %LGV1
  store <4 x i32> %B13, ptr @G.14, align 16
  %I = insertelement <4 x i32> %B13, i32 %LGV14, i128 18446744073709551616
  store double %B4, ptr poison, align 8
  store <4 x i32> %I, ptr @G.14, align 16
  br label %BB1

SW_C5:                                            ; preds = %BB
  br label %BB1

SW_C6:                                            ; preds = %BB
  br label %BB1

SW_C7:                                            ; preds = %BB
  br label %BB1

SW_C8:                                            ; preds = %BB
  br label %BB1

SW_C9:                                            ; preds = %BB
  %G12 = getelementptr double, ptr %A, i1 %C2
  store ptr %G12, ptr @G.18, align 8
  ret i16 %0

SW_C10:                                           ; preds = %BB
  ret i16 0
}

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
  %A4 = alloca i1, align 1
  store i1 poison, ptr %A4, align 1
  %A7 = alloca i1, align 1
  store i1 true, ptr %A7, align 1
  %A3 = alloca i1, align 1
  %L2 = load i32, ptr %A3, align 4
  store i1 poison, ptr %A3, align 1
  %A = alloca i1, align 1
  store ptr %A, ptr poison, align 8
  switch i32 %L2, label %SW_D [
    i32 1233189670, label %SW_C
    i32 2094690348, label %SW_C3
    i32 -1935030654, label %SW_C4
    i32 -987585556, label %SW_C5
    i32 1113009757, label %SW_C6
  ]

BB1:                                              ; preds = %SW_C6, %SW_C4, %BB2, %SW_C
  store i1 false, ptr %A, align 1
  %C = fcmp true double %a, 4.940660e-324
  br i1 %C, label %T, label %F

BB:                                               ; preds = %F, %T
  %C2 = fcmp oeq float f0x7F7FFFFF, 4.200000e+01
  %1 = fptoui double %a to i8
  %B = fdiv double %a, %a
  store i1 %C, ptr @G, align 1
  store double %B, ptr @G.8, align 8
  store i1 %C2, ptr %A3, align 1
  store i8 %1, ptr %A7, align 1
  ret i8 %1

T:                                                ; preds = %T, %BB1
  %C1 = fcmp oge double %a, %a
  %B1 = or i1 %C1, %C
  br i1 %B1, label %T, label %BB

F:                                                ; preds = %BB1
  %B2 = srem <4 x i32> zeroinitializer, splat (i32 42)
  store <4 x i32> %B2, ptr poison, align 16
  store <4 x i32> %B2, ptr @G.19, align 16
  br label %BB

SW_D:                                             ; preds = %0
  ret i8 -1

SW_C:                                             ; preds = %0
  %LGV1 = load i16, ptr @G.17, align 2
  %G = getelementptr double, ptr %A, i16 %LGV1
  store ptr %G, ptr %A7, align 8
  br label %BB1

SW_C3:                                            ; preds = %BB2, %0
  %L8 = load i1, ptr %A7, align 1
  store i1 %L8, ptr @G.5, align 1
  br i1 %L8, label %T3, label %F4

BB2:                                              ; preds = %F4, %T3
  br i1 %L8, label %SW_C3, label %BB1

SW_C4:                                            ; preds = %0
  %LGV = load i1, ptr @G.21, align 1
  %C3 = icmp sge i1 false, %LGV
  store i1 %C3, ptr %A4, align 1
  br label %BB1

SW_C5:                                            ; preds = %0
  %LGV9 = load i8, ptr @G.15, align 1
  ret i8 %LGV9

SW_C6:                                            ; preds = %0
  br label %BB1

T3:                                               ; preds = %SW_C3
  br label %BB2

F4:                                               ; preds = %SW_C3
  br label %BB2
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

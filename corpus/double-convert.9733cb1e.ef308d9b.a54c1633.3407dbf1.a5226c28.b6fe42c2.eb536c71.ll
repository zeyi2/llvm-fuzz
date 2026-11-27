; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+f,+zicond,+zvbb,+zvkb -O1
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
@G.17 = global <2 x i64> zeroinitializer

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
define i32 @fcvt_wu_d_sat(double %a) #0 {
start:
  %A7 = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A7, align 1
  %A6 = alloca i16, align 2
  store i16 256, ptr %A6, align 2
  %A1 = alloca i32, align 4
  store i32 poison, ptr %A1, align 4
  %LGV2 = load double, ptr @G.4, align 8
  %A = alloca <4 x i32>, align 16
  %L = load i8, ptr %A, align 1
  %C = fcmp une double %a, %LGV2
  store <4 x i32> poison, ptr %A, align 16
  %LGV1 = load i32, ptr @G.3, align 4
  %LGV = load <4 x i32>, ptr @G.2, align 16
  %0 = tail call i32 @llvm.fptoui.sat.i32.f64(double %a)
  %I = insertelement <4 x i32> %LGV, i32 %LGV1, i1 false
  store <4 x i32> %I, ptr %A, align 16
  store i1 %C, ptr @G.5, align 1
  switch i8 %L, label %SW_D [
    i8 -73, label %SW_C
    i8 50, label %SW_C3
    i8 71, label %SW_C4
    i8 118, label %SW_C5
    i8 -69, label %SW_C6
    i8 29, label %SW_C7
    i8 55, label %SW_C8
    i8 30, label %SW_C9
  ]

BB:                                               ; preds = %SW_C6, %SW_C5, %SW_C4, %SW_C3, %BB5, %SW_D
  ret i32 %0

SW_D:                                             ; preds = %start
  br label %BB

SW_C:                                             ; preds = %start
  %L7 = load i16, ptr %A6, align 2
  %B1 = xor i1 %C, %C
  store i1 %B1, ptr %A6, align 1
  switch i16 %L7, label %SW_D8 [
    i16 10452, label %SW_C10
  ]

BB5:                                              ; preds = %BB1
  br label %BB

SW_C3:                                            ; preds = %SW_C3, %start
  %LGV10 = load i1, ptr @G.6, align 1
  %B = shl i32 %LGV1, 42
  store i32 %B, ptr %A1, align 4
  br i1 %LGV10, label %SW_C3, label %BB

SW_C4:                                            ; preds = %start
  br label %BB

SW_C5:                                            ; preds = %start
  br label %BB

SW_C6:                                            ; preds = %SW_C6, %start
  br i1 %C, label %BB, label %SW_C6

SW_C7:                                            ; preds = %start
  %LGV3 = load i16, ptr @G.11, align 2
  %C4 = icmp slt i16 1, %LGV3
  store i1 %C4, ptr %A1, align 1
  ret i32 %0

SW_C8:                                            ; preds = %start
  %LGV12 = load i32, ptr @G.7, align 4
  %C11 = icmp ult i32 %LGV12, %0
  store i1 %C11, ptr %A6, align 1
  ret i32 %LGV12

SW_C9:                                            ; preds = %start
  ret i32 %0

SW_D8:                                            ; preds = %SW_C
  %LGV22 = load <4 x i32>, ptr @G.14, align 16
  %B23 = mul <4 x i32> %LGV22, %LGV
  store <4 x i32> %B23, ptr @G.14, align 16
  switch i32 %LGV1, label %SW_D2 [
    i32 -1511306095, label %SW_C11
    i32 1535392864, label %SW_C12
    i32 -808852141, label %SW_C13
    i32 430897025, label %SW_C14
    i32 1292181252, label %SW_C15
    i32 1602174823, label %SW_C16
    i32 -1816059589, label %SW_C17
  ]

BB1:                                              ; preds = %SW_C17, %SW_C16, %SW_C14, %SW_C13, %SW_C12, %BB18
  br label %BB5

SW_C10:                                           ; preds = %SW_C
  %C19 = fcmp olt double %a, %a
  store i1 %C19, ptr @G.12, align 1
  ret i32 %LGV1

SW_D2:                                            ; preds = %BB18, %SW_D8
  br i1 %C, label %T, label %F

BB18:                                             ; preds = %T
  %LGV20 = load i128, ptr @G.13, align 4
  %C21 = icmp sge i128 42, %LGV20
  store i1 %C21, ptr %A6, align 1
  br i1 %C, label %SW_D2, label %BB1

SW_C11:                                           ; preds = %SW_D8
  ret i32 42

SW_C12:                                           ; preds = %SW_D8
  %C9 = fcmp true double %a, %LGV2
  store i1 %C9, ptr poison, align 1
  br label %BB1

SW_C13:                                           ; preds = %SW_D8
  br label %BB1

SW_C14:                                           ; preds = %SW_D8
  br label %BB1

SW_C15:                                           ; preds = %SW_D8
  %C1 = icmp uge <4 x i32> %B23, %B23
  store <4 x i1> %C1, ptr poison, align 1
  %B6 = sub <4 x i1> %C1, zeroinitializer
  store <4 x i1> %B6, ptr %A7, align 1
  ret i32 42

SW_C16:                                           ; preds = %SW_D8
  br label %BB1

SW_C17:                                           ; preds = %SW_D8
  br label %BB1

T:                                                ; preds = %SW_D2
  br label %BB18

F:                                                ; preds = %SW_D2
  ret i32 42
}

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
  store double %B, ptr poison, align 8
  store <8 x i8> %B1, ptr @G.9, align 8
  store i1 %C2, ptr poison, align 1
  store <4 x i1> %C3, ptr %A4, align 1
  ret i16 %B3

SW_D:                                             ; preds = %start
  %C5 = icmp ult i32 42, 65536
  store i1 %C5, ptr %A, align 1
  br label %BB

SW_C:                                             ; preds = %SW_C, %start
  %LGV3 = load <2 x i64>, ptr @G.17, align 16
  %G = getelementptr i1, ptr %A, i32 65536
  %L = load <2 x i64>, ptr %G, align 16
  %B4 = and <2 x i64> %LGV3, %L
  %C1 = fcmp oge double %a, %a
  store ptr %G, ptr poison, align 8
  store <2 x i64> %B4, ptr %A4, align 16
  br i1 %C1, label %BB, label %SW_C
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
  %A7 = alloca i1, align 1
  store i1 true, ptr %A7, align 1
  %A3 = alloca i1, align 1
  %L2 = load i32, ptr %A3, align 4
  store i1 poison, ptr %A3, align 1
  %A = alloca i1, align 1
  switch i32 %L2, label %SW_D [
    i32 1233189670, label %SW_C
    i32 2094690348, label %SW_C3
    i32 -1935030654, label %SW_C4
    i32 -987585556, label %SW_C5
    i32 1113009757, label %SW_C6
  ]

BB1:                                              ; preds = %SW_C6, %SW_C4, %BB3, %BB2
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
  ret i8 %1

T:                                                ; preds = %T, %BB1
  %L = load i1, ptr %A, align 1
  %B1 = or i1 %L, %C
  br i1 %B1, label %T, label %BB

F:                                                ; preds = %BB1
  %B2 = srem <4 x i32> zeroinitializer, splat (i32 42)
  store <4 x i32> %B2, ptr poison, align 16
  br label %BB

SW_D:                                             ; preds = %0
  ret i8 -1

SW_C:                                             ; preds = %SW_C, %0
  br i1 true, label %SW_C, label %BB2

BB2:                                              ; preds = %SW_C
  br label %BB1

SW_C3:                                            ; preds = %BB3, %0
  %LGV = load i1, ptr @G, align 1
  %L8 = load i1, ptr %A7, align 1
  br i1 %L8, label %T4, label %F5

BB3:                                              ; preds = %F5, %T4
  br i1 %L8, label %SW_C3, label %BB1

SW_C4:                                            ; preds = %0
  %C1 = fcmp false double %a, f0x7FEFFFFFFFFFFFFF
  store i1 %C1, ptr %A7, align 1
  br label %BB1

SW_C5:                                            ; preds = %0
  %LGV9 = load i8, ptr @G.15, align 1
  ret i8 %LGV9

SW_C6:                                            ; preds = %0
  br label %BB1

T4:                                               ; preds = %SW_C3
  br label %BB3

F5:                                               ; preds = %SW_C3
  br label %BB3
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

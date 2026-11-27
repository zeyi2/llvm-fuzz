; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+f,+zicond,+zvbb,+zfh -O2 -code-model=medium
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
@G.16 = global <2 x i64> zeroinitializer
@G.17 = global <4 x i32> zeroinitializer
@G.18 = global i32 0

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
  %A23 = alloca i1, align 1
  store i1 true, ptr %A23, align 1
  %A7 = alloca i1, align 1
  store i1 poison, ptr %A7, align 1
  %A15 = alloca i1, align 1
  store i1 poison, ptr %A15, align 1
  %A10 = alloca i1, align 1
  store i1 false, ptr %A10, align 1
  %A2 = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A2, align 1
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

BB:                                               ; preds = %SW_C6, %BB8, %SW_C4, %SW_C3, %BB5, %SW_D
  %1 = phi <4 x i32> [ zeroinitializer, %SW_C6 ], [ %LGV, %BB8 ], [ splat (i32 1), %SW_C4 ], [ splat (i32 42), %SW_C3 ], [ %LGV, %BB5 ], [ splat (i32 -1), %SW_D ]
  store <4 x i32> %1, ptr @G.17, align 16
  %C7 = fcmp ugt double %a, %LGV2
  store i1 %C7, ptr %A7, align 1
  ret i32 %0

SW_D:                                             ; preds = %start
  br label %BB

SW_C:                                             ; preds = %start
  %L7 = load i16, ptr %A6, align 2
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
  %LGV11 = load i32, ptr @G.18, align 4
  switch i32 %LGV11, label %SW_D12 [
    i32 -637726224, label %SW_C18
    i32 -608985386, label %SW_C19
    i32 1750926745, label %SW_C20
    i32 1952821646, label %SW_C21
    i32 1180934287, label %SW_C22
  ]

BB8:                                              ; preds = %SW_C22, %SW_C19, %SW_C18, %SW_D12
  br label %BB

SW_C6:                                            ; preds = %SW_C6, %start
  %C9 = fcmp one double %a, f0x7FEFFFFFFFFFFFFF
  br i1 %C9, label %BB, label %SW_C6

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
  %LGV9 = load i1, ptr @G.6, align 1
  %C2 = icmp uge i1 %LGV9, true
  %L11 = load i1, ptr %A10, align 1
  store i1 %C2, ptr poison, align 1
  br i1 %L11, label %T7, label %F8

BB6:                                              ; preds = %F8, %T7
  %C5 = icmp ugt i16 %L7, -1
  %LGV22 = load <4 x i32>, ptr @G.14, align 16
  %B23 = mul <4 x i32> %LGV22, %LGV
  store <4 x i32> %B23, ptr @G.14, align 16
  store i1 %C5, ptr %A2, align 1
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

SW_D2:                                            ; preds = %BB18, %BB6
  %B14 = udiv i1 %C5, %LGV9
  store i1 %B14, ptr %A15, align 1
  br i1 %C, label %T, label %F

BB18:                                             ; preds = %T
  %LGV13 = load <2 x i64>, ptr @G.16, align 16
  %LGV20 = load i128, ptr @G.13, align 4
  %B15 = sub <2 x i64> zeroinitializer, %LGV13
  %C21 = icmp sge i128 42, %LGV20
  store i1 %C21, ptr %A6, align 1
  store <2 x i64> %B15, ptr @G.16, align 16
  br i1 %C, label %SW_D2, label %BB1

SW_C11:                                           ; preds = %BB6
  ret i32 42

SW_C12:                                           ; preds = %BB6
  br label %BB1

SW_C13:                                           ; preds = %BB6
  %B17 = xor <2 x i64> zeroinitializer, splat (i64 42)
  store <2 x i64> %B17, ptr %A7, align 16
  br label %BB1

SW_C14:                                           ; preds = %BB6
  %C1 = fcmp ugt <4 x float> splat (float +qnan), splat (float +qnan)
  store <4 x i1> %C1, ptr %A2, align 1
  br label %BB1

SW_C15:                                           ; preds = %BB6
  ret i32 42

SW_C16:                                           ; preds = %BB6
  br label %BB1

SW_C17:                                           ; preds = %BB6
  br label %BB1

T:                                                ; preds = %SW_D2
  %C6 = fcmp oeq double %a, %LGV2
  store i1 %C6, ptr %A7, align 1
  br label %BB18

F:                                                ; preds = %SW_D2
  ret i32 42

T7:                                               ; preds = %SW_D8
  br label %BB6

F8:                                               ; preds = %SW_D8
  %B8 = lshr i16 %L7, %L7
  store i16 %B8, ptr %A7, align 2
  br label %BB6

SW_D12:                                           ; preds = %SW_C5
  br label %BB8

SW_C18:                                           ; preds = %SW_C5
  br label %BB8

SW_C19:                                           ; preds = %SW_C19, %SW_C5
  %L24 = load i1, ptr %A23, align 1
  br i1 %L24, label %SW_C19, label %BB8

SW_C20:                                           ; preds = %SW_C5
  ret i32 %0

SW_C21:                                           ; preds = %SW_C5
  ret i32 %0

SW_C22:                                           ; preds = %SW_C5
  br label %BB8
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
  %A5 = alloca i1, align 1
  store i1 poison, ptr %A5, align 1
  %A3 = alloca i1, align 1
  %L1 = load double, ptr %A3, align 8
  store i1 poison, ptr %A3, align 1
  %G = getelementptr ptr, ptr %A5, i64 -1
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %C = fcmp true double %a, 4.940660e-324
  %C3 = fcmp ole double %a, %L1
  store i1 %C3, ptr poison, align 1
  br i1 %C, label %T, label %F

BB:                                               ; preds = %F, %T
  %B = fdiv double %a, %a
  store i1 %C, ptr %G, align 1
  store double %B, ptr @G.8, align 8
  %C2 = fcmp oeq float f0x7F7FFFFF, 4.200000e+01
  %1 = fptoui double %a to i8
  store i1 %C2, ptr %A3, align 1
  ret i8 %1

T:                                                ; preds = %T, %0
  %L = load i1, ptr %A, align 1
  %B4 = shl i1 %L, %L
  %B1 = or i1 %L, %C
  store i1 %B4, ptr %A5, align 1
  br i1 %B1, label %T, label %BB

F:                                                ; preds = %0
  %LGV = load i1, ptr @G.15, align 1
  %B2 = srem <4 x i32> zeroinitializer, splat (i32 42)
  %B3 = udiv i1 %LGV, true
  store <4 x i32> %B2, ptr poison, align 16
  store i1 %B3, ptr @G, align 1
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

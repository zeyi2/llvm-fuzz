; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32d -mattr=+d,+zfhmin,+zicsr -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 -1)
@G.1 = global i64 -9223372036854775808
@G.2 = global i8 -128
@G.3 = global i8 42
@G.4 = global i64 0
@G.5 = global i1 true
@G.6 = global i1 false
@G.7 = global i32 -2147483648
@G.8 = global float 0.000000e+00
@G.9 = global double 4.940660e-324
@G.10 = global i1 false
@G.11 = global i128 0
@G.12 = global double +inf
@G.13 = global <4 x i32> splat (i32 42)
@G.14 = global i1 true
@G.15 = global double 4.940660e-324
@G.16 = global i16 -32768
@G.17 = global ptr poison
@G.18 = global float f0x7F7FFFFF
@G.19 = global i128 42

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
define zeroext i16 @fcvt_wu_s_i16(double %a) #0 {
  %A = alloca i16, align 2
  %1 = fptoui double %a to i16
  %LGV1 = load i16, ptr @G.16, align 2
  %B7 = fmul double %a, %a
  %L2 = load i32, ptr %A, align 4
  %B2 = xor i16 %1, %LGV1
  store i16 %1, ptr %A, align 2
  %A3 = alloca i1, align 1
  %L5 = load double, ptr %A3, align 8
  %B6 = fmul double %a, %L5
  %L6 = load float, ptr %A3, align 4
  %L3 = load i1, ptr %A3, align 1
  %B = sub i1 %L3, true
  %C2 = fcmp oeq double %a, %B6
  store i1 poison, ptr %A3, align 1
  store i1 %B, ptr @G.6, align 1
  store i1 %C2, ptr %A3, align 1
  %L4 = load i32, ptr %A, align 4
  store i16 poison, ptr %A, align 2
  %L = load i1, ptr %A3, align 1
  %C5 = icmp sge i32 %L2, %L4
  %C8 = icmp eq i32 %L4, 1
  %C4 = icmp ule i1 %L, %L3
  %LGV = load float, ptr @G.18, align 4
  store i1 %C8, ptr @G.6, align 1
  store i1 %C4, ptr %A, align 1
  store double %B7, ptr @G.9, align 8
  %C7 = fcmp une float %LGV, %L6
  store i1 %C7, ptr %A, align 1
  store i1 %C5, ptr @G.5, align 1
  ret i16 %B2
}

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(double) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(double) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(double) #0

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_i8(double) #0

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_sat_i8(double) #0

; Function Attrs: nounwind
define zeroext i32 @fcvt_wu_d_sat_zext(double %a) #0 {
start:
  %LGV5 = load i128, ptr @G.19, align 4
  %A2 = alloca i1, align 1
  store i1 poison, ptr %A2, align 1
  %LGV10 = load <4 x i32>, ptr @G.13, align 16
  %A9 = alloca double, align 8
  %G7 = getelementptr ptr, ptr %A9, i1 true
  store double poison, ptr %A9, align 8
  %A12 = alloca i1, align 1
  store i1 false, ptr %A12, align 1
  %A10 = alloca i1, align 1
  store i1 false, ptr %A10, align 1
  %LGV2 = load i64, ptr @G.4, align 4
  %A = alloca i8, align 1
  %L = load i64, ptr %A, align 4
  store i8 poison, ptr %A, align 1
  %LGV1 = load i8, ptr @G.3, align 1
  %C3 = icmp uge i64 %L, %LGV2
  store ptr %G7, ptr %A, align 8
  switch i8 %LGV1, label %SW_D [
    i8 91, label %SW_C
    i8 -104, label %SW_C4
    i8 -58, label %SW_C5
    i8 -127, label %SW_C6
    i8 -64, label %SW_C7
    i8 126, label %SW_C8
  ]

BB:                                               ; preds = %SW_C8, %BB4, %SW_C6, %SW_C, %SW_D
  %LGV = load i8, ptr @G.2, align 1
  %C14 = icmp uge i128 18446744073709551616, -170141183460469231731687303715884105728
  %0 = tail call i32 @llvm.fptoui.sat.i32.f64(double %a)
  %C = icmp uge i1 %C14, true
  %B = lshr i8 %LGV, %LGV1
  %C7 = icmp ule i32 %0, %0
  store i1 %C, ptr poison, align 1
  store i8 %B, ptr %A, align 1
  store i1 %C7, ptr @G.5, align 1
  ret i32 %0

SW_D:                                             ; preds = %start
  %C2 = fcmp ule double %a, %a
  %LGV7 = load double, ptr @G.12, align 8
  %B8 = fmul double %a, %LGV7
  store double %B8, ptr %A9, align 8
  store i1 %C2, ptr %A9, align 1
  br label %BB

SW_C:                                             ; preds = %SW_C, %start
  %1 = phi i128 [ %1, %SW_C ], [ %LGV5, %start ]
  %G = getelementptr <8 x i8>, ptr %A10, i1 true
  %L8 = load double, ptr %G, align 8
  %B3 = frem float 1.000000e+00, 1.401300e-45
  %C9 = fcmp uge double %a, %L8
  store ptr %G, ptr %A12, align 8
  store float %B3, ptr @G.8, align 4
  store i1 %C9, ptr %A2, align 1
  store i128 %1, ptr %A2, align 4
  br i1 %C3, label %SW_C, label %BB

SW_C4:                                            ; preds = %start
  %2 = phi <4 x i32> [ %LGV10, %start ]
  %C1 = fcmp ueq double 1.000000e+00, %a
  store i1 %C1, ptr %A12, align 1
  store <4 x i32> %2, ptr poison, align 16
  ret i32 65536

SW_C5:                                            ; preds = %start
  %LGV9 = load i32, ptr @G.7, align 4
  %G1 = getelementptr i1, ptr %A12, i32 %LGV9
  store ptr %G1, ptr @G.17, align 8
  ret i32 %LGV9

SW_C6:                                            ; preds = %start
  %LGV6 = load double, ptr @G.15, align 8
  %B7 = fsub double %a, %LGV6
  %C4 = fcmp uno double %B7, 1.000000e+00
  store double %B7, ptr poison, align 8
  store i1 %C4, ptr @G.5, align 1
  br label %BB

SW_C7:                                            ; preds = %BB4, %SW_C7, %start
  %G6 = getelementptr inbounds i64, ptr %A12, i8 %LGV1
  %LGV3 = load i1, ptr @G.10, align 1
  %L11 = load i1, ptr %A10, align 1
  store ptr %G6, ptr %A12, align 8
  %B1 = mul i1 %LGV3, %C3
  store i1 %B1, ptr %A2, align 1
  br i1 %LGV3, label %SW_C7, label %BB4

BB4:                                              ; preds = %SW_C7
  br i1 %L11, label %SW_C7, label %BB

SW_C8:                                            ; preds = %SW_C8, %start
  %G5 = getelementptr ptr, ptr %A12, i1 %C3
  %L13 = load i1, ptr %A12, align 1
  %B4 = and i1 %C3, %C3
  store i1 %B4, ptr @G.14, align 1
  store ptr %G5, ptr %A2, align 8
  br i1 %L13, label %BB, label %SW_C8
}

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

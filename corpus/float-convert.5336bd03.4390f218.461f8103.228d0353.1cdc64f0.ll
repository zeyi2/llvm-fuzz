; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f,+zvkb,+zbs,+c -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i8 -128
@G.2 = global i1 true
@G.3 = global i64 0
@G.4 = global float 1.000000e+00
@G.5 = global i16 -32768
@G.6 = global float 1.401300e-45
@G.7 = global i1 true
@G.8 = global float 4.200000e+01
@G.9 = global i128 -1
@G.10 = global i1 true
@G.11 = global bfloat 0.000000e+00
@G.12 = global i1 true
@G.13 = global i32 2147483647
@G.14 = global ptr poison

; Function Attrs: nounwind
declare i32 @fcvt_w_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s_multiple_use(float, ptr) #0

; Function Attrs: nounwind
declare signext i32 @fmv_x_w(float, float) #0

; Function Attrs: nounwind
declare float @fcvt_s_w(i32) #0

; Function Attrs: nounwind
declare float @fcvt_s_w_load(ptr) #0

; Function Attrs: nounwind
declare float @fcvt_s_wu(i32) #0

; Function Attrs: nounwind
declare float @fcvt_s_wu_load(ptr) #0

; Function Attrs: nounwind
define float @fmv_w_x(i32 %a, i32 %b) #0 {
  %A7 = alloca i32, align 4
  store i32 poison, ptr %A7, align 4
  %A6 = alloca bfloat, align 2
  store bfloat poison, ptr %A6, align 2
  %A5 = alloca i1, align 1
  store i1 poison, ptr %A5, align 1
  %A17 = alloca i1, align 1
  store i1 false, ptr %A17, align 1
  %A14 = alloca i1, align 1
  store i1 false, ptr %A14, align 1
  %A12 = alloca i1, align 1
  store i1 false, ptr %A12, align 1
  %A9 = alloca i1, align 1
  store i1 true, ptr %A9, align 1
  %LGV1 = load i128, ptr @G.9, align 4
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i8, ptr @G.1, align 1
  %G = getelementptr i32, ptr %A7, i32 %a
  %1 = bitcast i32 %a to float
  %C1 = icmp eq i8 -1, %LGV
  %2 = bitcast i32 %b to float
  %C = fcmp ogt float %2, 0.000000e+00
  store ptr %G, ptr @G.14, align 8
  switch i128 %LGV1, label %SW_D [
    i128 12334120865224864325, label %SW_C
    i128 3298296253462092001, label %SW_C2
    i128 4088944954782553100, label %SW_C3
    i128 15442632561807883262, label %SW_C4
    i128 15275486085816549412, label %SW_C5
    i128 9616605875146262232, label %SW_C6
    i128 3478737351913716005, label %SW_C7
    i128 1228602924683991740, label %SW_C8
  ]

BB:                                               ; preds = %SW_C8, %SW_C7, %SW_C6, %SW_C5, %SW_C3, %SW_C2, %SW_C
  %3 = fadd float %1, %2
  store i1 %C, ptr @G, align 1
  store i1 %C1, ptr %A, align 1
  store float %3, ptr poison, align 4
  ret float %3

SW_D:                                             ; preds = %0
  %C3 = fcmp uge bfloat 1.000000e+00, +qnan
  store i1 %C3, ptr @G, align 1
  %C4 = icmp ule i1 %C3, %C1
  store i1 %C4, ptr @G.12, align 1
  store i1 %C4, ptr @G.12, align 1
  ret float %1

SW_C:                                             ; preds = %SW_C, %0
  %L = load i1, ptr %A9, align 1
  store i1 %L, ptr %A5, align 1
  br i1 %L, label %SW_C, label %BB

SW_C2:                                            ; preds = %SW_C2, %0
  %LGV10 = load i1, ptr @G.10, align 1
  br i1 %LGV10, label %BB, label %SW_C2

SW_C3:                                            ; preds = %SW_C3, %0
  %L13 = load i1, ptr %A12, align 1
  br i1 %L13, label %SW_C3, label %BB

SW_C4:                                            ; preds = %0
  ret float %2

SW_C5:                                            ; preds = %SW_C5, %0
  %LGV2 = load i32, ptr @G.13, align 4
  %B3 = and i32 1, %LGV2
  %C2 = icmp ne i32 %a, %a
  %LGV19 = load bfloat, ptr @G.11, align 2
  %C20 = fcmp ogt bfloat +inf, %LGV19
  %G6 = getelementptr i32, ptr %A12, i1 %C20
  store i1 %C20, ptr %G6, align 1
  store bfloat %LGV19, ptr %A6, align 2
  store i32 %B3, ptr @G.13, align 4
  br i1 %C2, label %SW_C5, label %BB

SW_C6:                                            ; preds = %SW_C6, %0
  %L18 = load i1, ptr %A17, align 1
  %B5 = sub i1 %C1, true
  %B4 = mul i32 %a, 42
  store i32 %B4, ptr %A17, align 4
  store i1 %B5, ptr %A7, align 1
  br i1 %L18, label %SW_C6, label %BB

SW_C7:                                            ; preds = %0
  br label %BB

SW_C8:                                            ; preds = %0
  %B = xor <2 x i64> splat (i64 -9223372036854775808), zeroinitializer
  store <2 x i64> %B, ptr %A17, align 16
  %B1 = add i32 %b, -2147483648
  store i32 %B1, ptr poison, align 4
  store i32 %B1, ptr %A7, align 4
  br label %BB
}

; Function Attrs: nounwind
declare i64 @fcvt_l_s(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_s(float) #0

; Function Attrs: nounwind
declare float @fcvt_s_l(i64) #0

; Function Attrs: nounwind
declare float @fcvt_s_lu(i64) #0

; Function Attrs: nounwind
declare float @fcvt_s_w_i8(i8 signext) #0

; Function Attrs: nounwind
declare float @fcvt_s_wu_i8(i8 zeroext) #0

; Function Attrs: nounwind
declare float @fcvt_s_w_i16(i16 signext) #0

; Function Attrs: nounwind
declare float @fcvt_s_wu_i16(i16 zeroext) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_s_w_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_s_wu_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_i16(float) #0

; Function Attrs: nounwind
define zeroext i16 @fcvt_wu_s_i16(float %a) #0 {
  %A4 = alloca i1, align 1
  store i1 poison, ptr %A4, align 1
  %A = alloca i128, align 8
  %L5 = load i8, ptr %A, align 1
  %C4 = fcmp une bfloat 9.183550e-41, 0.000000e+00
  %L2 = load i1, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  store i128 poison, ptr %A, align 4
  %1 = fptoui float %a to i16
  %C = icmp slt i16 %1, 256
  %B3 = or i1 %L, %L2
  %B1 = urem i128 18446744073709551616, 18446744073709551616
  %G = getelementptr i1, ptr %A, i8 %L5
  %B = fadd float %a, 1.000000e+00
  store i1 %C, ptr @G, align 1
  %C1 = icmp sle i1 %C4, %L
  store float %B, ptr @G.8, align 4
  store i128 %B1, ptr %G, align 4
  store i1 %C1, ptr @G.10, align 1
  store i1 %B3, ptr %A4, align 1
  ret i16 %1
}

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(float) #0

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_i8(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_s_sat(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s_sat(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_l_s_sat(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_s_sat(float) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_sat_i16(float) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(float) #0

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_sat_i8(float) #0

; Function Attrs: nounwind
declare zeroext i32 @fcvt_wu_s_sat_zext(float) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_w_s_sat_sext(float) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fptosi.sat.i16.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fptosi.sat.i32.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fptosi.sat.i64.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fptosi.sat.i8.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fptoui.sat.i16.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fptoui.sat.i32.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fptoui.sat.i64.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fptoui.sat.i8.f32(float) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

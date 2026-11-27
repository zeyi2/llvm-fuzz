; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f,+zvkb,+zihintpause,+zba -O0
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
@G.12 = global i1 false
@G.13 = global double 0.000000e+00
@G.14 = global <2 x i64> splat (i64 1)
@G.15 = global float +qnan
@G.16 = global <8 x i1> splat (i1 true)
@G.17 = global float 0.000000e+00
@G.18 = global i32 1

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
  %A3 = alloca i64, align 8
  store i64 42, ptr %A3, align 4
  %A4 = alloca i32, align 4
  store i32 2147483647, ptr %A4, align 4
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
  %1 = bitcast i32 %a to float
  %C1 = icmp eq i8 -1, %LGV
  %2 = bitcast i32 %b to float
  %C = fcmp ogt float %2, 0.000000e+00
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

BB:                                               ; preds = %SW_C8, %SW_C7, %BB1, %BB3, %SW_C3, %SW_C2, %SW_C
  %3 = fadd float %1, %2
  store i1 %C, ptr @G, align 1
  store i1 %C1, ptr %A, align 1
  ret float %3

SW_D:                                             ; preds = %0
  %L4 = load i64, ptr %A3, align 4
  switch i64 %L4, label %SW_D5 [
    i64 -2046436005197036997, label %SW_C12
    i64 3509701477871876001, label %SW_C13
  ]

BB2:                                              ; preds = %SW_C12, %SW_D5
  %C3 = fcmp uge bfloat 1.000000e+00, +qnan
  store i1 %C3, ptr @G, align 1
  ret float %1

SW_C:                                             ; preds = %SW_C, %0
  %L = load i1, ptr %A9, align 1
  br i1 %L, label %SW_C, label %BB

SW_C2:                                            ; preds = %SW_C2, %0
  %LGV10 = load i1, ptr @G.10, align 1
  br i1 %LGV10, label %BB, label %SW_C2

SW_C3:                                            ; preds = %SW_C3, %0
  %L13 = load i1, ptr %A12, align 1
  br i1 %L13, label %SW_C3, label %BB

SW_C4:                                            ; preds = %0
  ret float %2

SW_C5:                                            ; preds = %BB3, %0
  %LGV19 = load bfloat, ptr @G.11, align 2
  %L5 = load i32, ptr %A4, align 4
  switch i32 %L5, label %SW_D6 [
    i32 745552174, label %SW_C9
    i32 -1190634058, label %SW_C10
    i32 859024868, label %SW_C11
  ]

BB3:                                              ; preds = %SW_D6
  %L15 = load i1, ptr %A14, align 1
  %C20 = fcmp ogt bfloat +inf, %LGV19
  store i1 %C20, ptr %A17, align 1
  br i1 %L15, label %SW_C5, label %BB

SW_C6:                                            ; preds = %BB1, %0
  br i1 %C, label %T, label %F

BB1:                                              ; preds = %F, %T
  %L18 = load i1, ptr %A17, align 1
  %B4 = mul i32 %a, 42
  store i32 %B4, ptr %A17, align 4
  br i1 %L18, label %SW_C6, label %BB

SW_C7:                                            ; preds = %0
  br label %BB

SW_C8:                                            ; preds = %0
  %B = xor <2 x i64> splat (i64 -9223372036854775808), zeroinitializer
  store <2 x i64> %B, ptr %A17, align 16
  br label %BB

T:                                                ; preds = %T, %SW_C6
  br i1 %C, label %T, label %BB1

F:                                                ; preds = %SW_C6
  br label %BB1

SW_D6:                                            ; preds = %SW_C5
  br label %BB3

SW_C9:                                            ; preds = %SW_C5
  %LGV2 = load i32, ptr @G.18, align 4
  %C4 = icmp ule i32 %b, %LGV2
  store i1 %C4, ptr %A3, align 1
  ret float f0x7F7FFFFF

SW_C10:                                           ; preds = %SW_C5
  ret float %1

SW_C11:                                           ; preds = %SW_C5
  ret float %1

SW_D5:                                            ; preds = %SW_D
  %B1 = xor i64 %L4, %L4
  store i64 %B1, ptr %A3, align 4
  br label %BB2

SW_C12:                                           ; preds = %SW_D
  br label %BB2

SW_C13:                                           ; preds = %SW_D
  ret float %2
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
define float @fcvt_s_wu_i16(i16 zeroext %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %B = add i16 %a, %a
  %C3 = icmp ne i16 %B, %B
  %1 = uitofp i16 %a to float
  %C2 = icmp ne <8 x i8> zeroinitializer, splat (i8 -1)
  %C = fcmp ule float %1, +inf
  %C1 = fcmp ult double +qnan, 0.000000e+00
  %B1 = mul <2 x i64> splat (i64 -9223372036854775808), splat (i64 -1)
  store i16 %B, ptr @G.5, align 2
  store i1 %C, ptr poison, align 1
  store i1 %C1, ptr poison, align 1
  store <2 x i64> %B1, ptr @G.14, align 16
  store <8 x i1> %C2, ptr @G.16, align 1
  store i1 %C3, ptr poison, align 1
  %C4 = icmp slt i1 %C3, %C1
  store i1 %C4, ptr %A, align 1
  ret float %1
}

; Function Attrs: nounwind
declare signext i32 @fcvt_s_w_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_s_wu_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_i16(float) #0

; Function Attrs: nounwind
define zeroext i16 @fcvt_wu_s_i16(float %a) #0 {
  %A6 = alloca i1, align 1
  store i1 true, ptr %A6, align 1
  %A4 = alloca i1, align 1
  store i1 true, ptr %A4, align 1
  %A2 = alloca ptr, align 8
  %L3 = load i1, ptr %A2, align 1
  store ptr poison, ptr %A2, align 8
  %A1 = alloca i1, align 1
  store i1 poison, ptr %A1, align 1
  %LGV1 = load i1, ptr @G.12, align 1
  %A = alloca i128, align 8
  %L = load i16, ptr %A, align 2
  %G = getelementptr float, ptr %A1, i16 0
  store i128 poison, ptr %A, align 4
  %1 = fptoui float %a to i16
  %C2 = icmp uge i1 true, %LGV1
  %B1 = urem i128 18446744073709551616, 18446744073709551616
  %B = fadd float %a, 1.000000e+00
  store i1 %C2, ptr @G, align 1
  store float %B, ptr @G.8, align 4
  store i128 %B1, ptr %A, align 4
  %L5 = load i1, ptr %A4, align 1
  br i1 %L5, label %T, label %F

BB:                                               ; preds = %F, %T
  %B2 = ashr i16 0, %L
  %C = icmp slt i16 %1, %L
  store i1 %C, ptr %A1, align 1
  store ptr %G, ptr %A2, align 8
  store i16 %B2, ptr %A6, align 2
  ret i16 %1

T:                                                ; preds = %T, %0
  %L7 = load i1, ptr %A6, align 1
  %G3 = getelementptr i128, ptr %A2, i1 %C2
  %C1 = icmp sle i1 %L7, %L3
  store ptr %G3, ptr %A6, align 8
  br i1 %C1, label %BB, label %T

F:                                                ; preds = %0
  br label %BB
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

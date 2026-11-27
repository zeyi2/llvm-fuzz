; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+zvkb,+zvfh,+zve64d -O2
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
@G.12 = global i64 -1
@G.13 = global <2 x i1> zeroinitializer
@G.14 = global i1 true
@G.15 = global float 1.401300e-45
@G.16 = global float 0.000000e+00
@G.17 = global i1 false
@G.18 = global float +qnan
@G.19 = global i16 0
@G.20 = global i16 -1

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
declare float @fmv_w_x(i32, i32) #0

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
  %LGV5 = load i16, ptr @G.19, align 2
  %LGV = load float, ptr @G.18, align 4
  %B6 = lshr i16 0, %LGV5
  %A = alloca i1, align 1
  %L = load float, ptr %A, align 4
  store i1 poison, ptr %A, align 1
  %B2 = sdiv i8 0, 1
  %1 = fptoui float %a to i16
  %C = icmp slt i16 %1, 256
  %B = fadd float %a, 1.000000e+00
  store i1 %C, ptr @G, align 1
  store float %B, ptr @G.8, align 4
  store i8 %B2, ptr @G.1, align 1
  %C1 = fcmp true float %a, %B
  store i1 %C1, ptr @G.10, align 1
  %C4 = icmp ne i1 %C1, %C1
  %C2 = fcmp ult float %a, %L
  store i1 %C4, ptr %A, align 1
  %C3 = fcmp oge float %B, %LGV
  store i1 %C2, ptr @G.14, align 1
  store i1 %C3, ptr @G, align 1
  store i16 %B6, ptr @G.20, align 2
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
define i64 @fcvt_lu_s_sat(float %a) #0 {
start:
  %A9 = alloca i64, align 8
  store i64 -1, ptr %A9, align 4
  %LGV8 = load i64, ptr @G.12, align 4
  %LGV2 = load float, ptr @G.15, align 4
  %C2 = fcmp one float %a, +qnan
  %B1 = xor i1 %C2, %C2
  store i1 %C2, ptr @G.7, align 1
  %L = load i64, ptr %A9, align 4
  switch i64 %L, label %SW_D [
    i64 3867172081383205322, label %SW_C
    i64 -8110063563604586758, label %SW_C10
    i64 7948438064311459552, label %SW_C11
    i64 -3396051455986074754, label %SW_C12
    i64 7993904389105380142, label %SW_C13
    i64 2345653942526857271, label %SW_C14
    i64 4770995733833269431, label %SW_C15
    i64 -2345468454921491376, label %SW_C16
  ]

BB:                                               ; preds = %SW_C15, %SW_C14, %SW_C13, %SW_C12, %SW_C10, %SW_C, %SW_D
  %B3 = shl i128 0, 42
  %B5 = fdiv float %LGV2, %LGV2
  %LGV = load float, ptr @G.4, align 4
  %0 = tail call i64 @llvm.fptoui.sat.i64.f32(float %a)
  %LGV1 = load float, ptr @G.6, align 4
  %A = alloca i128, align 8
  %C = fcmp ult float %LGV, %LGV1
  store i128 %B3, ptr %A, align 4
  %B = fadd float f0x7F7FFFFF, %LGV
  store i128 poison, ptr %A, align 4
  store float %B, ptr @G.4, align 4
  store i1 %C, ptr @G.7, align 1
  %C7 = fcmp ult float %B5, %LGV2
  store i1 %C7, ptr @G, align 1
  %B4 = or i128 %B3, %B3
  %C4 = fcmp olt float %LGV, %LGV2
  store i128 %B4, ptr poison, align 4
  store i1 %B1, ptr @G.14, align 1
  store i1 %C4, ptr @G.7, align 1
  store float %B5, ptr @G.16, align 4
  ret i64 %0

SW_D:                                             ; preds = %start
  br label %BB

SW_C:                                             ; preds = %start
  br label %BB

SW_C10:                                           ; preds = %start
  br label %BB

SW_C11:                                           ; preds = %start
  %LGV17 = load i64, ptr @G.12, align 4
  ret i64 %LGV8

SW_C12:                                           ; preds = %start
  br label %BB

SW_C13:                                           ; preds = %start
  br label %BB

SW_C14:                                           ; preds = %start
  br label %BB

SW_C15:                                           ; preds = %SW_C15, %start
  %LGV18 = load i1, ptr @G.17, align 1
  br i1 %LGV18, label %BB, label %SW_C15

SW_C16:                                           ; preds = %start
  ret i64 %LGV8
}

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

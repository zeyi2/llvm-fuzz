; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32f -mattr=+f,+zicond,+zbkb,+zcb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 0
@G.1 = global i16 1
@G.2 = global i64 -1
@G.3 = global i8 -128
@G.4 = global i1 false
@G.5 = global i1 true
@G.6 = global i1 true
@G.7 = global float 1.000000e+00
@G.8 = global i128 18446744073709551616
@G.9 = global float 0.000000e+00

; Function Attrs: nounwind
declare i32 @fcvt_w_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_s_sat(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s_multiple_use(float, ptr) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s_sat(float) #0

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
declare i64 @fcvt_l_s_sat(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_s(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_s_sat(float) #0

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
declare signext i16 @fcvt_w_s_sat_i16(float) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_i16(float) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(float) #0

; Function Attrs: nounwind
define zeroext i8 @fcvt_wu_s_i8(float %a) #0 {
  %A2 = alloca i1, align 1
  store i1 false, ptr %A2, align 1
  %A1 = alloca i1, align 1
  %L9 = load i64, ptr %A1, align 4
  store i1 false, ptr %A1, align 1
  %A = alloca i1, align 1
  %L10 = load i64, ptr %A, align 4
  %C11 = icmp sle i64 %L9, %L10
  %L3 = load i8, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  store i1 poison, ptr %A, align 1
  %L2 = load i1, ptr %A1, align 1
  store i1 %C11, ptr @G.6, align 1
  br i1 %L2, label %T, label %F

BB:                                               ; preds = %F
  %1 = fptoui float %a to i8
  store i1 %B, ptr %A, align 1
  %C = icmp ult i1 %L, %C1
  store i1 %C, ptr @G.5, align 1
  ret i8 %1

T:                                                ; preds = %0
  %LGV2 = load float, ptr @G.9, align 4
  %B6 = or i16 -1, 32767
  %C3 = fcmp ule float %a, %LGV2
  store i16 %B6, ptr @G, align 2
  switch i1 %C3, label %SW_D [
    i1 true, label %SW_C
    i1 false, label %SW_C5
  ]

BB1:                                              ; preds = %SW_D
  %LGV3 = load i8, ptr @G.3, align 1
  %C2 = fcmp olt float %a, %a
  store i1 %C2, ptr @G.5, align 1
  ret i8 %LGV3

F:                                                ; preds = %0
  %LGV = load i128, ptr @G.8, align 4
  %G6 = getelementptr float, ptr %A1, i32 -1
  %C1 = icmp sgt i128 0, %LGV
  %LGV4 = load i1, ptr %G6, align 1
  %B = sub i1 %L, %LGV4
  %C6 = fcmp ord float %a, %a
  store i1 %C6, ptr @G.5, align 1
  br label %BB

SW_D:                                             ; preds = %T
  %C4 = fcmp uno float %a, %LGV2
  store i1 %C4, ptr %A2, align 1
  br label %BB1

SW_C:                                             ; preds = %T
  ret i8 %L3

SW_C5:                                            ; preds = %T
  %LGV7 = load float, ptr @G.7, align 4
  %C7 = fcmp ole float %a, %LGV2
  %B8 = fadd float %a, %LGV7
  store float %B8, ptr poison, align 4
  store i1 %C7, ptr poison, align 1
  ret i8 %L3
}

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

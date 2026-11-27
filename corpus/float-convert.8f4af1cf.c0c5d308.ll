; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f,+zba -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i1 true
@G.2 = global i8 16
@G.3 = global i16 1
@G.4 = global i8 16
@G.5 = global i8 0
@G.6 = global <2 x i64> splat (i64 -9223372036854775808)
@G.7 = global <2 x i64> splat (i64 42)

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
define zeroext i16 @fcvt_wu_s_sat_i16(float %a) #0 {
start:
  %LGV2 = load <2 x i64>, ptr @G.6, align 16
  %C = fcmp one float %a, %a
  %LGV = load i1, ptr @G, align 1
  %0 = tail call i16 @llvm.fptoui.sat.i16.f32(float %a)
  %B = shl i1 false, %LGV
  store i1 %B, ptr @G.1, align 1
  store i1 %C, ptr poison, align 1
  %B3 = add <2 x i64> splat (i64 4294967296), %LGV2
  store <2 x i64> %B3, ptr @G.7, align 16
  ret i16 %0
}

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(float) #0

; Function Attrs: nounwind
define zeroext i8 @fcvt_wu_s_i8(float %a) #0 {
  %A11 = alloca i1, align 1
  store i1 true, ptr %A11, align 1
  %A10 = alloca i1, align 1
  store i1 false, ptr %A10, align 1
  %LGV = load i16, ptr @G.3, align 2
  switch i16 %LGV, label %SW_D [
    i16 -21810, label %SW_C
    i16 -24170, label %SW_C1
    i16 -23575, label %SW_C2
    i16 13117, label %SW_C3
    i16 10703, label %SW_C4
    i16 17400, label %SW_C5
    i16 -19714, label %SW_C6
    i16 13354, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C6, %SW_C5, %SW_C4, %SW_C, %SW_D
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %1 = fptoui float %a to i8
  %B = or i8 %1, %1
  store i8 %B, ptr %A, align 1
  ret i8 %1

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  %LGV8 = load i8, ptr @G.4, align 1
  ret i8 %LGV8

SW_C2:                                            ; preds = %0
  %LGV9 = load i8, ptr @G.5, align 1
  ret i8 %LGV9

SW_C3:                                            ; preds = %0
  ret i8 0

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %SW_C6, %0
  %L = load i1, ptr %A10, align 1
  br i1 %L, label %BB, label %SW_C6

SW_C7:                                            ; preds = %SW_C7, %0
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %SW_C7, label %BB
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

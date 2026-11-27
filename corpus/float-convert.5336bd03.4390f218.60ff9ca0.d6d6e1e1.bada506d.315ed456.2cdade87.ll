; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+zvfh,+a -O3
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
@G.14 = global i64 4294967296
@G.15 = global i8 -128
@G.16 = global i16 256
@G.17 = global i8 127

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
  %A23 = alloca i1, align 1
  store i1 poison, ptr %A23, align 1
  %A16 = alloca i1, align 1
  store i1 true, ptr %A16, align 1
  %A10 = alloca i1, align 1
  store i1 poison, ptr %A10, align 1
  %LGV = load i64, ptr @G.14, align 4
  %A = alloca i1, align 1
  %L7 = load i16, ptr %A, align 2
  %L = load i16, ptr %A, align 2
  store i1 poison, ptr %A, align 1
  %L17 = load i1, ptr %A16, align 1
  br i1 %L17, label %T, label %F

BB:                                               ; preds = %F, %T
  %B2 = sdiv i8 0, 1
  %1 = fptoui float %a to i16
  %B3 = shl i64 42, %LGV
  %C = icmp slt i16 %1, 256
  %B = fadd float %a, 1.000000e+00
  store i1 %C, ptr @G, align 1
  store float %B, ptr @G.8, align 4
  %C9 = fcmp uno float %B, %a
  store i8 %B2, ptr @G.1, align 1
  %C1 = fcmp true float %a, %B
  store i1 %C1, ptr @G.10, align 1
  %C5 = fcmp oeq float %a, %B
  store i1 %C5, ptr %A, align 1
  %C8 = icmp ult i16 256, %L7
  store i64 %B3, ptr @G.12, align 4
  %B4 = and i16 %L, %1
  %B5 = fadd float %a, %B
  store i1 %C8, ptr @G, align 1
  store float %B5, ptr @G.8, align 4
  %B13 = urem i8 %B2, 0
  store i1 %C9, ptr %A10, align 1
  store i8 %B13, ptr @G.15, align 1
  store i8 %B2, ptr @G.17, align 1
  ret i16 %B4

T:                                                ; preds = %0
  %LGV21 = load i16, ptr @G.16, align 2
  %G = getelementptr float, ptr %A16, i8 0
  %L20 = load i16, ptr %G, align 2
  store ptr %G, ptr %A16, align 8
  %C22 = icmp uge i16 %L20, %L
  store i1 %C22, ptr %A23, align 1
  br label %BB

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

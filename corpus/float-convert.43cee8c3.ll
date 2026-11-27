; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f,+zcb,+zvbb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global bfloat 1.000000e+00
@G.1 = global i1 true
@G.2 = global i32 0
@G.3 = global i32 2147483647
@G.4 = global i1 false

; Function Attrs: nounwind
declare i32 @fcvt_w_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_s_sat(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s(float) #0

; Function Attrs: nounwind
define i32 @fcvt_wu_s_multiple_use(float %x, ptr %y) #0 {
  %LGV = load bfloat, ptr @G, align 2
  %C = fcmp ogt bfloat %LGV, 0.000000e+00
  %a = fptoui float %x to i32
  %c = select i1 %C, i32 1, i32 %a
  ret i32 %c
}

; Function Attrs: nounwind
declare i32 @fcvt_wu_s_sat(float) #0

; Function Attrs: nounwind
declare signext i32 @fmv_x_w(float, float) #0

; Function Attrs: nounwind
declare float @fcvt_s_w(i32) #0

; Function Attrs: nounwind
declare float @fcvt_s_w_load(ptr) #0

; Function Attrs: nounwind
define float @fcvt_s_wu(i32 %a) #0 {
  %LGV = load i32, ptr @G.2, align 4
  %B = lshr i32 %a, %LGV
  %1 = uitofp i32 %a to float
  store i32 %B, ptr poison, align 4
  ret float %1
}

; Function Attrs: nounwind
declare float @fcvt_s_wu_load(ptr) #0

; Function Attrs: nounwind
declare float @fmv_w_x(i32, i32) #0

; Function Attrs: nounwind
define i64 @fcvt_l_s(float %a) #0 {
  %A = alloca <8 x i8>, align 8
  store <8 x i8> poison, ptr %A, align 8
  %B = mul <8 x i8> zeroinitializer, splat (i8 -128)
  %1 = fptosi float %a to i64
  store <8 x i8> %B, ptr %A, align 8
  ret i64 %1
}

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
define signext i32 @fcvt_s_w_demanded_bits(i32 signext %0, ptr %1) #0 {
  %3 = add i32 %0, 1
  %4 = sitofp i32 %3 to float
  store float %4, ptr %1, align 4
  %C = fcmp true float %4, +qnan
  store i1 %C, ptr @G.4, align 1
  ret i32 %3
}

; Function Attrs: nounwind
define signext i32 @fcvt_s_wu_demanded_bits(i32 signext %0, ptr %1) #0 {
  %3 = add i32 %0, 1
  %4 = uitofp i32 %3 to float
  store float %4, ptr %1, align 4
  %B = add i32 %3, %3
  store i32 %B, ptr @G.3, align 4
  ret i32 %3
}

; Function Attrs: nounwind
define signext i16 @fcvt_w_s_i16(float %a) #0 {
  %A = alloca i128, align 8
  store i128 poison, ptr %A, align 4
  %B = add i128 -1, -170141183460469231731687303715884105728
  %1 = fptosi float %a to i16
  store i128 %B, ptr %A, align 4
  ret i16 %1
}

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
  %1 = fptoui float %a to i8
  %C = fcmp ule float %a, %a
  store i1 %C, ptr poison, align 1
  ret i8 %1
}

; Function Attrs: nounwind
define zeroext i8 @fcvt_wu_s_sat_i8(float %a) #0 {
start:
  %0 = tail call i8 @llvm.fptoui.sat.i8.f32(float %a)
  %C = fcmp ule float %a, 0.000000e+00
  store i1 %C, ptr @G.1, align 1
  ret i8 %0
}

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

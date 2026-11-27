; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f,+zihintpause,+zve32x -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global float 1.000000e+00
@G.2 = global i128 0
@G.3 = global i1 false
@G.4 = global i64 -1
@G.5 = global i16 32767
@G.6 = global bfloat 0.000000e+00
@G.7 = global float 0.000000e+00
@G.8 = global i32 -1
@G.9 = global i32 2147483647
@G.10 = global i1 false

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
define i64 @fcvt_l_s(float %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C2 = fcmp olt float %a, 0.000000e+00
  %LGV = load bfloat, ptr @G.6, align 2
  %C1 = fcmp false bfloat +qnan, %LGV
  %1 = fptosi float %a to i64
  %C = icmp ult i1 true, true
  store i1 %C, ptr @G, align 1
  store i64 %1, ptr poison, align 4
  store i1 %C1, ptr %A, align 1
  store i1 %C2, ptr @G.3, align 1
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
define float @fcvt_s_lu(i64 %a) #0 {
  %A2 = alloca i64, align 8
  %L1 = load i8, ptr %A2, align 1
  %G = getelementptr i16, ptr %A2, i8 %L1
  store i64 poison, ptr %G, align 4
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %LGV = load i64, ptr @G.4, align 4
  %B = shl i64 9223372036854775807, %LGV
  %1 = uitofp i64 %a to float
  store i64 %B, ptr %A, align 4
  %B1 = sub i64 %a, %a
  store i64 %B1, ptr %A2, align 4
  ret float %1
}

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
define zeroext i16 @fcvt_wu_s_i16(float %a) #0 {
  %LGV3 = load i32, ptr @G.8, align 4
  %LGV = load float, ptr @G.7, align 4
  %C1 = fcmp ule float %a, %LGV
  %1 = fptoui float %a to i16
  %B = lshr i32 -1, %LGV3
  %C = fcmp true float %a, %a
  store i1 %C1, ptr @G.3, align 1
  store i32 %B, ptr @G.9, align 4
  store i1 %C, ptr @G.10, align 1
  ret i16 %1
}

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(float) #0

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_i8(float) #0

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

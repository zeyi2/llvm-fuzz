; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f,+m -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 9223372036854775807
@G.1 = global i128 -170141183460469231731687303715884105728
@G.2 = global i1 true
@G.3 = global i16 0
@G.4 = global float 0.000000e+00

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
define float @fcvt_s_w(i32 %a) #0 {
  %LGV1 = load i16, ptr @G.3, align 2
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %1 = sitofp i32 %a to float
  %C2 = icmp uge i16 -1, %LGV1
  store i1 %C2, ptr %A, align 1
  ret float %1
}

; Function Attrs: nounwind
declare float @fcvt_s_w_load(ptr) #0

; Function Attrs: nounwind
define float @fcvt_s_wu(i32 %a) #0 {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %1 = uitofp i32 %a to float
  %B = and i32 %a, -1
  store i32 %B, ptr %A, align 4
  ret float %1
}

; Function Attrs: nounwind
declare float @fcvt_s_wu_load(ptr) #0

; Function Attrs: nounwind
declare float @fmv_w_x(i32, i32) #0

; Function Attrs: nounwind
define i64 @fcvt_l_s(float %a) #0 {
  %C = fcmp ugt float %a, 1.401300e-45
  %1 = fptosi float %a to i64
  store i1 %C, ptr poison, align 1
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
  %A = alloca i1, align 1
  %L1 = load float, ptr %A, align 4
  %L = load float, ptr %A, align 4
  store i1 poison, ptr %A, align 1
  %C2 = fcmp oge float %L, %L1
  %LGV = load i128, ptr @G.1, align 4
  %C = icmp sgt i128 -170141183460469231731687303715884105728, %LGV
  %0 = tail call i16 @llvm.fptoui.sat.i16.f32(float %a)
  store i1 %C, ptr %A, align 1
  store i1 %C2, ptr @G.2, align 1
  ret i16 %0
}

; Function Attrs: nounwind
define signext i8 @fcvt_w_s_i8(float %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i64, ptr @G, align 4
  %C = icmp ne i64 %LGV, 9223372036854775807
  %1 = fptosi float %a to i8
  store i1 %C, ptr %A, align 1
  ret i8 %1
}

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(float) #0

; Function Attrs: nounwind
define zeroext i8 @fcvt_wu_s_i8(float %a) #0 {
  %LGV = load float, ptr @G.4, align 4
  %1 = fptoui float %a to i8
  %C = fcmp ole float %a, %LGV
  store i1 %C, ptr poison, align 1
  ret i8 %1
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

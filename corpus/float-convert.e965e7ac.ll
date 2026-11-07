; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+zvfh -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float f0x7F7FFFFF
@G.1 = global i32 1
@G.2 = global i32 42
@G.3 = global <2 x i64> splat (i64 -1)
@G.4 = global i128 -170141183460469231731687303715884105728

; Function Attrs: nounwind
declare i32 @fcvt_w_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_s_sat(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s_multiple_use(float, ptr) #0

; Function Attrs: nounwind
define i32 @fcvt_wu_s_sat(float %a) #0 {
start:
  %LGV = load float, ptr @G, align 4
  %0 = tail call i32 @llvm.fptoui.sat.i32.f32(float %a)
  %C = fcmp oeq float %a, %LGV
  store i1 %C, ptr poison, align 1
  ret i32 %0
}

; Function Attrs: nounwind
declare signext i32 @fmv_x_w(float, float) #0

; Function Attrs: nounwind
declare float @fcvt_s_w(i32) #0

; Function Attrs: nounwind
define float @fcvt_s_w_load(ptr %p) #0 {
  %G = getelementptr <2 x i64>, ptr %p, i16 32767
  %a = load i32, ptr %p, align 4
  %1 = sitofp i32 %a to float
  store ptr %G, ptr poison, align 8
  ret float %1
}

; Function Attrs: nounwind
define float @fcvt_s_wu(i32 %a) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %1 = uitofp i32 %a to float
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  ret float %1

T:                                                ; preds = %0
  ret float %1

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare float @fcvt_s_wu_load(ptr) #0

; Function Attrs: nounwind
define float @fmv_w_x(i32 %a, i32 %b) #0 {
  %LGV1 = load i32, ptr @G.1, align 4
  %1 = bitcast i32 %a to float
  %B = shl i32 %b, %LGV1
  %2 = bitcast i32 %b to float
  %3 = fadd float %1, %2
  store i32 %B, ptr @G.2, align 4
  ret float %3
}

; Function Attrs: nounwind
declare i64 @fcvt_l_s(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_l_s_sat(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_s(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_s_sat(float) #0

; Function Attrs: nounwind
define float @fcvt_s_l(i64 %a) #0 {
  %1 = sitofp i64 %a to float
  %B = fdiv float %1, 4.200000e+01
  ret float %B
}

; Function Attrs: nounwind
declare float @fcvt_s_lu(i64) #0

; Function Attrs: nounwind
define float @fcvt_s_w_i8(i8 signext %a) #0 {
  %1 = sitofp i8 %a to float
  %B = urem <2 x i64> splat (i64 -1), splat (i64 -9223372036854775808)
  store <2 x i64> %B, ptr @G.3, align 16
  ret float %1
}

; Function Attrs: nounwind
declare float @fcvt_s_wu_i8(i8 zeroext) #0

; Function Attrs: nounwind
declare float @fcvt_s_w_i16(i16 signext) #0

; Function Attrs: nounwind
define float @fcvt_s_wu_i16(i16 zeroext %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = icmp ugt i16 %a, 256
  %1 = uitofp i16 %a to float
  store i1 %C, ptr %A, align 1
  ret float %1
}

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
  %B = and i128 -1, -170141183460469231731687303715884105728
  %1 = fptoui float %a to i8
  store i128 %B, ptr @G.4, align 4
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

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+f,+zbkb,+m -O0 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float f0x7F7FFFFF
@G.1 = global i64 1
@G.2 = global i1 true
@G.3 = global i1 false
@G.4 = global i1 false
@G.5 = global bfloat 3.389530e+38
@G.6 = global double +qnan
@G.7 = global double 4.940660e-324
@G.8 = global i1 false
@G.9 = global <2 x i64> splat (i64 42)

; Function Attrs: nounwind
declare i32 @fcvt_w_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_s_sat(float) #0

; Function Attrs: nounwind
define i32 @fcvt_wu_s(float %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load float, ptr @G, align 4
  %1 = fptoui float %a to i32
  %C = fcmp false float %a, %LGV
  %C2 = fcmp ule float %a, %LGV
  %C1 = fcmp false float %a, 1.401300e-45
  store i1 %C, ptr poison, align 1
  store i1 %C1, ptr @G.4, align 1
  store i1 %C2, ptr @G.2, align 1
  %C3 = icmp eq i1 %C2, true
  store i1 %C3, ptr %A, align 1
  ret i32 %1
}

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
define signext i16 @fcvt_w_s_i16(float %a) #0 {
  %A2 = alloca i64, align 8
  store i64 poison, ptr %A2, align 4
  %LGV1 = load double, ptr @G.6, align 8
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %1 = fptosi float %a to i16
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %B = sdiv i64 9223372036854775807, 4294967296
  store i64 %B, ptr %A, align 4
  ret i16 %1

T:                                                ; preds = %0
  %2 = phi double [ %LGV1, %0 ]
  %G = getelementptr i1, ptr %A, i1 %L
  store double %2, ptr @G.7, align 8
  store ptr %G, ptr poison, align 8
  br label %BB

F:                                                ; preds = %0
  %B1 = ashr i64 1, -9223372036854775808
  %C = fcmp ule float %a, %a
  store i1 %C, ptr @G.4, align 1
  store i64 %B1, ptr %A2, align 4
  br label %BB
}

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_sat_i16(float) #0

; Function Attrs: nounwind
define zeroext i16 @fcvt_wu_s_i16(float %a) #0 {
  %LGV2 = load i1, ptr @G.8, align 1
  %B = lshr <2 x i64> splat (i64 4294967296), splat (i64 1)
  %LGV = load bfloat, ptr @G.5, align 2
  %C2 = fcmp ult bfloat %LGV, +inf
  %1 = fptoui float %a to i16
  %C5 = fcmp ugt float %a, %a
  %C = icmp eq i1 %C2, %LGV2
  %C1 = fcmp ogt bfloat %LGV, 9.183550e-41
  store i1 %C, ptr @G.3, align 1
  store i1 %C2, ptr poison, align 1
  store <2 x i64> %B, ptr @G.9, align 16
  store i1 %C1, ptr @G.2, align 1
  store i1 %C5, ptr @G.8, align 1
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

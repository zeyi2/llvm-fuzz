; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+f,+zbkb,+m,+zihintpause,+zbs,+zbb -O3
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
@G.8 = global <8 x i1> splat (i1 true)
@G.9 = global double +inf
@G.10 = global i16 1
@G.11 = global i16 256
@G.12 = global <2 x i64> splat (i64 9223372036854775807)
@G.13 = global <2 x i64> zeroinitializer

; Function Attrs: nounwind
declare i32 @fcvt_w_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_s_sat(float) #0

; Function Attrs: nounwind
define i32 @fcvt_wu_s(float %a) #0 {
  %LGV5 = load <2 x i64>, ptr @G.12, align 16
  %A = alloca float, align 4
  store float poison, ptr %A, align 4
  %LGV = load float, ptr @G, align 4
  %1 = fptoui float %a to i32
  %C = fcmp oge float %LGV, %LGV
  %B1 = fdiv double +qnan, f0x7FEFFFFFFFFFFFFF
  %C2 = icmp uge <8 x i8> splat (i8 16), zeroinitializer
  %C1 = fcmp false float %a, 1.401300e-45
  store i1 %C, ptr poison, align 1
  %B = mul i1 %C1, %C1
  store i1 %B, ptr @G.4, align 1
  store <8 x i1> %C2, ptr @G.8, align 1
  %C3 = icmp uge i32 %1, 65536
  store double %B1, ptr @G.9, align 8
  %B6 = sdiv <2 x i64> zeroinitializer, %LGV5
  store i1 %C3, ptr poison, align 1
  %B4 = fsub float %a, %a
  store float %B4, ptr %A, align 4
  store <2 x i64> %B6, ptr @G.13, align 16
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
  %LGV1 = load double, ptr @G.6, align 8
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %1 = fptosi float %a to i16
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %C = fcmp uge float %a, %a
  %C4 = icmp eq i1 %C, %C
  store i1 %C, ptr %A, align 1
  store i1 %C4, ptr %A, align 1
  ret i16 %1

T:                                                ; preds = %0
  %2 = phi nsz double [ %LGV1, %0 ]
  store double %2, ptr @G.7, align 8
  %B1 = xor i1 %L, false
  store i1 %B1, ptr %A, align 1
  br label %BB

F:                                                ; preds = %0
  %LGV2 = load i16, ptr @G.11, align 2
  %LGV = load i16, ptr @G.10, align 2
  %B3 = lshr i16 %1, %LGV2
  %B = ashr i16 0, %LGV
  store i16 %B, ptr %A, align 2
  store i16 %B3, ptr @G.10, align 2
  br label %BB
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

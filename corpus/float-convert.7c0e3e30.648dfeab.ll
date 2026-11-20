; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f,+zfhmin,+zbb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float +qnan
@G.1 = global <4 x float> splat (float 4.200000e+01)
@G.2 = global i128 1
@G.3 = global i32 1
@G.4 = global <4 x i32> zeroinitializer
@G.5 = global float 4.200000e+01

; Function Attrs: nounwind
declare i32 @fcvt_w_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_s_sat(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s(float) #0

; Function Attrs: nounwind
define i32 @fcvt_wu_s_multiple_use(float %x, ptr %y) #0 {
  %LGV = load i32, ptr @G.3, align 4
  %a = fptoui float %x to i32
  %B = fdiv <4 x float> splat (float +qnan), splat (float +inf)
  %I1 = insertelement <4 x i32> splat (i32 2147483647), i32 %LGV, i32 %a
  %b = icmp eq i32 %a, 0
  %c = select i1 %b, i32 1, i32 %a
  %I = insertelement <4 x float> splat (float +qnan), float %x, i32 %a
  store <4 x float> %B, ptr poison, align 16
  store <4 x float> %I, ptr @G.1, align 16
  store <4 x i32> %I1, ptr @G.4, align 16
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
define signext i8 @fcvt_w_s_i8(float %a) #0 {
  %A5 = alloca i1, align 1
  store i1 poison, ptr %A5, align 1
  %A4 = alloca i128, align 8
  store i128 poison, ptr %A4, align 4
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV1 = load i128, ptr @G.2, align 4
  %LGV = load float, ptr @G, align 4
  %1 = fptosi float %a to i8
  %B = fdiv float %a, %LGV
  store i128 %LGV1, ptr %A4, align 4
  switch i128 %LGV1, label %SW_D [
    i128 14925197629249633873, label %SW_C
    i128 7278952953740037239, label %SW_C2
    i128 3213416354223033470, label %SW_C3
  ]

BB:                                               ; preds = %SW_C3, %SW_C2, %SW_C, %SW_D
  store float %B, ptr @G, align 4
  ret i8 %1

SW_D:                                             ; preds = %0
  %LGV7 = load float, ptr @G.5, align 4
  %B8 = fsub float %a, %LGV7
  store float %B8, ptr @G, align 4
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %SW_C3, %0
  %L = load i1, ptr %A, align 1
  store i1 %L, ptr %A5, align 1
  br i1 %L, label %SW_C3, label %BB
}

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

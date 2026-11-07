; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f,+zihintpause,+zvkb -O3 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 42)
@G.1 = global <4 x i1> splat (i1 true)
@G.2 = global i1 true
@G.3 = global <2 x i64> zeroinitializer
@G.4 = global <2 x i1> splat (i1 true)
@G.5 = global <8 x i8> splat (i8 -128)
@G.6 = global <2 x i64> splat (i64 42)
@G.7 = global i1 true
@G.8 = global i8 16
@G.9 = global i8 0
@G.10 = global i128 0
@G.11 = global <4 x i32> splat (i32 -1)

; Function Attrs: nounwind
declare i32 @fcvt_w_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_s_sat(float) #0

; Function Attrs: nounwind
define i32 @fcvt_wu_s(float %a) #0 {
  %A4 = alloca i1, align 1
  store i1 poison, ptr %A4, align 1
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %LGV = load <4 x i32>, ptr @G.11, align 16
  %B1 = srem i8 127, -128
  %LGV1 = load <2 x i64>, ptr @G.3, align 16
  %B3 = lshr i128 0, 0
  %1 = fptoui float %a to i32
  %B2 = mul <4 x i32> splat (i32 -1), %LGV
  %B = add <2 x i64> %LGV1, %LGV1
  %C = icmp slt <2 x i64> zeroinitializer, %LGV1
  store <2 x i1> %C, ptr @G.4, align 1
  store <2 x i64> %B, ptr @G.6, align 16
  store i8 %B1, ptr @G.8, align 1
  %C3 = fcmp ord float %a, +inf
  store <4 x i32> %B2, ptr %A, align 16
  store i128 %B3, ptr poison, align 4
  store i1 %C3, ptr %A4, align 1
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
  %A11 = alloca i1, align 1
  store i1 false, ptr %A11, align 1
  %A3 = alloca i128, align 8
  store i128 -1, ptr %A3, align 4
  %A2 = alloca i1, align 1
  store i1 true, ptr %A2, align 1
  %LGV = load i8, ptr @G.8, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp ueq float %a, 4.200000e+01
  %C2 = fcmp ult float %a, %a
  %B = ashr i1 true, %C
  %1 = fptoui float %a to i8
  %C1 = icmp uge i1 %C, %C
  switch i8 %1, label %SW_D [
    i8 78, label %SW_C
    i8 -5, label %SW_C1
    i8 114, label %SW_C2
  ]

BB:                                               ; preds = %SW_C, %SW_D
  store i1 %C1, ptr @G.2, align 1
  store i1 %C2, ptr @G.7, align 1
  store i1 %B, ptr %A, align 1
  ret i8 %1

SW_D:                                             ; preds = %0
  %C7 = icmp sgt i8 %LGV, %1
  store i1 %C7, ptr @G.7, align 1
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  ret i8 %LGV

SW_C2:                                            ; preds = %0
  %LGV3 = load i8, ptr @G.9, align 1
  %L = load i1, ptr %A2, align 1
  br i1 %L, label %T, label %F

BB1:                                              ; preds = %F, %T
  %L4 = load i128, ptr %A3, align 4
  switch i128 %L4, label %SW_D5 [
    i128 5985019398231380753, label %SW_C6
    i128 12574427065692397109, label %SW_C7
    i128 14461159624713785746, label %SW_C8
    i128 5094462952505108448, label %SW_C9
  ]

BB2:                                              ; preds = %SW_C9, %SW_C7, %SW_C6, %SW_D5
  %B4 = sdiv i128 42, 0
  store i128 %B4, ptr @G.10, align 4
  ret i8 %LGV3

T:                                                ; preds = %SW_C2
  br label %BB1

F:                                                ; preds = %F, %SW_C2
  br i1 %L, label %BB1, label %F

SW_D5:                                            ; preds = %BB1
  br label %BB2

SW_C6:                                            ; preds = %BB1
  br label %BB2

SW_C7:                                            ; preds = %SW_C7, %BB1
  %LGV10 = load i1, ptr @G.2, align 1
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %SW_C7, label %BB2

SW_C8:                                            ; preds = %BB1
  ret i8 %LGV

SW_C9:                                            ; preds = %BB1
  br label %BB2
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

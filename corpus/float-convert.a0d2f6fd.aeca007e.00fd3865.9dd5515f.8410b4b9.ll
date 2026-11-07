; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f,+zvkb,+zve64d -O2
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
@G.12 = global ptr poison
@G.13 = global float +qnan
@G.14 = global float 4.200000e+01
@G.15 = global i1 true
@G.16 = global float f0x7F7FFFFF

; Function Attrs: nounwind
declare i32 @fcvt_w_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_s_sat(float) #0

; Function Attrs: nounwind
define i32 @fcvt_wu_s(float %a) #0 {
  %A10 = alloca i1, align 1
  %L12 = load <8 x i8>, ptr %A10, align 8
  store i1 poison, ptr %A10, align 1
  %LGV4 = load float, ptr @G.13, align 4
  %B4 = fadd float %LGV4, 0.000000e+00
  %C5 = fcmp ugt float %a, %LGV4
  %A = alloca <4 x i32>, align 16
  %L = load <8 x i8>, ptr %A, align 8
  %C9 = icmp sgt i1 %C5, %C5
  store <4 x i32> poison, ptr %A, align 16
  %LGV = load <4 x i32>, ptr @G.11, align 16
  %B1 = srem i8 127, -128
  %LGV1 = load <2 x i64>, ptr @G.3, align 16
  %1 = fptoui float %a to i32
  %B2 = mul <4 x i32> splat (i32 -1), %LGV
  %B = add <2 x i64> %LGV1, %LGV1
  %B3 = sdiv <2 x i64> %B, %B
  %C = icmp slt <2 x i64> zeroinitializer, %LGV1
  store <2 x i1> %C, ptr @G.4, align 1
  store <2 x i64> %B3, ptr @G.6, align 16
  %C6 = fcmp olt float %a, %B4
  store i8 %B1, ptr @G.8, align 1
  store <4 x i32> %B2, ptr %A, align 16
  store i1 %C5, ptr @G.7, align 1
  store float %B4, ptr @G.14, align 4
  store i1 %C6, ptr @G.15, align 1
  %B13 = xor <8 x i8> %L, %L12
  store i1 %C9, ptr %A10, align 1
  store <8 x i8> %B13, ptr @G.5, align 8
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
  %A4 = alloca i1, align 1
  store i1 false, ptr %A4, align 1
  %LGV = load i8, ptr @G.8, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp ueq float %a, 4.200000e+01
  %G = getelementptr i8, ptr %A, i8 %LGV
  %C2 = fcmp ult float %a, %a
  %B = ashr i1 true, %C
  %1 = fptoui float %a to i8
  %C1 = icmp uge i1 %C, %C
  store ptr %G, ptr @G.12, align 8
  switch i8 %1, label %SW_D [
    i8 78, label %SW_C
    i8 -5, label %SW_C1
    i8 114, label %SW_C2
  ]

BB:                                               ; preds = %BB3, %SW_D
  store i1 %C1, ptr @G.2, align 1
  store i1 %C2, ptr @G.7, align 1
  store i1 %B, ptr %A, align 1
  ret i8 %1

SW_D:                                             ; preds = %0
  %C7 = icmp sgt i8 %LGV, %1
  store i1 %C7, ptr @G.7, align 1
  br label %BB

SW_C:                                             ; preds = %0
  %L = load i1, ptr %A4, align 1
  br i1 %L, label %T, label %F

BB3:                                              ; preds = %T
  br label %BB

SW_C1:                                            ; preds = %SW_C1, %0
  %B10 = sdiv i1 %B, false
  br i1 %B, label %SW_C1, label %BB2

BB2:                                              ; preds = %SW_C1
  store i1 %B10, ptr @G.2, align 1
  ret i8 %LGV

SW_C2:                                            ; preds = %0
  %LGV3 = load i8, ptr @G.9, align 1
  %B4 = sdiv i128 42, 0
  store i128 %B4, ptr @G.10, align 4
  ret i8 %LGV3

T:                                                ; preds = %SW_C
  %B5 = sdiv i1 %L, %C1
  store i1 %B5, ptr @G.7, align 1
  br label %BB3

F:                                                ; preds = %SW_C
  %LGV6 = load float, ptr @G.16, align 4
  %C8 = fcmp one float %a, %LGV6
  store i1 %C8, ptr %A4, align 1
  ret i8 16
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

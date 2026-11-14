; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32f -mattr=+f,+zicond,+zvkb,+v,+a,+zve32x,+m,+zvfh,+zfa,+zbb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 0
@G.1 = global i16 1
@G.2 = global i64 -1
@G.3 = global i32 2147483647
@G.4 = global i1 true
@G.5 = global float f0x7F7FFFFF
@G.6 = global float +inf
@G.7 = global float 1.000000e+00
@G.8 = global i1 false
@G.9 = global i32 1
@G.10 = global float 1.401300e-45
@G.11 = global float +qnan
@G.12 = global ptr poison
@G.13 = global i32 1
@G.14 = global i1 false

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
  %A15 = alloca i1, align 1
  store i1 false, ptr %A15, align 1
  %LGV13 = load i32, ptr @G.13, align 4
  %LGV5 = load i32, ptr @G.9, align 4
  %C12 = icmp ne i32 %LGV5, %LGV13
  %LGV6 = load float, ptr @G.7, align 4
  %B7 = fmul float %a, %LGV6
  %A5 = alloca ptr, align 8
  %L16 = load float, ptr %A5, align 4
  store ptr poison, ptr %A5, align 8
  %A3 = alloca i1, align 1
  %L12 = load i1, ptr %A3, align 1
  %L8 = load i32, ptr %A3, align 4
  %L7 = load i32, ptr %A3, align 4
  store i1 poison, ptr %A3, align 1
  %B9 = ashr i32 %L7, %L8
  br i1 %L12, label %T, label %F

BB:                                               ; preds = %F, %T
  %C17 = fcmp ueq float %a, %L16
  %B10 = fadd float %a, %a
  %LGV2 = load i32, ptr @G.3, align 4
  %C15 = fcmp ule float %LGV6, %a
  %A = alloca i1, align 1
  %L2 = load i32, ptr %A, align 4
  %C14 = icmp sgt i32 %LGV5, %LGV13
  %C13 = fcmp olt float %a, %a
  %G = getelementptr float, ptr %A3, i8 0
  %C10 = icmp uge i32 %LGV2, %L8
  %L1 = load float, ptr %A, align 4
  %L = load i32, ptr %A, align 4
  %B8 = fsub float %a, %a
  store i1 poison, ptr %A, align 1
  %LGV1 = load i16, ptr @G.1, align 2
  %B1 = fadd fast float %a, %a
  %B = shl i32 %LGV5, %L
  %C8 = fcmp false float %a, %a
  %C3 = icmp slt i32 %B, %LGV2
  %C2 = fcmp ugt float %B10, %L1
  %B4 = and i1 %C13, %C8
  %C5 = icmp ugt i32 %B9, 0
  %LGV = load i16, ptr @G, align 2
  %1 = fptoui float %a to i8
  %G5 = getelementptr float, ptr %A, i1 %C2
  %C = icmp sle i16 %LGV, %LGV1
  %B11 = mul i1 %C17, false
  store i1 %C, ptr %A, align 1
  store i1 %C15, ptr @G.4, align 1
  %C6 = fcmp ult float %a, 4.200000e+01
  store i1 %B4, ptr %A3, align 1
  %C11 = fcmp uno float %a, %B7
  %C7 = fcmp uge float %a, %a
  %C4 = icmp ule i32 %LGV2, %L2
  %B6 = fsub float %a, %a
  store ptr %G, ptr %A5, align 8
  store float %B7, ptr @G.5, align 4
  store float %B8, ptr @G.6, align 4
  store i1 %C13, ptr @G.8, align 1
  %G6 = getelementptr float, ptr %A, i1 %C3
  store i1 %C7, ptr @G.8, align 1
  store float %B6, ptr @G.7, align 4
  store i1 %C5, ptr %G6, align 1
  %G7 = getelementptr i64, ptr %G5, i128 18446744073709551616
  store float %B1, ptr @G.11, align 4
  store i1 %C4, ptr %G7, align 1
  store ptr %G5, ptr @G.12, align 8
  store i1 %C17, ptr @G.8, align 1
  store i1 %B11, ptr %G6, align 1
  store i1 %C14, ptr %G7, align 1
  store i1 %C6, ptr @G.4, align 1
  store i1 %C10, ptr @G.14, align 1
  store i1 %C12, ptr %G7, align 1
  store i1 %C11, ptr %G6, align 1
  ret i8 %1

T:                                                ; preds = %T, %0
  %LGV14 = load i1, ptr @G.4, align 1
  %L17 = load i1, ptr %A15, align 1
  br i1 %L17, label %T, label %BB

F:                                                ; preds = %0
  br label %BB
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

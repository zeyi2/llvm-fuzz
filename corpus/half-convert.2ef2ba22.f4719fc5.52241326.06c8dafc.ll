; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi ilp32d -mattr=+zfh,+zfhmin,+zve64d -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 4.200000e+01
@G.1 = global i1 false
@G.2 = global i32 0
@G.3 = global i32 42
@G.4 = global i1 true
@G.5 = global i1 false
@G.6 = global half 4.200000e+01
@G.7 = global <4 x float> splat (float 1.401300e-45)
@G.8 = global ptr poison
@G.9 = global <8 x i8> splat (i8 1)
@G.10 = global double 4.940660e-324
@G.11 = global i8 1

; Function Attrs: nounwind
declare i16 @fcvt_si_h(half) #0

; Function Attrs: nounwind
declare i16 @fcvt_si_h_sat(half) #0

; Function Attrs: nounwind
declare i16 @fcvt_ui_h(half) #0

; Function Attrs: nounwind
declare i16 @fcvt_ui_h_sat(half) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_h(half) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_h_sat(half) #0

; Function Attrs: nounwind
define i32 @fcvt_wu_h(half %a) #0 {
  %A2 = alloca i1, align 1
  store i1 poison, ptr %A2, align 1
  %A = alloca i128, align 8
  store i128 1, ptr %A, align 4
  %C = fcmp false half %a, +inf
  %B = ashr i1 %C, %C
  %1 = fptoui half %a to i32
  %L = load i128, ptr %A, align 4
  switch i128 %L, label %SW_D [
    i128 9503341225252827397, label %SW_C
  ]

BB:                                               ; preds = %SW_C, %SW_D
  %LGV4 = load i8, ptr @G.11, align 1
  %B5 = mul i8 0, %LGV4
  %LGV = load double, ptr @G.10, align 8
  %C1 = fcmp une double 0.000000e+00, %LGV
  store i1 %B, ptr @G.1, align 1
  store i1 %C1, ptr %A2, align 1
  store i8 %B5, ptr @G.11, align 1
  ret i32 %1

SW_D:                                             ; preds = %SW_D, %0
  %G = getelementptr half, ptr %A, i64 -9223372036854775808
  store ptr %G, ptr @G.8, align 8
  br i1 %C, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare i32 @fcvt_wu_h_multiple_use(half, ptr) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_h_sat(half) #0

; Function Attrs: nounwind
define i64 @fcvt_l_h(half %a) #0 {
  %LGV2 = load <8 x i8>, ptr @G.9, align 8
  %A = alloca i1, align 1
  %L5 = load half, ptr %A, align 2
  %B3 = xor <8 x i8> splat (i8 1), %LGV2
  %L2 = load <4 x float>, ptr %A, align 16
  %L = load i1, ptr %A, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load float, ptr @G, align 4
  %G = getelementptr ptr, ptr %A, i1 %L
  %1 = fptosi half %a to i64
  %C = fcmp ord float %LGV, 0.000000e+00
  %C6 = fcmp ole half %a, %L5
  %B = fmul <4 x float> splat (float 4.200000e+01), %L2
  store i1 %C, ptr %G, align 1
  store <4 x float> %B, ptr @G.7, align 16
  store <8 x i8> %B3, ptr %G, align 8
  store i1 %C6, ptr poison, align 1
  ret i64 %1
}

; Function Attrs: nounwind
declare i64 @fcvt_l_h_sat(half) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_h(half) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_h_sat(half) #0

; Function Attrs: nounwind
declare half @fcvt_h_si(i16) #0

; Function Attrs: nounwind
declare half @fcvt_h_si_signext(i16 signext) #0

; Function Attrs: nounwind
declare half @fcvt_h_ui(i16) #0

; Function Attrs: nounwind
declare half @fcvt_h_ui_zeroext(i16 zeroext) #0

; Function Attrs: nounwind
declare half @fcvt_h_w(i32) #0

; Function Attrs: nounwind
declare half @fcvt_h_w_load(ptr) #0

; Function Attrs: nounwind
declare half @fcvt_h_wu(i32) #0

; Function Attrs: nounwind
declare half @fcvt_h_wu_load(ptr) #0

; Function Attrs: nounwind
declare half @fcvt_h_l(i64) #0

; Function Attrs: nounwind
declare half @fcvt_h_lu(i64) #0

; Function Attrs: nounwind
declare half @fcvt_h_s(float) #0

; Function Attrs: nounwind
declare float @fcvt_s_h(half) #0

; Function Attrs: nounwind
declare half @fcvt_h_d(double) #0

; Function Attrs: nounwind
declare double @fcvt_d_h(half) #0

; Function Attrs: nounwind
declare half @bitcast_h_i16(i16) #0

; Function Attrs: nounwind
declare i16 @bitcast_i16_h(half) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_h_w_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_h_wu_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_i16(half) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_sat_i16(half) #0

; Function Attrs: nounwind
define zeroext i16 @fcvt_wu_s_i16(half %a) #0 {
  %A3 = alloca i1, align 1
  %L4 = load i8, ptr %A3, align 1
  store i1 poison, ptr %A3, align 1
  %B = fmul half %a, %a
  %C1 = fcmp ugt half %a, %a
  %1 = fptoui half %a to i16
  %A = alloca i1, align 1
  %C3 = fcmp false half %a, %a
  %C2 = fcmp ole half %a, %a
  store i1 %C1, ptr %A, align 1
  %C5 = icmp sle i8 127, %L4
  store i1 poison, ptr %A, align 1
  store i1 %C3, ptr @G.4, align 1
  store i1 %C2, ptr %A3, align 1
  store i1 %C5, ptr @G.4, align 1
  store half %B, ptr @G.6, align 2
  ret i16 %1
}

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(half) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(half) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(half) #0

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_i8(half) #0

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_sat_i8(half) #0

; Function Attrs: nounwind
declare zeroext i32 @fcvt_wu_h_sat_zext(half) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_w_h_sat_sext(half) #0

; Function Attrs: nounwind
declare void @fcvt_h_q(fp128, ptr) #0

declare fp128 @fcvt_q_h(ptr)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fptosi.sat.i16.f16(half) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fptosi.sat.i32.f16(half) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fptosi.sat.i64.f16(half) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fptosi.sat.i8.f16(half) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fptoui.sat.i16.f16(half) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fptoui.sat.i32.f16(half) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fptoui.sat.i64.f16(half) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fptoui.sat.i8.f16(half) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

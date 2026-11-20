; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi ilp32d -mattr=+d,+zfhmin,+m,+v -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 0
@G.1 = global i1 true
@G.2 = global i1 true
@G.3 = global i64 0
@G.4 = global <2 x i64> zeroinitializer
@G.5 = global ptr poison
@G.6 = global ptr poison
@G.7 = global i32 -2147483648

; Function Attrs: nounwind
define i16 @fcvt_si_h(half %a) #0 {
  %LGV2 = load i64, ptr @G.3, align 4
  %A = alloca i1, align 1
  %B = lshr i64 9223372036854775807, %LGV2
  %G = getelementptr half, ptr %A, i8 1
  store i1 poison, ptr %G, align 1
  %LGV = load i8, ptr @G, align 1
  %C2 = fcmp une half %a, 1.000000e+00
  %C = icmp ugt i8 %LGV, -128
  %C1 = fcmp ueq half %a, %a
  %1 = fptosi half %a to i16
  store i1 %C, ptr poison, align 1
  store i1 %C1, ptr @G.2, align 1
  store i1 %C2, ptr %A, align 1
  store i64 %B, ptr %G, align 4
  ret i16 %1
}

; Function Attrs: nounwind
declare i16 @fcvt_si_h_sat(half) #0

; Function Attrs: nounwind
declare i16 @fcvt_ui_h(half) #0

; Function Attrs: nounwind
declare i16 @fcvt_ui_h_sat(half) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_h(half) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_w_h_signext(half) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_h_sat(half) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_wu_h_signext(half) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_h(half) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_h_multiple_use(half, ptr) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_h_sat(half) #0

; Function Attrs: nounwind
declare i64 @fcvt_l_h(half) #0

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
define half @fcvt_h_wu(i32 %a) #0 {
  %C = icmp ne i16 32767, -1
  %1 = uitofp i32 %a to half
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  br i1 %C, label %T, label %F

BB:                                               ; preds = %F, %T
  store i1 %C, ptr %A, align 1
  ret half %1

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  %G = getelementptr <2 x i64>, ptr %A, i32 %a
  store ptr %G, ptr @G.5, align 8
  %G3 = getelementptr ptr, ptr %G, i32 %a
  store ptr %G3, ptr @G.6, align 8
  br label %BB
}

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
declare zeroext i16 @fcvt_wu_s_i16(half) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(half) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(half) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(half) #0

; Function Attrs: nounwind
define zeroext i8 @fcvt_wu_s_i8(half %a) #0 {
  %A = alloca i1, align 1
  %L1 = load i32, ptr %A, align 4
  %L = load i32, ptr %A, align 4
  store i1 poison, ptr %A, align 1
  %G = getelementptr half, ptr %A, i128 0
  %B = udiv i32 %L, %L1
  %C = fcmp ord double 0.000000e+00, 0.000000e+00
  %1 = fptoui half %a to i8
  store i1 %C, ptr %G, align 1
  store i1 %C, ptr %A, align 1
  store i32 %B, ptr @G.7, align 4
  ret i8 %1
}

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

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi ilp32d -mattr=+d,+zfh,+zvbb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 4.200000e+01
@G.1 = global i1 false
@G.2 = global i32 0
@G.3 = global i32 42
@G.4 = global i1 true
@G.5 = global i1 false
@G.6 = global half 4.200000e+01
@G.7 = global i1 true
@G.8 = global i32 1
@G.9 = global i32 0
@G.10 = global i32 42
@G.11 = global i32 -1
@G.12 = global i1 true
@G.13 = global i16 256
@G.14 = global double 1.000000e+00
@G.15 = global i8 127

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
  %A38 = alloca i1, align 1
  store i1 poison, ptr %A38, align 1
  %A33 = alloca i1, align 1
  store i1 true, ptr %A33, align 1
  %A30 = alloca i1, align 1
  store i1 false, ptr %A30, align 1
  %A22 = alloca i32, align 4
  store i32 -1, ptr %A22, align 4
  %A19 = alloca i1, align 1
  store i1 false, ptr %A19, align 1
  %A16 = alloca i1, align 1
  store i1 true, ptr %A16, align 1
  %A11 = alloca i8, align 1
  store i8 -128, ptr %A11, align 1
  %L = load i8, ptr %A11, align 1
  switch i8 %L, label %SW_D [
    i8 117, label %SW_C
    i8 -76, label %SW_C12
    i8 48, label %SW_C13
    i8 85, label %SW_C14
    i8 -97, label %SW_C15
  ]

BB10:                                             ; preds = %SW_C15, %SW_C13, %SW_C, %SW_D
  %A7 = alloca i1, align 1
  %L9 = load i16, ptr %A7, align 2
  store i1 true, ptr %A7, align 1
  %LGV3 = load i32, ptr @G.9, align 4
  %LGV2 = load i32, ptr @G.8, align 4
  %A5 = alloca i1, align 1
  %C2 = fcmp uno half %a, %a
  store i1 poison, ptr %A5, align 1
  %A = alloca i1, align 1
  %C5 = fcmp one half %a, 5.960460e-08
  store i1 poison, ptr %A5, align 1
  %C = icmp sle i16 %L9, 1
  store i1 %C2, ptr @G.12, align 1
  br i1 %C, label %T, label %F

BB:                                               ; preds = %T
  %LGV4 = load i32, ptr @G.10, align 4
  %LGV1 = load i32, ptr @G.3, align 4
  %LGV = load i32, ptr @G.2, align 4
  %C4 = fcmp ogt half %a, %a
  %C7 = icmp ne i32 %LGV, %LGV1
  %C3 = fcmp ueq half %a, %a
  %C6 = icmp eq i32 %LGV2, %LGV2
  %C8 = icmp sle i32 %LGV3, %LGV4
  %1 = fptoui half %a to i16
  store i1 %C6, ptr @G.4, align 1
  store i1 %C3, ptr %A, align 1
  store i1 %C4, ptr %A5, align 1
  %C1 = fcmp ogt half %a, 6.550400e+04
  store i1 %C1, ptr @G.7, align 1
  %B = ashr i32 %LGV2, %LGV3
  store i1 %C5, ptr @G.1, align 1
  store i1 %C7, ptr @G.7, align 1
  store i32 %B, ptr @G.3, align 4
  store i1 %C8, ptr @G.4, align 1
  ret i16 %1

T:                                                ; preds = %BB10
  %B10 = srem i32 %LGV2, 0
  store i32 %B10, ptr @G.11, align 4
  br label %BB

F:                                                ; preds = %BB10
  %LGV12 = load i8, ptr @G.15, align 1
  %C12 = icmp ule i32 %LGV3, 42
  %C13 = icmp sle i8 -128, %LGV12
  %C9 = fcmp true half %a, +qnan
  store i1 %C12, ptr poison, align 1
  store i1 %C9, ptr %A7, align 1
  store i1 %C13, ptr %A7, align 1
  ret i16 32767

SW_D:                                             ; preds = %0
  br label %BB10

SW_C:                                             ; preds = %SW_C, %0
  %L17 = load i1, ptr %A16, align 1
  br i1 %L17, label %SW_C, label %BB10

SW_C12:                                           ; preds = %0
  ret i16 1

SW_C13:                                           ; preds = %0
  %C10 = fcmp uno half %a, %a
  store i1 %C10, ptr poison, align 1
  br label %BB10

SW_C14:                                           ; preds = %0
  %L23 = load i32, ptr %A22, align 4
  switch i32 %L23, label %SW_D24 [
    i32 -896106468, label %SW_C25
    i32 -1284608221, label %SW_C26
    i32 -1226107545, label %SW_C27
    i32 1084416595, label %SW_C28
  ]

BB21:                                             ; preds = %SW_C28, %SW_C27, %SW_C26, %SW_C25, %SW_D24
  %LGV18 = load i16, ptr @G.13, align 2
  ret i16 %LGV18

SW_C15:                                           ; preds = %SW_C15, %0
  %L20 = load i1, ptr %A19, align 1
  br i1 %L20, label %BB10, label %SW_C15

SW_D24:                                           ; preds = %SW_C14
  br label %BB21

SW_C25:                                           ; preds = %SW_C14
  br label %BB21

SW_C26:                                           ; preds = %SW_C26, %SW_C14
  %L31 = load i1, ptr %A30, align 1
  br i1 %L31, label %BB21, label %SW_C26

SW_C27:                                           ; preds = %SW_C14
  %LGV36 = load double, ptr @G.14, align 8
  %C37 = fcmp true double 4.940660e-324, %LGV36
  store i1 %C37, ptr %A38, align 1
  br label %BB21

SW_C28:                                           ; preds = %SW_C28, %SW_C14
  %L34 = load i1, ptr %A33, align 1
  br i1 %L34, label %SW_C28, label %BB21
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

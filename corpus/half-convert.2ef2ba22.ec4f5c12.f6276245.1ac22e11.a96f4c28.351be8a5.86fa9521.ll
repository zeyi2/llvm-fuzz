; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi ilp32d -mattr=+d,+zfh,+a -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 4.200000e+01
@G.1 = global i1 false
@G.2 = global i32 0
@G.3 = global i32 42
@G.4 = global i1 true
@G.5 = global i1 false
@G.6 = global half 4.200000e+01
@G.7 = global half 0.000000e+00
@G.8 = global i64 0
@G.9 = global double 1.000000e+00
@G.10 = global i1 true
@G.11 = global i16 -32768
@G.12 = global ptr poison

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
  %A13 = alloca i1, align 1
  store i1 poison, ptr %A13, align 1
  %A10 = alloca half, align 2
  %B2 = fsub half %a, %a
  %G = getelementptr half, ptr %A10, i16 42
  store half poison, ptr %A10, align 2
  %A2 = alloca i64, align 8
  store i64 0, ptr %A2, align 4
  %LGV5 = load double, ptr @G.9, align 8
  %A3 = alloca i1, align 1
  %L = load double, ptr %A3, align 8
  store i1 poison, ptr %A3, align 1
  %A5 = alloca i1, align 1
  %C6 = fcmp ueq double %L, %LGV5
  store i1 poison, ptr %A5, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load i32, ptr @G.3, align 4
  %LGV = load i32, ptr @G.2, align 4
  %C4 = fcmp ogt half %a, %a
  store i1 %C6, ptr %A, align 1
  store ptr %G, ptr %A3, align 8
  br i1 %C4, label %T, label %F

BB:                                               ; preds = %F, %BB1
  %LGV2 = load i64, ptr @G.8, align 4
  %B3 = xor i64 0, %LGV2
  %C3 = fcmp ueq half %a, %a
  %C = icmp sge i32 %LGV, %LGV1
  %1 = fptoui half %a to i16
  store i1 %C, ptr @G.4, align 1
  store i1 %C3, ptr %A, align 1
  store i1 %C4, ptr %A5, align 1
  store i64 %B3, ptr @G.8, align 4
  ret i16 %1

T:                                                ; preds = %0
  %L3 = load i64, ptr %A2, align 4
  %C12 = icmp uge i64 %L3, 0
  store i1 %C12, ptr %A13, align 1
  switch i64 %L3, label %SW_D [
    i64 5449563390579187284, label %SW_C
    i64 -6587352370741394496, label %SW_C4
    i64 6461853661540840868, label %SW_C5
    i64 4184414614151755908, label %SW_C6
  ]

BB1:                                              ; preds = %SW_C6, %SW_C5, %SW_C, %SW_D
  %C1 = icmp sge i32 %LGV, 0
  store i1 %C1, ptr @G.5, align 1
  %C7 = icmp uge i1 %C12, false
  store i1 %C7, ptr %A5, align 1
  br label %BB

F:                                                ; preds = %0
  %B = fmul half %a, 0.000000e+00
  %C2 = fcmp ord half %B, %a
  %B6 = shl i32 %LGV, %LGV1
  store half %B2, ptr @G.7, align 2
  store i32 %B6, ptr %A5, align 4
  store i1 %C2, ptr %A3, align 1
  %B1 = lshr i1 false, %C2
  store i1 %B1, ptr @G.10, align 1
  br label %BB

SW_D:                                             ; preds = %T
  %C9 = icmp uge i128 0, 42
  store i1 %C9, ptr %A13, align 1
  br label %BB1

SW_C:                                             ; preds = %T
  %C14 = icmp slt i64 42, %L3
  %B4 = shl i1 %C14, true
  store i1 %C14, ptr @G.5, align 1
  store i1 %B4, ptr %A13, align 1
  br label %BB1

SW_C4:                                            ; preds = %T
  ret i16 32767

SW_C5:                                            ; preds = %T
  %B9 = fadd half %a, %a
  %C10 = fcmp olt half %B9, %B9
  store half %B9, ptr %A10, align 2
  store i1 %C10, ptr @G.1, align 1
  br label %BB1

SW_C6:                                            ; preds = %T
  %2 = phi <8 x i8> [ zeroinitializer, %T ]
  %LGV7 = load i16, ptr @G.11, align 2
  %G5 = getelementptr ptr, ptr %A13, i128 170141183460469231731687303715884105727
  %L12 = load i128, ptr %G5, align 4
  %C8 = icmp sge i16 1, %LGV7
  store ptr %G5, ptr poison, align 8
  store i1 %C8, ptr %A13, align 1
  %G13 = getelementptr half, ptr %G5, i128 %L12
  store <8 x i8> %2, ptr %A13, align 8
  store ptr %G13, ptr @G.12, align 8
  br label %BB1
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

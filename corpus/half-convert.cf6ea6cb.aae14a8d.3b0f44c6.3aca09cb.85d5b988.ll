; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi ilp32d -mattr=+zfh,+zvbb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half 6.550400e+04
@G.1 = global i8 -1
@G.2 = global i1 false
@G.3 = global i1 false
@G.4 = global i16 32767

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
  %A2 = alloca i64, align 8
  store i64 -1, ptr %A2, align 4
  %A6 = alloca i1, align 1
  store i1 false, ptr %A6, align 1
  %A8 = alloca i1, align 1
  %L3 = load half, ptr %A8, align 2
  store i1 true, ptr %A8, align 1
  %C4 = fcmp une half %a, %L3
  %LGV2 = load i8, ptr @G.1, align 1
  %LGV = load half, ptr @G, align 2
  %C1 = fcmp oge half %a, %LGV
  switch i8 %LGV2, label %SW_D [
    i8 33, label %SW_C
    i8 -17, label %SW_C3
    i8 24, label %SW_C4
    i8 -35, label %SW_C5
    i8 -99, label %SW_C6
    i8 -111, label %SW_C7
  ]

BB:                                               ; preds = %SW_C6, %SW_C5, %BB17, %SW_C3, %SW_C, %SW_D
  %L7 = load i1, ptr %A6, align 1
  store i1 %L7, ptr @G.2, align 1
  br i1 %L7, label %T, label %F

BB5:                                              ; preds = %F, %BB1
  %A = alloca i1, align 1
  store i1 %C1, ptr %A, align 1
  %C = icmp ule i128 -170141183460469231731687303715884105728, 0
  %1 = fptoui half %a to i16
  store i1 %C, ptr %A, align 1
  ret i16 %1

SW_D:                                             ; preds = %SW_D, %0
  %L = load i1, ptr %A8, align 1
  store i1 %L, ptr @G.3, align 1
  br i1 %L, label %BB, label %SW_D

SW_C:                                             ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  br i1 %C4, label %T18, label %F19

BB17:                                             ; preds = %T18
  store i1 %C4, ptr @G.2, align 1
  %C9 = fcmp ugt half %a, %L3
  store i1 %C9, ptr %A6, align 1
  br label %BB

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  %B = sub i1 %C1, %C1
  store i1 %B, ptr @G.2, align 1
  br label %BB

SW_C7:                                            ; preds = %0
  ret i16 -32768

T:                                                ; preds = %BB1, %BB
  %LGV8 = load i1, ptr @G.3, align 1
  %L4 = load i64, ptr %A2, align 4
  switch i64 %L4, label %SW_D5 [
    i64 -106833956209430535, label %SW_C8
    i64 4663783556281015888, label %SW_C9
    i64 -4612079661888149606, label %SW_C10
    i64 -293325716891193182, label %SW_C11
    i64 5407158008988053670, label %SW_C12
    i64 2674812998420912148, label %SW_C13
    i64 696949685089354328, label %SW_C14
  ]

BB1:                                              ; preds = %SW_C13, %SW_C10, %SW_C9
  br i1 %LGV8, label %T, label %BB5

F:                                                ; preds = %BB
  br label %BB5

SW_D5:                                            ; preds = %T
  %LGV15 = load i16, ptr @G.4, align 2
  ret i16 %LGV15

SW_C8:                                            ; preds = %T
  ret i16 -1

SW_C9:                                            ; preds = %T
  br label %BB1

SW_C10:                                           ; preds = %T
  br label %BB1

SW_C11:                                           ; preds = %T
  %LGV16 = load i16, ptr @G.4, align 2
  ret i16 0

SW_C12:                                           ; preds = %T
  ret i16 42

SW_C13:                                           ; preds = %T
  br label %BB1

SW_C14:                                           ; preds = %T
  ret i16 256

T18:                                              ; preds = %SW_C4
  br label %BB17

F19:                                              ; preds = %SW_C4
  %LGV20 = load i16, ptr @G.4, align 2
  ret i16 42
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

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -mattr=+d,+a,+zcb,+zfa,+zfh,+zbkb -O0 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i64 -1
@G.2 = global i1 false
@G.3 = global half +qnan
@G.4 = global double +inf
@G.5 = global i1 false
@G.6 = global i1 true
@G.7 = global i8 -1
@G.8 = global i1 true
@G.9 = global i64 4294967296
@G.10 = global i32 2147483647
@G.11 = global <2 x i64> splat (i64 -1)

; Function Attrs: nounwind
declare float @fcvt_s_d(double) #0

; Function Attrs: nounwind
declare double @fcvt_d_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_d(double) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_d_sat(double) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_d(double) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_d_multiple_use(double, ptr) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_d_sat(double) #0

; Function Attrs: nounwind
declare double @fcvt_d_w(i32) #0

; Function Attrs: nounwind
declare double @fcvt_d_w_load(ptr) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu(i32) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu_load(ptr) #0

; Function Attrs: nounwind
declare i64 @fcvt_l_d(double) #0

; Function Attrs: nounwind
declare i64 @fcvt_l_d_sat(double) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_d(double) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_d_sat(double) #0

; Function Attrs: nounwind
declare i64 @fmv_x_d(double, double) #0

; Function Attrs: nounwind
declare double @fcvt_d_l(i64) #0

; Function Attrs: nounwind
declare double @fcvt_d_lu(i64) #0

; Function Attrs: nounwind
declare double @fmv_d_x(i64, i64) #0

; Function Attrs: nounwind
declare double @fcvt_d_w_i8(i8 signext) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu_i8(i8 zeroext) #0

; Function Attrs: nounwind
declare double @fcvt_d_w_i16(i16 signext) #0

; Function Attrs: nounwind
declare double @fcvt_d_wu_i16(i16 zeroext) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_d_w_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_d_wu_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_i16(double) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_sat_i16(double) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_i16(double) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(double) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(double) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(double) #0

; Function Attrs: nounwind
define zeroext i8 @fcvt_wu_s_i8(double %a) #0 {
  %A3 = alloca ptr, align 8
  store ptr poison, ptr %A3, align 8
  %A = alloca i8, align 1
  store i8 1, ptr %A, align 1
  %L = load i8, ptr %A, align 1
  switch i8 %L, label %SW_D [
    i8 62, label %SW_C
    i8 -28, label %SW_C1
  ]

BB:                                               ; preds = %BB1, %SW_D
  %LGV1 = load i64, ptr @G.9, align 4
  %1 = fptoui double %a to i8
  %C2 = icmp ne i64 -1, %LGV1
  store i1 %C2, ptr @G.2, align 1
  %B8 = fmul double %a, %a
  store double %B8, ptr @G.4, align 8
  ret i8 %1

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %LGV2 = load i1, ptr @G.8, align 1
  %G = getelementptr <4 x i32>, ptr %A, i8 %L
  %L5 = load i1, ptr %G, align 1
  %L1 = load i1, ptr %G, align 1
  store ptr %G, ptr %A, align 8
  %B7 = and i1 %L1, %L5
  store i1 %B7, ptr %A3, align 1
  br i1 %LGV2, label %T, label %F

BB1:                                              ; preds = %T
  br label %BB

SW_C1:                                            ; preds = %0
  %LGV = load i8, ptr @G.7, align 1
  %C3 = icmp ne i8 %LGV, %LGV
  store i1 %C3, ptr poison, align 1
  ret i8 %LGV

T:                                                ; preds = %SW_C
  %LGV3 = load i32, ptr @G.10, align 4
  %G1 = getelementptr ptr, ptr %G, i16 -32768
  %L4 = load i32, ptr %G1, align 4
  %B = add i32 %LGV3, %L4
  store ptr %G1, ptr poison, align 8
  store i32 %B, ptr poison, align 4
  br label %BB1

F:                                                ; preds = %SW_C
  %C = icmp ult i8 %L, 16
  store i1 %C, ptr poison, align 1
  %B6 = urem <2 x i64> splat (i64 9223372036854775807), splat (i64 4294967296)
  %G2 = getelementptr half, ptr %A, i8 %L
  store ptr %G2, ptr %A3, align 8
  store <2 x i64> %B6, ptr @G.11, align 16
  ret i8 0
}

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_sat_i8(double) #0

; Function Attrs: nounwind
declare zeroext i32 @fcvt_wu_d_sat_zext(double) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_w_d_sat_sext(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fptosi.sat.i16.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fptosi.sat.i32.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fptosi.sat.i64.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fptosi.sat.i8.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fptoui.sat.i16.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fptoui.sat.i32.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fptoui.sat.i64.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fptoui.sat.i8.f64(double) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

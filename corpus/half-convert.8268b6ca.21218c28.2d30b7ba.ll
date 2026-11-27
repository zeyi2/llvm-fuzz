; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi lp64f -mattr=+zfhmin,+a,+zicond -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 65536)
@G.1 = global i128 -170141183460469231731687303715884105728
@G.2 = global i1 false
@G.3 = global <2 x i64> splat (i64 9223372036854775807)
@G.4 = global half +qnan
@G.5 = global <2 x i64> splat (i64 1)
@G.6 = global i16 256
@G.7 = global <2 x i64> splat (i64 -1)

; Function Attrs: nounwind
define i16 @fcvt_si_h(half %a) #0 {
  %LGV = load <2 x i64>, ptr @G.7, align 16
  %LGV1 = load <2 x i64>, ptr @G.5, align 16
  %B2 = lshr <2 x i64> splat (i64 1), %LGV1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp ogt half %a, %a
  %B3 = sdiv i1 true, %C
  %C1 = fcmp false half %a, %a
  %B = or <2 x i64> %B2, %LGV
  %1 = fptosi half %a to i16
  store <2 x i64> %B2, ptr @G.3, align 16
  store i1 %C1, ptr %A, align 1
  store i1 %C, ptr @G.2, align 1
  store <2 x i64> %B, ptr @G.3, align 16
  store i1 %B3, ptr poison, align 1
  ret i16 %1
}

; Function Attrs: nounwind
declare i16 @fcvt_si_h_sat(half) #0

; Function Attrs: nounwind
define i16 @fcvt_ui_h(half %a) #0 {
  %LGV2 = load i16, ptr @G.6, align 2
  %C3 = icmp sle i16 0, %LGV2
  %A3 = alloca ptr, align 8
  store ptr poison, ptr %A3, align 8
  %A = alloca i128, align 8
  store i128 poison, ptr %A, align 4
  %LGV = load i128, ptr @G.1, align 4
  %C = icmp slt i128 %LGV, -1
  %1 = fptoui half %a to i16
  %B = or i128 %LGV, %LGV
  store i1 %C, ptr @G.2, align 1
  %B5 = and i1 %C3, %C3
  store i128 %B, ptr %A, align 4
  %G = getelementptr i128, ptr %A, i8 0
  store ptr %G, ptr %A3, align 8
  store i1 %C3, ptr @G.2, align 1
  store i1 %B5, ptr %G, align 1
  ret i16 %1
}

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
declare zeroext i16 @fcvt_wu_s_i16(half) #0

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

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi lp64f -mattr=+zfh,+zihintpause,+zbs,+zfa,+zba,+zve64d -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 16
@G.1 = global i8 0
@G.2 = global i1 true
@G.3 = global i1 false
@G.4 = global i1 true
@G.5 = global i1 false
@G.6 = global half 6.550400e+04
@G.7 = global i1 true
@G.8 = global i8 1

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
  %LGV3 = load i8, ptr @G.8, align 1
  %LGV8 = load half, ptr @G.6, align 2
  %B7 = shl i1 true, true
  %LGV = load i8, ptr @G, align 1
  %C4 = icmp ule i8 %LGV, %LGV3
  %B = xor i8 %LGV, 42
  %1 = fptoui half %a to i16
  store i8 %B, ptr @G.1, align 1
  %C = fcmp true double 1.000000e+00, 4.200000e+01
  store i1 %C, ptr @G.3, align 1
  %C6 = fcmp oge half %a, %a
  store i1 %C4, ptr @G.2, align 1
  %C2 = fcmp oge half %a, %a
  store i1 %C6, ptr @G.2, align 1
  store i1 %C2, ptr @G.5, align 1
  store i1 %B7, ptr @G.2, align 1
  %C9 = fcmp true half %a, %LGV8
  store i1 %C9, ptr @G.7, align 1
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

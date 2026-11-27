; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi lp64d -mattr=+zfh,+zcb,+c -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 42
@G.1 = global half 6.550400e+04
@G.2 = global double f0x7FEFFFFFFFFFFFFF
@G.3 = global i1 true
@G.4 = global i1 true
@G.5 = global i64 -9223372036854775808
@G.6 = global i64 0
@G.7 = global i1 false
@G.8 = global <4 x float> splat (float +inf)
@G.9 = global bfloat 9.183550e-41
@G.10 = global half 4.200000e+01

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
define half @bitcast_h_i16(i16 %a) #0 {
  %B5 = udiv i128 -1, 0
  %LGV3 = load bfloat, ptr @G.9, align 2
  %C4 = fcmp ogt bfloat %LGV3, %LGV3
  %LGV2 = load <4 x float>, ptr @G.8, align 16
  %A = alloca i16, align 2
  %L = load <4 x float>, ptr %A, align 16
  store i16 poison, ptr %A, align 2
  %LGV = load i16, ptr @G, align 2
  %B1 = and i16 %a, 0
  %1 = bitcast i16 %a to half
  %B = add i16 %a, %LGV
  store i16 %B, ptr @G, align 2
  %B2 = sdiv i16 %a, 1
  store i16 %B1, ptr poison, align 2
  store i16 %B2, ptr %A, align 2
  %C = fcmp ole <4 x float> %L, %LGV2
  store <4 x i1> %C, ptr poison, align 1
  store i1 %C4, ptr @G.7, align 1
  store i128 %B5, ptr %A, align 4
  ret half %1
}

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
  %LGV2 = load i64, ptr @G.5, align 4
  %C1 = fcmp uge half %a, %a
  %B4 = fsub half %a, 4.200000e+01
  %B2 = sdiv i64 %LGV2, 0
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load half, ptr @G.1, align 2
  %B = or i64 -1, %LGV2
  %1 = fptoui half %a to i8
  %C = fcmp ule half 5.960460e-08, %LGV
  store i1 %C, ptr %A, align 1
  %B5 = fsub half %B4, +inf
  %C3 = fcmp oeq half %a, +inf
  store i1 %C1, ptr @G.3, align 1
  store i64 %B, ptr @G.6, align 4
  store half %B4, ptr %A, align 2
  store i64 %B2, ptr %A, align 4
  %C2 = icmp sgt i1 false, %C
  store i1 %C2, ptr @G.7, align 1
  store i1 %C3, ptr @G.4, align 1
  store half %B5, ptr @G.10, align 2
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

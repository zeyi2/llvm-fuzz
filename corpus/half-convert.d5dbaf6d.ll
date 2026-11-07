; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi lp64f -mattr=+zfhmin,+c,+zfh -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> zeroinitializer
@G.1 = global float 1.401300e-45
@G.2 = global i1 true
@G.3 = global <2 x i64> zeroinitializer

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
define i32 @fcvt_w_h_sat(half %a) #0 {
start:
  %B = add <2 x i64> splat (i64 42), splat (i64 -1)
  %0 = tail call i32 @llvm.fptosi.sat.i32.f16(half %a)
  store <2 x i64> %B, ptr @G.3, align 16
  ret i32 %0
}

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
define half @fcvt_h_w_load(ptr %p) #0 {
  %A = alloca <8 x i8>, align 8
  store <8 x i8> poison, ptr %A, align 8
  %LGV = load <8 x i8>, ptr @G, align 8
  %a = load i32, ptr %p, align 4
  %B = mul <8 x i8> splat (i8 -128), %LGV
  %1 = sitofp i32 %a to half
  store <8 x i8> %B, ptr %A, align 8
  ret half %1
}

; Function Attrs: nounwind
declare half @fcvt_h_wu(i32) #0

; Function Attrs: nounwind
declare half @fcvt_h_wu_load(ptr) #0

; Function Attrs: nounwind
define half @fcvt_h_l(i64 %a) #0 {
  %C = fcmp ugt bfloat +qnan, 1.000000e+00
  %1 = sitofp i64 %a to half
  store i1 %C, ptr @G.2, align 1
  ret half %1
}

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
  %LGV = load float, ptr @G.1, align 4
  %1 = fptoui half %a to i16
  %C = fcmp ogt float f0x7F7FFFFF, %LGV
  store i1 %C, ptr @G.2, align 1
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

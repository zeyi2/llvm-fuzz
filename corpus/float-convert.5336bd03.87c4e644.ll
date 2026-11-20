; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i8 -128
@G.2 = global i1 true
@G.3 = global i64 0
@G.4 = global float 1.000000e+00
@G.5 = global i16 -32768
@G.6 = global float +inf
@G.7 = global i1 true

; Function Attrs: nounwind
declare i32 @fcvt_w_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s_multiple_use(float, ptr) #0

; Function Attrs: nounwind
declare signext i32 @fmv_x_w(float, float) #0

; Function Attrs: nounwind
declare float @fcvt_s_w(i32) #0

; Function Attrs: nounwind
declare float @fcvt_s_w_load(ptr) #0

; Function Attrs: nounwind
declare float @fcvt_s_wu(i32) #0

; Function Attrs: nounwind
declare float @fcvt_s_wu_load(ptr) #0

; Function Attrs: nounwind
define float @fmv_w_x(i32 %a, i32 %b) #0 {
  %A1 = alloca i32, align 4
  store i32 poison, ptr %A1, align 4
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i8, ptr @G.1, align 1
  %1 = bitcast i32 %a to float
  %C1 = icmp eq i8 -1, %LGV
  %2 = bitcast i32 %b to float
  %C = fcmp ogt float %2, 0.000000e+00
  %B = or i32 %b, 0
  %3 = fadd float %1, %2
  store i1 %C, ptr @G, align 1
  store i1 %C1, ptr %A, align 1
  store i32 %B, ptr %A1, align 4
  ret float %3
}

; Function Attrs: nounwind
declare i64 @fcvt_l_s(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_s(float) #0

; Function Attrs: nounwind
define float @fcvt_s_l(i64 %a) #0 {
  %A = alloca i16, align 2
  store i16 poison, ptr %A, align 2
  %LGV = load i64, ptr @G.3, align 4
  %1 = sitofp i64 %a to float
  %B = shl i64 %a, %LGV
  %B2 = srem i16 256, 0
  store i64 %B, ptr poison, align 4
  store i16 %B2, ptr %A, align 2
  ret float %1
}

; Function Attrs: nounwind
declare float @fcvt_s_lu(i64) #0

; Function Attrs: nounwind
declare float @fcvt_s_w_i8(i8 signext) #0

; Function Attrs: nounwind
declare float @fcvt_s_wu_i8(i8 zeroext) #0

; Function Attrs: nounwind
declare float @fcvt_s_w_i16(i16 signext) #0

; Function Attrs: nounwind
define float @fcvt_s_wu_i16(i16 zeroext %a) #0 {
  %C = icmp ugt i16 %a, 0
  %1 = uitofp i16 %a to float
  %B = add i16 %a, %a
  %B1 = ashr <2 x i64> splat (i64 9223372036854775807), splat (i64 4294967296)
  store i1 %C, ptr @G.7, align 1
  store i16 %B, ptr @G.5, align 2
  store <2 x i64> %B1, ptr poison, align 16
  ret float %1
}

; Function Attrs: nounwind
declare signext i32 @fcvt_s_w_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_s_wu_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_i16(float) #0

; Function Attrs: nounwind
define zeroext i16 @fcvt_wu_s_i16(float %a) #0 {
  %B = fsub float 4.200000e+01, 0.000000e+00
  %1 = fptoui float %a to i16
  %C = icmp slt i16 %1, 256
  store i1 %C, ptr @G, align 1
  store float %B, ptr @G.6, align 4
  ret i16 %1
}

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(float) #0

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_i8(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_s_sat(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s_sat(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_l_s_sat(float) #0

; Function Attrs: nounwind
define i64 @fcvt_lu_s_sat(float %a) #0 {
start:
  %LGV = load float, ptr @G.4, align 4
  %C = fcmp oge float %a, %LGV
  %B = fadd float f0x7F7FFFFF, %LGV
  %0 = tail call i64 @llvm.fptoui.sat.i64.f32(float %a)
  store float %B, ptr @G.4, align 4
  store i1 %C, ptr @G, align 1
  ret i64 %0
}

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_sat_i16(float) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(float) #0

; Function Attrs: nounwind
declare zeroext i8 @fcvt_wu_s_sat_i8(float) #0

; Function Attrs: nounwind
declare zeroext i32 @fcvt_wu_s_sat_zext(float) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_w_s_sat_sext(float) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fptosi.sat.i16.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fptosi.sat.i32.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fptosi.sat.i64.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fptosi.sat.i8.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fptoui.sat.i16.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fptoui.sat.i32.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fptoui.sat.i64.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fptoui.sat.i8.f32(float) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

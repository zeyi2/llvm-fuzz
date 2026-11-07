; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32f -mattr=+f,+zbb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 32767
@G.1 = global i32 2147483647
@G.2 = global <8 x i8> splat (i8 127)
@G.3 = global <4 x float> splat (float 4.200000e+01)
@G.4 = global <4 x i1> splat (i1 true)
@G.5 = global i32 65536
@G.6 = global float 4.200000e+01
@G.7 = global i1 false

; Function Attrs: nounwind
define i32 @fcvt_w_s(float %a) #0 {
  %LGV1 = load <4 x float>, ptr @G.3, align 16
  %C = fcmp one <4 x float> splat (float 1.401300e-45), %LGV1
  %A = alloca float, align 4
  store float poison, ptr %A, align 4
  %B = fdiv float %a, +inf
  %1 = fptosi float %a to i32
  store float %B, ptr %A, align 4
  store <4 x i1> %C, ptr @G.4, align 1
  ret i32 %1
}

; Function Attrs: nounwind
declare i32 @fcvt_w_s_sat(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s(float) #0

; Function Attrs: nounwind
define i32 @fcvt_wu_s_multiple_use(float %x, ptr %y) #0 {
  %LGV = load i16, ptr @G, align 2
  %C = icmp sle i16 %LGV, 0
  %a = fptoui float %x to i32
  %c = select i1 %C, i32 1, i32 %a
  %G = getelementptr i32, ptr %y, i64 9223372036854775807
  store ptr %G, ptr poison, align 8
  ret i32 %c
}

; Function Attrs: nounwind
declare i32 @fcvt_wu_s_sat(float) #0

; Function Attrs: nounwind
declare signext i32 @fmv_x_w(float, float) #0

; Function Attrs: nounwind
declare float @fcvt_s_w(i32) #0

; Function Attrs: nounwind
define float @fcvt_s_w_load(ptr %p) #0 {
  %a = load i32, ptr %p, align 4
  %B = sdiv <8 x i8> splat (i8 16), zeroinitializer
  %A = alloca <8 x i8>, align 8
  store <8 x i8> %B, ptr %A, align 8
  %1 = sitofp i32 %a to float
  store <8 x i8> poison, ptr %A, align 8
  %C = icmp ule i128 0, 0
  store i1 %C, ptr poison, align 1
  ret float %1
}

; Function Attrs: nounwind
declare float @fcvt_s_wu(i32) #0

; Function Attrs: nounwind
declare float @fcvt_s_wu_load(ptr) #0

; Function Attrs: nounwind
declare float @fmv_w_x(i32, i32) #0

; Function Attrs: nounwind
declare i64 @fcvt_l_s(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_l_s_sat(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_s(float) #0

; Function Attrs: nounwind
declare i64 @fcvt_lu_s_sat(float) #0

; Function Attrs: nounwind
declare float @fcvt_s_l(i64) #0

; Function Attrs: nounwind
declare float @fcvt_s_lu(i64) #0

; Function Attrs: nounwind
declare float @fcvt_s_w_i8(i8 signext) #0

; Function Attrs: nounwind
declare float @fcvt_s_wu_i8(i8 zeroext) #0

; Function Attrs: nounwind
declare float @fcvt_s_w_i16(i16 signext) #0

; Function Attrs: nounwind
declare float @fcvt_s_wu_i16(i16 zeroext) #0

; Function Attrs: nounwind
define signext i32 @fcvt_s_w_demanded_bits(i32 signext %0, ptr %1) #0 {
  %A2 = alloca i1, align 1
  store i1 poison, ptr %A2, align 1
  %LGV1 = load i32, ptr @G.5, align 4
  %A = alloca <8 x i8>, align 8
  store <8 x i8> poison, ptr %A, align 8
  %LGV = load <8 x i8>, ptr @G.2, align 8
  %B = and <8 x i8> %LGV, splat (i8 -128)
  %3 = add i32 %0, 1
  %4 = sitofp i32 %3 to float
  %C = icmp slt i32 %0, %LGV1
  store float %4, ptr %1, align 4
  store <8 x i8> %B, ptr %A, align 8
  store i1 %C, ptr %A2, align 1
  ret i32 %3
}

; Function Attrs: nounwind
declare signext i32 @fcvt_s_wu_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_i16(float) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_sat_i16(float) #0

; Function Attrs: nounwind
define zeroext i16 @fcvt_wu_s_i16(float %a) #0 {
  %LGV = load float, ptr @G.6, align 4
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp ueq float %a, +qnan
  %1 = fptoui float %a to i16
  store i1 %C, ptr %A, align 1
  %C1 = fcmp ole float %a, %LGV
  store i1 %C1, ptr @G.7, align 1
  ret i16 %1
}

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(float) #0

; Function Attrs: nounwind
define zeroext i8 @fcvt_wu_s_i8(float %a) #0 {
  %C = fcmp ord float %a, 1.000000e+00
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV = load i32, ptr @G.1, align 4
  %1 = fptoui float %a to i8
  %B = xor i32 -2147483648, %LGV
  store i32 %B, ptr %A, align 4
  store i1 %C, ptr %A, align 1
  ret i8 %1
}

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

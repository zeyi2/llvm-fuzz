; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f,+zicsr,+zbkb,+zfh,+c,+zbs,+zfa,+zfhmin -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 0.000000e+00
@G.1 = global i1 false
@G.2 = global double 4.200000e+01
@G.3 = global i1 false
@G.4 = global i64 4294967296
@G.5 = global double 0.000000e+00
@G.6 = global float f0x7F7FFFFF
@G.7 = global ptr poison
@G.8 = global i1 false
@G.9 = global i1 false
@G.10 = global i64 -9223372036854775808

; Function Attrs: nounwind
declare i32 @fcvt_w_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_w_s_sat(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s(float) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s_multiple_use(float, ptr) #0

; Function Attrs: nounwind
declare i32 @fcvt_wu_s_sat(float) #0

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
declare signext i32 @fcvt_s_w_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i32 @fcvt_s_wu_demanded_bits(i32 signext, ptr) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_i16(float) #0

; Function Attrs: nounwind
declare signext i16 @fcvt_w_s_sat_i16(float) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_i16(float) #0

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(float) #0

; Function Attrs: nounwind
define zeroext i8 @fcvt_wu_s_i8(float %a) #0 {
  %LGV4 = load float, ptr @G.6, align 4
  %C5 = fcmp une float %a, %LGV4
  %A2 = alloca ptr, align 8
  %L1 = load i128, ptr %A2, align 4
  %C6 = fcmp olt float %a, %LGV4
  %L = load i128, ptr %A2, align 4
  store ptr poison, ptr %A2, align 8
  %C9 = fcmp one float %a, %LGV4
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %LGV = load float, ptr @G, align 4
  %C3 = icmp ult i128 %L, %L1
  %C = fcmp uge float 4.200000e+01, %LGV
  %C8 = icmp ult i128 18446744073709551616, 42
  %B10 = and i1 %C, %C
  %C2 = fcmp une float %a, %a
  %C4 = fcmp ugt float %a, %LGV
  %1 = fptoui float %LGV4 to i8
  %B = ashr i8 0, %1
  store i1 %C, ptr @G.1, align 1
  store i1 %C2, ptr @G.1, align 1
  %G5 = getelementptr float, ptr %A2, i1 %C4
  %L2 = load i64, ptr %G5, align 4
  %G = getelementptr i8, ptr %A, i1 %C
  store i8 %B, ptr %A, align 1
  %C7 = fcmp ule float %LGV, %LGV4
  store ptr %G, ptr %A2, align 8
  store i1 %C4, ptr %G, align 1
  store ptr %G5, ptr %G, align 8
  store i1 %B10, ptr @G.1, align 1
  store i1 %C5, ptr @G.1, align 1
  store i1 %C8, ptr %G, align 1
  store ptr %A2, ptr @G.7, align 8
  store i1 %C3, ptr @G.8, align 1
  store i1 %C6, ptr @G.9, align 1
  store i1 %C7, ptr @G.1, align 1
  store i1 %C9, ptr %A, align 1
  %B4 = sub i64 %L2, -9223372036854775808
  store i64 %B4, ptr @G.10, align 4
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

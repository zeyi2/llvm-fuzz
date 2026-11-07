; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32f -mattr=+f,+zicond,+zfhmin,+zve32x -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 0
@G.1 = global i16 1
@G.2 = global i64 -1
@G.3 = global i1 false
@G.4 = global <4 x i32> splat (i32 42)

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
define zeroext i16 @fcvt_wu_s_i16(float %a) #0 {
  %A5 = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A5, align 1
  %A3 = alloca i1, align 1
  store i1 false, ptr %A3, align 1
  %LGV = load i64, ptr @G.2, align 4
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %1 = fptoui float %a to i16
  %C = icmp sge i32 0, -1
  switch i64 %LGV, label %SW_D [
    i64 -6601540807527257676, label %SW_C
    i64 4995750803204054296, label %SW_C1
    i64 5024561109755684165, label %SW_C2
  ]

BB:                                               ; preds = %SW_C2, %SW_D
  store i1 %C, ptr %A, align 1
  ret i16 %1

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %LGV3 = load <4 x i32>, ptr @G.4, align 16
  %C1 = fcmp uno float %a, +inf
  store i1 %C1, ptr @G.3, align 1
  %C4 = icmp sgt <4 x i32> zeroinitializer, %LGV3
  store <4 x i1> %C4, ptr %A5, align 1
  ret i16 1

SW_C1:                                            ; preds = %0
  ret i16 1

SW_C2:                                            ; preds = %SW_C2, %0
  %L = load i1, ptr %A3, align 1
  br i1 %L, label %BB, label %SW_C2
}

; Function Attrs: nounwind
declare zeroext i16 @fcvt_wu_s_sat_i16(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_i8(float) #0

; Function Attrs: nounwind
declare signext i8 @fcvt_w_s_sat_i8(float) #0

; Function Attrs: nounwind
define zeroext i8 @fcvt_wu_s_i8(float %a) #0 {
  %LGV = load i16, ptr @G, align 2
  %LGV1 = load i16, ptr @G.1, align 2
  %C = icmp sle i16 %LGV, %LGV1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %1 = fptoui float %a to i8
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

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+f -O3 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.401300e-45
@G.1 = global float 1.401300e-45
@G.2 = global i1 true
@G.3 = global i1 false
@G.4 = global i1 false
@G.5 = global i8 -128
@G.6 = global i16 42

; Function Attrs: nounwind
declare float @fadd_s(float, float) #0

; Function Attrs: nounwind
declare float @fsub_s(float, float) #0

; Function Attrs: nounwind
define float @fmul_s(float %a, float %b) #0 {
  %C1 = icmp ult i1 false, true
  %C = icmp ule <8 x i8> splat (i8 -1), splat (i8 -1)
  %1 = fmul float %a, %b
  store <8 x i1> %C, ptr poison, align 1
  store i1 %C1, ptr poison, align 1
  ret float %1
}

; Function Attrs: nounwind
declare float @fdiv_s(float, float) #0

; Function Attrs: nounwind
declare float @fsqrt_s(float) #0

; Function Attrs: nounwind
declare float @fsgnj_s(float, float) #0

; Function Attrs: nounwind
declare i32 @fneg_s(float, float) #0

; Function Attrs: nounwind
declare float @fsgnjn_s(float, float) #0

; Function Attrs: nounwind
define float @fabs_s(float %a, float %b) #0 {
  %B = mul <2 x i64> splat (i64 4294967296), splat (i64 4294967296)
  %1 = fadd float %a, %b
  %C = fcmp ueq float %1, %1
  %2 = call float @llvm.fabs.f32(float %1)
  %3 = fadd float %2, %1
  store <2 x i64> %B, ptr poison, align 16
  store i1 %C, ptr poison, align 1
  ret float %3
}

; Function Attrs: nounwind
define float @fmin_s(float %a, float %b) #0 {
  %A11 = alloca i1, align 1
  store i1 true, ptr %A11, align 1
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i1, ptr @G.4, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  %LGV2 = load i16, ptr @G.6, align 2
  %E = extractelement <4 x float> splat (float +qnan), i32 -1
  switch i16 %LGV2, label %SW_D [
    i16 646, label %SW_C
    i16 -23838, label %SW_C3
    i16 7586, label %SW_C4
    i16 5003, label %SW_C5
    i16 -26538, label %SW_C6
    i16 8540, label %SW_C7
    i16 -6214, label %SW_C8
    i16 -2374, label %SW_C9
  ]

BB1:                                              ; preds = %SW_C7, %SW_C5, %SW_C4, %SW_C, %SW_D
  %1 = call float @llvm.minnum.f32(float %a, float %E)
  ret float %1

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB

SW_D:                                             ; preds = %BB
  br label %BB1

SW_C:                                             ; preds = %SW_C, %BB
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_C, label %BB1

SW_C3:                                            ; preds = %BB
  ret float %b

SW_C4:                                            ; preds = %SW_C4, %BB
  br i1 %LGV, label %SW_C4, label %BB1

SW_C5:                                            ; preds = %BB
  br label %BB1

SW_C6:                                            ; preds = %BB
  %LGV10 = load float, ptr @G, align 4
  ret float +inf

SW_C7:                                            ; preds = %SW_C7, %BB
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %SW_C7, label %BB1

SW_C8:                                            ; preds = %BB
  ret float %b

SW_C9:                                            ; preds = %BB
  %LGV13 = load float, ptr @G, align 4
  ret float %a
}

; Function Attrs: nounwind
declare float @fmax_s(float, float) #0

; Function Attrs: nounwind
declare float @fmadd_s(float, float, float) #0

; Function Attrs: nounwind
define float @fmsub_s(float %a, float %b, float %c) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load float, ptr @G.1, align 4
  %c_ = fadd float 0.000000e+00, %c
  %C1 = fcmp ole float %c_, %a
  %negc = fsub float -0.000000e+00, %c_
  %1 = call float @llvm.fma.f32(float %a, float %b, float %negc)
  %C2 = fcmp ult float %negc, %a
  %C = fcmp olt float %c_, %LGV
  store i1 %C, ptr poison, align 1
  store i1 %C2, ptr poison, align 1
  store i1 %C1, ptr %A, align 1
  ret float %1
}

; Function Attrs: nounwind
declare float @fmsub_s_fmul_fneg(float, float, float, float) #0

; Function Attrs: nounwind
declare float @fnmadd_s(float, float, float) #0

; Function Attrs: nounwind
declare float @fnmadd_s_2(float, float, float) #0

; Function Attrs: nounwind
declare float @fnmadd_s_3(float, float, float) #0

; Function Attrs: nounwind
declare float @fnmadd_s_fmul_fneg(float, float, float, float) #0

; Function Attrs: nounwind
declare float @fnmadd_nsz(float, float, float) #0

; Function Attrs: nounwind
define float @fnmsub_s(float %a, float %b, float %c) #0 {
  %A1 = alloca i8, align 1
  store i8 42, ptr %A1, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load float, ptr @G, align 4
  %a_ = fadd float 0.000000e+00, %a
  %nega = fsub float -0.000000e+00, %a_
  %1 = call float @llvm.fma.f32(float %nega, float %b, float %c)
  %C = fcmp ueq float %a_, %LGV
  store i1 %C, ptr %A, align 1
  %L2 = load i8, ptr %A1, align 1
  switch i8 %L2, label %SW_D [
    i8 2, label %SW_C
    i8 17, label %SW_C3
    i8 81, label %SW_C4
    i8 -42, label %SW_C5
    i8 -99, label %SW_C6
  ]

BB:                                               ; preds = %SW_C6, %SW_C4, %SW_C, %SW_D
  ret float %1

SW_D:                                             ; preds = %SW_D, %0
  %LGV7 = load i1, ptr @G.3, align 1
  br i1 %LGV7, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  ret float %b

SW_C4:                                            ; preds = %0
  %LGV9 = load i8, ptr @G.5, align 1
  %C10 = icmp ne i8 -1, %LGV9
  store i1 %C10, ptr @G.2, align 1
  br label %BB

SW_C5:                                            ; preds = %0
  ret float +inf

SW_C6:                                            ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare float @fnmsub_s_2(float, float, float) #0

; Function Attrs: nounwind
declare float @fmadd_s_contract(float, float, float) #0

; Function Attrs: nounwind
declare float @fmsub_s_contract(float, float, float) #0

; Function Attrs: nounwind
declare float @fnmadd_s_contract(float, float, float) #0

; Function Attrs: nounwind
declare float @fnmsub_s_contract(float, float, float) #0

; Function Attrs: nounwind
declare float @fsgnjx_f32(float, float) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

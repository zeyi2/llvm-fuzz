; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi lp64f -mattr=+zfhmin,+f,+m -O0 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 1
@G.1 = global <4 x i1> zeroinitializer
@G.2 = global ptr poison
@G.3 = global i8 1
@G.4 = global i8 42
@G.5 = global half 4.200000e+01
@G.6 = global i1 false

; Function Attrs: nounwind
declare i32 @aext_fptosi(half) #0

; Function Attrs: nounwind
declare signext i32 @sext_fptosi(half) #0

; Function Attrs: nounwind
define zeroext i32 @zext_fptosi(half %a) #0 {
  %LGV = load half, ptr @G.5, align 2
  %A = alloca i1, align 1
  %L7 = load half, ptr %A, align 2
  %B8 = fmul half %a, %L7
  %L3 = load i8, ptr %A, align 1
  %L = load <4 x float>, ptr %A, align 16
  store i1 poison, ptr %A, align 1
  %G1 = getelementptr ptr, ptr %A, i8 %L3
  %C = fcmp ugt half %a, %a
  %B = sub i1 %C, %C
  %C3 = fcmp uge half %a, %LGV
  %C2 = fcmp true <4 x float> %L, splat (float +qnan)
  %1 = fptosi half %a to i32
  %C6 = fcmp uge half %a, %B8
  store i1 %C, ptr %A, align 1
  store <4 x i1> %C2, ptr @G.1, align 1
  %G = getelementptr half, ptr %A, i8 %L3
  store ptr %G, ptr %G1, align 8
  store i1 %C3, ptr @G.6, align 1
  store i1 %B, ptr @G.6, align 1
  store i1 %C6, ptr @G.6, align 1
  ret i32 %1
}

; Function Attrs: nounwind
declare i32 @aext_fptoui(half) #0

; Function Attrs: nounwind
declare signext i32 @sext_fptoui(half) #0

; Function Attrs: nounwind
define zeroext i32 @zext_fptoui(half %a) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV1 = load i8, ptr @G.3, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %1 = fptoui half %a to i32
  %B = xor i32 %1, 0
  store i32 %B, ptr @G, align 4
  %B2 = ashr i8 127, %LGV1
  store i8 %B2, ptr @G.4, align 1
  ret i32 %1

T:                                                ; preds = %T, %0
  %B1 = add i1 true, %L
  br i1 %B1, label %BB, label %T

F:                                                ; preds = %0
  %B3 = lshr i64 0, 4294967296
  store i64 %B3, ptr %A, align 4
  br label %BB
}

; Function Attrs: nounwind
declare i16 @bcvt_f16_to_aext_i16(half, half) #0

; Function Attrs: nounwind
declare signext i16 @bcvt_f16_to_sext_i16(half, half) #0

; Function Attrs: nounwind
declare zeroext i16 @bcvt_f16_to_zext_i16(half, half) #0

; Function Attrs: nounwind
declare half @bcvt_i64_to_f16_via_i16(i64, i64) #0

; Function Attrs: nounwind
declare half @uitofp_aext_i32_to_f16(i32) #0

; Function Attrs: nounwind
declare half @uitofp_sext_i32_to_f16(i32 signext) #0

; Function Attrs: nounwind
declare half @uitofp_zext_i32_to_f16(i32 zeroext) #0

; Function Attrs: nounwind
declare half @sitofp_aext_i32_to_f16(i32) #0

; Function Attrs: nounwind
declare half @sitofp_sext_i32_to_f16(i32 signext) #0

; Function Attrs: nounwind
declare half @sitofp_zext_i32_to_f16(i32 zeroext) #0

attributes #0 = { nounwind }

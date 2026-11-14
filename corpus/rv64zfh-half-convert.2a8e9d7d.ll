; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi lp64f -mattr=+zfh -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 0
@G.1 = global i1 false

; Function Attrs: nounwind
declare i32 @aext_fptosi(half) #0

; Function Attrs: nounwind
declare signext i32 @sext_fptosi(half) #0

; Function Attrs: nounwind
declare zeroext i32 @zext_fptosi(half) #0

; Function Attrs: nounwind
declare i32 @aext_fptoui(half) #0

; Function Attrs: nounwind
define signext i32 @sext_fptoui(half %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp oeq half %a, 5.960460e-08
  %1 = fptoui half %a to i32
  store i1 %C, ptr %A, align 1
  ret i32 %1
}

; Function Attrs: nounwind
define zeroext i32 @zext_fptoui(half %a) #0 {
  %C = fcmp true half %a, %a
  %1 = fptoui half %a to i32
  store i1 %C, ptr @G.1, align 1
  ret i32 %1
}

; Function Attrs: nounwind
define i16 @bcvt_f16_to_aext_i16(half %a, half %b) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %1 = fadd half %a, %b
  %2 = bitcast half %1 to i16
  ret i16 %2

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare signext i16 @bcvt_f16_to_sext_i16(half, half) #0

; Function Attrs: nounwind
declare zeroext i16 @bcvt_f16_to_zext_i16(half, half) #0

; Function Attrs: nounwind
declare half @bcvt_i64_to_f16_via_i16(i64, i64) #0

; Function Attrs: nounwind
define half @uitofp_aext_i32_to_f16(i32 %a) #0 {
  %LGV = load i32, ptr @G, align 4
  %1 = uitofp i32 %a to half
  %C = icmp eq i32 %a, %LGV
  store i1 %C, ptr @G.1, align 1
  ret half %1
}

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

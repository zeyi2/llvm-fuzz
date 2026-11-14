; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi lp64f -mattr=+zfh,+m,+zfa,+zve64d -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half +qnan
@G.1 = global i1 false
@G.2 = global i1 false
@G.3 = global i64 4294967296

; Function Attrs: nounwind
declare i32 @aext_fptosi(half) #0

; Function Attrs: nounwind
declare signext i32 @sext_fptosi(half) #0

; Function Attrs: nounwind
declare zeroext i32 @zext_fptosi(half) #0

; Function Attrs: nounwind
declare i32 @aext_fptoui(half) #0

; Function Attrs: nounwind
declare signext i32 @sext_fptoui(half) #0

; Function Attrs: nounwind
define zeroext i32 @zext_fptoui(half %a) #0 {
  %C2 = fcmp uge half %a, 6.550400e+04
  br i1 %C2, label %T, label %F

BB:                                               ; preds = %F, %T
  %LGV = load half, ptr @G, align 2
  %C7 = fcmp ugt half %a, %LGV
  %B1 = ashr i64 42, 4294967296
  %B = fadd half +qnan, %LGV
  %1 = fptoui half %a to i32
  %C = fcmp une half %a, %B
  %C1 = fcmp uge half %a, %a
  %C3 = icmp ne i32 %1, %1
  store i1 %C, ptr @G.1, align 1
  store i1 %C1, ptr @G.2, align 1
  store i1 %C2, ptr @G.2, align 1
  %C4 = fcmp ueq half %a, %a
  store i1 %C3, ptr @G.2, align 1
  store i1 %C4, ptr @G.1, align 1
  store i64 %B1, ptr @G.3, align 4
  store i1 %C7, ptr @G.1, align 1
  ret i32 %1

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  br i1 %C2, label %F, label %BB
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

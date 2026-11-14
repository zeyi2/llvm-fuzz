; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi lp64f -mattr=+zfh,+m,+zfa,+zve64d,+f -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half +qnan
@G.1 = global i1 false
@G.2 = global i1 false
@G.3 = global i32 0
@G.4 = global i1 true

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
  %C8 = fcmp true half %a, %a
  %A = alloca half, align 2
  %L = load i128, ptr %A, align 4
  store half poison, ptr %A, align 2
  %C2 = fcmp uge half %a, 6.550400e+04
  %LGV = load half, ptr @G, align 2
  %C10 = icmp sgt i128 %L, -1
  %B = fadd half +qnan, %LGV
  %1 = fptoui half %a to i32
  %C = fcmp une half %a, %B
  %C6 = fcmp ueq half %a, %B
  %B2 = lshr i32 %1, -1
  %C1 = fcmp uge half %a, %a
  %B3 = fmul half %B, %LGV
  store i1 %C, ptr @G.1, align 1
  store i1 %C1, ptr @G.2, align 1
  store i1 %C2, ptr @G.2, align 1
  store i1 %C10, ptr @G.2, align 1
  store i1 %C6, ptr @G.1, align 1
  store i32 %B2, ptr @G.3, align 4
  store half %B3, ptr %A, align 2
  store i1 %C8, ptr @G.4, align 1
  ret i32 %1
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

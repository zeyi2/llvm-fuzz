; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi lp64f -mattr=+zfhmin -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 1
@G.1 = global i8 127
@G.2 = global i8 -1
@G.3 = global half 6.550400e+04
@G.4 = global i1 false
@G.5 = global half 4.200000e+01
@G.6 = global i1 true

; Function Attrs: nounwind
declare i32 @aext_fptosi(half) #0

; Function Attrs: nounwind
declare signext i32 @sext_fptosi(half) #0

; Function Attrs: nounwind
define zeroext i32 @zext_fptosi(half %a) #0 {
  %LGV1 = load half, ptr @G.5, align 2
  %LGV = load half, ptr @G.3, align 2
  %C2 = fcmp uno half %a, %LGV1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C4 = fcmp ugt half %LGV, %LGV
  %C = fcmp ugt half %a, %a
  %G2 = getelementptr i64, ptr %A, i32 65536
  %C3 = fcmp ule half %a, %LGV
  %1 = fptosi half %a to i32
  store i1 %C, ptr %G2, align 1
  store i1 %C3, ptr @G.4, align 1
  store i1 %C2, ptr %G2, align 1
  store i1 %C4, ptr @G.6, align 1
  ret i32 %1
}

; Function Attrs: nounwind
declare i32 @aext_fptoui(half) #0

; Function Attrs: nounwind
declare signext i32 @sext_fptoui(half) #0

; Function Attrs: nounwind
define zeroext i32 @zext_fptoui(half %a) #0 {
  %LGV = load i8, ptr @G.1, align 1
  %C = fcmp one half %a, %a
  %B1 = ashr i8 %LGV, 0
  %1 = fptoui half %a to i32
  %B = xor i32 %1, 0
  store i32 %B, ptr @G, align 4
  store i8 %B1, ptr @G.2, align 1
  store i1 %C, ptr @G.4, align 1
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

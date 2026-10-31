; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi lp64f -mattr=+zfhmin,+zfh -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 -1
@G.1 = global i1 false

; Function Attrs: nounwind
declare i32 @aext_fptosi(half) #0

; Function Attrs: nounwind
declare signext i32 @sext_fptosi(half) #0

; Function Attrs: nounwind
declare zeroext i32 @zext_fptosi(half) #0

; Function Attrs: nounwind
define i32 @aext_fptoui(half %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %1 = fptoui half %a to i32
  %C = icmp slt i128 -170141183460469231731687303715884105728, -170141183460469231731687303715884105728
  %C1 = fcmp ord half %a, %a
  store i1 %C, ptr %A, align 1
  store i1 %C1, ptr @G.1, align 1
  ret i32 %1
}

; Function Attrs: nounwind
declare signext i32 @sext_fptoui(half) #0

; Function Attrs: nounwind
define zeroext i32 @zext_fptoui(half %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i128, ptr @G, align 4
  %1 = fptoui half %a to i32
  %C2 = icmp uge i128 %LGV, 1
  store i1 %C2, ptr %A, align 1
  ret i32 %1
}

; Function Attrs: nounwind
declare i16 @bcvt_f16_to_aext_i16(half, half) #0

; Function Attrs: nounwind
declare signext i16 @bcvt_f16_to_sext_i16(half, half) #0

; Function Attrs: nounwind
declare zeroext i16 @bcvt_f16_to_zext_i16(half, half) #0

; Function Attrs: nounwind
define half @bcvt_i64_to_f16_via_i16(i64 %a, i64 %b) #0 {
  %1 = trunc i64 %a to i16
  %2 = trunc i64 %b to i16
  %3 = bitcast i16 %1 to half
  %4 = bitcast i16 %2 to half
  %5 = fadd half %3, %4
  %C = fcmp uge half +inf, %5
  store i1 %C, ptr @G.1, align 1
  ret half %5
}

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

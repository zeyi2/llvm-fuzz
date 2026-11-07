; isel-diff-config: -verify-machineinstrs -mtriple=riscv32-unknown-unknown -mattr=+zfh -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.000000e+00
@G.1 = global i1 true

define i32 @skip(i32 noundef %a, i32 noundef %b, i32 noundef %c) #0 {
entry:
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %mul = mul nsw i32 %b, %a
  %B = and i32 %b, %c
  %or = or i32 %mul, %c
  store i32 %B, ptr %A, align 4
  ret i32 %or
}

declare i32 @used_gpr_arg(i32 noundef, i32 noundef, i32 noundef) #1

declare i32 @used_gpr(i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @used_arg(i32 noundef, i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @used(i32 noundef, i32 noundef, i32 noundef) #4

declare i32 @all_gpr_arg(i32 noundef, i32 noundef, i32 noundef) #5

declare i32 @all_gpr(i32 noundef, i32 noundef, i32 noundef) #6

define double @skip_float(double noundef %a, float noundef %b) #0 {
entry:
  %LGV = load float, ptr @G, align 4
  %C = fcmp ord float %b, %LGV
  %conv = fpext float %b to double
  %mul = fmul double %conv, %a
  store i1 %C, ptr @G.1, align 1
  ret double %mul
}

declare double @used_gpr_arg_float(double noundef, float noundef) #1

declare double @used_gpr_float(double noundef, float noundef) #2

declare double @all_gpr_arg_float(double noundef, float noundef) #5

declare double @all_gpr_float(double noundef, float noundef) #6

declare double @used_zdinx(double noundef, double noundef, float noundef) #7

declare double @used_arg_zdinx(double noundef, double noundef, float noundef) #8

declare void @huge_stack() #2

attributes #0 = { "target-cpu"="generic" "target-features"="+m,+f,+d" "zero-call-used-regs"="skip" }
attributes #1 = { "target-cpu"="generic" "target-features"="+m,+f,+d" "zero-call-used-regs"="used-gpr-arg" }
attributes #2 = { "target-cpu"="generic" "target-features"="+m,+f,+d" "zero-call-used-regs"="used-gpr" }
attributes #3 = { "target-cpu"="generic" "target-features"="+m,+f,+d" "zero-call-used-regs"="used-arg" }
attributes #4 = { "target-cpu"="generic" "target-features"="+m,+f,+d" "zero-call-used-regs"="used" }
attributes #5 = { "target-cpu"="generic" "target-features"="+m,+f,+d" "zero-call-used-regs"="all-gpr-arg" }
attributes #6 = { "target-cpu"="generic" "target-features"="+m,+f,+d" "zero-call-used-regs"="all-gpr" }
attributes #7 = { "target-cpu"="generic" "target-features"="+m,+zdinx" "zero-call-used-regs"="used" }
attributes #8 = { "target-cpu"="generic" "target-features"="+m,+zdinx" "zero-call-used-regs"="used-arg" }

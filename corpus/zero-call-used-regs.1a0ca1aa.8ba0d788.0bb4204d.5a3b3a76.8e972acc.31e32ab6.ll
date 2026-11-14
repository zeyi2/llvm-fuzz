; isel-diff-config: -verify-machineinstrs -mtriple=riscv32-unknown-unknown -mattr=+zfa,+m -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i32 1
@G.2 = global i32 0
@G.3 = global double 1.000000e+00
@G.4 = global i32 -2147483648
@G.5 = global i32 42
@G.6 = global <4 x i32> zeroinitializer
@G.7 = global i1 true
@G.8 = global float 4.200000e+01
@G.9 = global i8 -1
@G.10 = global i8 42

declare i32 @skip(i32 noundef, i32 noundef, i32 noundef) #0

declare i32 @used_gpr_arg(i32 noundef, i32 noundef, i32 noundef) #1

declare i32 @used_gpr(i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @used_arg(i32 noundef, i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @used(i32 noundef, i32 noundef, i32 noundef) #4

declare i32 @all_gpr_arg(i32 noundef, i32 noundef, i32 noundef) #5

declare i32 @all_gpr(i32 noundef, i32 noundef, i32 noundef) #6

define double @skip_float(double noundef %a, float noundef %b) #0 {
entry:
  %C2 = fcmp olt double %a, 1.000000e+00
  %conv = fpext float %b to double
  %mul = fmul arcp double %conv, %a
  %C = fcmp oge double %a, %a
  store i1 %C2, ptr @G, align 1
  store i1 %C, ptr @G, align 1
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

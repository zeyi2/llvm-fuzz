; isel-diff-config: -verify-machineinstrs -mtriple=riscv32-unknown-unknown -O0
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

define i32 @skip(i32 noundef %a, i32 noundef %b, i32 noundef %c) #0 {
entry:
  %LGV = load double, ptr @G.3, align 8
  %B2 = or i32 %b, 65536
  %B = mul i32 %a, %c
  %B1 = fsub double +inf, %LGV
  %mul = mul nsw i32 %b, %B
  %C = icmp sle i32 %B, %B
  store double %B1, ptr poison, align 8
  %or = or i32 %c, %mul
  store i1 %C, ptr @G, align 1
  store i32 %B2, ptr @G.2, align 4
  ret i32 %or
}

declare i32 @used_gpr_arg(i32 noundef, i32 noundef, i32 noundef) #1

declare i32 @used_gpr(i32 noundef, i32 noundef, i32 noundef) #2

define i32 @used_arg(i32 noundef %a, i32 noundef %b, i32 noundef %c, i32 noundef %d) #3 {
entry:
  %LGV2 = load i1, ptr @G.7, align 1
  %LGV = load i32, ptr @G.1, align 4
  %B = sdiv i32 %d, %LGV
  %or = or i32 %B, %c
  %B1 = or i32 %d, 65536
  %C = fcmp ueq float f0x7F7FFFFF, f0x7F7FFFFF
  %C3 = icmp sgt i1 false, %LGV2
  store i1 %C, ptr poison, align 1
  store i32 %B1, ptr @G.4, align 4
  store i1 %C3, ptr @G.7, align 1
  ret i32 %or
}

declare i32 @used(i32 noundef, i32 noundef, i32 noundef) #4

declare i32 @all_gpr_arg(i32 noundef, i32 noundef, i32 noundef) #5

declare i32 @all_gpr(i32 noundef, i32 noundef, i32 noundef) #6

define double @skip_float(double noundef %a, float noundef %b) #0 {
entry:
  %LGV1 = load float, ptr @G.8, align 4
  %C2 = fcmp ueq float %b, %LGV1
  %conv = fpext float %b to double
  %mul = fmul arcp double %conv, %a
  store i1 %C2, ptr @G, align 1
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

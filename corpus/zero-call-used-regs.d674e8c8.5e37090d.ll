; isel-diff-config: -verify-machineinstrs -mtriple=riscv64-unknown-unknown -O0 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 1
@G.1 = global i1 true
@G.2 = global i8 1
@G.3 = global ptr poison

declare i32 @skip(i32 noundef, i32 noundef, i32 noundef) #0

declare i32 @used_gpr_arg(i32 noundef, i32 noundef, i32 noundef) #1

declare i32 @used_gpr(i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @used_arg(i32 noundef, i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @used(i32 noundef, i32 noundef, i32 noundef) #4

declare i32 @all_gpr_arg(i32 noundef, i32 noundef, i32 noundef) #5

declare i32 @all_gpr(i32 noundef, i32 noundef, i32 noundef) #6

declare double @skip_float(double noundef, float noundef) #0

define double @used_gpr_arg_float(double noundef %a, float noundef %b) #1 {
entry:
  %LGV = load i1, ptr @G.1, align 1
  %conv = fpext float %b to double
  %C = icmp sgt i1 false, %LGV
  %mul = fmul double %conv, %a
  store i1 %C, ptr @G.1, align 1
  br label %BB

BB:                                               ; preds = %entry
  ret double %mul
}

declare double @used_gpr_float(double noundef, float noundef) #2

declare double @all_gpr_arg_float(double noundef, float noundef) #5

declare double @all_gpr_float(double noundef, float noundef) #6

define double @used_zdinx(double noundef %a, double noundef %b, float noundef %c) #7 {
entry:
  %A2 = alloca i8, align 1
  store i8 poison, ptr %A2, align 1
  %LGV1 = load i8, ptr @G.2, align 1
  %A = alloca i1, align 1
  %C4 = fcmp oeq double %b, %b
  %L = load i8, ptr %A, align 1
  store i1 %C4, ptr %A, align 1
  %LGV = load i32, ptr @G, align 4
  %conv = fpext float %c to double
  %mul1 = fmul double %a, %b
  %G = getelementptr double, ptr %A, i16 -32768
  %C = icmp sle i32 %LGV, 0
  %B = ashr i8 %LGV1, %L
  %mul2 = fmul double %mul1, %conv
  store i1 %C, ptr %A, align 1
  store i8 %B, ptr %A2, align 1
  store ptr %G, ptr @G.3, align 8
  ret double %mul2
}

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

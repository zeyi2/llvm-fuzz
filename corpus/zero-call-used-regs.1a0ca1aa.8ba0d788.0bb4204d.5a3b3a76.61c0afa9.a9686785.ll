; isel-diff-config: -verify-machineinstrs -mtriple=riscv32-unknown-unknown -O3
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
@G.10 = global double 4.200000e+01
@G.11 = global i1 false
@G.12 = global half +qnan
@G.13 = global double +qnan

define i32 @skip(i32 noundef %a, i32 noundef %b, i32 noundef %c) #0 {
entry:
  %LGV8 = load double, ptr @G.13, align 8
  %A6 = alloca i1, align 1
  store i1 poison, ptr %A6, align 1
  %A5 = alloca i1, align 1
  store i1 true, ptr %A5, align 1
  %A3 = alloca i1, align 1
  store i1 false, ptr %A3, align 1
  %C10 = fcmp uno double %LGV8, 0.000000e+00
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %B2 = or i32 %b, 65536
  %B = mul nuw i32 %a, %c
  %C2 = fcmp ogt float +inf, +qnan
  store i32 %B2, ptr @G.2, align 4
  %C3 = icmp eq i1 true, false
  store i1 %C3, ptr poison, align 1
  %mul = mul nsw i32 %b, %B
  %C1 = icmp uge i128 1, 170141183460469231731687303715884105727
  store i1 %C10, ptr @G, align 1
  store i1 %C1, ptr @G, align 1
  %or = or i32 %c, %mul
  %LGV = load double, ptr @G.3, align 8
  %L4 = load i1, ptr %A3, align 1
  br i1 %L4, label %T, label %F

BB:                                               ; preds = %F, %T
  %B7 = or i32 %b, 42
  %B3 = mul i32 %b, %B7
  %B9 = ashr i32 %b, %B
  %C7 = icmp ule i32 %B9, 2147483647
  %B1 = fsub double +inf, %LGV
  store double %B1, ptr poison, align 8
  store i1 %C2, ptr %A, align 1
  %C4 = icmp slt i1 false, true
  store i32 %B7, ptr @G.4, align 4
  store i32 %B9, ptr @G.2, align 4
  store i32 %B3, ptr @G.1, align 4
  store i1 %C4, ptr %A6, align 1
  store i1 %C7, ptr @G.7, align 1
  ret i32 %or

T:                                                ; preds = %T, %entry
  %L6 = load i1, ptr %A5, align 1
  br i1 %L6, label %BB, label %T

F:                                                ; preds = %entry
  %0 = phi half [ 4.200000e+01, %entry ]
  store half %0, ptr @G.12, align 2
  br label %BB
}

declare i32 @used_gpr_arg(i32 noundef, i32 noundef, i32 noundef) #1

declare i32 @used_gpr(i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @used_arg(i32 noundef, i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @used(i32 noundef, i32 noundef, i32 noundef) #4

declare i32 @all_gpr_arg(i32 noundef, i32 noundef, i32 noundef) #5

declare i32 @all_gpr(i32 noundef, i32 noundef, i32 noundef) #6

define double @skip_float(double noundef %a, float noundef %b) #0 {
entry:
  %C4 = fcmp ole double %a, f0x7FEFFFFFFFFFFFFF
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV2 = load double, ptr @G.10, align 8
  %C = fcmp oge double %a, %a
  %C1 = icmp sge i1 %C, true
  %conv = fpext float %b to double
  %C3 = fcmp oeq double %conv, %LGV2
  %mul = fmul arcp double %conv, %a
  store i1 %C1, ptr @G, align 1
  store i1 %C3, ptr @G.11, align 1
  %C2 = icmp slt i1 %C, true
  store i1 %C2, ptr %A, align 1
  store i1 %C4, ptr %A, align 1
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

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -M no-aliases -mattr=+zca,+m,+zdinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <4 x i32> splat (i32 -1)

; Function Attrs: nounwind
define signext i32 @add_small_const(i32 signext %a) #0 {
  %A = alloca i1, align 1
  %L1 = load i32, ptr %A, align 4
  store i1 false, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  %C = icmp slt i32 %a, %L1
  store i1 %C, ptr poison, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %1 = add i32 %a, 1
  %2 = shl i32 %1, 24
  %3 = ashr i32 %2, 24
  ret i32 %3

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
define signext i32 @add_large_const(i32 signext %a) #0 {
  %A1 = alloca i1, align 1
  store i1 true, ptr %A1, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i1, ptr @G, align 1
  %1 = add i32 %a, 4095
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %2 = shl i32 %1, 16
  %3 = ashr i32 %2, 16
  ret i32 %3

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %L2 = load i1, ptr %A1, align 1
  br i1 %L2, label %F, label %BB
}

; Function Attrs: nounwind
define signext i32 @add_huge_const(i32 signext %a) #0 {
  %1 = add i32 %a, 32767
  %2 = shl i32 %1, 16
  %B = add <4 x i32> splat (i32 1), zeroinitializer
  %3 = ashr i32 %2, 16
  store <4 x i32> %B, ptr @G.1, align 16
  ret i32 %3
}

; Function Attrs: nounwind
define signext i24 @add_non_machine_type(i24 signext %a) #0 {
  %A = alloca i24, align 4
  store i24 poison, ptr %A, align 4
  %C1 = icmp sle i24 %a, %a
  %1 = add i24 %a, 256
  %B = mul i24 %a, %1
  %2 = shl i24 %1, 12
  store i1 %C1, ptr @G, align 1
  store i24 %B, ptr %A, align 4
  ret i24 %2
}

; Function Attrs: nounwind
declare i128 @add_wide_operand(i128) #0

attributes #0 = { nounwind }

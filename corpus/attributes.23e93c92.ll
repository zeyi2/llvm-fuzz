; isel-diff-config: -mtriple=riscv64 -mattr=+rva23p1s64,+zfh -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 16
@G.1 = global i1 true
@G.2 = global i1 false
@G.3 = global i1 true

define i32 @addi(i32 %a) {
  %LGV = load i1, ptr @G.2, align 1
  %C = icmp sge i32 %a, 2147483647
  %B3 = ashr i1 %C, false
  %C1 = icmp sle i1 %C, %LGV
  %1 = add i32 %a, 1
  %B = ashr i32 %1, %1
  store i1 %C, ptr @G.1, align 1
  store i1 %C1, ptr @G.3, align 1
  %C2 = icmp sgt i32 %B, %a
  store i1 %C2, ptr poison, align 1
  store i1 %B3, ptr @G.3, align 1
  ret i32 %B
}

; Function Attrs: nounwind
define i8 @atomic_load_i8_seq_cst(ptr %a) #0 {
  %A = alloca i1, align 1
  %L2 = load i8, ptr %A, align 1
  store i1 false, ptr %A, align 1
  %G = getelementptr inbounds ptr, ptr %a, i8 %L2
  %L = load i1, ptr %G, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %T
  %1 = load atomic i8, ptr %a seq_cst, align 1
  ret i8 %1

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  %LGV = load i8, ptr @G, align 1
  ret i8 %LGV
}

attributes #0 = { nounwind }

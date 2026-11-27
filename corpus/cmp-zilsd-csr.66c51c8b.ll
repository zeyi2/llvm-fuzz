; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 1
@G.1 = global i1 false
@G.2 = global i32 -1
@G.3 = global i1 true

declare i32 @foo()

declare void @bar()

; Function Attrs: nounwind optsize
define void @c_expand_asm_operands(ptr %p, i32 %a) #0 {
entry:
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i32, ptr @G.2, align 4
  %L = load i1, ptr %A, align 1
  switch i1 %L, label %SW_D [
    i1 false, label %SW_C
    i1 true, label %SW_C3
  ]

BB:                                               ; preds = %SW_C3, %SW_C
  %call1 = call i32 @foo()
  %0 = alloca i8, i32 %a, align 8
  store ptr %0, ptr %p, align 8
  tail call void @bar()
  %C2 = icmp sgt i32 %a, %LGV
  %B = add i32 %call1, %call1
  store i32 %B, ptr @G, align 4
  %C = icmp eq i32 %B, %call1
  %B1 = xor i32 %a, %a
  store i32 %B1, ptr @G, align 4
  store i1 %C, ptr @G.1, align 1
  store i1 %C2, ptr @G.3, align 1
  ret void

SW_D:                                             ; preds = %entry
  ret void

SW_C:                                             ; preds = %SW_C, %entry
  br i1 %L, label %SW_C, label %BB

SW_C3:                                            ; preds = %entry
  br label %BB
}

attributes #0 = { nounwind optsize }

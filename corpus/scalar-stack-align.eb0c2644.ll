; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+v,+d -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global ptr poison

; Function Attrs: nounwind
define ptr @scalar_stack_align16() #0 {
  %LGV = load i1, ptr @G, align 1
  %a = alloca <vscale x 2 x i32>, align 8
  %G = getelementptr ptr, ptr %a, i1 %LGV
  %c = alloca i64, align 16
  call void @extern(ptr %a)
  store ptr %G, ptr @G.1, align 8
  ret ptr %c
}

declare void @extern(ptr)

attributes #0 = { nounwind }

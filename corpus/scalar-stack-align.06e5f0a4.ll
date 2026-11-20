; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+v -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -1
@G.1 = global i1 false

; Function Attrs: nounwind
define ptr @scalar_stack_align16() #0 {
  %LGV = load i8, ptr @G, align 1
  %a = alloca <vscale x 2 x i32>, align 8
  %c = alloca i64, align 16
  %L = load i8, ptr %c, align 1
  %C = icmp slt i8 %LGV, %L
  call void @extern(ptr %a)
  store i1 %C, ptr @G.1, align 1
  ret ptr %c
}

declare void @extern(ptr)

attributes #0 = { nounwind }

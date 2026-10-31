; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+v -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -2147483648
@G.1 = global i1 false

; Function Attrs: nounwind
define ptr @scalar_stack_align16() #0 {
  %LGV = load i32, ptr @G, align 4
  %C = icmp ne i32 %LGV, 42
  %a = alloca <vscale x 2 x i32>, align 8
  %c = alloca i64, align 16
  call void @extern(ptr %a)
  store i1 %C, ptr @G.1, align 1
  ret ptr %c
}

declare void @extern(ptr)

attributes #0 = { nounwind }

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zve64x -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global ptr poison

; Function Attrs: nounwind
define ptr @scalar_stack_align16() #0 {
  %a = alloca <vscale x 2 x i32>, align 8
  %c = alloca i64, align 16
  %G = getelementptr ptr, ptr %c, i1 true
  call void @extern(ptr %a)
  store ptr %G, ptr @G, align 8
  ret ptr %c
}

declare void @extern(ptr)

attributes #0 = { nounwind }

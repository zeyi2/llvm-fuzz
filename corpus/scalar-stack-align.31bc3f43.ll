; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zve64x -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 0
@G.1 = global double 4.940660e-324
@G.2 = global ptr poison

; Function Attrs: nounwind
define ptr @scalar_stack_align16() #0 {
  %LGV = load i32, ptr @G, align 4
  %a = alloca <vscale x 2 x i32>, align 8
  %G2 = getelementptr double, ptr %a, i32 %LGV
  call void @extern(ptr %a)
  %G5 = getelementptr i16, ptr %a, i16 42
  store ptr %G2, ptr @G.2, align 8
  ret ptr %G5
}

declare void @extern(ptr)

attributes #0 = { nounwind }

; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global i1 true

; Function Attrs: nounwind
define ptr @scalar_stack_align16() #0 {
  %LGV = load double, ptr @G, align 8
  %a = alloca <vscale x 2 x i32>, align 8
  %c = alloca i64, align 16
  call void @extern(ptr %a)
  %C = fcmp ueq double 1.000000e+00, %LGV
  store i1 %C, ptr @G.1, align 1
  ret ptr %c
}

declare void @extern(ptr)

attributes #0 = { nounwind }

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+v,+zicond,+m -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 1)
@G.1 = global ptr poison
@G.2 = global double +inf

; Function Attrs: nounwind
define ptr @scalar_stack_align16() #0 {
  %a = alloca <vscale x 2 x i32>, align 8
  %L2 = load double, ptr %a, align 8
  %B = fadd double 4.940660e-324, %L2
  %L = load i8, ptr %a, align 1
  %G = getelementptr <8 x i8>, ptr %a, i8 %L
  %c = alloca i64, align 16
  call void @extern(ptr %a)
  store ptr %G, ptr @G.1, align 8
  store double %B, ptr @G.2, align 8
  ret ptr %c
}

declare void @extern(ptr)

attributes #0 = { nounwind }

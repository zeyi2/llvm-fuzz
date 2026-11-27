; isel-diff-config: -mtriple=riscv32 -frame-pointer=non-leaf -mattr=+v -O2 -code-model=small -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false

declare void @use(ptr)

; Function Attrs: nounwind
define i32 @foo(i32 %a, i32 %b) #0 {
  %A8 = alloca i1, align 1
  store i1 poison, ptr %A8, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %x = alloca i32, align 4
  %L4 = load double, ptr %x, align 8
  %y = alloca i32, align 4
  %L = load i32, ptr %y, align 4
  store i32 %a, ptr %x, align 4
  store i32 %b, ptr %y, align 4
  call void @use(ptr %x)
  %C = fcmp uno float +qnan, 1.000000e+00
  %v1 = load i32, ptr %x, align 4
  %v2 = load i32, ptr %y, align 4
  %B = xor i32 %v2, %L
  %sum = add i32 %v1, %B
  %C5 = fcmp uge double 4.200000e+01, %L4
  %C7 = icmp slt i32 %a, 2147483647
  store i1 %C, ptr @G, align 1
  store i1 %C5, ptr %A, align 1
  store i1 %C7, ptr %A8, align 1
  ret i32 %sum
}

attributes #0 = { nounwind }

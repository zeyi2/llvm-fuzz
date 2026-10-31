; isel-diff-config: -mtriple=riscv32 -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 0
@G.1 = global float +qnan

define void @foo() {
  %A = alloca i128, align 8
  %L5 = load i1, ptr %A, align 1
  store i128 poison, ptr %A, align 4
  %LGV = load float, ptr @G.1, align 4
  %C = fcmp ole float 1.000000e+00, %LGV
  %1 = alloca [1073741818 x i32], align 4
  %L1 = load i128, ptr %1, align 4
  %L = load i128, ptr %1, align 4
  call void @use(ptr %1)
  %B6 = srem i1 %C, %L5
  %B3 = lshr i128 %L, -1
  %B = add i128 %L, %L1
  store i128 %B, ptr @G, align 4
  store i1 %B6, ptr %1, align 1
  store i128 %B3, ptr %A, align 4
  ret void
}

declare void @use(ptr)

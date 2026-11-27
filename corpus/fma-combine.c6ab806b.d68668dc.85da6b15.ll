; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+d,+zfa,+zvbb,+zicsr -O3 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 18446744073709551616
@G.1 = global double f0x7FEFFFFFFFFFFFFF
@G.2 = global double f0x7FEFFFFFFFFFFFFF
@G.3 = global i1 true
@G.4 = global i1 true

define double @fnmadd_non_trivial(ptr %p0, ptr %p1, ptr %dst, double %mul425) {
  %LGV8 = load i1, ptr @G.4, align 1
  %LGV3 = load double, ptr @G.2, align 8
  %LGV = load double, ptr @G.1, align 8
  %A = alloca i1, align 1
  %L6 = load i128, ptr %A, align 4
  %L = load double, ptr %A, align 8
  store i1 poison, ptr %A, align 1
  store double f0x3FEE666666666666, ptr %dst, align 8
  %mul413 = fmul double %mul425, -3.000000e+00
  store double %mul413, ptr %p0, align 8
  %mul428 = fmul contract double %mul425, 4.500000e+00
  %G = getelementptr i128, ptr %p1, i128 -1
  %add429 = fadd nsz contract double %mul428, 3.000000e+00
  %B4 = fmul double %LGV, %LGV3
  br i1 %LGV8, label %T, label %F

BB:                                               ; preds = %F
  %mul430 = fmul contract double %add429, 0.000000e+00
  %C2 = icmp ult i1 true, true
  %sub432 = fadd nsz contract double %mul430, 1.000000e+00
  %mul433 = fmul contract double %sub432, 0.000000e+00
  %G7 = getelementptr ptr, ptr %p0, i128 %L6
  %B = fdiv double %mul433, %mul430
  store double %sub432, ptr %G, align 8
  %mul441 = fmul contract double %mul425, 0.000000e+00
  %add443 = fsub double 0.000000e+00, %mul425
  %mul446 = fmul contract double %add443, 4.500000e+00
  %add447 = fadd nsz contract double %mul446, 3.000000e+00
  %mul448 = fmul contract double %add447, 0.000000e+00
  %C = fcmp oeq double %mul446, %mul433
  %sub450 = fadd nsz contract double %mul448, 1.000000e+00
  %1 = fsub nsz contract double %sub450, %mul441
  store i1 %C, ptr %A, align 1
  store double %B, ptr poison, align 8
  store i1 %C2, ptr poison, align 1
  %C5 = fcmp one double %B4, %L
  store double %B4, ptr %G7, align 8
  store i1 %C5, ptr @G.3, align 1
  ret double %1

T:                                                ; preds = %0
  ret double %mul425

F:                                                ; preds = %0
  br label %BB
}

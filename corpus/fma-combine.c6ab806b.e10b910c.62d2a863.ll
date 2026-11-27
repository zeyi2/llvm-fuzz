; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+d,+zfa,+zvbb,+f,+zve32x -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 18446744073709551616
@G.1 = global double 0.000000e+00
@G.2 = global double +inf
@G.3 = global i1 true
@G.4 = global i1 true
@G.5 = global ptr poison
@G.6 = global ptr poison

define double @fnmadd_non_trivial(ptr %p0, ptr %p1, ptr %dst, double %mul425) {
  %LGV = load i1, ptr @G.4, align 1
  store double f0x3FEE666666666666, ptr %dst, align 8
  %mul413 = fmul double %mul425, -3.000000e+00
  %C5 = fcmp ole double f0x7FEFFFFFFFFFFFFF, %mul425
  store double %mul413, ptr %p0, align 8
  %mul428 = fmul contract double %mul425, 4.500000e+00
  %G = getelementptr i128, ptr %p1, i128 -1
  %L = load i128, ptr %G, align 4
  %add429 = fadd nsz contract double %mul428, 3.000000e+00
  %mul430 = fmul contract double %add429, 0.000000e+00
  %sub432 = fadd nsz contract double %mul430, 1.000000e+00
  %mul433 = fmul contract double %sub432, 0.000000e+00
  %1 = fsub nsz contract double %mul433, %mul425
  %B = fmul double %mul428, %mul413
  store double %1, ptr %G, align 8
  %G4 = getelementptr double, ptr %p1, i1 %LGV
  %mul441 = fmul contract double %mul425, 0.000000e+00
  %add443 = fsub double 0.000000e+00, %mul425
  %mul446 = fmul contract double %add443, 4.500000e+00
  %add447 = fadd nsz contract double %mul446, 3.000000e+00
  %C = fcmp uno double %mul441, %mul425
  %mul448 = fmul contract double %add447, 0.000000e+00
  %sub450 = fadd nsz contract double %mul448, 1.000000e+00
  %2 = fsub nsz contract double %sub450, %mul441
  store i1 %C, ptr @G.3, align 1
  store ptr %G4, ptr @G.5, align 8
  store i1 %C5, ptr %G, align 1
  %G7 = getelementptr double, ptr %dst, i128 %L
  store ptr %G7, ptr @G.6, align 8
  store double %B, ptr %G4, align 8
  %G1 = getelementptr ptr, ptr %dst, i1 %LGV
  store ptr %G1, ptr @G.5, align 8
  ret double %2
}

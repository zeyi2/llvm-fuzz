; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+d,+m,+zfa,+c -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 18446744073709551616
@G.1 = global i16 1
@G.2 = global i8 42
@G.3 = global i8 -128
@G.4 = global i1 false
@G.5 = global ptr poison

define double @fnmadd_non_trivial(ptr %p0, ptr %p1, ptr %dst, double %mul425) {
  %A7 = alloca i1, align 1
  store i1 poison, ptr %A7, align 1
  %A4 = alloca ptr, align 8
  %L1 = load i8, ptr %A4, align 1
  store ptr poison, ptr %A4, align 8
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load i8, ptr @G.2, align 1
  %G9 = getelementptr i8, ptr %dst, i8 %LGV1
  %B15 = srem i8 %L1, %LGV1
  %LGV = load i16, ptr @G.1, align 2
  store double f0x3FEE666666666666, ptr %dst, align 8
  %C5 = icmp sgt i8 %B15, %L1
  %mul413 = fmul double %mul425, -3.000000e+00
  store double %mul413, ptr %p0, align 8
  %G = getelementptr i128, ptr %p1, i128 -1
  %G7 = getelementptr <8 x i8>, ptr %A, i16 %LGV
  %L = load i8, ptr %G, align 1
  %G13 = getelementptr i1, ptr %dst, i32 42
  %B = fdiv double %mul413, %mul425
  store double %B, ptr %G, align 8
  %mul441 = fmul contract double %mul425, 0.000000e+00
  %add443 = fsub double 0.000000e+00, %mul425
  %mul446 = fmul contract double %add443, 4.500000e+00
  %add447 = fadd nsz contract double %mul446, 3.000000e+00
  %mul448 = fmul contract double %add447, 0.000000e+00
  %sub450 = fadd nsz contract double %mul448, 1.000000e+00
  %1 = fsub nsz contract double %sub450, %mul441
  store ptr %G13, ptr %G, align 8
  store i1 %C5, ptr %A, align 1
  %B2 = add i8 %L1, %L
  store ptr %G7, ptr %A4, align 8
  store ptr %G9, ptr %G7, align 8
  store i8 %B2, ptr @G.3, align 1
  %C = fcmp ule double %mul425, f0x7FEFFFFFFFFFFFFF
  %C14 = icmp sge i128 0, 42
  store i1 %C, ptr %A7, align 1
  %G10 = getelementptr ptr, ptr %dst, i1 %C5
  store i1 %C14, ptr @G.4, align 1
  store ptr %G10, ptr @G.5, align 8
  ret double %1
}

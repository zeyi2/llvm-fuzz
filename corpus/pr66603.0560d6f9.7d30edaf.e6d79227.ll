; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+v,+zbkb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global i1 true
@G.2 = global i1 false
@G.3 = global i1 false
@G.4 = global i1 false
@G.5 = global double 0.000000e+00

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %LGV12 = load double, ptr @G.5, align 8
  %A11 = alloca i1, align 1
  store i1 poison, ptr %A11, align 1
  %C13 = fcmp uno double %x, %LGV12
  %LGV8 = load i1, ptr @G.4, align 1
  %LGV7 = load i1, ptr @G.3, align 1
  %A6 = alloca i1, align 1
  store i1 poison, ptr %A6, align 1
  %C4 = fcmp true double %x, %x
  %A = alloca i1, align 1
  %L = load double, ptr %A, align 8
  store i1 poison, ptr %A, align 1
  %LGV = load double, ptr @G, align 8
  %as_i8 = fptosi double %x to i8
  %C5 = fcmp ule double %x, %L
  %C9 = icmp ult i1 %LGV7, %LGV8
  %C3 = fcmp ule double %x, %LGV
  %C2 = fcmp oge double %x, +qnan
  %frozen_i8 = freeze i8 %as_i8
  %ext = sext i8 %frozen_i8 to i32
  store i1 %C13, ptr @G.1, align 1
  store i1 %C9, ptr %A, align 1
  store i1 %C2, ptr @G.1, align 1
  store i1 %C3, ptr @G.1, align 1
  store i1 %C4, ptr @G.2, align 1
  store i1 %C5, ptr %A6, align 1
  %C10 = icmp uge i1 %LGV7, %C9
  store i1 %C10, ptr %A11, align 1
  ret i32 %ext
}

attributes #0 = { nounwind }

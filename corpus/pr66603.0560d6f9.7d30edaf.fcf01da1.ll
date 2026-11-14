; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+v -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global i1 true
@G.2 = global i1 false

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %C4 = fcmp true double %x, %x
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load double, ptr @G, align 8
  %C1 = fcmp oge double %LGV, %x
  %as_i8 = fptosi double %x to i8
  %C = fcmp ugt double %x, %LGV
  %C3 = fcmp ule double %x, %LGV
  %C5 = fcmp true double %x, 0.000000e+00
  %frozen_i8 = freeze i8 %as_i8
  %ext = sext i8 %frozen_i8 to i32
  store i1 %C, ptr @G.1, align 1
  store i1 %C1, ptr %A, align 1
  store i1 %C5, ptr @G.1, align 1
  store i1 %C3, ptr @G.1, align 1
  store i1 %C4, ptr @G.2, align 1
  ret i32 %ext
}

attributes #0 = { nounwind }

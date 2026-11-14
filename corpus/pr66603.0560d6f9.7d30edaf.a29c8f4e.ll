; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+v -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 4.940660e-324
@G.1 = global i1 true
@G.2 = global i1 false
@G.3 = global i16 42
@G.4 = global ptr poison
@G.5 = global i128 42
@G.6 = global i128 42
@G.7 = global i1 false

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %LGV7 = load i128, ptr @G.6, align 4
  %LGV2 = load i16, ptr @G.3, align 2
  %C4 = fcmp true double %x, %x
  %A = alloca i1, align 1
  %L = load i128, ptr %A, align 4
  %C12 = icmp sgt i128 -1, 1
  store i1 poison, ptr %A, align 1
  %G = getelementptr double, ptr %A, i16 %LGV2
  %L3 = load i128, ptr %G, align 4
  %LGV = load double, ptr @G, align 8
  %C1 = fcmp oge double %LGV, %x
  %as_i8 = fptosi double %x to i8
  %C = fcmp ugt double %x, %LGV
  %C8 = icmp slt i128 %L, %LGV7
  %B5 = add i1 %C1, %C1
  %C3 = fcmp ule double %x, %LGV
  %C2 = fcmp oge double %x, +qnan
  %frozen_i8 = freeze i8 %as_i8
  %B = xor i128 %L, %L3
  %ext = sext i8 %frozen_i8 to i32
  store i1 %C, ptr @G.1, align 1
  store i1 %C1, ptr %A, align 1
  store i1 %C2, ptr @G.1, align 1
  store i1 %C3, ptr @G.1, align 1
  store i1 %C4, ptr @G.2, align 1
  store ptr %G, ptr @G.4, align 8
  store i128 %B, ptr @G.5, align 4
  store i1 %B5, ptr @G.1, align 1
  store i1 %C8, ptr @G.7, align 1
  store i1 %C12, ptr @G.7, align 1
  ret i32 %ext
}

attributes #0 = { nounwind }

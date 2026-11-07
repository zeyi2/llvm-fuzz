; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d,+v -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -1
@G.1 = global i1 true
@G.2 = global double +qnan
@G.3 = global double f0x7FEFFFFFFFFFFFFF

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %as_i8 = fptosi double %x to i8
  %frozen_i8 = freeze i8 %as_i8
  %ext = sext i8 %frozen_i8 to i32
  %C1 = icmp ne i128 0, 42
  store i1 %C1, ptr @G.1, align 1
  %B = and i8 %as_i8, %frozen_i8
  %LGV = load double, ptr @G.2, align 8
  store i8 %B, ptr @G, align 1
  %C = fcmp uno double %x, %LGV
  %B2 = fadd double %x, %LGV
  store double %B2, ptr @G.3, align 8
  store i1 %C, ptr @G.1, align 1
  ret i32 %ext
}

attributes #0 = { nounwind }

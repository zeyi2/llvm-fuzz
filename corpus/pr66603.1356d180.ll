; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 16
@G.1 = global i1 true

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %LGV = load i8, ptr @G, align 1
  %as_i8 = fptosi double %x to i8
  %frozen_i8 = freeze i8 %as_i8
  %C = icmp sle i8 %as_i8, %LGV
  %ext = sext i8 %frozen_i8 to i32
  store i1 %C, ptr @G.1, align 1
  ret i32 %ext
}

attributes #0 = { nounwind }

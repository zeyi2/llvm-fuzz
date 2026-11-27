; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d,+zihintpause -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %as_i8 = fptosi double %x to i8
  %frozen_i8 = freeze i8 %as_i8
  %C1 = icmp slt i8 %frozen_i8, %as_i8
  %ext = sext i8 %frozen_i8 to i32
  store i1 %C1, ptr @G, align 1
  ret i32 %ext
}

attributes #0 = { nounwind }

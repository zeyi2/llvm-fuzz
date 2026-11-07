; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d,+zihintpause,+zve64d -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -1
@G.1 = global i8 42

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %LGV = load i8, ptr @G, align 1
  %C = fcmp uge double %x, f0x7FEFFFFFFFFFFFFF
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %as_i8 = fptosi double %x to i8
  %frozen_i8 = freeze i8 %as_i8
  %ext = sext i8 %frozen_i8 to i32
  store i8 %frozen_i8, ptr %A, align 1
  %B = and i8 %as_i8, %LGV
  store i8 %B, ptr @G.1, align 1
  store i1 %C, ptr %A, align 1
  ret i32 %ext
}

attributes #0 = { nounwind }

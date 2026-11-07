; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d,+v,+c -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -1
@G.1 = global i1 true
@G.2 = global i32 65536

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV = load i32, ptr @G.2, align 4
  %as_i8 = fptosi double %x to i8
  %frozen_i8 = freeze i8 %as_i8
  %ext = sext i8 %frozen_i8 to i32
  %B1 = or i32 2147483647, %LGV
  %B = and i8 %as_i8, %frozen_i8
  %C = icmp sgt i8 %B, %as_i8
  store i8 %B, ptr @G, align 1
  store i1 %C, ptr @G.1, align 1
  store i32 %B1, ptr %A, align 4
  ret i32 %ext
}

attributes #0 = { nounwind }

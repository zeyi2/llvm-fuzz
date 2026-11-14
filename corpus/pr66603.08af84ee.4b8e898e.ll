; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 170141183460469231731687303715884105727
@G.1 = global i128 170141183460469231731687303715884105727

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %LGV1 = load i128, ptr @G.1, align 4
  %LGV = load i128, ptr @G, align 4
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %G = getelementptr inbounds ptr, ptr %A, i1 true
  %as_i8 = fptosi double %x to i8
  %frozen_i8 = freeze i8 %as_i8
  %ext = sext i8 %frozen_i8 to i32
  %C2 = icmp sge i128 %LGV, %LGV1
  store i1 %C2, ptr %G, align 1
  ret i32 %ext
}

attributes #0 = { nounwind }

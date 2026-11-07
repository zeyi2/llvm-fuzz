; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d,+zihintpause,+zcb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 42
@G.1 = global double 4.940660e-324
@G.2 = global i1 true

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %B5 = sdiv i128 18446744073709551616, 0
  %LGV = load double, ptr @G.1, align 8
  %A2 = alloca i1, align 1
  store i1 poison, ptr %A2, align 1
  %A = alloca i128, align 8
  store i128 poison, ptr %A, align 4
  %as_i8 = fptosi double %x to i8
  %B = sdiv i128 -170141183460469231731687303715884105728, 0
  %frozen_i8 = freeze i8 %as_i8
  %ext = sext i8 %frozen_i8 to i32
  store i128 %B, ptr %A, align 4
  store i128 %B5, ptr @G, align 4
  %C3 = fcmp olt double %x, %LGV
  %C = fcmp false double %x, %x
  store i1 %C, ptr %A2, align 1
  store i1 %C3, ptr @G.2, align 1
  ret i32 %ext
}

attributes #0 = { nounwind }

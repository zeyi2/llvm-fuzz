; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d,+zcb -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double f0x7FEFFFFFFFFFFFFF
@G.1 = global i1 false

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %LGV = load double, ptr @G, align 8
  br label %BB

BB:                                               ; preds = %0
  %B = fadd double %x, %x
  %as_i8 = fptosi double %x to i8
  %frozen_i8 = freeze i8 %as_i8
  %ext = sext i8 %frozen_i8 to i32
  %C = fcmp oeq double %x, %LGV
  store i1 %C, ptr @G.1, align 1
  store double %B, ptr @G, align 8
  %C2 = icmp slt i1 %C, %C
  store i1 %C2, ptr @G.1, align 1
  ret i32 %ext
}

attributes #0 = { nounwind }

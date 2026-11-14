; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d,+zbb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %A1 = alloca i16, align 2
  store i16 256, ptr %A1, align 2
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %as_i8 = fptosi double %x to i8
  %frozen_i8 = freeze i8 %as_i8
  %L2 = load i16, ptr %A1, align 2
  switch i16 %L2, label %SW_D [
    i16 -25439, label %SW_C
    i16 -28834, label %SW_C3
  ]

BB:                                               ; preds = %SW_C3, %SW_C, %SW_D
  %ext = sext i8 %frozen_i8 to i32
  %C = fcmp ord double %x, 0.000000e+00
  store i1 %C, ptr %A, align 1
  ret i32 %ext

SW_D:                                             ; preds = %0
  %C4 = icmp ule i8 %as_i8, %as_i8
  store i1 %C4, ptr %A1, align 1
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  br label %BB
}

attributes #0 = { nounwind }

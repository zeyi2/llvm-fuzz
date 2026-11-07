; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d,+v -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -1
@G.1 = global i1 true
@G.2 = global i16 1

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %G = getelementptr ptr, ptr %A, i64 -9223372036854775808
  %LGV = load i16, ptr %G, align 2
  %as_i8 = fptosi double %x to i8
  %frozen_i8 = freeze i8 %as_i8
  %ext = sext i8 %frozen_i8 to i32
  switch i16 %LGV, label %SW_D [
    i16 9729, label %SW_C
    i16 16520, label %SW_C2
  ]

BB:                                               ; preds = %SW_C, %SW_D
  %B = and i8 %as_i8, %frozen_i8
  %C = icmp sgt i8 %B, %as_i8
  store i8 %B, ptr @G, align 1
  store i1 %C, ptr @G.1, align 1
  %B1 = xor i16 32767, %LGV
  store i16 %B1, ptr @G.2, align 2
  ret i32 %ext

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %SW_C

SW_C2:                                            ; preds = %0
  ret i32 %ext
}

attributes #0 = { nounwind }

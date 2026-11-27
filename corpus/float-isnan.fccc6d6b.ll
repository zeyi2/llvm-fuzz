; isel-diff-config: -mtriple=riscv32 -target-abi ilp32f -verify-machineinstrs -mattr=+f,+zve64d -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

; Function Attrs: nounwind
declare zeroext i1 @float_is_nan(float) #0

; Function Attrs: nounwind
define zeroext i1 @float_not_nan(float %a) #0 {
  %B = sub <8 x i8> zeroinitializer, splat (i8 -128)
  %A = alloca i1, align 1
  %L = load i1, ptr %A, align 1
  store i1 poison, ptr %A, align 1
  store <8 x i8> %B, ptr %A, align 8
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  %C = fcmp ole float %a, 4.200000e+01
  %1 = fcmp ord float %a, 0.000000e+00
  store i1 %C, ptr %A, align 1
  ret i1 %1

T:                                                ; preds = %0
  ret i1 true

F:                                                ; preds = %0
  br label %BB
}

attributes #0 = { nounwind }

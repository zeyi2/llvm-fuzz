; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zdinx,+m -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 0.000000e+00
@G.1 = global i1 true
@G.2 = global i1 false
@G.3 = global i32 1

; Function Attrs: nounwind
declare zeroext i8 @uint8_arg_to_uint8_ret(i8 zeroext) #0

declare void @receive_uint8(i8 zeroext)

; Function Attrs: nounwind
declare void @pass_uint8_as_uint8(i8 zeroext) #0

declare zeroext i8 @return_uint8()

; Function Attrs: nounwind
declare zeroext i8 @ret_callresult_uint8_as_uint8() #0

; Function Attrs: nounwind
declare signext i8 @uint8_arg_to_sint8_ret(i8 zeroext) #0

declare void @receive_sint8(i8 signext)

; Function Attrs: nounwind
declare void @pass_uint8_as_sint8(i8 zeroext) #0

; Function Attrs: nounwind
declare signext i8 @ret_callresult_uint8_as_sint8() #0

; Function Attrs: nounwind
declare signext i32 @uint8_arg_to_anyint32_ret(i8 zeroext) #0

declare void @receive_anyint32(i32 signext)

; Function Attrs: nounwind
declare void @pass_uint8_as_anyint32(i8 zeroext) #0

; Function Attrs: nounwind
declare signext i32 @ret_callresult_uint8_as_anyint32() #0

; Function Attrs: nounwind
declare zeroext i8 @sint8_arg_to_uint8_ret(i8 signext) #0

; Function Attrs: nounwind
declare void @pass_sint8_as_uint8(i8 signext) #0

declare signext i8 @return_sint8()

; Function Attrs: nounwind
define zeroext i8 @ret_callresult_sint8_as_uint8() #0 {
  %LGV = load i1, ptr @G.1, align 1
  %B = sdiv i1 %LGV, %LGV
  br i1 %B, label %T, label %F

BB:                                               ; preds = %F, %T
  %1 = call signext i8 @return_sint8()
  ret i8 %1

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  br i1 %LGV, label %BB, label %F
}

; Function Attrs: nounwind
define signext i8 @sint8_arg_to_sint8_ret(i8 signext %a) #0 {
  %LGV = load i1, ptr @G.2, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  ret i8 %a

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare void @pass_sint8_as_sint8(i8 signext) #0

; Function Attrs: nounwind
declare signext i8 @ret_callresult_sint8_as_sint8() #0

; Function Attrs: nounwind
declare signext i32 @sint8_arg_to_anyint32_ret(i8 signext) #0

; Function Attrs: nounwind
declare void @pass_sint8_as_anyint32(i8 signext) #0

; Function Attrs: nounwind
declare signext i32 @ret_callresult_sint8_as_anyint32() #0

; Function Attrs: nounwind
define zeroext i8 @anyint32_arg_to_uint8_ret(i32 signext %a) #0 {
  %LGV = load double, ptr @G, align 8
  %C = fcmp uno double %LGV, 4.940660e-324
  %1 = trunc i32 %a to i8
  store i1 %C, ptr poison, align 1
  ret i8 %1
}

; Function Attrs: nounwind
declare void @pass_anyint32_as_uint8(i32 signext) #0

declare signext i32 @return_anyint32()

; Function Attrs: nounwind
define zeroext i8 @ret_callresult_anyint32_as_uint8() #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i32, ptr @G.3, align 4
  %1 = call signext i32 @return_anyint32()
  %C = icmp uge i32 %1, %LGV
  %2 = trunc i32 %1 to i8
  store i1 %C, ptr %A, align 1
  ret i8 %2
}

; Function Attrs: nounwind
declare signext i8 @anyint32_arg_to_sint8_ret(i32 signext) #0

; Function Attrs: nounwind
declare void @pass_anyint32_as_sint8(i32 signext) #0

; Function Attrs: nounwind
declare signext i8 @ret_callresult_anyint32_as_sint8() #0

; Function Attrs: nounwind
declare signext i32 @anyint32_arg_to_anyint32_ret(i32 signext) #0

; Function Attrs: nounwind
declare void @pass_anyint32_as_anyint32(i32 signext) #0

; Function Attrs: nounwind
declare signext i32 @ret_callresult_anyint32_as_anyint32() #0

attributes #0 = { nounwind }

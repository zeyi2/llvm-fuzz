; isel-diff-config: -mtriple=riscv64-unknown-linux-gnu -mattr=+m -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global <4 x i32> zeroinitializer
@G.2 = global <4 x i32> splat (i32 -1)

; Function Attrs: nounwind
define i32 @udiv_by_7(i32 %x) #0 {
  %LGV = load <4 x i32>, ptr @G.1, align 16
  %B = sdiv i32 %x, %x
  %B1 = shl <4 x i32> %LGV, splat (i32 2147483647)
  store <4 x i32> %B1, ptr @G.2, align 16
  ret i32 %B
}

; Function Attrs: nounwind
declare i32 @udiv_by_19(i32) #0

; Function Attrs: nounwind
define i32 @udiv_by_21(i32 %x) #0 {
  %A = alloca i32, align 4
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  store i32 poison, ptr %A, align 4
  %div = udiv i32 %x, 21
  %B = lshr i32 %div, %x
  store i32 %B, ptr %A, align 4
  ret i32 %div

T:                                                ; preds = %0
  ret i32 %x

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
define i32 @udiv_by_3(i32 %x) #0 {
  %B = srem i32 %x, %x
  ret i32 %B
}

; Function Attrs: nounwind
define i32 @udiv_by_14(i32 %x) #0 {
  %div = udiv i32 %x, 14
  %C = icmp slt i32 %x, 65536
  store i1 %C, ptr @G, align 1
  ret i32 %div
}

attributes #0 = { nounwind }

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m,+zhinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <8 x i8> splat (i8 -128)
@G.1 = global i8 16

; Function Attrs: minsize nounwind
define i32 @testsize1(i32 %x) #0 {
entry:
  %LGV = load <8 x i8>, ptr @G, align 8
  %E = extractelement <8 x i8> %LGV, i32 %x
  %div = sdiv i32 %x, 32
  store i8 %E, ptr poison, align 1
  ret i32 %div
}

; Function Attrs: minsize nounwind
declare i32 @testsize2(i32) #0

; Function Attrs: minsize nounwind
define i32 @testsize3(i32 %x) #0 {
entry:
  %B = sub i16 42, 1
  %div = udiv i32 %x, 32
  store i16 %B, ptr poison, align 2
  ret i32 %div
}

; Function Attrs: minsize nounwind
define i32 @testsize4(i32 %x) #0 {
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %LGV = load i8, ptr @G.1, align 1
  %B = udiv i8 0, %LGV
  %div = udiv i32 %x, 33
  store i8 %B, ptr %A, align 1
  ret i32 %div
}

; Function Attrs: minsize nounwind
declare i128 @i128_sdiv(i128) #0

; Function Attrs: minsize nounwind
define i256 @i256_sdiv(i256 %arg0) #0 {
  %B = ashr i256 %arg0, 42
  ret i256 %B
}

attributes #0 = { minsize nounwind }

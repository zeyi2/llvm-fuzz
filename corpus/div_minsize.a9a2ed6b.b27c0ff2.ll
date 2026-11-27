; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 65536
@G.1 = global i128 -1
@G.2 = global i256 1
@G.3 = global i32 0
@G.4 = global i32 -1
@G.5 = global i256 0
@G.6 = global <8 x i8> splat (i8 127)

; Function Attrs: minsize nounwind
define i32 @testsize1(i32 %x) #0 {
entry:
  %A3 = alloca i32, align 4
  %L4 = load i8, ptr %A3, align 1
  %C = icmp ugt i8 42, %L4
  store i32 poison, ptr %A3, align 4
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV = load i32, ptr @G.3, align 4
  %B1 = sub i32 %x, %x
  %B2 = srem i32 %x, %B1
  %div = sdiv i32 %x, 32
  %B = or i32 %div, %LGV
  store i32 %B, ptr @G, align 4
  store i32 %B1, ptr @G.4, align 4
  %B3 = or i32 %x, 0
  store i32 %B3, ptr %A, align 4
  store i32 %B2, ptr %A3, align 4
  store i1 %C, ptr %A, align 1
  ret i32 %div
}

; Function Attrs: minsize nounwind
define i32 @testsize2(i32 %x) #0 {
entry:
  %A4 = alloca i1, align 1
  store i1 poison, ptr %A4, align 1
  %B3 = fmul bfloat 9.183550e-41, 3.389530e+38
  %A = alloca i32, align 4
  %C = icmp sle i32 %x, -1
  %L1 = load float, ptr %A, align 4
  store i32 poison, ptr %A, align 4
  %div = sdiv i32 %x, 33
  %B = shl i32 %div, %div
  %B2 = fmul float 1.000000e+00, %L1
  store i32 %B, ptr %A, align 4
  store float %B2, ptr poison, align 4
  store bfloat %B3, ptr %A, align 2
  store i1 %C, ptr %A4, align 1
  ret i32 %div
}

; Function Attrs: minsize nounwind
declare i32 @testsize3(i32) #0

; Function Attrs: minsize nounwind
declare i32 @testsize4(i32) #0

; Function Attrs: minsize nounwind
declare i128 @i128_sdiv(i128) #0

; Function Attrs: minsize nounwind
define i256 @i256_sdiv(i256 %arg0) #0 {
  %B1 = mul i256 %arg0, %arg0
  %B = srem i256 %arg0, 340282366920938463463374607431768211456
  %div = sdiv i256 %arg0, 4
  store i256 %B, ptr @G.2, align 4
  store i256 %B1, ptr @G.5, align 4
  %B2 = and <8 x i8> zeroinitializer, splat (i8 -1)
  store <8 x i8> %B2, ptr @G.6, align 8
  ret i256 %div
}

attributes #0 = { minsize nounwind }

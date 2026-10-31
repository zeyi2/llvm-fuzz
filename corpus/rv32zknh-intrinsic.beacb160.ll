; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zknh,+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i64 0
@G.2 = global i32 65536
@G.3 = global <4 x float> splat (float 1.000000e+00)
@G.4 = global <4 x i1> zeroinitializer
@G.5 = global i1 false

; Function Attrs: nounwind
define i32 @sha256sig0_i32(i32 %a) #0 {
  %val = call i32 @llvm.riscv.sha256sig0(i32 %a)
  %LGV = load <4 x float>, ptr @G.3, align 16
  %C1 = icmp ult i32 %a, %a
  store i1 %C1, ptr @G.5, align 1
  %C = fcmp ule <4 x float> splat (float 4.200000e+01), %LGV
  store <4 x i1> %C, ptr @G.4, align 1
  ret i32 %val
}

; Function Attrs: nounwind
declare i32 @sha256sig1_i32(i32) #0

; Function Attrs: nounwind
declare i32 @sha256sum0_i32(i32) #0

; Function Attrs: nounwind
declare i32 @sha256sum1_i32(i32) #0

; Function Attrs: nounwind
define i32 @sha512sig0l(i32 %a, i32 %b) #0 {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV = load i32, ptr @G.2, align 4
  %val = call i32 @llvm.riscv.sha512sig0l(i32 %a, i32 %b)
  %B = lshr i32 %val, %LGV
  store i32 %B, ptr %A, align 4
  ret i32 %val
}

; Function Attrs: nounwind
define i32 @sha512sig0h(i32 %a, i32 %b) #0 {
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %LGV = load i64, ptr @G.1, align 4
  %B = srem i64 -1, %LGV
  %val = call i32 @llvm.riscv.sha512sig0h(i32 %a, i32 %b)
  store i64 %B, ptr %A, align 4
  ret i32 %val
}

; Function Attrs: nounwind
define i32 @sha512sig1l(i32 %a, i32 %b) #0 {
  %C = icmp ult i32 %a, %a
  %val = call i32 @llvm.riscv.sha512sig1l(i32 %a, i32 %b)
  store i1 %C, ptr poison, align 1
  ret i32 %val
}

; Function Attrs: nounwind
define i32 @sha512sig1h(i32 %a, i32 %b) #0 {
  %LGV = load i1, ptr @G, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  %val = call i32 @llvm.riscv.sha512sig1h(i32 %a, i32 %b)
  ret i32 %val

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare i32 @sha512sum0r(i32, i32) #0

; Function Attrs: nounwind
declare i32 @sha512sum1r(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha256sig0(i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha256sig1(i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha256sum0(i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha256sum1(i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha512sig0h(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha512sig0l(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha512sig1h(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha512sig1l(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha512sum0r(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha512sum1r(i32, i32) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

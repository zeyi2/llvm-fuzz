; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zknh,+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 4294967296
@G.1 = global i1 true
@G.2 = global i32 -1
@G.3 = global i1 false

; Function Attrs: nounwind
declare i32 @sha256sig0_i32(i32) #0

; Function Attrs: nounwind
declare i32 @sha256sig1_i32(i32) #0

; Function Attrs: nounwind
define i32 @sha256sum0_i32(i32 %a) #0 {
  %A1 = alloca i1, align 1
  store i1 false, ptr %A1, align 1
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %val = call i32 @llvm.riscv.sha256sum0(i32 %a)
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  ret i32 %val

T:                                                ; preds = %T, %0
  %LGV = load i1, ptr @G.1, align 1
  %L2 = load i1, ptr %A1, align 1
  br i1 %L2, label %BB, label %T

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
define i32 @sha256sum1_i32(i32 %a) #0 {
  %LGV = load i64, ptr @G, align 4
  %C = icmp eq i64 -1, %LGV
  %val = call i32 @llvm.riscv.sha256sum1(i32 %a)
  store i1 %C, ptr poison, align 1
  ret i32 %val
}

; Function Attrs: nounwind
define i32 @sha512sig0l(i32 %a, i32 %b) #0 {
  %LGV1 = load i32, ptr @G.2, align 4
  %C = icmp uge i32 %a, %LGV1
  %val = call i32 @llvm.riscv.sha512sig0l(i32 %a, i32 %b)
  store i1 %C, ptr @G.3, align 1
  ret i32 %val
}

; Function Attrs: nounwind
declare i32 @sha512sig0h(i32, i32) #0

; Function Attrs: nounwind
declare i32 @sha512sig1l(i32, i32) #0

; Function Attrs: nounwind
declare i32 @sha512sig1h(i32, i32) #0

; Function Attrs: nounwind
define i32 @sha512sum0r(i32 %a, i32 %b) #0 {
  %val = call i32 @llvm.riscv.sha512sum0r(i32 %a, i32 %b)
  %C = icmp sgt i32 %val, 65536
  store i1 %C, ptr @G.1, align 1
  %B = add i32 %a, %val
  ret i32 %B
}

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

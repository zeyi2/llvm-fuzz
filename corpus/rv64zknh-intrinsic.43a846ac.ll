; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zknh,+zfinx,+zicsr -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i64 9223372036854775807
@G.2 = global i1 false

; Function Attrs: nounwind
declare signext i32 @sha256sig0_i32(i32 signext) #0

; Function Attrs: nounwind
declare signext i32 @sha256sig1_i32(i32 signext) #0

; Function Attrs: nounwind
define signext i32 @sha256sum0_i32(i32 signext %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i64, ptr @G.1, align 4
  %val = call i32 @llvm.riscv.sha256sum0(i32 signext %a)
  %C = icmp eq i64 -9223372036854775808, %LGV
  store i1 %C, ptr @G.2, align 1
  store i1 %C, ptr %A, align 1
  ret i32 %val
}

; Function Attrs: nounwind
define signext i32 @sha256sum1_i32(i32 signext %a) #0 {
  %val = call i32 @llvm.riscv.sha256sum1(i32 signext %a)
  %C = icmp ult i32 %a, %val
  store i1 %C, ptr @G, align 1
  ret i32 %val
}

; Function Attrs: nounwind
define i64 @sha512sig0(i64 %a) #0 {
  %val = call i64 @llvm.riscv.sha512sig0(i64 %a)
  %C = icmp slt i8 -1, 1
  store i1 %C, ptr @G, align 1
  ret i64 %val
}

; Function Attrs: nounwind
define i64 @sha512sig1(i64 %a) #0 {
  %C = fcmp ult half 5.960460e-08, +qnan
  %val = call i64 @llvm.riscv.sha512sig1(i64 %a)
  store i1 %C, ptr @G, align 1
  ret i64 %val
}

; Function Attrs: nounwind
declare i64 @sha512sum0(i64) #0

; Function Attrs: nounwind
declare i64 @sha512sum1(i64) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha256sig0(i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha256sig1(i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha256sum0(i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sha256sum1(i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.sha512sig0(i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.sha512sig1(i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.sha512sum0(i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.sha512sum1(i64) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

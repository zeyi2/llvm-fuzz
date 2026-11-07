; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zkne,+zba,+zhinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 42

; Function Attrs: nounwind
declare i64 @aes64es(i64, i64) #0

; Function Attrs: nounwind
define i64 @aes64esm(i64 %a, i64 %b) #0 {
  %val = call i64 @llvm.riscv.aes64esm(i64 %a, i64 %b)
  store i64 %val, ptr @G, align 4
  ret i64 %val
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.aes64es(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.aes64esm(i64, i64) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

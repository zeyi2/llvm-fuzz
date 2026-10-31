; isel-diff-config: -mtriple=riscv64 -mattr=+zhinx -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i15 42

; Function Attrs: nounwind
define i15 @foo(i15 %x) #0 {
  %B = ashr i15 %x, %x
  %a = call i15 @llvm.ctlz.i15(i15 %x, i1 false)
  store i15 %B, ptr @G, align 2
  ret i15 %a
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i15 @llvm.ctlz.i15(i15, i1 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

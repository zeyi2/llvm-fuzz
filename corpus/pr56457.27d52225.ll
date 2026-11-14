; isel-diff-config: -mtriple=riscv64 -mattr=+m,+zhinx -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false

; Function Attrs: nounwind
define i15 @foo(i15 %x) #0 {
  %B1 = lshr i15 %x, %x
  %B = or i15 %x, 1
  %a = call i15 @llvm.ctlz.i15(i15 %B, i1 false)
  %C = icmp ugt i32 1, 65536
  store i1 %C, ptr @G, align 1
  store i15 %B1, ptr poison, align 2
  ret i15 %a
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i15 @llvm.ctlz.i15(i15, i1 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

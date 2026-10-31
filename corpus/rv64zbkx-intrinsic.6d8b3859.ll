; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zbkx,+zdinx,+xtheadba -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i1 false
@G.2 = global i64 -9223372036854775808

; Function Attrs: nounwind
define i64 @xperm8(i64 %a, i64 %b) #0 {
  %tmp = call i64 @llvm.riscv.xperm8.i64(i64 %a, i64 %b)
  %C = fcmp ugt float f0x7F7FFFFF, 0.000000e+00
  %C1 = icmp slt i64 %b, %b
  store i1 %C, ptr @G, align 1
  %B = sdiv i1 true, %C
  store i1 %B, ptr @G.1, align 1
  store i1 %C1, ptr poison, align 1
  ret i64 %tmp
}

; Function Attrs: nounwind
define i64 @xperm4(i64 %a, i64 %b) #0 {
  %tmp = call i64 @llvm.riscv.xperm4.i64(i64 %a, i64 %b)
  %B = or i64 %a, -9223372036854775808
  %B1 = ashr i64 %B, %b
  store i64 %B, ptr poison, align 4
  store i64 %B1, ptr @G.2, align 4
  ret i64 %tmp
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.xperm4.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.xperm8.i64(i64, i64) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

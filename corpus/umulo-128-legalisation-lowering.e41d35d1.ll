; isel-diff-config: -mtriple=riscv32 -mattr=+m,+zfinx -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

; Function Attrs: nounwind memory(none)
define { i128, i8 } @muloti_test(i128 %l, i128 %r) #0 {
start:
  %0 = tail call { i128, i1 } @llvm.umul.with.overflow.i128(i128 %l, i128 %r) #2
  %1 = extractvalue { i128, i1 } %0, 0
  %2 = extractvalue { i128, i1 } %0, 1
  %3 = zext i1 %2 to i8
  %4 = insertvalue { i128, i8 } poison, i128 %1, 0
  %C = fcmp oeq double 4.940660e-324, 0.000000e+00
  %5 = insertvalue { i128, i8 } %4, i8 %3, 1
  store i1 %C, ptr poison, align 1
  ret { i128, i8 } %5
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare { i128, i1 } @llvm.umul.with.overflow.i128(i128, i128) #1

attributes #0 = { nounwind memory(none) }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind }

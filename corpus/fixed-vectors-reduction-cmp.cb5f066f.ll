; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m,+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

declare i1 @test1(<4 x i16>)

define i1 @test2(<4 x i16> %v) {
  %red = call i16 @llvm.vector.reduce.or.v4i16(<4 x i16> %v)
  %C = icmp ne i8 0, 42
  %cmp = icmp ne i16 %red, 0
  store i1 %C, ptr poison, align 1
  ret i1 %cmp
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.and.v4i16(<4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.or.v4i16(<4 x i16>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

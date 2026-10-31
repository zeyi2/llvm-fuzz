; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zhinx -O1 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false

; Function Attrs: nounwind
define void @test_trap() #0 {
  tail call void @llvm.trap()
  %C = icmp ule i16 256, 0
  store i1 %C, ptr @G, align 1
  ret void
}

; Function Attrs: nounwind
define void @test_debugtrap() #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp oge half +inf, 6.550400e+04
  tail call void @llvm.debugtrap()
  store i1 %C, ptr %A, align 1
  ret void
}

; Function Attrs: nounwind
declare void @llvm.debugtrap() #0

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #1

attributes #0 = { nounwind }
attributes #1 = { cold noreturn nounwind memory(inaccessiblemem: write) }

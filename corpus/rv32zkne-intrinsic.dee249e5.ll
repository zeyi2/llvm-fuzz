; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zkne,+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.000000e+00
@G.1 = global i1 false

; Function Attrs: nounwind
define i32 @aes32esi(i32 %a, i32 %b) #0 {
  %val = call i32 @llvm.riscv.aes32esi(i32 %a, i32 %b, i32 2)
  %C = icmp ult i32 %b, 0
  store i1 %C, ptr @G.1, align 1
  ret i32 %val
}

; Function Attrs: nounwind
define i32 @aes32esmi(i32 %a, i32 %b) #0 {
  %LGV = load float, ptr @G, align 4
  %val = call i32 @llvm.riscv.aes32esmi(i32 %a, i32 %b, i32 3)
  %C = fcmp oeq float +qnan, %LGV
  store i1 %C, ptr poison, align 1
  ret i32 %val
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.aes32esi(i32, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.aes32esmi(i32, i32, i32 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

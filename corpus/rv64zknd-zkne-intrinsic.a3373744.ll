; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zkne,+zfinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half +qnan
@G.1 = global i1 true
@G.2 = global i1 false
@G.3 = global i64 42

; Function Attrs: nounwind
define i64 @aes64ks2(i64 %a, i64 %b) #0 {
  %LGV = load half, ptr @G, align 2
  %val = call i64 @llvm.riscv.aes64ks2(i64 %a, i64 %b)
  %C = fcmp oeq half %LGV, 1.000000e+00
  %B = sub i64 %a, %b
  store i1 %C, ptr @G.1, align 1
  store i64 %B, ptr @G.3, align 4
  ret i64 %val
}

; Function Attrs: nounwind
define i64 @aes64ks1i(i64 %a) #0 {
  %val = call i64 @llvm.riscv.aes64ks1i(i64 %a, i32 10)
  %C = icmp ne i64 %a, %a
  store i1 %C, ptr @G.2, align 1
  ret i64 %val
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.aes64ks1i(i64, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.aes64ks2(i64, i64) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

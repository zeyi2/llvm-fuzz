; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zknd,+xtheadba,+zhinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 -1)
@G.1 = global <2 x i1> splat (i1 true)
@G.2 = global i1 false

; Function Attrs: nounwind
define i64 @aes64ds(i64 %a, i64 %b) #0 {
  %LGV = load <2 x i64>, ptr @G, align 16
  %B = sdiv <2 x i64> %LGV, zeroinitializer
  %C = icmp sgt <2 x i64> %B, %LGV
  %val = call i64 @llvm.riscv.aes64ds(i64 %a, i64 %b)
  store <2 x i64> %B, ptr poison, align 16
  store <2 x i1> %C, ptr @G.1, align 1
  ret i64 %val
}

; Function Attrs: nounwind
define i64 @aes64dsm(i64 %a, i64 %b) #0 {
  %val = call i64 @llvm.riscv.aes64dsm(i64 %a, i64 %b)
  %C = fcmp ueq float 4.200000e+01, 0.000000e+00
  store i1 %C, ptr @G.2, align 1
  ret i64 %val
}

; Function Attrs: nounwind
declare i64 @aes64im(i64) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.aes64ds(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.aes64dsm(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.aes64im(i64) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

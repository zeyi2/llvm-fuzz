; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zbc,+c,+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -1
@G.1 = global i1 false
@G.2 = global i1 true

; Function Attrs: nounwind
define i64 @clmul64r(i64 %a, i64 %b) #0 {
  %tmp = call i64 @llvm.riscv.clmulr.i64(i64 %a, i64 %b)
  %C = icmp ule i64 %tmp, %b
  store i1 %C, ptr @G.2, align 1
  ret i64 %tmp
}

; Function Attrs: nounwind
declare signext i32 @clmul32r(i32 signext, i32 signext) #0

; Function Attrs: nounwind
define signext i32 @clmul32r_zext(i32 zeroext %a, i32 zeroext %b) #0 {
  %LGV = load i32, ptr @G, align 4
  %B1 = sub i32 %b, %LGV
  ret i32 %B1
}

; Function Attrs: nounwind
define i64 @llvm_clmulr_i64(i64 %a, i64 %b) #0 {
  %tmp1 = zext i64 %a to i128
  %tmp2 = zext i64 %b to i128
  %tmp3 = call i128 @llvm.clmul.i128(i128 %tmp1, i128 %tmp2)
  %tmp4 = lshr i128 %tmp3, 63
  %C = icmp eq i64 -9223372036854775808, %b
  %tmp5 = trunc i128 %tmp4 to i64
  store i1 %C, ptr @G.1, align 1
  ret i64 %tmp5
}

; Function Attrs: nounwind
declare signext i32 @llvm_clmulr_i32(i32 signext, i32 signext) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.clmul.i128(i128, i128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.clmul.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.clmulr.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.clmulr.i64(i64, i64) #2

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

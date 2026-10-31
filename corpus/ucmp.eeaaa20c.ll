; isel-diff-config: -mtriple=riscv32 -mattr=+zba,+zhinx -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 1.000000e+00
@G.1 = global i1 false

; Function Attrs: nounwind
declare i8 @ucmp.8.8(i8 zeroext, i8 zeroext) #0

; Function Attrs: nounwind
declare i8 @ucmp.8.16(i16 zeroext, i16 zeroext) #0

; Function Attrs: nounwind
declare i8 @ucmp.8.32(i32, i32) #0

; Function Attrs: nounwind
declare i8 @ucmp.8.64(i64, i64) #0

; Function Attrs: nounwind
declare i8 @ucmp.8.128(i128, i128) #0

; Function Attrs: nounwind
declare i32 @ucmp.32.32(i32, i32) #0

; Function Attrs: nounwind
declare i32 @ucmp.32.32_sext(i32 signext, i32 signext) #0

; Function Attrs: nounwind
define i32 @ucmp.32.32_zext(i32 zeroext %x, i32 zeroext %y) #0 {
  %LGV = load double, ptr @G, align 8
  %C = fcmp ueq double %LGV, +qnan
  %1 = call i32 @llvm.ucmp.i32.i32(i32 %x, i32 %y)
  store i1 %C, ptr @G.1, align 1
  ret i32 %1
}

; Function Attrs: nounwind
define i32 @ucmp.32.64(i64 %x, i64 %y) #0 {
  %1 = call i32 @llvm.ucmp.i32.i64(i64 %x, i64 %y)
  %C = icmp ule i32 %1, -1
  store i1 %C, ptr @G.1, align 1
  ret i32 %1
}

; Function Attrs: nounwind
declare i64 @ucmp.64.64(i64, i64) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i64 -1, 2) i64 @llvm.ucmp.i64.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i32 -1, 2) i32 @llvm.ucmp.i32.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i32 -1, 2) i32 @llvm.ucmp.i32.i32(i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i8 -1, 2) i8 @llvm.ucmp.i8.i128(i128, i128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i8 -1, 2) i8 @llvm.ucmp.i8.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i8 -1, 2) i8 @llvm.ucmp.i8.i32(i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i8 -1, 2) i8 @llvm.ucmp.i8.i16(i16, i16) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i8 -1, 2) i8 @llvm.ucmp.i8.i8(i8, i8) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

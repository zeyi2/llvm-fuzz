; isel-diff-config: -mtriple=riscv64 -mattr=+zdinx -O0 -code-model=medium -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 127
@G.1 = global float 1.401300e-45
@G.2 = global float 0.000000e+00
@G.3 = global i1 false
@G.4 = global i1 false

; Function Attrs: nounwind
define i8 @scmp.8.8(i8 signext %x, i8 signext %y) #0 {
  %B = sdiv i8 %x, 0
  %1 = call i8 @llvm.scmp.i8.i8(i8 %x, i8 %y)
  store i8 %B, ptr @G, align 1
  %C = icmp slt i8 %x, %1
  store i1 %C, ptr @G.4, align 1
  ret i8 %1
}

; Function Attrs: nounwind
declare i8 @scmp.8.16(i16 signext, i16 signext) #0

; Function Attrs: nounwind
declare i8 @scmp.8.32(i32, i32) #0

; Function Attrs: nounwind
define i8 @scmp.8.64(i64 %x, i64 %y) #0 {
  %1 = call i8 @llvm.scmp.i8.i64(i64 %x, i64 %y)
  %B = sdiv i8 %1, %1
  store i8 %B, ptr @G, align 1
  ret i8 %1
}

; Function Attrs: nounwind
define i8 @scmp.8.128(i128 %x, i128 %y) #0 {
  %C = icmp uge i128 %x, 0
  %1 = call i8 @llvm.scmp.i8.i128(i128 %x, i128 %y)
  store i1 %C, ptr @G.4, align 1
  ret i8 %1
}

; Function Attrs: nounwind
declare i32 @scmp.32.32(i32, i32) #0

; Function Attrs: nounwind
declare i32 @scmp.32.64(i64, i64) #0

; Function Attrs: nounwind
define i64 @scmp.64.64(i64 %x, i64 %y) #0 {
  %LGV1 = load float, ptr @G.2, align 4
  %LGV = load float, ptr @G.1, align 4
  %B = srem i64 %y, 1
  %1 = call i64 @llvm.scmp.i64.i64(i64 %x, i64 %B)
  %C = fcmp ogt float %LGV, %LGV1
  store i1 %C, ptr @G.3, align 1
  ret i64 %1
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i64 -1, 2) i64 @llvm.scmp.i64.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i32 -1, 2) i32 @llvm.scmp.i32.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i32 -1, 2) i32 @llvm.scmp.i32.i32(i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i8 -1, 2) i8 @llvm.scmp.i8.i128(i128, i128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i8 -1, 2) i8 @llvm.scmp.i8.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i8 -1, 2) i8 @llvm.scmp.i8.i32(i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i8 -1, 2) i8 @llvm.scmp.i8.i16(i16, i16) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i8 -1, 2) i8 @llvm.scmp.i8.i8(i8, i8) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

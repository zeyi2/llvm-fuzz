; isel-diff-config: -mtriple=riscv32 -mattr=+zfinx -O3 -code-model=medium -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i32 65536
@G.2 = global i64 0
@G.3 = global bfloat 0.000000e+00

; Function Attrs: nounwind
define i8 @scmp.8.8(i8 signext %x, i8 signext %y) #0 {
  %1 = call i8 @llvm.scmp.i8.i8(i8 %x, i8 %y)
  %C = icmp sge i8 %1, %1
  store i1 %C, ptr poison, align 1
  ret i8 %1
}

; Function Attrs: nounwind
define i8 @scmp.8.16(i16 signext %x, i16 signext %y) #0 {
  %1 = call i8 @llvm.scmp.i8.i16(i16 %x, i16 %y)
  %C = icmp ule i8 %1, %1
  store i1 %C, ptr @G, align 1
  ret i8 %1
}

; Function Attrs: nounwind
declare i8 @scmp.8.32(i32, i32) #0

; Function Attrs: nounwind
define i8 @scmp.8.64(i64 %x, i64 %y) #0 {
  %LGV1 = load i64, ptr @G.2, align 4
  %B = xor i64 %x, %LGV1
  %1 = call i8 @llvm.scmp.i8.i64(i64 %x, i64 %B)
  ret i8 %1
}

; Function Attrs: nounwind
declare i8 @scmp.8.128(i128, i128) #0

; Function Attrs: nounwind
define i32 @scmp.32.32(i32 %x, i32 %y) #0 {
  %B1 = fadd bfloat 3.389530e+38, 4.200000e+01
  %1 = call i32 @llvm.scmp.i32.i32(i32 %x, i32 %y)
  %B = urem i32 %y, %x
  store i32 %B, ptr @G.1, align 4
  store bfloat %B1, ptr @G.3, align 2
  ret i32 %1
}

; Function Attrs: nounwind
define i32 @scmp.32.64(i64 %x, i64 %y) #0 {
  %1 = call i32 @llvm.scmp.i32.i64(i64 %x, i64 %y)
  %C = icmp sle i64 %x, 42
  store i1 %C, ptr @G, align 1
  ret i32 %1
}

; Function Attrs: nounwind
declare i64 @scmp.64.64(i64, i64) #0

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

; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zbb,+zhinx -O2 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 16
@G.1 = global i8 1
@G.2 = global <2 x i64> splat (i64 42)
@G.3 = global <2 x i1> splat (i1 true)
@G.4 = global i1 false
@G.5 = global i16 32767

; Function Attrs: nounwind
declare signext i32 @func(i32 signext, i32 signext) #0

; Function Attrs: nounwind
declare i64 @func2(i64, i64) #0

; Function Attrs: nounwind
define signext i16 @func16(i16 signext %x, i16 signext %y) #0 {
  %tmp = call i16 @llvm.sadd.sat.i16(i16 %x, i16 %y)
  %B = udiv i16 %tmp, %x
  %B1 = or i16 %B, %x
  store i16 %B1, ptr @G.5, align 2
  ret i16 %B1
}

; Function Attrs: nounwind
declare signext i8 @func8(i8 signext, i8 signext) #0

; Function Attrs: nounwind
define signext i4 @func3(i4 signext %x, i4 signext %y) #0 {
  %B = sdiv i4 %y, -6
  %LGV = load <2 x i64>, ptr @G.2, align 16
  %tmp = call i4 @llvm.sadd.sat.i4(i4 %x, i4 %y)
  %C = icmp sge <2 x i64> %LGV, zeroinitializer
  store <2 x i1> %C, ptr @G.3, align 1
  store i4 %B, ptr poison, align 1
  ret i4 %tmp
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.sadd.sat.i16(i16, i16) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.sadd.sat.i32(i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i4 @llvm.sadd.sat.i4(i4, i4) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.sadd.sat.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.sadd.sat.i8(i8, i8) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

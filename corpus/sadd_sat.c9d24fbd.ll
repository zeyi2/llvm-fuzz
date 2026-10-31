; isel-diff-config: -mtriple=riscv64 -mattr=+m,+zbb,+zdinx -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 1.401300e-45
@G.1 = global <4 x float> splat (float +inf)
@G.2 = global i4 1
@G.3 = global i16 32767
@G.4 = global <2 x i1> zeroinitializer

; Function Attrs: nounwind
define signext i32 @func(i32 signext %x, i32 signext %y) #0 {
  %LGV = load float, ptr @G, align 4
  %C = fcmp true float %LGV, f0x7F7FFFFF
  %tmp = call i32 @llvm.sadd.sat.i32(i32 %x, i32 %y)
  store i1 %C, ptr poison, align 1
  ret i32 %tmp
}

; Function Attrs: nounwind
declare i64 @func2(i64, i64) #0

; Function Attrs: nounwind
define signext i16 @func16(i16 signext %x, i16 signext %y) #0 {
  %A = alloca i16, align 2
  store i16 poison, ptr %A, align 2
  %LGV = load i16, ptr @G.3, align 2
  %tmp = call i16 @llvm.sadd.sat.i16(i16 %x, i16 %y)
  %B = udiv i16 %x, %LGV
  store i16 %B, ptr %A, align 2
  ret i16 %tmp
}

; Function Attrs: nounwind
define signext i8 @func8(i8 signext %x, i8 signext %y) #0 {
  %tmp = call i8 @llvm.sadd.sat.i8(i8 %x, i8 %y)
  %C = icmp sgt <2 x i64> splat (i64 -1), zeroinitializer
  store <2 x i1> %C, ptr @G.4, align 1
  ret i8 %tmp
}

; Function Attrs: nounwind
define signext i4 @func3(i4 signext %x, i4 signext %y) #0 {
  %tmp = call i4 @llvm.sadd.sat.i4(i4 %x, i4 %y)
  %B1 = ashr i4 %y, %tmp
  %B = fadd <4 x float> zeroinitializer, splat (float 4.200000e+01)
  store <4 x float> %B, ptr @G.1, align 16
  store i4 %B1, ptr @G.2, align 1
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

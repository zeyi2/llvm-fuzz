; isel-diff-config: -mtriple=riscv64 -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 9223372036854775807
@G.1 = global i16 32767
@G.2 = global <8 x i8> splat (i8 42)

; Function Attrs: nounwind
define i8 @scmp.8.8(i8 signext %x, i8 signext %y) #0 {
  %LGV = load <8 x i8>, ptr @G.2, align 8
  %E = extractelement <8 x i8> %LGV, i32 65536
  %1 = call i8 @llvm.scmp.i8.i8(i8 %E, i8 %y)
  ret i8 %1
}

; Function Attrs: nounwind
define i8 @scmp.8.16(i16 signext %x, i16 signext %y) #0 {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %1 = call i8 @llvm.scmp.i8.i16(i16 %x, i16 %y)
  %B = and i64 -1, 9223372036854775807
  store i64 %B, ptr @G, align 4
  %C = fcmp uno <4 x float> zeroinitializer, splat (float +inf)
  store <4 x i1> %C, ptr %A, align 1
  ret i8 %1
}

; Function Attrs: nounwind
declare i8 @scmp.8.32(i32, i32) #0

; Function Attrs: nounwind
define i8 @scmp.8.64(i64 %x, i64 %y) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i16, ptr @G.1, align 2
  %C = icmp ule i16 %LGV, 32767
  %1 = call i8 @llvm.scmp.i8.i64(i64 %x, i64 %y)
  store i1 %C, ptr %A, align 1
  ret i8 %1
}

; Function Attrs: nounwind
declare i32 @scmp.32.32(i32, i32) #0

; Function Attrs: nounwind
declare i32 @scmp.32.64(i64, i64) #0

; Function Attrs: nounwind
declare i64 @scmp.64.64(i64, i64) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i64 -1, 2) i64 @llvm.scmp.i64.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i32 -1, 2) i32 @llvm.scmp.i32.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare range(i32 -1, 2) i32 @llvm.scmp.i32.i32(i32, i32) #1

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

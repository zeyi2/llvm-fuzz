; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zimop,+zhinx,+zihintpause -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global bfloat 9.183550e-41
@G.1 = global i1 false
@G.2 = global i1 false
@G.3 = global i8 -1

; Function Attrs: nounwind
declare i64 @mopr0_64(i64) #0

; Function Attrs: nounwind
define i64 @mopr31_64(i64 %a) #0 {
  %LGV = load i8, ptr @G.3, align 1
  %A = alloca i1, align 1
  %B = mul i8 -1, %LGV
  store i1 poison, ptr %A, align 1
  %C = icmp ugt i64 %a, 42
  %tmp = call i64 @llvm.riscv.mopr.i64(i64 %a, i64 31)
  store i1 %C, ptr %A, align 1
  store i8 %B, ptr poison, align 1
  ret i64 %tmp
}

; Function Attrs: nounwind
declare i64 @moprr0_64(i64, i64) #0

; Function Attrs: nounwind
define i64 @moprr7_64(i64 %a, i64 %b) #0 {
  %tmp = call i64 @llvm.riscv.moprr.i64(i64 %a, i64 %b, i64 7)
  %C1 = icmp eq i64 %tmp, %b
  store i1 %C1, ptr @G.1, align 1
  ret i64 %tmp
}

; Function Attrs: nounwind
declare signext i32 @mopr0_32(i32 signext) #0

; Function Attrs: nounwind
define signext i32 @mopr31_32(i32 signext %a) #0 {
  %A1 = alloca i1, align 1
  store i1 true, ptr %A1, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %tmp = call i32 @llvm.riscv.mopr.i32(i32 %a, i32 31)
  ret i32 %tmp

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %C = fcmp uno half +qnan, 5.960460e-08
  %L2 = load i1, ptr %A1, align 1
  store i1 %C, ptr %A1, align 1
  br i1 %L2, label %BB, label %F
}

; Function Attrs: nounwind
declare signext i32 @moprr0_32(i32 signext, i32 signext) #0

; Function Attrs: nounwind
define signext i32 @moprr7_32(i32 signext %a, i32 signext %b) #0 {
  %LGV = load i1, ptr @G.2, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %tmp = call i32 @llvm.riscv.moprr.i32(i32 %a, i32 %b, i32 7)
  %C = icmp sle i32 %a, 1
  store i1 %C, ptr poison, align 1
  %C1 = icmp ule i1 %C, %C
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  store i1 %C1, ptr %A, align 1
  ret i32 %tmp

T:                                                ; preds = %T, %0
  br i1 %C1, label %BB, label %T

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mopr.i32(i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mopr.i64(i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.moprr.i32(i32, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.moprr.i64(i64, i64, i64 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

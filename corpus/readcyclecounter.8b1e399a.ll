; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 0

; Function Attrs: nounwind
define i64 @test_builtin_readcyclecounter() #0 {
  %LGV = load i64, ptr @G, align 4
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %1 = tail call i64 @llvm.readcyclecounter()
  %C = icmp sge i64 %LGV, 4294967296
  br i1 %C, label %T, label %F

BB:                                               ; preds = %F, %T
  %B = ashr i64 %1, %1
  ret i64 %B

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare i64 @llvm.readcyclecounter() #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn }

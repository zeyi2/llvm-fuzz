; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 0
@G.1 = global i16 0

; Function Attrs: nounwind
define i64 @test_builtin_readcyclecounter() #0 {
  %LGV1 = load i16, ptr @G.1, align 2
  %LGV = load i64, ptr @G, align 4
  %A = alloca i1, align 1
  %L = load i16, ptr %A, align 2
  %B2 = sub i16 %LGV1, %L
  store i1 true, ptr %A, align 1
  %1 = tail call i64 @llvm.readcyclecounter()
  %C = icmp sge i64 %LGV, 4294967296
  store i16 %B2, ptr @G.1, align 2
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

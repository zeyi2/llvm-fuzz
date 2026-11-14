; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 0
@G.1 = global i32 -2147483648

; Function Attrs: nounwind
define i64 @test_builtin_readcyclecounter() #0 {
  %LGV = load i64, ptr @G, align 4
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %B2 = sub i64 %LGV, %LGV
  %1 = tail call i64 @llvm.readcyclecounter()
  %C = icmp sge i64 %LGV, 4294967296
  store i64 %B2, ptr @G, align 4
  br i1 %C, label %T, label %F

BB:                                               ; preds = %F, %T
  %B = ashr i64 %1, %1
  ret i64 %B

T:                                                ; preds = %0
  %C1 = icmp slt i16 1, -32768
  store i1 %C1, ptr %A, align 1
  %B3 = sub i32 0, 0
  store i32 %B3, ptr @G.1, align 4
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare i64 @llvm.readcyclecounter() #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn }

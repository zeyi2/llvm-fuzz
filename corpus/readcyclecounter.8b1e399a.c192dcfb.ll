; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 0
@G.1 = global i16 0
@G.2 = global i16 1
@G.3 = global i1 true
@G.4 = global i32 0
@G.5 = global i1 false

; Function Attrs: nounwind
define i64 @test_builtin_readcyclecounter() #0 {
  %LGV15 = load i1, ptr @G.5, align 1
  %LGV1 = load i16, ptr @G.1, align 2
  %LGV = load i64, ptr @G, align 4
  %B3 = urem i16 %LGV1, 1
  %A = alloca i1, align 1
  %L = load i1, ptr %A, align 1
  store i1 true, ptr %A, align 1
  %1 = tail call i64 @llvm.readcyclecounter()
  %C16 = icmp ne i1 %L, %LGV15
  %C = icmp sge i64 %LGV, 4294967296
  store i16 %B3, ptr @G.2, align 2
  br i1 %C16, label %T, label %F

BB:                                               ; preds = %F, %BB4
  %B = ashr i64 %1, %1
  ret i64 %B

T:                                                ; preds = %0
  switch i16 %LGV1, label %SW_D [
    i16 22419, label %SW_C
    i16 -17590, label %SW_C6
    i16 28315, label %SW_C7
    i16 5046, label %SW_C8
  ]

BB4:                                              ; preds = %SW_C8, %SW_C7, %SW_C6, %SW_D
  %B14 = xor i16 %B3, %LGV1
  store i16 %B14, ptr @G.2, align 2
  br label %BB

F:                                                ; preds = %0
  br label %BB

SW_D:                                             ; preds = %SW_D, %T
  %LGV9 = load i1, ptr @G.3, align 1
  br i1 %LGV9, label %BB4, label %SW_D

SW_C:                                             ; preds = %T
  ret i64 0

SW_C6:                                            ; preds = %T
  br label %BB4

SW_C7:                                            ; preds = %SW_C7, %T
  br i1 %C, label %SW_C7, label %BB4

SW_C8:                                            ; preds = %SW_C8, %T
  %LGV12 = load i32, ptr @G.4, align 4
  %B13 = add i32 65536, %LGV12
  store i32 %B13, ptr @G.4, align 4
  br i1 %C, label %BB4, label %SW_C8
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare i64 @llvm.readcyclecounter() #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn }

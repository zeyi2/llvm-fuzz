; isel-diff-config: -mtriple=riscv32 -mattr=+f -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 -1
@G.1 = global i1 true
@G.2 = global i1 false

; Function Attrs: nounwind
define i64 @test_builtin_readcyclecounter() #0 {
  %A15 = alloca i1, align 1
  store i1 false, ptr %A15, align 1
  %A12 = alloca i1, align 1
  store i1 false, ptr %A12, align 1
  %A8 = alloca i1, align 1
  store i1 false, ptr %A8, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i64, ptr @G, align 4
  switch i64 %LGV, label %SW_D [
    i64 4303199021846014237, label %SW_C
    i64 2825014246696475366, label %SW_C1
    i64 -1124663481073590762, label %SW_C2
    i64 -126088060032052412, label %SW_C3
    i64 5381856492718128585, label %SW_C4
    i64 -1449714065303366033, label %SW_C5
    i64 -3830871222338784181, label %SW_C6
    i64 8167191317104177415, label %SW_C7
  ]

BB:                                               ; preds = %SW_C6, %SW_C5, %SW_C4, %SW_C2, %SW_C1, %SW_C, %SW_D
  %1 = tail call i64 @llvm.readcyclecounter()
  %B = ashr i64 %1, %1
  ret i64 %B

SW_D:                                             ; preds = %SW_D, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %SW_D

SW_C:                                             ; preds = %SW_C, %0
  %L9 = load i1, ptr %A8, align 1
  br i1 %L9, label %SW_C, label %BB

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %SW_C2, %0
  %LGV10 = load i1, ptr @G.1, align 1
  br i1 %LGV10, label %BB, label %SW_C2

SW_C3:                                            ; preds = %0
  ret i64 0

SW_C4:                                            ; preds = %SW_C4, %0
  %LGV11 = load i1, ptr @G.2, align 1
  br i1 %LGV11, label %BB, label %SW_C4

SW_C5:                                            ; preds = %SW_C5, %0
  %L13 = load i1, ptr %A12, align 1
  br i1 %L13, label %SW_C5, label %BB

SW_C6:                                            ; preds = %SW_C6, %0
  %LGV14 = load i1, ptr @G.1, align 1
  %L16 = load i1, ptr %A15, align 1
  br i1 %L16, label %BB, label %SW_C6

SW_C7:                                            ; preds = %0
  ret i64 %LGV
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare i64 @llvm.readcyclecounter() #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn }

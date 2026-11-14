; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+v,+zve32x -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global ptr poison
@G.1 = global i1 false
@G.2 = global i1 false
@G.3 = global i64 1
@G.4 = global i1 false

; Function Attrs: nounwind
define ptr @scalar_stack_align16() #0 {
  %LGV = load i64, ptr @G.3, align 4
  %a = alloca <vscale x 2 x i32>, align 8
  %L1 = load i64, ptr %a, align 4
  %C = icmp eq i1 false, false
  %c = alloca i64, align 16
  %L2 = load i8, ptr %c, align 1
  %L = load i8, ptr %c, align 1
  %C5 = icmp ugt i1 %C, %C
  %B = ashr i8 %L, %L2
  %C4 = icmp ne i8 42, %L
  call void @extern(ptr %a)
  %G = getelementptr <4 x i32>, ptr %c, i64 42
  store ptr %G, ptr @G, align 8
  store i8 %B, ptr %G, align 1
  store i1 %C4, ptr %G, align 1
  switch i64 %L1, label %SW_D [
    i64 -7238253405697586372, label %SW_C
    i64 1013420823016252803, label %SW_C2
    i64 -58296775762524371, label %SW_C3
    i64 -3151351091260957220, label %SW_C4
    i64 1112508041065636579, label %SW_C5
    i64 3220501491446837799, label %SW_C6
    i64 -7724111468219965697, label %SW_C7
  ]

BB:                                               ; preds = %SW_C7, %SW_C6, %SW_C5, %SW_C4, %SW_C3, %SW_C2, %SW_D
  store i1 %C, ptr %c, align 1
  store i1 %C5, ptr @G.1, align 1
  ret ptr %c

SW_D:                                             ; preds = %0
  %LGV1 = load i1, ptr @G.4, align 1
  %B2 = add i1 false, %LGV1
  store i1 %B2, ptr %a, align 1
  br label %BB

SW_C:                                             ; preds = %0
  br i1 %C5, label %T, label %F

BB10:                                             ; preds = %T
  ret ptr poison

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %SW_C5, %0
  br i1 %C, label %BB, label %SW_C5

SW_C6:                                            ; preds = %SW_C6, %0
  %1 = phi i64 [ %L1, %SW_C6 ], [ %LGV, %0 ]
  %LGV8 = load i1, ptr @G.2, align 1
  store i64 %1, ptr poison, align 4
  br i1 %LGV8, label %BB, label %SW_C6

SW_C7:                                            ; preds = %0
  %B9 = udiv i1 %C, %C5
  store i1 %B9, ptr %a, align 1
  br label %BB

T:                                                ; preds = %SW_C
  br label %BB10

F:                                                ; preds = %SW_C
  ret ptr %a
}

declare void @extern(ptr)

attributes #0 = { nounwind }

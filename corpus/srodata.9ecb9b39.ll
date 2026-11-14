; isel-diff-config: -mtriple=riscv64 -mattr=+d -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 4294967296
@G.1 = global i64 1
@G.2 = global i128 42
@G.3 = global i1 false
@G.4 = global i64 -9223372036854775808
@G.5 = global i16 256

define dso_local double @foo() {
entry:
  %A = alloca i64, align 8
  %L = load i1, ptr %A, align 1
  store i64 poison, ptr %A, align 4
  %LGV5 = load i64, ptr @G.4, align 4
  %LGV2 = load i128, ptr @G.2, align 4
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F
  %LGV10 = load i16, ptr @G.5, align 2
  %G = getelementptr i128, ptr %A, i8 1
  %LGV = load i64, ptr @G, align 4
  %B3 = and i64 %LGV, -1
  %B = sub i64 1, %LGV
  store i64 %B, ptr @G.1, align 4
  switch i16 %LGV10, label %SW_D [
    i16 -16251, label %SW_C
  ]

BB9:                                              ; preds = %SW_C, %SW_D
  %B6 = sub i64 %B, %LGV5
  %C = icmp uge i128 1, %LGV2
  store i1 %C, ptr @G.3, align 1
  store i64 %B3, ptr @G, align 4
  store i64 %B6, ptr %A, align 4
  store ptr %G, ptr %A, align 8
  ret double f0x400A08AC91C3E242

T:                                                ; preds = %entry
  ret double +qnan

F:                                                ; preds = %entry
  br label %BB

SW_D:                                             ; preds = %BB
  br label %BB9

SW_C:                                             ; preds = %SW_C, %BB
  br i1 %L, label %SW_C, label %BB9
}

!llvm.module.flags = !{!1}

!1 = !{i32 8, !"SmallDataLimit", i32 0}

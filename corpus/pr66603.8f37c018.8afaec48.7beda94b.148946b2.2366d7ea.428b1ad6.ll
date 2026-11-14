; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d,+zfa,+zfhmin,+zvfh -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -1
@G.1 = global i1 true
@G.2 = global double +qnan
@G.3 = global double f0x7FEFFFFFFFFFFFFF
@G.4 = global i128 -170141183460469231731687303715884105728
@G.5 = global i32 -1
@G.6 = global i1 true

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %LGV6 = load i1, ptr @G.6, align 1
  %LGV1 = load i32, ptr @G.5, align 4
  %E = extractelement <4 x i32> zeroinitializer, i16 1
  %C = fcmp uge double %x, %x
  %A4 = alloca ptr, align 8
  store ptr poison, ptr %A4, align 8
  %A = alloca i1, i32 %E, align 1
  %L = load i1, ptr %A, align 1
  %B3 = lshr i32 %E, %LGV1
  store i1 poison, ptr %A, align 1
  %G4 = getelementptr double, ptr %A, i1 %L
  %B4 = udiv i8 1, 127
  %as_i8 = fptosi double %x to i8
  br i1 %LGV6, label %T, label %F

BB:                                               ; preds = %F, %T
  %frozen_i8 = freeze i8 %as_i8
  %ext = sext i8 %frozen_i8 to i32
  %C1 = icmp ne i128 0, 42
  store i1 %C1, ptr @G.1, align 1
  %B = and i8 %as_i8, %B4
  %LGV = load double, ptr @G.2, align 8
  store i8 %B, ptr @G, align 1
  %B2 = fadd double %x, %LGV
  %C4 = fcmp one double %B2, %x
  %G = getelementptr i128, ptr %A, i64 0
  store double %B2, ptr @G.3, align 8
  store i1 %C4, ptr @G.1, align 1
  store i1 %C, ptr %A, align 1
  store ptr %G, ptr %A4, align 8
  store ptr %G4, ptr %G, align 8
  store i32 %B3, ptr %G4, align 4
  ret i32 %ext

T:                                                ; preds = %T, %0
  %LGV7 = load i1, ptr @G.1, align 1
  br i1 %LGV6, label %BB, label %T

F:                                                ; preds = %0
  br label %BB
}

attributes #0 = { nounwind }

; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d,+zfa,+zfhmin,+c,+zve64d -O2 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -1
@G.1 = global i1 true
@G.2 = global double +qnan
@G.3 = global double f0x7FEFFFFFFFFFFFFF
@G.4 = global i128 -170141183460469231731687303715884105728
@G.5 = global i32 -1
@G.6 = global double +inf
@G.7 = global i1 false

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %LGV3 = load double, ptr @G.6, align 8
  %C12 = icmp ule i1 false, false
  %C10 = fcmp ule double %LGV3, +inf
  %LGV1 = load i32, ptr @G.5, align 4
  %E = extractelement <4 x i32> zeroinitializer, i16 1
  %A4 = alloca ptr, align 8
  store ptr poison, ptr %A4, align 8
  %A = alloca i1, i32 %E, align 1
  %L2 = load i16, ptr %A, align 2
  %L = load i1, ptr %A, align 1
  %B3 = lshr i32 %E, %LGV1
  store i1 poison, ptr %A, align 1
  %G4 = getelementptr double, ptr %A, i1 %L
  %C = icmp slt i16 -1, %L2
  %as_i8 = fptosi double %x to i8
  %frozen_i8 = freeze i8 %as_i8
  %ext = sext i8 %frozen_i8 to i32
  store i1 %C, ptr @G.1, align 1
  %B = and i8 %as_i8, %frozen_i8
  %C5 = fcmp ord double %x, %LGV3
  %C2 = fcmp contract false double %x, +inf
  %LGV = load double, ptr @G.2, align 8
  store i8 %B, ptr @G, align 1
  %B2 = fadd double %x, %LGV
  %C4 = fcmp one double %B2, %x
  %G = getelementptr i128, ptr %A, i64 0
  store double %B2, ptr @G.3, align 8
  store i1 %C4, ptr @G.1, align 1
  store i1 %C2, ptr %A, align 1
  store ptr %G, ptr %A4, align 8
  store ptr %G4, ptr %G, align 8
  store i32 %B3, ptr %G4, align 4
  store i1 %C5, ptr @G.1, align 1
  store i1 %C10, ptr %G, align 1
  store i1 %C12, ptr @G.7, align 1
  ret i32 %ext
}

attributes #0 = { nounwind }

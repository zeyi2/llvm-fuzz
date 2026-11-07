; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d,+zfhmin,+m,+zve32x,+zcb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i128 0
@G.2 = global i64 42
@G.3 = global i64 42
@G.4 = global i8 42
@G.5 = global i1 true
@G.6 = global double 1.000000e+00
@G.7 = global ptr poison
@G.8 = global i1 true
@G.9 = global i16 42
@G.10 = global i128 18446744073709551616

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %A11 = alloca i128, align 8
  store i128 poison, ptr %A11, align 4
  %LGV9 = load i128, ptr @G.10, align 4
  %LGV4 = load double, ptr @G.6, align 8
  %C5 = fcmp ole double %x, %LGV4
  %A8 = alloca i8, align 1
  %L12 = load i16, ptr %A8, align 2
  %L = load i16, ptr %A8, align 2
  store i8 poison, ptr %A8, align 1
  %B2 = sub i1 %C5, false
  %LGV6 = load i8, ptr @G.4, align 1
  %A5 = alloca i64, align 8
  %L13 = load i16, ptr %A5, align 2
  store i64 poison, ptr %A5, align 4
  %LGV3 = load i64, ptr @G.3, align 4
  %LGV2 = load i64, ptr @G.2, align 4
  %A = alloca i128, align 8
  %C = fcmp une double %x, 4.200000e+01
  %C7 = icmp ugt i1 true, %C
  store i128 poison, ptr %A, align 4
  %LGV = load i128, ptr @G.1, align 4
  %B = xor i128 170141183460469231731687303715884105727, %LGV
  %G = getelementptr i128, ptr %A, i16 %L
  %as_i8 = fptosi double %x to i8
  %B1 = add i128 %LGV, %B
  %frozen_i8 = freeze i8 %as_i8
  %B7 = and i8 %frozen_i8, %LGV6
  %C2 = fcmp uno double %x, 4.200000e+01
  %ext = sext i8 %frozen_i8 to i32
  store i1 %C5, ptr @G, align 1
  %B4 = urem i64 %LGV2, %LGV3
  store i128 %B1, ptr %A, align 4
  store i64 %B4, ptr %A5, align 4
  %B14 = shl i16 %L12, %L13
  store i8 %B7, ptr %A8, align 1
  %B5 = srem i16 %L, %B14
  store i1 %C, ptr @G.5, align 1
  %B10 = ashr i128 42, %LGV9
  store ptr %G, ptr @G.7, align 8
  store i1 %C2, ptr @G, align 1
  store i1 %C7, ptr @G, align 1
  store i1 %B2, ptr @G.8, align 1
  store i16 %B5, ptr @G.9, align 2
  store i128 %B10, ptr %A11, align 4
  ret i32 %ext
}

attributes #0 = { nounwind }

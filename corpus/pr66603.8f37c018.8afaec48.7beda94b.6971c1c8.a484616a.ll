; isel-diff-config: -mtriple=riscv64-- -verify-machineinstrs -mattr=+d,+v,+zfa,+a,+zbb,+zvbb -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -1
@G.1 = global i1 true
@G.2 = global double +qnan
@G.3 = global double f0x7FEFFFFFFFFFFFFF
@G.4 = global i128 -170141183460469231731687303715884105728
@G.5 = global double +qnan
@G.6 = global ptr poison
@G.7 = global float f0x7F7FFFFF

; Function Attrs: nounwind
define i32 @PR66603(double %x) #0 {
  %A11 = alloca float, align 4
  store float poison, ptr %A11, align 4
  %LGV5 = load float, ptr @G.7, align 4
  %B7 = sdiv <2 x i64> splat (i64 4294967296), splat (i64 9223372036854775807)
  %C6 = fcmp false float 4.200000e+01, %LGV5
  %LGV4 = load double, ptr @G.5, align 8
  %A4 = alloca ptr, align 8
  %C5 = fcmp ord double %x, %LGV4
  store ptr poison, ptr %A4, align 8
  %A = alloca i1, align 1
  %L9 = load float, ptr %A, align 4
  store i1 poison, ptr %A, align 1
  %as_i8 = fptosi double %x to i8
  %frozen_i8 = freeze i8 %as_i8
  %ext = sext i8 %frozen_i8 to i32
  %C1 = icmp ne i128 0, 42
  store i1 %C1, ptr @G.1, align 1
  %B = and i8 %as_i8, %frozen_i8
  %LGV = load double, ptr @G.2, align 8
  store i8 %B, ptr @G, align 1
  %C = fcmp uno double %x, %LGV
  %B2 = fadd double %x, %LGV
  %G = getelementptr i128, ptr %A, i64 0
  %C3 = fcmp olt double %x, %LGV
  store double %B2, ptr @G.3, align 8
  store i1 %C, ptr @G.1, align 1
  %G7 = getelementptr double, ptr %A, i32 %ext
  %B10 = fadd float 0.000000e+00, %L9
  store i1 %C3, ptr %A, align 1
  store ptr %G, ptr %A4, align 8
  store i1 %C5, ptr %A, align 1
  store ptr %G7, ptr @G.6, align 8
  store i1 %C6, ptr %G, align 1
  store <2 x i64> %B7, ptr %G, align 16
  store float %B10, ptr %A11, align 4
  ret i32 %ext
}

attributes #0 = { nounwind }

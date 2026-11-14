; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zbb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 -2147483648)
@G.1 = global <2 x i64> splat (i64 1)
@G.2 = global <2 x i64> splat (i64 -1)
@G.3 = global i200 0
@G.4 = global i1 true
@G.5 = global ptr poison
@G.6 = global i1 true

; Function Attrs: nounwind
define void @test_bitint_200_add(ptr %a, ptr %b, ptr %out) #0 {
  %A3 = alloca i1, align 1
  %L6 = load i8, ptr %A3, align 1
  %L5 = load i8, ptr %A3, align 1
  store i1 false, ptr %A3, align 1
  %B = udiv i8 %L5, %L6
  %G5 = getelementptr ptr, ptr %b, i8 %L5
  %A = alloca <2 x i1>, align 1
  store <2 x i1> poison, ptr %A, align 1
  %L4 = load i1, ptr %A3, align 1
  store i8 %B, ptr %A, align 1
  store ptr %G5, ptr %A, align 8
  br i1 %L4, label %T, label %F

BB:                                               ; preds = %F, %T
  %LGV1 = load <2 x i64>, ptr @G.2, align 16
  %G = getelementptr <2 x i64>, ptr %b, i8 1
  %1 = load i200, ptr %b, align 8
  %LGV = load <2 x i64>, ptr @G.1, align 16
  %C = icmp sgt <2 x i64> %LGV, %LGV1
  store <2 x i1> %C, ptr %A, align 1
  %2 = load i200, ptr %G, align 8
  %3 = add i200 %2, %1
  store i200 %3, ptr %out, align 8
  ret void

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  %G4 = getelementptr i8, ptr %a, i8 %B
  store ptr %G4, ptr poison, align 8
  br label %BB
}

; Function Attrs: nounwind
define void @test_bitint_200_to_float(ptr %in, ptr %out) #0 {
  %G = getelementptr i200, ptr %in, i128 -170141183460469231731687303715884105728
  %LGV = load i200, ptr @G.3, align 4
  store ptr %G, ptr @G.5, align 8
  %1 = load i200, ptr %in, align 8
  %C = icmp uge i200 %1, %LGV
  store i1 %C, ptr @G.4, align 1
  %2 = sitofp i200 %1 to float
  store float %2, ptr %out, align 4
  ret void
}

; Function Attrs: nounwind
define void @test_float_to_bitint_200(ptr %in, ptr %out) #0 {
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %G = getelementptr ptr, ptr %in, i32 42
  %LGV = load <4 x i32>, ptr @G, align 16
  %B = lshr <4 x i32> %LGV, splat (i32 42)
  %1 = load float, ptr %in, align 4
  %2 = fptosi float %1 to i200
  store i200 %2, ptr %out, align 8
  %C2 = fcmp ult half 0.000000e+00, 1.000000e+00
  %C = icmp sge i1 false, %C2
  store <4 x i32> %B, ptr poison, align 16
  store i1 %C, ptr poison, align 1
  store ptr %G, ptr %A, align 8
  ret void
}

attributes #0 = { nounwind }

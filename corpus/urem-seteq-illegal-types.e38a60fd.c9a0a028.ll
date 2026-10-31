; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global ptr poison
@G.2 = global <3 x i11> splat (i11 1)
@G.3 = global half +inf
@G.4 = global half +inf
@G.5 = global i9 255

; Function Attrs: nounwind
define i1 @test_urem_odd(i13 %X) #0 {
  %LGV1 = load half, ptr @G.4, align 2
  %LGV = load half, ptr @G.3, align 2
  %C = fcmp oeq half %LGV, %LGV1
  %urem = urem i13 %X, 5
  %cmp = icmp eq i13 %urem, 0
  store i1 %cmp, ptr poison, align 1
  store i1 %C, ptr @G, align 1
  ret i1 %cmp
}

; Function Attrs: nounwind
declare i1 @test_urem_even(i27) #0

; Function Attrs: nounwind
declare i1 @test_urem_odd_setne(i4) #0

; Function Attrs: nounwind
define i1 @test_urem_negative_odd(i9 %X) #0 {
  %LGV = load i1, ptr @G, align 1
  %urem = urem i9 %X, -5
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %BB1, %T
  %cmp = icmp sle i9 %urem, 0
  ret i1 %cmp

T:                                                ; preds = %T, %0
  %B = add i9 %X, -1
  store i9 %B, ptr @G.5, align 2
  br i1 %LGV, label %T, label %BB

F:                                                ; preds = %0
  %LGV4 = load i1, ptr @G, align 1
  br i1 %LGV, label %T2, label %F3

BB1:                                              ; preds = %F3, %T2
  br label %BB

T2:                                               ; preds = %F
  br label %BB1

F3:                                               ; preds = %F3, %F
  br i1 %LGV, label %F3, label %BB1
}

; Function Attrs: nounwind
define void @test_urem_vec(ptr %X) #0 {
  %A = alloca <3 x i11>, align 8
  store <3 x i11> poison, ptr %A, align 8
  %LGV = load <3 x i11>, ptr @G.2, align 8
  %ld = load <3 x i11>, ptr %X, align 8
  %urem = urem <3 x i11> %ld, <i11 6, i11 7, i11 -5>
  %G = getelementptr <3 x i11>, ptr %X, i128 42
  %B = udiv <3 x i11> %urem, %LGV
  %cmp = icmp ne <3 x i11> %urem, <i11 0, i11 1, i11 2>
  %ext = sext <3 x i1> %cmp to <3 x i11>
  store <3 x i11> %ext, ptr %X, align 8
  store ptr %G, ptr @G.1, align 8
  store <3 x i11> %B, ptr %A, align 8
  ret void
}

attributes #0 = { nounwind }

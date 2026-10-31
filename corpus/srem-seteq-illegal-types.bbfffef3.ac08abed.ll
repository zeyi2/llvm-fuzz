; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zvbb,+zdinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i29 1
@G.2 = global <4 x i32> splat (i32 -1)
@G.3 = global <4 x float> splat (float +inf)
@G.4 = global <4 x float> splat (float 4.200000e+01)
@G.5 = global <3 x i1> splat (i1 true)
@G.6 = global i1 false
@G.7 = global i1 false
@G.8 = global i1 false

; Function Attrs: nounwind
define i1 @test_srem_odd(i29 %X) #0 {
  %B4 = and i29 %X, 1
  %LGV = load <4 x i32>, ptr @G.2, align 16
  %srem = srem i29 %X, %B4
  %B = add i29 %X, 16384
  %cmp = icmp eq i29 %srem, 0
  store i29 %B, ptr @G.1, align 4
  %B2 = urem i29 %X, %X
  %C = icmp ule <4 x i32> splat (i32 -1), %LGV
  store <4 x i1> %C, ptr poison, align 1
  store i29 %B2, ptr @G.1, align 4
  ret i1 %cmp
}

; Function Attrs: nounwind
declare i1 @test_srem_even(i4) #0

; Function Attrs: nounwind
declare i1 @test_srem_pow2_setne(i6) #0

; Function Attrs: nounwind
define void @test_srem_vec(ptr %X) #0 {
  %A20 = alloca i1, align 1
  store i1 true, ptr %A20, align 1
  %A7 = alloca i64, align 8
  store i64 0, ptr %A7, align 4
  %A1 = alloca i1, align 1
  %L6 = load i64, ptr %A1, align 4
  store i1 poison, ptr %A1, align 1
  %A = alloca i32, align 4
  store i32 2147483647, ptr %A, align 4
  %ld = load <3 x i33>, ptr %X, align 16
  %L8 = load i64, ptr %A7, align 4
  switch i64 %L8, label %SW_D9 [
    i64 2121897845639071109, label %SW_C10
    i64 -4417499845396789936, label %SW_C11
    i64 3540483206417878113, label %SW_C12
    i64 630110303117357050, label %SW_C13
    i64 -5698371732741254022, label %SW_C14
    i64 7576023095597280261, label %SW_C15
  ]

BB5:                                              ; preds = %SW_C15, %SW_C14, %SW_C13, %SW_C12, %SW_C11, %SW_C10, %SW_D9
  %srem = srem <3 x i33> %ld, <i33 6, i33 7, i33 -5>
  %cmp = icmp ne <3 x i33> %srem, <i33 0, i33 1, i33 2>
  %ext = sext <3 x i1> %cmp to <3 x i33>
  store <3 x i33> %ext, ptr %X, align 16
  %L = load i32, ptr %A, align 4
  switch i32 %L, label %SW_D [
    i32 -1112476658, label %SW_C
    i32 1473375866, label %SW_C1
    i32 -1422803339, label %SW_C2
    i32 850327075, label %SW_C3
  ]

BB:                                               ; preds = %SW_C1, %SW_D
  ret void

SW_D:                                             ; preds = %SW_D, %BB5
  %LGV = load i1, ptr @G, align 1
  store i1 %LGV, ptr %A1, align 1
  br i1 %LGV, label %SW_D, label %BB

SW_C:                                             ; preds = %BB5
  ret void

SW_C1:                                            ; preds = %BB5
  %LGV4 = load <3 x i1>, ptr @G.5, align 1
  %C = icmp eq <3 x i1> %cmp, %LGV4
  store <3 x i1> %C, ptr %A1, align 1
  br label %BB

SW_C2:                                            ; preds = %BB5
  ret void

SW_C3:                                            ; preds = %BB5
  %LGV3 = load <4 x float>, ptr @G.4, align 16
  %LGV2 = load <4 x float>, ptr @G.3, align 16
  %B = frem <4 x float> %LGV2, %LGV3
  store <4 x float> %B, ptr %A1, align 16
  ret void

SW_D9:                                            ; preds = %0
  br label %BB5

SW_C10:                                           ; preds = %0
  br label %BB5

SW_C11:                                           ; preds = %SW_C11, %0
  %LGV16 = load i1, ptr @G.6, align 1
  br i1 %LGV16, label %BB5, label %SW_C11

SW_C12:                                           ; preds = %SW_C12, %0
  %LGV17 = load i1, ptr @G.7, align 1
  br i1 %LGV17, label %BB5, label %SW_C12

SW_C13:                                           ; preds = %0
  br label %BB5

SW_C14:                                           ; preds = %SW_C14, %0
  %LGV18 = load i1, ptr @G.8, align 1
  br i1 %LGV18, label %SW_C14, label %BB5

SW_C15:                                           ; preds = %SW_C15, %0
  %LGV19 = load i1, ptr @G.7, align 1
  %L21 = load i1, ptr %A20, align 1
  br i1 %L21, label %BB5, label %SW_C15
}

attributes #0 = { nounwind }

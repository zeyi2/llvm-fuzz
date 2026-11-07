; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx,+zvbb,+zvkb,+zdinx -O0 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i32 2147483647
@G.2 = global i32 -2147483648
@G.3 = global half 5.960460e-08
@G.4 = global i1 true
@G.5 = global i256 0
@G.6 = global i1 false
@G.7 = global float 0.000000e+00
@G.8 = global float 1.401300e-45
@G.9 = global ptr poison
@G.10 = global half 6.550400e+04
@G.11 = global i16 -1
@G.12 = global i256 42
@G.13 = global i8 127

; Function Attrs: minsize nounwind
declare i32 @testsize1(i32) #0

; Function Attrs: minsize nounwind
declare i32 @testsize2(i32) #0

; Function Attrs: minsize nounwind
declare i32 @testsize3(i32) #0

; Function Attrs: minsize nounwind
define i32 @testsize4(i32 %x) #0 {
  %A18 = alloca i1, align 1
  store i1 true, ptr %A18, align 1
  %LGV5 = load float, ptr @G.7, align 4
  %A2 = alloca i1, align 1
  store i1 false, ptr %A2, align 1
  %A = alloca i1, align 1
  %L4 = load float, ptr %A, align 4
  store i1 false, ptr %A, align 1
  %B = fsub float %L4, %LGV5
  %div = udiv i32 %x, 33
  store float %B, ptr @G.8, align 4
  switch i32 %div, label %SW_D [
    i32 -673949832, label %SW_C
    i32 -155192142, label %SW_C1
    i32 1694259833, label %SW_C2
    i32 -1514716585, label %SW_C3
    i32 -213165383, label %SW_C4
  ]

BB:                                               ; preds = %SW_C3, %SW_C2, %SW_C1, %SW_D
  %G1 = getelementptr float, ptr %A, i8 127
  store ptr %G1, ptr %A2, align 8
  ret i32 %div

SW_D:                                             ; preds = %SW_D, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  %L3 = load i1, ptr %A2, align 1
  %C = icmp eq i32 %x, -1
  store i1 %C, ptr @G, align 1
  br i1 %L3, label %T, label %F

BB1:                                              ; preds = %F, %BB5
  ret i32 %x

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  %LGV3 = load half, ptr @G.10, align 2
  %B6 = fdiv half %LGV3, 6.550400e+04
  %G = getelementptr i32, ptr %A, i32 %div
  %L2 = load half, ptr %G, align 2
  store ptr %G, ptr @G.9, align 8
  %C4 = fcmp false half %L2, %LGV3
  store i1 %C4, ptr @G.4, align 1
  store half %LGV3, ptr @G.10, align 2
  store half %B6, ptr %G, align 2
  br label %BB

SW_C3:                                            ; preds = %SW_C3, %0
  %LGV = load i1, ptr @G, align 1
  store i1 %LGV, ptr @G.6, align 1
  br i1 %LGV, label %SW_C3, label %BB

SW_C4:                                            ; preds = %0
  ret i32 %x

T:                                                ; preds = %SW_C
  %LGV6 = load i16, ptr @G.11, align 2
  switch i16 %LGV6, label %SW_D7 [
    i16 4107, label %SW_C8
    i16 -25629, label %SW_C9
    i16 17110, label %SW_C10
    i16 -20858, label %SW_C11
    i16 -24115, label %SW_C12
    i16 -4948, label %SW_C13
    i16 1098, label %SW_C14
    i16 -25179, label %SW_C15
  ]

BB5:                                              ; preds = %SW_C15, %SW_C14, %SW_C13, %SW_C12, %SW_C11, %SW_C10, %SW_C9
  %LGV4 = load i8, ptr @G.13, align 1
  %B5 = shl i8 42, %LGV4
  store i8 %B5, ptr @G.13, align 1
  br label %BB1

F:                                                ; preds = %F, %SW_C
  br i1 %L3, label %BB1, label %F

SW_D7:                                            ; preds = %T
  %C2 = icmp ne i16 -32768, %LGV6
  store i1 %C2, ptr %A18, align 1
  ret i32 1

SW_C8:                                            ; preds = %T
  ret i32 %x

SW_C9:                                            ; preds = %T
  br label %BB5

SW_C10:                                           ; preds = %T
  br label %BB5

SW_C11:                                           ; preds = %SW_C11, %T
  br i1 %L3, label %BB5, label %SW_C11

SW_C12:                                           ; preds = %SW_C12, %T
  %C7 = icmp uge i32 %x, 65536
  store i1 %C7, ptr @G, align 1
  br i1 %C, label %SW_C12, label %BB5

SW_C13:                                           ; preds = %T
  br label %BB5

SW_C14:                                           ; preds = %SW_C14, %T
  %L19 = load i1, ptr %A18, align 1
  store i1 %L19, ptr poison, align 1
  br i1 %L19, label %BB5, label %SW_C14

SW_C15:                                           ; preds = %SW_C15, %T
  br i1 %C, label %BB5, label %SW_C15
}

; Function Attrs: minsize nounwind
declare i128 @i128_sdiv(i128) #0

; Function Attrs: minsize nounwind
define i256 @i256_sdiv(i256 %arg0) #0 {
  %A = alloca i256, align 8
  store i256 poison, ptr %A, align 4
  %C1 = icmp sge i256 %arg0, %arg0
  %B3 = lshr i256 %arg0, %arg0
  %B = mul i256 %arg0, %arg0
  %C = icmp ult i32 0, -1
  %B4 = udiv i256 %arg0, %B
  store i1 %C, ptr poison, align 1
  %B2 = sdiv i1 true, %C
  %B1 = lshr i256 %arg0, 57896044618658097711785492504343953926634992332820282019728792003956564819967
  %C5 = icmp ult i1 %C, %C
  store i256 %B, ptr @G.5, align 4
  store i1 %B2, ptr @G, align 1
  store i256 %B3, ptr @G.5, align 4
  store i1 %C1, ptr poison, align 1
  store i256 %B4, ptr @G.12, align 4
  store i1 %C5, ptr @G.4, align 1
  %B5 = sdiv i256 %B3, %B1
  store i256 %B5, ptr %A, align 4
  ret i256 %B1
}

attributes #0 = { minsize nounwind }

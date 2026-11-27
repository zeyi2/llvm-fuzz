; isel-diff-config: -mtriple=riscv32 -target-abi ilp32f -verify-machineinstrs -mattr=+xandesbfhcvt -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global ptr poison
@G.1 = global <8 x i1> zeroinitializer
@G.2 = global bfloat +inf
@G.4 = global half 1.000000e+00
@G.5 = global <8 x i1> zeroinitializer

; Function Attrs: nounwind
declare float @fcvt_s_bf16(bfloat) #0

; Function Attrs: nounwind
define bfloat @fcvt_bf16_s(float %a) #0 {
  %A9 = alloca i1, align 1
  store i1 true, ptr %A9, align 1
  %A7 = alloca i1, align 1
  store i1 false, ptr %A7, align 1
  %A = alloca i8, align 1
  store i8 1, ptr %A, align 1
  %L = load i8, ptr %A, align 1
  switch i8 %L, label %SW_D [
    i8 -111, label %SW_C
    i8 -95, label %SW_C1
    i8 -109, label %SW_C2
    i8 125, label %SW_C3
    i8 -80, label %SW_C4
    i8 -57, label %SW_C5
    i8 116, label %SW_C6
  ]

BB:                                               ; preds = %SW_C6, %SW_C5, %SW_C3, %SW_C2, %SW_C, %SW_D
  %B = fmul bfloat 3.389530e+38, 4.200000e+01
  ret bfloat %B

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %L8 = load i1, ptr %A7, align 1
  br i1 %L8, label %BB, label %SW_C

SW_C1:                                            ; preds = %0
  %LGV = load bfloat, ptr @G.2, align 2
  ret bfloat %LGV

SW_C2:                                            ; preds = %0
  %LGV12 = load half, ptr @G.4, align 2
  %C = fcmp oeq half 5.960460e-08, %LGV12
  store i1 %C, ptr poison, align 1
  br label %BB

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  ret bfloat +inf

SW_C5:                                            ; preds = %SW_C5, %0
  %L10 = load i1, ptr %A9, align 1
  br i1 %L10, label %BB, label %SW_C5

SW_C6:                                            ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
define void @loadstorebf16(ptr %bf, ptr %sf) #0 {
entry:
  %C = icmp sge <8 x i8> splat (i8 127), splat (i8 42)
  %C1 = icmp uge <8 x i1> %C, zeroinitializer
  %B = sub <8 x i1> %C, zeroinitializer
  %0 = load bfloat, ptr %bf, align 2
  %S = shufflevector <2 x i64> splat (i64 4294967296), <2 x i64> splat (i64 4294967296), <2 x i32> poison
  %G = getelementptr <4 x float>, ptr %bf, i16 0
  %B2 = add <8 x i1> %C, %C
  %1 = fpext bfloat %0 to float
  store volatile float %1, ptr %sf, align 4
  %2 = load float, ptr %sf, align 4
  %3 = fptrunc float %2 to bfloat
  store volatile bfloat %3, ptr %bf, align 2
  store ptr %G, ptr @G, align 8
  store <8 x i1> %C, ptr @G.1, align 1
  store <8 x i1> %B, ptr %G, align 1
  store <2 x i64> %S, ptr %G, align 16
  store <8 x i1> %C1, ptr %G, align 1
  store <8 x i1> %B2, ptr @G.5, align 1
  ret void
}

attributes #0 = { nounwind }

; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zfa,+zfh -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i128 170141183460469231731687303715884105727
@G.2 = global i16 42
@G.3 = global ptr poison
@G.4 = global i1 false
@G.5 = global i1 true
@G.6 = global <8 x i8> zeroinitializer
@G.7 = global <8 x i8> splat (i8 42)
@G.8 = global <2 x i64> splat (i64 1)
@G.9 = global i1 true
@G.10 = global double 0.000000e+00

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %LGV = load double, ptr @G.10, align 8
  %B = udiv i64 %idx, 0
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 %idx
  %G = getelementptr i16, ptr %x, i1 false
  %L = load double, ptr %G, align 8
  store ptr %G, ptr @G.3, align 8
  store i64 %B, ptr %G, align 4
  %C1 = fcmp ule double %L, %LGV
  store i1 %C1, ptr @G.4, align 1
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v2i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v4i1(ptr, i64) #0

; Function Attrs: nounwind
define i1 @extractelt_v8i1(ptr %x, i64 %idx) #0 {
  %A10 = alloca i1, align 1
  store i1 true, ptr %A10, align 1
  %A2 = alloca i64, align 8
  store i64 -1, ptr %A2, align 4
  %A6 = alloca i1, align 1
  store i1 true, ptr %A6, align 1
  %A = alloca i32, align 4
  store i32 0, ptr %A, align 4
  %a = load <8 x i8>, ptr %x, align 8
  %C = icmp ne i8 42, 0
  %b = icmp eq <8 x i8> %a, zeroinitializer
  %c = extractelement <8 x i1> %b, i64 %idx
  store i1 %C, ptr @G, align 1
  %L = load i32, ptr %A, align 4
  switch i32 %L, label %SW_D [
    i32 -769955774, label %SW_C
    i32 -157984656, label %SW_C1
    i32 1506251618, label %SW_C2
    i32 -780188090, label %SW_C3
    i32 787831640, label %SW_C4
  ]

BB:                                               ; preds = %BB1, %SW_C2, %SW_C, %SW_D
  ret i1 %c

SW_D:                                             ; preds = %0
  %LGV8 = load <8 x i8>, ptr @G.6, align 8
  %B = xor <8 x i8> splat (i8 -128), %LGV8
  store <8 x i8> %B, ptr @G.7, align 8
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %LGV = load i1, ptr @G.5, align 1
  br i1 %LGV, label %SW_C, label %BB

SW_C1:                                            ; preds = %0
  ret i1 %C

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  ret i1 %c

SW_C4:                                            ; preds = %BB1, %0
  %L7 = load i1, ptr %A6, align 1
  %L3 = load i64, ptr %A2, align 4
  switch i64 %L3, label %SW_D4 [
    i64 5265603579204295871, label %SW_C5
    i64 -4153665866169706806, label %SW_C6
    i64 -5453247331296548269, label %SW_C7
  ]

BB1:                                              ; preds = %SW_C7, %SW_C6, %SW_C5, %SW_D4
  br i1 %L7, label %BB, label %SW_C4

SW_D4:                                            ; preds = %SW_D4, %SW_C4
  %LGV9 = load i1, ptr @G.9, align 1
  br i1 %LGV9, label %SW_D4, label %BB1

SW_C5:                                            ; preds = %SW_C5, %SW_C4
  %L11 = load i1, ptr %A10, align 1
  br i1 %L11, label %BB1, label %SW_C5

SW_C6:                                            ; preds = %SW_C4
  br label %BB1

SW_C7:                                            ; preds = %SW_C7, %SW_C4
  %C12 = icmp sge i64 %L3, %L3
  store i1 %C12, ptr @G.5, align 1
  br i1 %L7, label %SW_C7, label %BB1
}

; Function Attrs: nounwind
declare i1 @extractelt_v16i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v32i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v64i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v128i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v256i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v1i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v2i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v4i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v8i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v16i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v32i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v64i1_idx0(ptr) #0

; Function Attrs: nounwind
define i1 @extractelt_v128i1_idx0(ptr %x) #0 {
  %LGV1 = load <2 x i64>, ptr @G.8, align 16
  %A20 = alloca i1, align 1
  store i1 false, ptr %A20, align 1
  %A17 = alloca i1, align 1
  store i1 false, ptr %A17, align 1
  %A13 = alloca i1, align 1
  store i1 true, ptr %A13, align 1
  %A11 = alloca i1, align 1
  store i1 true, ptr %A11, align 1
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %G3 = getelementptr ptr, ptr %x, i64 0
  %L = load i64, ptr %G3, align 4
  %LGV = load i128, ptr @G.1, align 4
  %a = load <128 x i8>, ptr %x, align 128
  switch i64 %L, label %SW_D [
    i64 7866001166238367967, label %SW_C
    i64 8053183849284403055, label %SW_C4
    i64 3656351730894554702, label %SW_C5
    i64 -93071573734254244, label %SW_C6
    i64 6281825630107969787, label %SW_C7
    i64 -4869394737951714450, label %SW_C8
    i64 272186364064208078, label %SW_C9
    i64 3546478522271737287, label %SW_C10
  ]

BB:                                               ; preds = %SW_C10, %SW_C9, %SW_C7, %SW_C5, %SW_C4, %SW_C, %SW_D
  %C = icmp eq i128 %LGV, 0
  %b = icmp eq <128 x i8> %a, zeroinitializer
  %c = extractelement <128 x i1> %b, i64 0
  store i1 %C, ptr poison, align 1
  store ptr %G3, ptr %A, align 8
  ret i1 %c

SW_D:                                             ; preds = %SW_D, %0
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  %1 = phi <2 x i64> [ %LGV1, %0 ]
  store <2 x i64> %1, ptr %A20, align 16
  br label %BB

SW_C4:                                            ; preds = %SW_C4, %0
  %L14 = load i1, ptr %A13, align 1
  br i1 %L14, label %BB, label %SW_C4

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  %LGV15 = load i1, ptr @G.4, align 1
  ret i1 false

SW_C7:                                            ; preds = %SW_C7, %0
  %LGV16 = load i1, ptr @G, align 1
  %L18 = load i1, ptr %A17, align 1
  br i1 %L18, label %BB, label %SW_C7

SW_C8:                                            ; preds = %0
  ret i1 true

SW_C9:                                            ; preds = %0
  br label %BB

SW_C10:                                           ; preds = %SW_C10, %0
  %LGV19 = load i1, ptr @G.4, align 1
  %L21 = load i1, ptr %A20, align 1
  br i1 %L21, label %SW_C10, label %BB
}

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

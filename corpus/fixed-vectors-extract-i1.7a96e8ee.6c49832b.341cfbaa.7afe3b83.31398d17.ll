; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+zfa,+zfh,+c,+v,+zicsr -O1
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
@G.8 = global ptr poison
@G.9 = global <1 x i1> zeroinitializer
@G.10 = global i128 0
@G.11 = global i128 0
@G.12 = global <128 x i1> zeroinitializer
@G.13 = global i128 0
@G.14 = global i64 42
@G.15 = global <4 x i32> splat (i32 -1)

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %LGV6 = load i64, ptr @G.14, align 4
  %LGV4 = load i128, ptr @G.10, align 4
  %B5 = add i128 0, %LGV4
  %a = load <1 x i8>, ptr %x, align 1
  %C2 = icmp slt i1 false, false
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %B = sub i128 %B5, 42
  %c = extractelement <1 x i1> %b, i64 %idx
  %B1 = shl i64 %idx, %idx
  %G = getelementptr i16, ptr %x, i1 false
  store ptr %G, ptr @G.3, align 8
  %B7 = and i64 %idx, %LGV6
  store i64 %B1, ptr %G, align 4
  %C3 = fcmp true float 4.200000e+01, 4.200000e+01
  store i1 %C3, ptr @G.4, align 1
  %C1 = icmp ugt <1 x i8> %a, zeroinitializer
  store <1 x i1> %C1, ptr @G.9, align 1
  store i1 %C2, ptr @G.4, align 1
  store i128 %B, ptr @G.11, align 4
  store i64 %B7, ptr @G.14, align 4
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v2i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v4i1(ptr, i64) #0

; Function Attrs: nounwind
define i1 @extractelt_v8i1(ptr %x, i64 %idx) #0 {
  %A12 = alloca i1, align 1
  store i1 true, ptr %A12, align 1
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

BB:                                               ; preds = %SW_C4, %SW_C2, %SW_C, %BB3
  ret i1 %c

SW_D:                                             ; preds = %0
  %LGV4 = load i128, ptr @G.13, align 4
  switch i128 %LGV4, label %SW_D5 [
    i128 14642328600451723768, label %SW_C6
    i128 15550010939144378975, label %SW_C7
    i128 17955404283361775121, label %SW_C8
    i128 3817969332948839449, label %SW_C9
    i128 17877647211177765429, label %SW_C10
    i128 18027643775029342501, label %SW_C11
  ]

BB3:                                              ; preds = %SW_C10, %SW_C8, %SW_C7, %SW_C6, %SW_D5
  %LGV8 = load <8 x i8>, ptr @G.6, align 8
  %B = xor <8 x i8> splat (i8 -128), %LGV8
  %G3 = getelementptr i128, ptr %x, i64 %idx
  store <8 x i8> %B, ptr @G.7, align 8
  store ptr %G3, ptr %A12, align 8
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %G2 = getelementptr i64, ptr %A, i1 %C
  %LGV = load i1, ptr @G.5, align 1
  store ptr %G2, ptr poison, align 8
  br i1 %LGV, label %SW_C, label %BB

SW_C1:                                            ; preds = %0
  %G = getelementptr i128, ptr %x, i64 %idx
  store ptr %G, ptr %A6, align 8
  ret i1 %C

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  %B2 = sdiv i1 true, true
  store i1 %B2, ptr poison, align 1
  ret i1 %c

SW_C4:                                            ; preds = %SW_C4, %0
  %L7 = load i1, ptr %A6, align 1
  br i1 %L7, label %BB, label %SW_C4

SW_D5:                                            ; preds = %SW_D
  br label %BB3

SW_C6:                                            ; preds = %SW_C6, %SW_D
  %L13 = load i1, ptr %A12, align 1
  br i1 %L13, label %SW_C6, label %BB3

SW_C7:                                            ; preds = %SW_D
  br label %BB3

SW_C8:                                            ; preds = %SW_D
  br label %BB3

SW_C9:                                            ; preds = %SW_D
  ret i1 false

SW_C10:                                           ; preds = %SW_C10, %SW_D
  %G4 = getelementptr i128, ptr %x, i1 %c
  store ptr %G4, ptr @G.8, align 8
  br i1 %C, label %BB3, label %SW_C10

SW_C11:                                           ; preds = %SW_D
  ret i1 true
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
  %A1 = alloca ptr, align 8
  store ptr poison, ptr %A1, align 8
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
  %LGV1 = load <128 x i1>, ptr @G.12, align 16
  %C = icmp eq i128 %LGV, 0
  %b = icmp eq <128 x i8> %a, zeroinitializer
  %B = or <128 x i1> %b, %LGV1
  %c = extractelement <128 x i1> %B, i64 0
  store i1 %C, ptr poison, align 1
  %G4 = getelementptr ptr, ptr %x, i1 %C
  store ptr %G3, ptr %A, align 8
  store ptr %G4, ptr @G.8, align 8
  ret i1 %c

SW_D:                                             ; preds = %SW_D, %0
  %L12 = load i1, ptr %A11, align 1
  br i1 %L12, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  %G1 = getelementptr <8 x i8>, ptr %x, i128 %LGV
  store ptr %G1, ptr %A1, align 8
  br label %BB

SW_C4:                                            ; preds = %SW_C4, %0
  %L14 = load i1, ptr %A13, align 1
  %G6 = getelementptr ptr, ptr %x, i128 %LGV
  store ptr %G6, ptr poison, align 8
  br i1 %L14, label %BB, label %SW_C4

SW_C5:                                            ; preds = %0
  %G5 = getelementptr i128, ptr %A13, i8 127
  store ptr %G5, ptr %A1, align 8
  br label %BB

SW_C6:                                            ; preds = %0
  %G7 = getelementptr ptr, ptr %A1, i64 %L
  %LGV15 = load i1, ptr @G.4, align 1
  %G = getelementptr <128 x i8>, ptr %x, i1 %LGV15
  store ptr %G, ptr %A1, align 8
  store ptr %G7, ptr %G, align 8
  ret i1 false

SW_C7:                                            ; preds = %SW_C7, %0
  %B3 = or <4 x i32> splat (i32 42), splat (i32 2147483647)
  %L18 = load i1, ptr %A17, align 1
  store <4 x i32> %B3, ptr @G.15, align 16
  br i1 %L18, label %BB, label %SW_C7

SW_C8:                                            ; preds = %0
  ret i1 true

SW_C9:                                            ; preds = %0
  br label %BB

SW_C10:                                           ; preds = %SW_C10, %0
  %L21 = load i1, ptr %A20, align 1
  br i1 %L21, label %SW_C10, label %BB
}

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

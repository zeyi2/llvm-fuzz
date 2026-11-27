; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zfa,+zfh,+d,+m -O2
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
@G.8 = global i1 false

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %B = udiv i64 %idx, 0
  %a = load <1 x i8>, ptr %x, align 1
  %G2 = getelementptr float, ptr %x, i64 %idx
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 %idx
  %G = getelementptr i16, ptr %x, i1 false
  store ptr %G, ptr @G.3, align 8
  store i64 %B, ptr %G, align 4
  %C = icmp uge i1 %c, true
  store i1 %C, ptr @G.4, align 1
  store ptr %G2, ptr %G, align 8
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v2i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v4i1(ptr, i64) #0

; Function Attrs: nounwind
define i1 @extractelt_v8i1(ptr %x, i64 %idx) #0 {
  %A1 = alloca i1, align 1
  store i1 poison, ptr %A1, align 1
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

BB:                                               ; preds = %SW_C4, %SW_C2, %SW_C, %SW_D
  ret i1 %c

SW_D:                                             ; preds = %0
  %LGV8 = load <8 x i8>, ptr @G.6, align 8
  %B = xor <8 x i8> splat (i8 -128), %LGV8
  store <8 x i8> %B, ptr @G.7, align 8
  store <8 x i8> %LGV8, ptr %A6, align 8
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %LGV = load i1, ptr @G.5, align 1
  store i1 %LGV, ptr poison, align 1
  br i1 %LGV, label %SW_C, label %BB

SW_C1:                                            ; preds = %0
  ret i1 %C

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  ret i1 %c

SW_C4:                                            ; preds = %SW_C4, %0
  %L7 = load i1, ptr %A6, align 1
  store i1 %L7, ptr %A1, align 1
  br i1 %L7, label %BB, label %SW_C4
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
  %A19 = alloca i1, align 1
  store i1 false, ptr %A19, align 1
  %A3 = alloca i64, align 8
  store i64 1, ptr %A3, align 4
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

BB:                                               ; preds = %BB2, %SW_C9, %SW_C7, %SW_C5, %SW_C4, %SW_C, %SW_D
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
  br label %BB

SW_C4:                                            ; preds = %SW_C4, %0
  %L14 = load i1, ptr %A13, align 1
  br i1 %L14, label %BB, label %SW_C4

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  ret i1 false

SW_C7:                                            ; preds = %SW_C7, %0
  %LGV16 = load i1, ptr @G, align 1
  %C1 = icmp ne i1 %LGV16, %LGV16
  br i1 %C1, label %BB, label %SW_C7

SW_C8:                                            ; preds = %0
  ret i1 true

SW_C9:                                            ; preds = %0
  br label %BB

SW_C10:                                           ; preds = %BB2, %0
  %L4 = load i64, ptr %A3, align 4
  switch i64 %L4, label %SW_D5 [
    i64 145629020820425594, label %SW_C11
    i64 444328613960116254, label %SW_C12
    i64 -7884386894448504635, label %SW_C13
    i64 -5844013737015823230, label %SW_C14
    i64 -5474090767208144332, label %SW_C15
  ]

BB2:                                              ; preds = %SW_C15, %SW_C14, %SW_C13, %SW_C11, %SW_D5
  %L21 = load i1, ptr %A20, align 1
  br i1 %L21, label %SW_C10, label %BB

SW_D5:                                            ; preds = %SW_C10
  br label %BB2

SW_C11:                                           ; preds = %SW_C11, %SW_C10
  %LGV17 = load i1, ptr @G.8, align 1
  br i1 %LGV17, label %BB2, label %SW_C11

SW_C12:                                           ; preds = %SW_C10
  %LGV18 = load i1, ptr @G.8, align 1
  ret i1 false

SW_C13:                                           ; preds = %SW_C10
  br label %BB2

SW_C14:                                           ; preds = %SW_C10
  br label %BB2

SW_C15:                                           ; preds = %SW_C15, %SW_C10
  %L20 = load i1, ptr %A19, align 1
  br i1 %L20, label %SW_C15, label %BB2
}

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

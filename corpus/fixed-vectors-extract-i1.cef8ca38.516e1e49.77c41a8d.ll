; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+v,+zbs,+zfa -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 18446744073709551616
@G.1 = global i8 42
@G.2 = global i1 false
@G.3 = global i128 18446744073709551616
@G.4 = global ptr poison
@G.5 = global i16 -1

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %A2 = alloca ptr, align 8
  %L = load i1, ptr %A2, align 1
  store ptr poison, ptr %A2, align 8
  %G1 = getelementptr ptr, ptr %x, i1 %L
  %LGV1 = load i128, ptr @G.3, align 4
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %a = load <1 x i8>, ptr %x, align 1
  %G = getelementptr ptr, ptr %x, i128 %LGV1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %B = mul <4 x i32> zeroinitializer, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 %idx
  store <4 x i32> %B, ptr %A, align 16
  store ptr %G, ptr %A2, align 8
  store ptr %G1, ptr %A, align 8
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v2i1(ptr, i64) #0

; Function Attrs: nounwind
define i1 @extractelt_v4i1(ptr %x, i64 %idx) #0 {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i8, ptr @G.1, align 1
  %a = load <4 x i8>, ptr %x, align 4
  switch i8 %LGV, label %SW_D [
    i8 -11, label %SW_C
    i8 117, label %SW_C1
    i8 -128, label %SW_C2
    i8 -38, label %SW_C3
    i8 12, label %SW_C4
  ]

BB:                                               ; preds = %BB1, %SW_C3, %SW_C2, %SW_C1, %SW_D
  %b = icmp eq <4 x i8> %a, zeroinitializer
  %c = extractelement <4 x i1> %b, i64 %idx
  ret i1 %c

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  ret i1 true

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %SW_C3, %0
  %LGV5 = load i1, ptr @G.2, align 1
  %C = icmp eq i1 %LGV5, false
  store i1 %C, ptr @G.2, align 1
  br i1 %LGV5, label %BB, label %SW_C3

SW_C4:                                            ; preds = %BB1, %0
  %LGV2 = load i16, ptr @G.5, align 2
  switch i16 %LGV2, label %SW_D3 [
    i16 25316, label %SW_C5
    i16 12030, label %SW_C6
  ]

BB1:                                              ; preds = %SW_C6
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %SW_C4

SW_D3:                                            ; preds = %SW_C4
  ret i1 false

SW_C5:                                            ; preds = %SW_C4
  ret i1 true

SW_C6:                                            ; preds = %SW_C4
  br label %BB1
}

; Function Attrs: nounwind
declare i1 @extractelt_v8i1(ptr, i64) #0

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
define i1 @extractelt_v64i1_idx0(ptr %x) #0 {
  %B = lshr i1 true, false
  %A7 = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A7, align 1
  %A = alloca i1, align 1
  %L3 = load i128, ptr %A, align 4
  store i1 poison, ptr %A, align 1
  %LGV = load i128, ptr @G, align 4
  %a = load <64 x i8>, ptr %x, align 64
  %G = getelementptr bfloat, ptr %x, i128 %L3
  %b = icmp eq <64 x i8> %a, zeroinitializer
  %C6 = fcmp ule <4 x float> splat (float 1.000000e+00), zeroinitializer
  %c = extractelement <64 x i1> %b, i64 0
  %C = icmp ugt i128 18446744073709551616, %LGV
  store i1 %C, ptr %A, align 1
  store ptr %G, ptr @G.4, align 8
  store <4 x i1> %C6, ptr %A7, align 1
  store i1 %B, ptr %G, align 1
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v128i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

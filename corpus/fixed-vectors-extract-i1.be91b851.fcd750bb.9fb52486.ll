; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+v,+zbs -O0 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 -1
@G.1 = global i16 0
@G.2 = global i1 false
@G.3 = global <8 x i8> splat (i8 127)
@G.4 = global i8 0
@G.5 = global i8 -128
@G.6 = global ptr poison
@G.7 = global i64 0
@G.8 = global <4 x i32> splat (i32 -1)

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %A7 = alloca i1, align 1
  store i1 false, ptr %A7, align 1
  %A2 = alloca i64, align 8
  store i64 -9223372036854775808, ptr %A2, align 4
  %L3 = load i64, ptr %A2, align 4
  switch i64 %L3, label %SW_D [
    i64 644086764822543288, label %SW_C
    i64 -5813704341727249848, label %SW_C4
    i64 -8700007828497559071, label %SW_C5
    i64 -2239859248994483442, label %SW_C6
  ]

BB1:                                              ; preds = %SW_C6, %SW_C5, %SW_C4, %SW_C, %SW_D
  %A1 = alloca i1, align 1
  store i1 false, ptr %A1, align 1
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %LGV = load i8, ptr @G.4, align 1
  %B = sub i8 0, %LGV
  %c = extractelement <1 x i1> %b, i64 %idx
  store i8 %B, ptr @G.5, align 1
  ret i1 %c

T:                                                ; preds = %BB1
  %LGV1 = load i64, ptr @G.7, align 4
  %C = icmp ult i64 %idx, %LGV1
  store i1 %C, ptr %A1, align 1
  br label %BB

F:                                                ; preds = %F, %BB1
  %L2 = load i1, ptr %A1, align 1
  br i1 %L2, label %F, label %BB

SW_D:                                             ; preds = %0
  br label %BB1

SW_C:                                             ; preds = %0
  br label %BB1

SW_C4:                                            ; preds = %0
  br label %BB1

SW_C5:                                            ; preds = %0
  br label %BB1

SW_C6:                                            ; preds = %SW_C6, %0
  %L8 = load i1, ptr %A7, align 1
  br i1 %L8, label %BB1, label %SW_C6
}

; Function Attrs: nounwind
declare i1 @extractelt_v2i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v4i1(ptr, i64) #0

; Function Attrs: nounwind
define i1 @extractelt_v8i1(ptr %x, i64 %idx) #0 {
  %A = alloca <8 x i8>, align 8
  %L = load double, ptr %A, align 8
  store <8 x i8> poison, ptr %A, align 8
  %LGV = load <8 x i8>, ptr @G.3, align 8
  %B4 = and <8 x i8> %LGV, %LGV
  %a = load <8 x i8>, ptr %x, align 8
  %b = icmp eq <8 x i8> %a, zeroinitializer
  %C = fcmp olt double %L, 4.940660e-324
  %c = extractelement <8 x i1> %b, i64 %idx
  %B = mul <8 x i8> %a, %LGV
  store <8 x i8> %B, ptr %A, align 8
  %G = getelementptr <8 x i8>, ptr %x, i1 %c
  store ptr %G, ptr @G.6, align 8
  store <8 x i8> %B4, ptr @G.3, align 8
  ret i1 %C
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
define i1 @extractelt_v4i1_idx0(ptr %x) #0 {
  %LGV = load i16, ptr @G.1, align 2
  %a = load <4 x i8>, ptr %x, align 4
  %B2 = and <4 x i8> %a, zeroinitializer
  %C = icmp sgt i16 256, %LGV
  %B = and <4 x i32> splat (i32 65536), splat (i32 1)
  %b = icmp eq <4 x i8> %a, zeroinitializer
  %c = extractelement <4 x i1> %b, i64 0
  store i1 %C, ptr @G.2, align 1
  store <4 x i32> %B, ptr @G.8, align 16
  store <4 x i8> %B2, ptr poison, align 4
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v8i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v16i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v32i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v64i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v128i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

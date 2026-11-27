; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zfh,+zfhmin -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i128 170141183460469231731687303715884105727
@G.2 = global i16 42
@G.3 = global ptr poison
@G.4 = global <4 x float> splat (float 1.401300e-45)
@G.5 = global ptr poison
@G.6 = global ptr poison
@G.7 = global i1 false
@G.8 = global double 1.000000e+00
@G.9 = global i16 0
@G.10 = global float 4.200000e+01
@G.11 = global float f0x7F7FFFFF
@G.12 = global <8 x i8> splat (i8 -1)

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %A3 = alloca i1, align 1
  store i1 true, ptr %A3, align 1
  %LGV2 = load float, ptr @G.10, align 4
  %A8 = alloca ptr, align 8
  store ptr poison, ptr %A8, align 8
  %A4 = alloca i16, align 2
  %L2 = load i1, ptr %A4, align 1
  store i16 poison, ptr %A4, align 2
  %LGV = load i16, ptr @G.9, align 2
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %G1 = getelementptr <4 x float>, ptr %x, i1 false
  %L = load i64, ptr %G1, align 4
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %L4 = load i1, ptr %A3, align 1
  br i1 %L4, label %T, label %F

BB1:                                              ; preds = %T
  %c = extractelement <1 x i1> %b, i64 %idx
  %G = getelementptr i16, ptr %x, i1 false
  %G7 = getelementptr i64, ptr %G1, i1 %c
  %C2 = icmp eq i64 %L, 9223372036854775807
  store ptr %G, ptr @G.3, align 8
  switch i16 %LGV, label %SW_D [
    i16 10611, label %SW_C
    i16 28195, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_D
  %C = icmp sle i64 %idx, %L
  store ptr %G1, ptr @G.5, align 8
  %B = srem i16 0, %LGV
  store i1 %C, ptr @G.7, align 1
  store i1 %C2, ptr %A, align 1
  store i16 %B, ptr %A4, align 2
  store ptr %G7, ptr %A8, align 8
  ret i1 %c

SW_D:                                             ; preds = %BB1
  br label %BB

SW_C:                                             ; preds = %BB1
  %1 = phi float [ %LGV2, %BB1 ]
  store float %1, ptr @G.11, align 4
  ret i1 %c

SW_C1:                                            ; preds = %BB1
  br label %BB

T:                                                ; preds = %0
  br label %BB1

F:                                                ; preds = %0
  ret i1 %L4
}

; Function Attrs: nounwind
declare i1 @extractelt_v2i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v4i1(ptr, i64) #0

; Function Attrs: nounwind
define i1 @extractelt_v8i1(ptr %x, i64 %idx) #0 {
  %A3 = alloca i1, align 1
  store i1 poison, ptr %A3, align 1
  %A10 = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A10, align 16
  %A = alloca <8 x i8>, align 8
  %L1 = load i64, ptr %A, align 4
  store <8 x i8> poison, ptr %A, align 8
  %LGV4 = load <8 x i8>, ptr @G.12, align 8
  %a = load <8 x i8>, ptr %x, align 8
  %C = icmp ne i8 42, 0
  %G2 = getelementptr i1, ptr %x, i64 %idx
  %L3 = load <8 x i8>, ptr %G2, align 8
  %b = icmp eq <8 x i8> %a, zeroinitializer
  %G = getelementptr i16, ptr %x, i16 1
  %L6 = load double, ptr %G, align 8
  %L = load double, ptr %G, align 8
  %L4 = load i16, ptr %G, align 2
  %B5 = xor <8 x i8> %L3, %LGV4
  %C2 = icmp sgt i64 %idx, %L1
  %B9 = sub <4 x i32> splat (i32 1), splat (i32 2147483647)
  %C5 = icmp ult i16 1, %L4
  %c = extractelement <8 x i1> %b, i64 %idx
  store i1 %C, ptr @G, align 1
  %B2 = or i1 %C5, true
  store ptr %G, ptr @G.5, align 8
  store ptr %G2, ptr @G.6, align 8
  store i1 %C5, ptr @G, align 1
  %B = fdiv double %L, %L6
  store double %B, ptr @G.8, align 8
  store i1 %B2, ptr @G, align 1
  store <8 x i8> %B5, ptr %A, align 8
  store <4 x i32> %B9, ptr %A10, align 16
  store i1 %C2, ptr %A3, align 1
  ret i1 %c
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
  %C5 = fcmp ule double 4.940660e-324, +qnan
  %A5 = alloca <128 x i1>, align 16
  store <128 x i1> poison, ptr %A5, align 16
  %A = alloca i1, align 1
  %L = load i32, ptr %A, align 4
  store i1 poison, ptr %A, align 1
  %C2 = fcmp oge float +qnan, +inf
  %G7 = getelementptr i1, ptr %A5, i32 %L
  %G = getelementptr i1, ptr %x, i8 -1
  %LGV = load i128, ptr @G.1, align 4
  %a = load <128 x i8>, ptr %x, align 128
  %C = icmp eq i128 %LGV, 0
  %b = icmp eq <128 x i8> %a, zeroinitializer
  %c = extractelement <128 x i1> %b, i64 0
  store i1 %C, ptr %G, align 1
  store i1 %C2, ptr poison, align 1
  %C3 = icmp uge i1 %C, true
  %C4 = icmp ult <128 x i8> %a, zeroinitializer
  store i1 %C3, ptr %A, align 1
  store <128 x i1> %C4, ptr %A5, align 16
  store i1 %C5, ptr %G, align 1
  store ptr %G7, ptr @G.5, align 8
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

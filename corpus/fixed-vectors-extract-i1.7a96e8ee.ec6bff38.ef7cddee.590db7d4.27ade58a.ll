; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zfh,+f,+a,+zihintpause -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i128 170141183460469231731687303715884105727
@G.2 = global i16 42
@G.3 = global ptr poison
@G.4 = global i1 false
@G.5 = global i128 1
@G.6 = global float 4.200000e+01
@G.7 = global i1 false

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %A6 = alloca ptr, align 8
  store ptr poison, ptr %A6, align 8
  %G = getelementptr i16, ptr %x, i1 false
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %G6 = getelementptr <1 x i1>, ptr %x, i64 %idx
  %G3 = getelementptr ptr, ptr %x, i16 42
  %L4 = load i32, ptr %G3, align 4
  %L3 = load float, ptr %G, align 4
  %a = load <1 x i8>, ptr %x, align 1
  %L2 = load double, ptr %G, align 8
  %L1 = load float, ptr %G, align 4
  %B = fsub double 1.000000e+00, %L2
  %G9 = getelementptr ptr, ptr %A, i64 %idx
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %C = fcmp oeq float %L1, %L3
  %c = extractelement <1 x i1> %b, i64 %idx
  %L = load i8, ptr %G, align 1
  %LGV7 = load float, ptr @G.6, align 4
  %G1 = getelementptr i1, ptr %x, i8 %L
  store ptr %G3, ptr %G1, align 8
  %G4 = getelementptr ptr, ptr %x, i64 %idx
  store ptr %G6, ptr %G1, align 8
  store ptr %G4, ptr %G, align 8
  store double %B, ptr %G1, align 8
  store i1 %C, ptr %G1, align 1
  %G5 = getelementptr i1, ptr %x, i32 %L4
  store ptr %G, ptr @G.3, align 8
  %C8 = fcmp false float %L1, %LGV7
  store i1 %C8, ptr @G.4, align 1
  store ptr %G1, ptr %A, align 8
  store ptr %G9, ptr @G.3, align 8
  store ptr %G5, ptr %A6, align 8
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v2i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v4i1(ptr, i64) #0

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
declare i1 @extractelt_v64i1_idx0(ptr) #0

; Function Attrs: nounwind
define i1 @extractelt_v128i1_idx0(ptr %x) #0 {
  %A5 = alloca ptr, align 8
  store ptr poison, ptr %A5, align 8
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load i1, ptr @G.7, align 1
  %G = getelementptr <4 x i32>, ptr %x, i32 1
  %L1 = load i128, ptr %G, align 4
  %L4 = load i16, ptr %G, align 2
  %L = load double, ptr %G, align 8
  %LGV = load i128, ptr @G.1, align 4
  %a = load <128 x i8>, ptr %x, align 128
  %C7 = fcmp oeq double %L, +inf
  %C2 = icmp sge i128 %LGV, 18446744073709551616
  %b = icmp eq <128 x i8> %a, zeroinitializer
  %c = extractelement <128 x i1> %b, i64 0
  store i1 %C7, ptr poison, align 1
  store i1 %C2, ptr @G.4, align 1
  store ptr %G, ptr poison, align 8
  store i1 %C7, ptr poison, align 1
  %B = and i128 %LGV, %L1
  %G5 = getelementptr <8 x i8>, ptr %x, i16 %L4
  store i128 %L1, ptr @G.5, align 4
  switch i1 %LGV1, label %SW_D [
    i1 false, label %SW_C
    i1 true, label %SW_C2
  ]

BB:                                               ; preds = %SW_C
  store ptr %G5, ptr poison, align 8
  store i128 %B, ptr @G.5, align 4
  ret i1 %c

SW_D:                                             ; preds = %0
  %G4 = getelementptr ptr, ptr %x, i8 127
  %LGV3 = load i1, ptr @G, align 1
  store i1 %LGV3, ptr %A, align 1
  store ptr %G4, ptr %A5, align 8
  ret i1 false

SW_C:                                             ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  ret i1 %C7
}

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

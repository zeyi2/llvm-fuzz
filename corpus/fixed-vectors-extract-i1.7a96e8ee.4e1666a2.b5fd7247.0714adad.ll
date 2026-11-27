; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zfa,+zfh,+zve32x -O3
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
@G.10 = global ptr poison

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %A5 = alloca i1, align 1
  store i1 poison, ptr %A5, align 1
  %A8 = alloca ptr, align 8
  store ptr poison, ptr %A8, align 8
  %A4 = alloca i16, align 2
  store i16 poison, ptr %A4, align 2
  %LGV = load i16, ptr @G.9, align 2
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %G1 = getelementptr <4 x float>, ptr %x, i1 false
  %L3 = load i1, ptr %G1, align 1
  %L = load i64, ptr %G1, align 4
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 %idx
  %G = getelementptr i16, ptr %x, i1 false
  %G2 = getelementptr i16, ptr %G1, i64 %idx
  %G7 = getelementptr i64, ptr %G1, i1 %c
  %C2 = icmp eq i64 %L, 9223372036854775807
  store ptr %G, ptr @G.3, align 8
  %C = icmp sle i64 %idx, %L
  store ptr %G1, ptr @G.5, align 8
  %B = srem i16 0, %LGV
  store i1 %C, ptr @G.7, align 1
  store i1 %C2, ptr %A, align 1
  store i16 %B, ptr %A4, align 2
  %B4 = or i1 %C2, %L3
  store ptr %G7, ptr %A8, align 8
  store ptr %G2, ptr @G.6, align 8
  store i1 %B4, ptr %A5, align 1
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v2i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v4i1(ptr, i64) #0

; Function Attrs: nounwind
define i1 @extractelt_v8i1(ptr %x, i64 %idx) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i1, ptr @G.7, align 1
  %L1 = load i1, ptr %A, align 1
  br i1 %L1, label %T, label %F

BB:                                               ; preds = %F
  %a = load <8 x i8>, ptr %x, align 8
  %C = icmp ne i8 42, 0
  %G2 = getelementptr i1, ptr %x, i64 %idx
  %b = icmp eq <8 x i8> %a, zeroinitializer
  %G = getelementptr i16, ptr %x, i16 1
  %L6 = load double, ptr %G, align 8
  %L = load double, ptr %G, align 8
  %L4 = load i16, ptr %G, align 2
  %C5 = icmp ult i16 1, %L4
  %c = extractelement <8 x i1> %b, i64 %idx
  store i1 %C, ptr @G, align 1
  store ptr %G, ptr @G.5, align 8
  store ptr %G2, ptr @G.6, align 8
  store i1 %C5, ptr @G, align 1
  %B = fdiv double %L, %L6
  store double %B, ptr @G.8, align 8
  ret i1 %c

T:                                                ; preds = %0
  ret i1 %LGV

F:                                                ; preds = %0
  %G3 = getelementptr i1, ptr %A, i16 0
  store ptr %G3, ptr @G.3, align 8
  br label %BB
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
  %C2 = fcmp oge float +qnan, +inf
  %G = getelementptr i1, ptr %x, i8 -1
  %L = load i16, ptr %G, align 2
  %LGV = load i128, ptr @G.1, align 4
  %G2 = getelementptr i1, ptr %x, i16 %L
  %a = load <128 x i8>, ptr %x, align 128
  %C = icmp eq i128 %LGV, 0
  %b = icmp eq <128 x i8> %a, zeroinitializer
  %c = extractelement <128 x i1> %b, i64 0
  store i1 %C, ptr %G, align 1
  store i1 %C2, ptr poison, align 1
  store ptr %G2, ptr @G.10, align 8
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

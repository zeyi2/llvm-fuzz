; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zvkb,+zfa,+zicsr -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <128 x i8> splat (i8 42)
@G.1 = global <8 x i1> zeroinitializer
@G.2 = global <4 x i32> zeroinitializer
@G.3 = global <4 x i32> splat (i32 1)
@G.4 = global i1 true
@G.5 = global i32 1
@G.6 = global i64 42

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %C = icmp ule i64 %idx, -9223372036854775808
  %a = load <1 x i8>, ptr %x, align 1
  %A2 = alloca double, align 8
  store double poison, ptr %A2, align 8
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %A = alloca i1, align 1
  %L = load i128, ptr %A, align 4
  %c = extractelement <1 x i1> %b, i64 %idx
  %A4 = alloca ptr, align 8
  store i1 %C, ptr %A, align 1
  %L1 = load double, ptr %A, align 8
  %B = fmul double +inf, %L1
  store ptr poison, ptr %A4, align 8
  %L3 = load i1, ptr %A, align 1
  store i1 poison, ptr %A, align 1
  %G1 = getelementptr double, ptr %x, i128 %L
  %G = getelementptr <2 x i64>, ptr %A2, i1 %L3
  store ptr %G, ptr %A4, align 8
  store double %B, ptr %A2, align 8
  store ptr %G1, ptr %G, align 8
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
define i1 @extractelt_v128i1(ptr %x, i64 %idx) #0 {
  %A9 = alloca i1, align 1
  store i1 poison, ptr %A9, align 1
  %A5 = alloca i1, align 1
  store i1 true, ptr %A5, align 1
  %A = alloca i1, align 1
  %L4 = load i1, ptr %A, align 1
  store i1 true, ptr %A, align 1
  %a = load <128 x i8>, ptr %x, align 128
  %B = add <128 x i8> %a, %a
  %b = icmp eq <128 x i8> %a, zeroinitializer
  br i1 %L4, label %T2, label %F3

BB1:                                              ; preds = %F3, %T2
  %LGV7 = load i1, ptr @G.4, align 1
  %L = load i1, ptr %A, align 1
  %G = getelementptr i16, ptr %x, i1 %LGV7
  store ptr %G, ptr %A5, align 8
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %LGV11 = load i64, ptr @G.6, align 4
  %LGV8 = load i32, ptr @G.5, align 4
  %c = extractelement <128 x i1> %b, i64 %idx
  %C = icmp sgt i32 42, %LGV8
  %B12 = ashr i64 %idx, %LGV11
  store <128 x i8> %B, ptr @G, align 128
  store i1 %C, ptr %A9, align 1
  store i64 %B12, ptr poison, align 4
  ret i1 %c

T:                                                ; preds = %BB1
  %LGV = load <4 x i32>, ptr @G.2, align 16
  %B2 = ashr <4 x i32> %LGV, zeroinitializer
  store <4 x i32> %B2, ptr @G.3, align 16
  br label %BB

F:                                                ; preds = %BB1
  br label %BB

T2:                                               ; preds = %0
  br label %BB1

F3:                                               ; preds = %F3, %0
  %L6 = load i1, ptr %A5, align 1
  br i1 %L6, label %F3, label %BB1
}

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
declare i1 @extractelt_v128i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+v,+zbs,+zvbb,+zvfh -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global <2 x i8> splat (i8 16)
@G.2 = global <8 x i8> splat (i8 1)

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %a = load <1 x i8>, ptr %x, align 1
  %I = insertelement <8 x i8> splat (i8 1), i8 127, i1 true
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 %idx
  store <8 x i8> %I, ptr @G.2, align 8
  ret i1 %c
}

; Function Attrs: nounwind
define i1 @extractelt_v2i1(ptr %x, i64 %idx) #0 {
  %C = icmp slt i64 %idx, 42
  %a = load <2 x i8>, ptr %x, align 2
  %b = icmp eq <2 x i8> %a, zeroinitializer
  %c = extractelement <2 x i1> %b, i64 %idx
  store i1 %C, ptr poison, align 1
  ret i1 %c
}

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
define i1 @extractelt_v2i1_idx0(ptr %x) #0 {
  %LGV = load <2 x i8>, ptr @G.1, align 2
  %a = load <2 x i8>, ptr %x, align 2
  %B = xor <2 x i8> %a, %LGV
  %b = icmp eq <2 x i8> %a, zeroinitializer
  %c = extractelement <2 x i1> %b, i64 0
  store <2 x i8> %B, ptr @G.1, align 2
  ret i1 %c
}

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
  %A = alloca <64 x i8>, align 64
  store <64 x i8> poison, ptr %A, align 64
  %a = load <64 x i8>, ptr %x, align 64
  %b = icmp eq <64 x i8> %a, zeroinitializer
  %c = extractelement <64 x i1> %b, i64 0
  %B = ashr <64 x i8> %a, splat (i8 -1)
  store <64 x i8> %B, ptr %A, align 64
  ret i1 %c
}

; Function Attrs: nounwind
define i1 @extractelt_v128i1_idx0(ptr %x) #0 {
  %G = getelementptr <vscale x 4 x i1>, ptr %x, i16 0
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i1, ptr @G, align 1
  %a = load <128 x i8>, ptr %x, align 128
  %b = icmp eq <128 x i8> %a, zeroinitializer
  %c = extractelement <128 x i1> %b, i64 0
  store ptr %G, ptr %A, align 8
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  ret i1 %c

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %F, label %BB
}

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

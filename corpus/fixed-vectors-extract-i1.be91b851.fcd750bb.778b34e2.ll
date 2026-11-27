; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+v,+zbs,+zfh -O1
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
@G.9 = global <4 x i8> zeroinitializer
@G.10 = global ptr poison

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
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

T:                                                ; preds = %0
  %LGV1 = load i64, ptr @G.7, align 4
  %C = icmp ult i64 %idx, %LGV1
  store i1 %C, ptr %A1, align 1
  br label %BB

F:                                                ; preds = %F, %0
  %C3 = icmp ult i64 %idx, 0
  br i1 %C3, label %F, label %BB
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
define i1 @extractelt_v4i1_idx0(ptr %x) #0 {
  %LGV1 = load <4 x i8>, ptr @G.9, align 4
  %LGV = load i16, ptr @G.1, align 2
  %a = load <4 x i8>, ptr %x, align 4
  %B2 = mul <4 x i8> %a, %LGV1
  %C = icmp sgt i16 256, %LGV
  %B = and <4 x i32> splat (i32 65536), splat (i32 1)
  %b = icmp eq <4 x i8> %a, zeroinitializer
  %c = extractelement <4 x i1> %b, i64 0
  store i1 %C, ptr @G.2, align 1
  %G = getelementptr ptr, ptr %x, i1 %C
  store <4 x i32> %B, ptr @G.8, align 16
  store <4 x i8> %B2, ptr @G.9, align 4
  store ptr %G, ptr @G.10, align 8
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

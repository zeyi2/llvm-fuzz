; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+v,+c -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 9223372036854775807
@G.1 = global <4 x float> splat (float 1.000000e+00)
@G.2 = global bfloat 3.389530e+38
@G.3 = global <4 x float> splat (float +inf)
@G.4 = global <4 x float> zeroinitializer
@G.5 = global <4 x i1> zeroinitializer
@G.6 = global i1 false
@G.7 = global ptr poison

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %LGV = load i1, ptr @G.6, align 1
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 %idx
  %C = icmp uge i1 %c, %LGV
  %B = srem i64 %idx, -9223372036854775808
  %G = getelementptr i1, ptr %x, i1 %LGV
  store i64 %B, ptr @G, align 4
  store i1 %C, ptr @G.6, align 1
  store ptr %G, ptr @G.7, align 8
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
define i1 @extractelt_v16i1_idx0(ptr %x) #0 {
  %LGV2 = load <4 x float>, ptr @G.4, align 16
  %LGV1 = load <4 x float>, ptr @G.3, align 16
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load bfloat, ptr @G.2, align 2
  %C = fcmp oeq bfloat %LGV, 9.183550e-41
  br i1 %C, label %T, label %F

BB:                                               ; preds = %F
  %C3 = fcmp olt <4 x float> %LGV1, %LGV2
  %a = load <16 x i8>, ptr %x, align 16
  %b = icmp eq <16 x i8> %a, zeroinitializer
  %c = extractelement <16 x i1> %b, i64 0
  store i1 %C, ptr %A, align 1
  store <4 x i1> %C3, ptr @G.5, align 1
  ret i1 %c

T:                                                ; preds = %0
  ret i1 false

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare i1 @extractelt_v32i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v64i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v128i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zbs,+d,+a -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global <16 x i8> zeroinitializer

; Function Attrs: nounwind
declare i1 @extractelt_v1i1(ptr, i64) #0

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
define i1 @extractelt_v1i1_idx0(ptr %x) #0 {
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 0
  %E = extractelement <1 x i1> %b, i1 %c
  ret i1 %E
}

; Function Attrs: nounwind
declare i1 @extractelt_v2i1_idx0(ptr) #0

; Function Attrs: nounwind
define i1 @extractelt_v4i1_idx0(ptr %x) #0 {
  %LGV = load i1, ptr @G, align 1
  %a = load <4 x i8>, ptr %x, align 4
  %b = icmp eq <4 x i8> %a, zeroinitializer
  %c = extractelement <4 x i1> %b, i64 0
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  ret i1 %c

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
declare i1 @extractelt_v8i1_idx0(ptr) #0

; Function Attrs: nounwind
define i1 @extractelt_v16i1_idx0(ptr %x) #0 {
  %a = load <16 x i8>, ptr %x, align 16
  %B = udiv <16 x i8> %a, %a
  %b = icmp eq <16 x i8> %a, zeroinitializer
  %c = extractelement <16 x i1> %b, i64 0
  store <16 x i8> %B, ptr @G.1, align 16
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v32i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v64i1_idx0(ptr) #0

; Function Attrs: nounwind
define i1 @extractelt_v128i1_idx0(ptr %x) #0 {
  %a = load <128 x i8>, ptr %x, align 128
  %b = icmp eq <128 x i8> %a, zeroinitializer
  %c = extractelement <128 x i1> %b, i64 0
  %C = icmp ne i1 %c, %c
  ret i1 %C
}

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -1
@G.1 = global float f0x7F7FFFFF
@G.2 = global float +inf

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %LGV = load float, ptr @G.1, align 4
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %B = fsub float f0x7F7FFFFF, %LGV
  %c = extractelement <1 x i1> %b, i64 %idx
  store float %B, ptr @G.2, align 4
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v2i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v4i1(ptr, i64) #0

; Function Attrs: nounwind
define i1 @extractelt_v8i1(ptr %x, i64 %idx) #0 {
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %LGV = load i8, ptr @G, align 1
  %B = or i8 0, %LGV
  %a = load <8 x i8>, ptr %x, align 8
  %b = icmp eq <8 x i8> %a, zeroinitializer
  %c = extractelement <8 x i1> %b, i64 %idx
  store i8 %B, ptr %A, align 1
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
define i1 @extractelt_v8i1_idx0(ptr %x) #0 {
  %a = load <8 x i8>, ptr %x, align 8
  %b = icmp eq <8 x i8> %a, zeroinitializer
  %c = extractelement <8 x i1> %b, i64 0
  %G = getelementptr <8 x i1>, ptr %x, i128 170141183460469231731687303715884105727
  store ptr %G, ptr poison, align 8
  ret i1 %c
}

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

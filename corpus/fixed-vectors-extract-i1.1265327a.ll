; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+v,+zbs,+zve32x,+zbb -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double f0x7FEFFFFFFFFFFFFF
@G.1 = global double 4.200000e+01
@G.2 = global <16 x i8> splat (i8 16)
@G.3 = global <2 x i64> splat (i64 -1)
@G.4 = global <2 x i8> splat (i8 1)

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 %idx
  %C = icmp sle i1 %c, %c
  store i1 %C, ptr %A, align 1
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v2i1(ptr, i64) #0

; Function Attrs: nounwind
declare i1 @extractelt_v4i1(ptr, i64) #0

; Function Attrs: nounwind
define i1 @extractelt_v8i1(ptr %x, i64 %idx) #0 {
  %a = load <8 x i8>, ptr %x, align 8
  %G = getelementptr <8 x i8>, ptr %x, i64 %idx
  %b = icmp eq <8 x i8> %a, zeroinitializer
  %c = extractelement <8 x i1> %b, i64 %idx
  store ptr %G, ptr poison, align 8
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v16i1(ptr, i64) #0

; Function Attrs: nounwind
define i1 @extractelt_v32i1(ptr %x, i64 %idx) #0 {
  %a = load <32 x i8>, ptr %x, align 32
  %b = icmp eq <32 x i8> %a, zeroinitializer
  %c = extractelement <32 x i1> %b, i64 %idx
  %I = insertelement <2 x i64> splat (i64 -9223372036854775808), i64 %idx, i64 %idx
  store <2 x i64> %I, ptr @G.3, align 16
  ret i1 %c
}

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
  %a = load <2 x i8>, ptr %x, align 2
  %B = urem <2 x i8> %a, splat (i8 127)
  %b = icmp eq <2 x i8> %a, zeroinitializer
  %c = extractelement <2 x i1> %b, i64 0
  store <2 x i8> %B, ptr @G.4, align 2
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v4i1_idx0(ptr) #0

; Function Attrs: nounwind
define i1 @extractelt_v8i1_idx0(ptr %x) #0 {
  %LGV = load double, ptr @G, align 8
  %a = load <8 x i8>, ptr %x, align 8
  %b = icmp eq <8 x i8> %a, zeroinitializer
  %B = fsub double 1.000000e+00, %LGV
  %c = extractelement <8 x i1> %b, i64 0
  store double %B, ptr @G.1, align 8
  ret i1 %c
}

; Function Attrs: nounwind
define i1 @extractelt_v16i1_idx0(ptr %x) #0 {
  %LGV1 = load <16 x i8>, ptr @G.2, align 16
  %a = load <16 x i8>, ptr %x, align 16
  %b = icmp eq <16 x i8> %a, zeroinitializer
  %B = and <16 x i8> %a, %LGV1
  %c = extractelement <16 x i1> %b, i64 0
  store <16 x i8> %B, ptr @G.2, align 16
  ret i1 %c
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

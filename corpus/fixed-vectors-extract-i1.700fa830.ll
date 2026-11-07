; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+v,+zbs,+zve64d,+c -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x float> splat (float +inf)
@G.1 = global <4 x i1> splat (i1 true)
@G.2 = global i64 4294967296
@G.3 = global i1 false
@G.4 = global float f0x7F7FFFFF

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %LGV = load i1, ptr @G.3, align 1
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 %idx
  %C = icmp sge i1 %c, %LGV
  store i1 %C, ptr @G.3, align 1
  ret i1 %c
}

; Function Attrs: nounwind
define i1 @extractelt_v2i1(ptr %x, i64 %idx) #0 {
  %LGV = load <4 x float>, ptr @G, align 16
  %C = fcmp true <4 x float> zeroinitializer, %LGV
  %a = load <2 x i8>, ptr %x, align 2
  %b = icmp eq <2 x i8> %a, zeroinitializer
  %C2 = fcmp false <4 x float> %LGV, %LGV
  %c = extractelement <2 x i1> %b, i64 %idx
  store <4 x i1> %C, ptr @G.1, align 1
  store <4 x i1> %C2, ptr poison, align 1
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
define i1 @extractelt_v256i1(ptr %x, i64 %idx) #0 {
  %LGV = load float, ptr @G.4, align 4
  %C = fcmp olt float f0x7F7FFFFF, %LGV
  ret i1 %C
}

; Function Attrs: nounwind
declare i1 @extractelt_v1i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v2i1_idx0(ptr) #0

; Function Attrs: nounwind
define i1 @extractelt_v4i1_idx0(ptr %x) #0 {
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %a = load <4 x i8>, ptr %x, align 4
  %b = icmp eq <4 x i8> %a, zeroinitializer
  %G = getelementptr ptr, ptr %x, i8 16
  %c = extractelement <4 x i1> %b, i64 0
  store ptr %G, ptr %A, align 8
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v8i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v16i1_idx0(ptr) #0

; Function Attrs: nounwind
define i1 @extractelt_v32i1_idx0(ptr %x) #0 {
  %a = load <32 x i8>, ptr %x, align 32
  %b = icmp eq <32 x i8> %a, zeroinitializer
  %c = extractelement <32 x i1> %b, i64 0
  %B = add i1 %c, true
  ret i1 %B
}

; Function Attrs: nounwind
define i1 @extractelt_v64i1_idx0(ptr %x) #0 {
  %A = alloca ptr, align 8
  %L = load double, ptr %A, align 8
  store ptr poison, ptr %A, align 8
  %LGV = load i64, ptr @G.2, align 4
  %a = load <64 x i8>, ptr %x, align 64
  %b = icmp eq <64 x i8> %a, zeroinitializer
  %B = fmul double %L, f0x7FEFFFFFFFFFFFFF
  %G = getelementptr i16, ptr %x, i64 %LGV
  %c = extractelement <64 x i1> %b, i64 0
  store ptr %G, ptr %A, align 8
  store double %B, ptr %G, align 8
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v128i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

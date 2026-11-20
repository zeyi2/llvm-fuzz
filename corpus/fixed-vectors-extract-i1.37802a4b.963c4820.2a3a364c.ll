; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zvkb -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <128 x i8> splat (i8 42)
@G.1 = global <8 x i1> zeroinitializer
@G.2 = global <4 x i32> zeroinitializer
@G.3 = global <4 x i32> splat (i32 1)

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %A4 = alloca ptr, align 8
  store ptr poison, ptr %A4, align 8
  %A2 = alloca double, align 8
  %G1 = getelementptr i32, ptr %x, i64 %idx
  store double poison, ptr %A2, align 8
  %A = alloca i1, align 1
  %L3 = load i1, ptr %A, align 1
  %G = getelementptr <2 x i64>, ptr %A2, i1 %L3
  %L1 = load double, ptr %A, align 8
  store i1 poison, ptr %A, align 1
  %B = fmul double +inf, %L1
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 %idx
  %C = icmp ule i64 %idx, -9223372036854775808
  store i1 %C, ptr %A, align 1
  store double %B, ptr %A2, align 8
  store ptr %G, ptr %A4, align 8
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
declare i1 @extractelt_v128i1_idx0(ptr) #0

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zfa,+zfh,+zicond,+zvfh,+zbkb,+zba,+xtheadba -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i128 170141183460469231731687303715884105727
@G.2 = global i16 42
@G.3 = global ptr poison
@G.4 = global i8 1
@G.5 = global <128 x i8> splat (i8 -128)
@G.6 = global <8 x i8> splat (i8 42)
@G.7 = global float +inf
@G.8 = global i1 true
@G.9 = global i1 true
@G.10 = global <2 x i64> splat (i64 42)
@G.11 = global i1 true

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %A = alloca ptr, align 8
  %a = load <1 x i8>, ptr %x, align 1
  %B = sdiv i8 -1, -128
  store ptr poison, ptr %A, align 8
  %B1 = urem i8 %B, %B
  %G = getelementptr i16, ptr %x, i1 false
  %G2 = getelementptr i1, ptr %x, i8 %B1
  store ptr %G, ptr @G.3, align 8
  %b = icmp eq <1 x i8> %a, zeroinitializer
  store i8 %B, ptr %G, align 1
  %B2 = or i8 %B1, 1
  %c = extractelement <1 x i1> %b, i64 %idx
  %G1 = getelementptr bfloat, ptr %x, i1 %c
  store ptr %G2, ptr %A, align 8
  store i8 %B1, ptr %G1, align 1
  store i8 %B2, ptr %G1, align 1
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

; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zbs,+zvbb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global ptr poison
@G.1 = global ptr poison
@G.2 = global i32 65536

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %A3 = alloca ptr, align 8
  store ptr poison, ptr %A3, align 8
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %a = load <1 x i8>, ptr %x, align 1
  %B1 = mul <1 x i8> %a, zeroinitializer
  %G = getelementptr ptr, ptr %A, i64 %idx
  %B = ashr i64 -1, %idx
  %b = icmp eq <1 x i8> %B1, zeroinitializer
  %G2 = getelementptr bfloat, ptr %x, i64 %idx
  %c = extractelement <1 x i1> %b, i64 %idx
  store i64 %B, ptr %A, align 4
  store ptr %G, ptr @G, align 8
  store ptr %G2, ptr %A3, align 8
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
  %LGV = load i32, ptr @G.2, align 4
  %a = load <128 x i8>, ptr %x, align 128
  %G1 = getelementptr i64, ptr %x, i128 -1
  %b = icmp eq <128 x i8> %a, zeroinitializer
  %c = extractelement <128 x i1> %b, i64 %idx
  %G = getelementptr inbounds double, ptr %x, i64 %idx
  %G2 = getelementptr i8, ptr %x, i32 %LGV
  store ptr %G, ptr poison, align 8
  store ptr %G1, ptr @G.1, align 8
  store ptr %G2, ptr @G.1, align 8
  ret i1 %c
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

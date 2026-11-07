; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+m -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <1 x i1> zeroinitializer

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %A = alloca <1 x i1>, align 1
  store <1 x i1> poison, ptr %A, align 1
  %LGV = load <1 x i1>, ptr @G, align 1
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %G = getelementptr <1 x i1>, ptr %x, i8 16
  %c = extractelement <1 x i1> %b, i64 %idx
  %C = icmp slt <1 x i1> %b, %LGV
  store <1 x i1> %C, ptr %G, align 1
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

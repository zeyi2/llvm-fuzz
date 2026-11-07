; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zbkb,+zfh -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float 4.200000e+01
@G.1 = global float f0x7F7FFFFF

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %LGV1 = load float, ptr @G.1, align 4
  %LGV = load float, ptr @G, align 4
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 %idx
  %B = fdiv float %LGV, %LGV1
  store float %B, ptr @G.1, align 4
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
  %a = load <16 x i8>, ptr %x, align 16
  %C = icmp uge <16 x i8> %a, %a
  %c = extractelement <16 x i1> %C, i64 0
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

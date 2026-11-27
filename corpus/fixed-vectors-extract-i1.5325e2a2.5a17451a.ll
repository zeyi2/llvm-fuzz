; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zbs -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 0
@G.1 = global i1 true

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %LGV = load i1, ptr @G.1, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %a = load <1 x i8>, ptr %x, align 1
  %B1 = shl i64 %idx, %idx
  %b = icmp eq <1 x i8> %a, zeroinitializer
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %T
  %C = fcmp oeq float 4.200000e+01, f0x7F7FFFFF
  %B = and i64 %idx, 4294967296
  %c = extractelement <1 x i1> %b, i64 %idx
  store i64 %B, ptr @G, align 4
  store i64 %B1, ptr @G, align 4
  store i1 %C, ptr %A, align 1
  ret i1 %c

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  ret i1 false
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

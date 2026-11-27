; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zfh,+f -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i128 170141183460469231731687303715884105727
@G.2 = global i16 42
@G.3 = global ptr poison
@G.4 = global i1 false
@G.5 = global i128 1
@G.6 = global float 4.200000e+01
@G.7 = global i32 65536

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %LGV = load i32, ptr @G.7, align 4
  %B1 = or i32 42, %LGV
  %G = getelementptr i16, ptr %x, i1 false
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %G6 = getelementptr <1 x i1>, ptr %x, i64 %idx
  %G3 = getelementptr ptr, ptr %x, i16 42
  %L3 = load float, ptr %G, align 4
  %a = load <1 x i8>, ptr %x, align 1
  %L2 = load double, ptr %G, align 8
  %L1 = load float, ptr %G, align 4
  %B = fsub double 1.000000e+00, %L2
  %G9 = getelementptr ptr, ptr %A, i64 %idx
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %C = fcmp oeq float %L1, %L3
  %c = extractelement <1 x i1> %b, i64 %idx
  %L = load i8, ptr %G, align 1
  %LGV7 = load float, ptr @G.6, align 4
  %G1 = getelementptr i1, ptr %x, i8 %L
  store ptr %G3, ptr %G1, align 8
  %G4 = getelementptr ptr, ptr %x, i64 %idx
  store ptr %G6, ptr %G1, align 8
  store ptr %G4, ptr %G, align 8
  store double %B, ptr %G1, align 8
  store i1 %C, ptr %G1, align 1
  store ptr %G, ptr @G.3, align 8
  %C8 = fcmp false float %L1, %LGV7
  store i1 %C8, ptr @G.4, align 1
  store ptr %G1, ptr %A, align 8
  store ptr %G9, ptr @G.3, align 8
  store i32 %B1, ptr %G, align 4
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

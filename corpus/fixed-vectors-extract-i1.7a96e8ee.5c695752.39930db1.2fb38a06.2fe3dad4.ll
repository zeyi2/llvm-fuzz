; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zfa,+zfh,+zicond,+zvfh,+zbkb,+zba -O2
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
  %B = sdiv i8 -1, -128
  %A = alloca ptr, align 8
  %B1 = urem i8 %B, %B
  %G = getelementptr i16, ptr %x, i1 false
  %G2 = getelementptr i1, ptr %x, i8 %B1
  store ptr %G2, ptr %A, align 8
  store ptr %G, ptr @G.3, align 8
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 %idx
  store i8 %B, ptr %G, align 1
  store ptr poison, ptr %A, align 8
  %G1 = getelementptr bfloat, ptr %x, i1 %c
  store i8 %B1, ptr %G1, align 1
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
define i1 @extractelt_v128i1_idx0(ptr %x) #0 {
  %LGV9 = load <2 x i64>, ptr @G.10, align 16
  %LGV4 = load i1, ptr @G.8, align 1
  %LGV1 = load float, ptr @G.7, align 4
  %A = alloca i1, align 1
  %L = load i1, ptr %A, align 1
  %G4 = getelementptr float, ptr %x, i1 %LGV4
  %L10 = load <2 x i64>, ptr %G4, align 16
  %C8 = icmp ne i1 %L, %LGV4
  store i1 poison, ptr %A, align 1
  %LGV = load i128, ptr @G.1, align 4
  %a = load <128 x i8>, ptr %x, align 128
  store i1 %C8, ptr @G.11, align 1
  br i1 %LGV4, label %T, label %F

BB:                                               ; preds = %T
  %C = icmp eq i128 %LGV, 0
  %b = icmp eq <128 x i8> %a, zeroinitializer
  %G = getelementptr ptr, ptr %x, i1 false
  %B = urem <128 x i1> %b, splat (i1 true)
  %I = insertelement <128 x i8> %a, i8 -1, i1 %C
  %C2 = fcmp ueq bfloat 0.000000e+00, +qnan
  %C3 = fcmp oeq float %LGV1, 1.000000e+00
  %c = extractelement <128 x i1> %B, i64 0
  store i1 %C, ptr poison, align 1
  store ptr %G, ptr @G.3, align 8
  store <128 x i8> %I, ptr @G.5, align 128
  store i1 %C3, ptr %A, align 1
  store i1 %C2, ptr %A, align 1
  ret i1 %c

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  %1 = phi <2 x i64> [ splat (i64 42), %0 ]
  %LGV6 = load <2 x i64>, ptr @G.10, align 16
  %B7 = mul <2 x i64> splat (i64 1), %LGV6
  %LGV5 = load i1, ptr @G.9, align 1
  store <2 x i64> %B7, ptr %G4, align 16
  store <2 x i64> %1, ptr poison, align 16
  ret i1 %LGV5
}

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

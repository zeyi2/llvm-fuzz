; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zvkb,+zbs -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i1 true
@G.2 = global i64 -9223372036854775808
@G.3 = global i1 false
@G.4 = global i16 0
@G.5 = global <8 x i1> zeroinitializer
@G.6 = global i128 -170141183460469231731687303715884105728

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %A1 = alloca i1, align 1
  store i1 false, ptr %A1, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i1, ptr @G, align 1
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %c = extractelement <1 x i1> %b, i64 %idx
  %C = icmp ugt i1 %LGV, %c
  store i1 %C, ptr @G.1, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  ret i1 %c

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %L2 = load i1, ptr %A1, align 1
  br i1 %L2, label %F, label %BB
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
define i1 @extractelt_v2i1_idx0(ptr %x) #0 {
  %A = alloca i1, align 1
  %L = load <8 x i8>, ptr %A, align 8
  store i1 poison, ptr %A, align 1
  %LGV = load i64, ptr @G.2, align 4
  %a = load <2 x i8>, ptr %x, align 2
  %b = icmp eq <2 x i8> %a, zeroinitializer
  switch i64 %LGV, label %SW_D [
    i64 -4020102547081303317, label %SW_C
    i64 8564985835122775911, label %SW_C1
    i64 -798310426039742719, label %SW_C2
    i64 -8582888678917626236, label %SW_C3
    i64 205444884111007468, label %SW_C4
    i64 1118457534187451292, label %SW_C5
  ]

BB:                                               ; preds = %SW_C4, %SW_C3, %SW_C, %SW_D
  %LGV1 = load i16, ptr @G.4, align 2
  %C = icmp ugt i16 %LGV1, -32768
  %c = extractelement <2 x i1> %b, i64 0
  store i1 %C, ptr %A, align 1
  ret i1 %c

SW_D:                                             ; preds = %0
  %1 = phi <8 x i8> [ splat (i8 -1), %0 ]
  store <8 x i8> %1, ptr poison, align 8
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  %LGV6 = load i1, ptr @G.3, align 1
  ret i1 %LGV6

SW_C2:                                            ; preds = %0
  ret i1 true

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %0
  ret i1 false
}

; Function Attrs: nounwind
declare i1 @extractelt_v4i1_idx0(ptr) #0

; Function Attrs: nounwind
define i1 @extractelt_v8i1_idx0(ptr %x) #0 {
  %LGV = load i128, ptr @G.6, align 4
  %G1 = getelementptr i1, ptr %x, i128 %LGV
  %a = load <8 x i8>, ptr %x, align 8
  %b = icmp eq <8 x i8> %a, zeroinitializer
  %G = getelementptr <4 x float>, ptr %x, i64 4294967296
  %C = icmp ule <8 x i1> %b, splat (i1 true)
  %c = extractelement <8 x i1> %b, i64 0
  store ptr %G, ptr poison, align 8
  store <8 x i1> %C, ptr @G.5, align 1
  store ptr %G1, ptr %G, align 8
  ret i1 %c
}

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

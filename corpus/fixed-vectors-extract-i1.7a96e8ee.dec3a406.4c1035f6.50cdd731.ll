; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+v,+zfa,+zfh,+zve64d,+zve32x -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i128 170141183460469231731687303715884105727
@G.2 = global i16 42
@G.3 = global ptr poison
@G.4 = global i1 false
@G.5 = global ptr poison
@G.6 = global i8 -1

; Function Attrs: nounwind
define i1 @extractelt_v1i1(ptr %x, i64 %idx) #0 {
  %LGV2 = load i8, ptr @G.6, align 1
  %B = add i8 127, %LGV2
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %a = load <1 x i8>, ptr %x, align 1
  %b = icmp eq <1 x i8> %a, zeroinitializer
  %C3 = icmp uge i8 %B, %B
  %L = load i1, ptr %A, align 1
  store i8 %B, ptr %A, align 1
  switch i1 %C3, label %SW_D [
    i1 false, label %SW_C
    i1 true, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_C, %SW_D
  %c = extractelement <1 x i1> %b, i64 %idx
  %G = getelementptr i16, ptr %x, i1 false
  store ptr %G, ptr @G.3, align 8
  %G2 = getelementptr ptr, ptr %G, i1 %c
  store ptr %G2, ptr @G.5, align 8
  ret i1 %c

SW_D:                                             ; preds = %SW_D, %0
  br i1 %L, label %SW_D, label %BB

SW_C:                                             ; preds = %0
  %G4 = getelementptr ptr, ptr %x, i64 42
  store ptr %G4, ptr poison, align 8
  br label %BB

SW_C1:                                            ; preds = %0
  %C = icmp sle i64 %idx, %idx
  store i1 %C, ptr %A, align 1
  br label %BB
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
  %A = alloca <8 x i8>, align 8
  store <8 x i8> poison, ptr %A, align 8
  %LGV = load i128, ptr @G.1, align 4
  %a = load <128 x i8>, ptr %x, align 128
  %C = icmp eq i128 %LGV, 0
  %b = icmp eq <128 x i8> %a, zeroinitializer
  %c = extractelement <128 x i1> %b, i64 0
  store i1 %C, ptr poison, align 1
  %B = sub i1 %c, %c
  %B2 = lshr <8 x i8> splat (i8 -1), zeroinitializer
  store i1 %B, ptr @G.4, align 1
  store i1 %c, ptr @G.4, align 1
  store <8 x i8> %B2, ptr %A, align 8
  ret i1 %c
}

; Function Attrs: nounwind
declare i1 @extractelt_v256i1_idx0(ptr) #0

attributes #0 = { nounwind }

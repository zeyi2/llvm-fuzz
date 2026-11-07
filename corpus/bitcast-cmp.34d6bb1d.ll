; isel-diff-config: -mtriple=riscv64 -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 32767
@G.1 = global i128 -1
@G.2 = global i1 false

define { i1, <32 x i8> } @bitcast_v32i8(ptr %a0) {
  %A3 = alloca i1, align 1
  store i1 false, ptr %A3, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i128, ptr @G.1, align 4
  %src256 = load i256, ptr %a0, align 32
  %src256.bitcast = bitcast i256 %src256 to <32 x i8>
  %iszero = icmp eq i256 %src256, 0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %BB2
  %res1 = insertvalue { i1, <32 x i8> } poison, i1 %iszero, 0
  %res2 = insertvalue { i1, <32 x i8> } %res1, <32 x i8> %src256.bitcast, 1
  %C = icmp ne i128 170141183460469231731687303715884105727, %LGV
  store i1 %C, ptr poison, align 1
  ret { i1, <32 x i8> } %res2

T:                                                ; preds = %BB2, %0
  %LGV1 = load i1, ptr @G.2, align 1
  %L4 = load i1, ptr %A3, align 1
  switch i1 %L4, label %SW_D [
    i1 false, label %SW_C
    i1 true, label %SW_C5
  ]

BB2:                                              ; preds = %SW_C5, %SW_C, %SW_D
  br i1 %LGV1, label %T, label %BB

F:                                                ; preds = %0
  br label %BB

SW_D:                                             ; preds = %T
  br label %BB2

SW_C:                                             ; preds = %T
  br label %BB2

SW_C5:                                            ; preds = %SW_C5, %T
  br i1 %L4, label %SW_C5, label %BB2
}

declare { i1, <16 x i16> } @bitcast_v16i16(ptr)

define { i1, <8 x i32> } @bitcast_v8i32(ptr %a0) {
  %src256 = load i256, ptr %a0, align 32
  %src256.bitcast = bitcast i256 %src256 to <8 x i32>
  %iszero = icmp eq i256 %src256, 0
  %res1 = insertvalue { i1, <8 x i32> } poison, i1 %iszero, 0
  br i1 %iszero, label %T, label %F

BB:                                               ; preds = %F, %T
  %res2 = insertvalue { i1, <8 x i32> } %res1, <8 x i32> %src256.bitcast, 1
  ret { i1, <8 x i32> } %res2

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

declare i1 @bitcast_from_v32i8(ptr)

define i1 @bitcast_from_v16i16(ptr %a0) {
  %LGV = load i16, ptr @G, align 2
  %G = getelementptr <4 x float>, ptr %a0, i16 %LGV
  %vec = load <16 x i16>, ptr %G, align 32
  %int = bitcast <16 x i16> %vec to i256
  %iszero = icmp eq i256 %int, 0
  ret i1 %iszero
}

declare i1 @bitcast_from_v8i32(ptr)

declare i1 @cmp_plain_to_v16i16(ptr, ptr)

declare i1 @cmp_v16i16_to_plain(ptr, ptr)

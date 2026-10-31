; isel-diff-config: -mtriple=riscv64 -mattr=+zfh -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i128 170141183460469231731687303715884105727
@G.2 = global i128 1
@G.3 = global ptr poison

declare { i1, <32 x i8> } @bitcast_v32i8(ptr)

declare { i1, <16 x i16> } @bitcast_v16i16(ptr)

define { i1, <8 x i32> } @bitcast_v8i32(ptr %a0) {
  %LGV = load i1, ptr @G, align 1
  %src256 = load i256, ptr %a0, align 32
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  %src256.bitcast = bitcast i256 %src256 to <8 x i32>
  %G = getelementptr i1, ptr %a0, i1 %LGV
  %iszero = icmp eq i256 %src256, 0
  %res1 = insertvalue { i1, <8 x i32> } poison, i1 %iszero, 0
  %res2 = insertvalue { i1, <8 x i32> } %res1, <8 x i32> %src256.bitcast, 1
  store ptr %G, ptr @G.3, align 8
  ret { i1, <8 x i32> } %res2

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

declare i1 @bitcast_from_v32i8(ptr)

declare i1 @bitcast_from_v16i16(ptr)

declare i1 @bitcast_from_v8i32(ptr)

define i1 @cmp_plain_to_v16i16(ptr %a0, ptr %a1) {
  %LGV = load i128, ptr @G.1, align 4
  %x = load i256, ptr %a0, align 32
  %y_vec = load <16 x i16>, ptr %a1, align 32
  %y = bitcast <16 x i16> %y_vec to i256
  %B = udiv i128 42, %LGV
  %cmp = icmp eq i256 %x, %y
  store i128 %B, ptr @G.2, align 4
  ret i1 %cmp
}

declare i1 @cmp_v16i16_to_plain(ptr, ptr)

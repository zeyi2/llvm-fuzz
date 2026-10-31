; isel-diff-config: -mtriple=riscv64 -mattr=+rva23u64 -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i256 1
@G.2 = global ptr poison
@G.3 = global <2 x i64> splat (i64 9223372036854775807)

define { i1, <32 x i8> } @bitcast_v32i8(ptr %a0) {
  %src256 = load i256, ptr %a0, align 32
  %src256.bitcast = bitcast i256 %src256 to <32 x i8>
  %iszero = icmp eq i256 %src256, 0
  %res1 = insertvalue { i1, <32 x i8> } poison, i1 %iszero, 0
  %G = getelementptr ptr, ptr %a0, i8 -128
  %res2 = insertvalue { i1, <32 x i8> } %res1, <32 x i8> %src256.bitcast, 1
  store ptr %G, ptr @G.2, align 8
  ret { i1, <32 x i8> } %res2
}

define { i1, <16 x i16> } @bitcast_v16i16(ptr %a0) {
  %LGV = load i1, ptr @G, align 1
  %src256 = load i256, ptr %a0, align 32
  %src256.bitcast = bitcast i256 %src256 to <16 x i16>
  %iszero = icmp eq i256 %src256, 0
  %B = lshr i1 %LGV, true
  %res1 = insertvalue { i1, <16 x i16> } poison, i1 %iszero, 0
  %res2 = insertvalue { i1, <16 x i16> } %res1, <16 x i16> %src256.bitcast, 1
  store i1 %B, ptr poison, align 1
  ret { i1, <16 x i16> } %res2
}

declare { i1, <8 x i32> } @bitcast_v8i32(ptr)

define i1 @bitcast_from_v32i8(ptr %a0) {
  %A = alloca i256, align 8
  store i256 poison, ptr %A, align 4
  %LGV = load i256, ptr @G.1, align 4
  %vec = load <32 x i8>, ptr %a0, align 32
  %int = bitcast <32 x i8> %vec to i256
  %iszero = icmp eq i256 %int, 0
  %B = urem i256 %int, %LGV
  store i256 %B, ptr %A, align 4
  ret i1 %iszero
}

define i1 @bitcast_from_v16i16(ptr %a0) {
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %G = getelementptr ptr, ptr %a0, i128 18446744073709551616
  %vec = load <16 x i16>, ptr %a0, align 32
  %int = bitcast <16 x i16> %vec to i256
  %iszero = icmp eq i256 %int, 0
  store ptr %G, ptr %A, align 8
  ret i1 %iszero
}

define i1 @bitcast_from_v8i32(ptr %a0) {
  %B = ashr i1 true, true
  %vec = load <8 x i32>, ptr %a0, align 32
  %int = bitcast <8 x i32> %vec to i256
  %iszero = icmp eq i256 %int, 0
  store i1 %B, ptr @G, align 1
  ret i1 %iszero
}

declare i1 @cmp_plain_to_v16i16(ptr, ptr)

define i1 @cmp_v16i16_to_plain(ptr %a0, ptr %a1) {
  %LGV = load <2 x i64>, ptr @G.3, align 16
  %B1 = or <2 x i64> splat (i64 -9223372036854775808), %LGV
  %x_vec = load <16 x i16>, ptr %a0, align 32
  %x = bitcast <16 x i16> %x_vec to i256
  %B = lshr i32 0, -1
  %y = load i256, ptr %a1, align 32
  %cmp = icmp eq i256 %x, %y
  store i32 %B, ptr poison, align 4
  store <2 x i64> %B1, ptr @G.3, align 16
  ret i1 %cmp
}

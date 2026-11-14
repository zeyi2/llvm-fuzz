; isel-diff-config: -mtriple=riscv64 -mattr=+rva23u64,+xtheadba,+zbkb -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 4294967296)
@G.1 = global i256 57896044618658097711785492504343953926634992332820282019728792003956564819967
@G.2 = global float 4.200000e+01
@G.3 = global ptr poison

define { i1, <32 x i8> } @bitcast_v32i8(ptr %a0) {
  %LGV = load <2 x i64>, ptr @G, align 16
  %src256 = load i256, ptr %a0, align 32
  %src256.bitcast = bitcast i256 %src256 to <32 x i8>
  %iszero = icmp eq i256 %src256, 0
  %res1 = insertvalue { i1, <32 x i8> } poison, i1 %iszero, 0
  %res2 = insertvalue { i1, <32 x i8> } %res1, <32 x i8> %src256.bitcast, 1
  %B = urem <2 x i64> splat (i64 -1), %LGV
  store <2 x i64> %B, ptr @G, align 16
  ret { i1, <32 x i8> } %res2
}

declare { i1, <16 x i16> } @bitcast_v16i16(ptr)

declare { i1, <8 x i32> } @bitcast_v8i32(ptr)

define i1 @bitcast_from_v32i8(ptr %a0) {
  %vec = load <32 x i8>, ptr %a0, align 32
  %int = bitcast <32 x i8> %vec to i256
  %iszero = icmp eq i256 %int, 0
  %G = getelementptr ptr, ptr %a0, i8 127
  store ptr %G, ptr @G.3, align 8
  ret i1 %iszero
}

define i1 @bitcast_from_v16i16(ptr %a0) {
  %LGV1 = load float, ptr @G.2, align 4
  %C = fcmp uge float f0x7F7FFFFF, %LGV1
  ret i1 %C
}

define i1 @bitcast_from_v8i32(ptr %a0) {
  %vec = load <8 x i32>, ptr %a0, align 32
  %int = bitcast <8 x i32> %vec to i256
  %G = getelementptr i256, ptr %a0, i256 %int
  %iszero = icmp eq i256 %int, 0
  store ptr %G, ptr poison, align 8
  ret i1 %iszero
}

declare i1 @cmp_plain_to_v16i16(ptr, ptr)

define i1 @cmp_v16i16_to_plain(ptr %a0, ptr %a1) {
  %x_vec = load <16 x i16>, ptr %a0, align 32
  %x = bitcast <16 x i16> %x_vec to i256
  %y = load i256, ptr %a1, align 32
  %cmp = icmp eq i256 %x, %y
  %G = getelementptr float, ptr %a0, i1 %cmp
  %B = udiv i256 %y, -1
  store i256 %B, ptr %G, align 4
  ret i1 %cmp
}

declare i1 @cmp_volatile_load(ptr, ptr)

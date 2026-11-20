; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zcb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global <64 x i1> zeroinitializer
@G.2 = global <16 x i1> zeroinitializer

declare zeroext i1 @vreduce_or_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_xor_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_and_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_umax_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_smax_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_umin_v1i1(<1 x i1>)

define zeroext i1 @vreduce_smin_v1i1(<1 x i1> %v) {
  %B = ashr <1 x i1> %v, %v
  %red = call i1 @llvm.vector.reduce.smin.v1i1(<1 x i1> %B)
  ret i1 %red
}

declare zeroext i1 @vreduce_or_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_xor_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_and_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_umax_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_smax_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_umin_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_smin_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_or_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_xor_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_and_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_umax_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_smax_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_umin_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_smin_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_or_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_xor_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_and_v8i1(<8 x i1>)

define zeroext i1 @vreduce_umax_v8i1(<8 x i1> %v) {
  %C = fcmp ole bfloat +qnan, 1.000000e+00
  ret i1 %C
}

declare zeroext i1 @vreduce_smax_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_umin_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_smin_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_or_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_xor_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_and_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_umax_v16i1(<16 x i1>)

define zeroext i1 @vreduce_smax_v16i1(<16 x i1> %v) {
  %red = call i1 @llvm.vector.reduce.smax.v16i1(<16 x i1> %v)
  %C = icmp slt <16 x i1> %v, splat (i1 true)
  store <16 x i1> %C, ptr @G.2, align 2
  ret i1 %red
}

declare zeroext i1 @vreduce_umin_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_smin_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_or_v32i1(<32 x i1>)

declare zeroext i1 @vreduce_xor_v32i1(<32 x i1>)

declare zeroext i1 @vreduce_and_v32i1(<32 x i1>)

declare zeroext i1 @vreduce_umax_v32i1(<32 x i1>)

declare zeroext i1 @vreduce_smax_v32i1(<32 x i1>)

declare zeroext i1 @vreduce_umin_v32i1(<32 x i1>)

define zeroext i1 @vreduce_smin_v32i1(<32 x i1> %v) {
  %C = icmp sle <32 x i1> %v, zeroinitializer
  %red = call i1 @llvm.vector.reduce.smin.v32i1(<32 x i1> %C)
  ret i1 %red
}

declare zeroext i1 @vreduce_or_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_xor_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_and_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_umax_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_smax_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_umin_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_smin_v64i1(<64 x i1>)

define zeroext i1 @vreduce_add_v1i1(<1 x i1> %v) {
  %red = call i1 @llvm.vector.reduce.add.v1i1(<1 x i1> %v)
  %C = icmp ne i1 %red, false
  store i1 %C, ptr @G, align 1
  ret i1 %red
}

declare zeroext i1 @vreduce_add_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_add_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_add_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_add_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_add_v32i1(<32 x i1>)

define zeroext i1 @vreduce_add_v64i1(<64 x i1> %v) {
  %LGV = load <64 x i1>, ptr @G.1, align 8
  %A = alloca i16, align 2
  %B1 = srem <64 x i1> %v, %LGV
  store i16 poison, ptr %A, align 2
  %B = and i16 -1, 0
  %red = call i1 @llvm.vector.reduce.add.v64i1(<64 x i1> %v)
  store i16 %B, ptr %A, align 2
  store <64 x i1> %B1, ptr @G.1, align 8
  ret i1 %red
}

declare zeroext i1 @vreduce_or_v128i1(<128 x i1>)

declare zeroext i1 @vreduce_xor_v128i1(<128 x i1>)

declare zeroext i1 @vreduce_and_v128i1(<128 x i1>)

declare zeroext i1 @vreduce_umax_v128i1(<128 x i1>)

declare zeroext i1 @vreduce_smax_v128i1(<128 x i1>)

declare zeroext i1 @vreduce_umin_v128i1(<128 x i1>)

declare zeroext i1 @vreduce_smin_v128i1(<128 x i1>)

declare zeroext i1 @vreduce_or_v256i1(<256 x i1>)

declare zeroext i1 @vreduce_xor_v256i1(<256 x i1>)

declare zeroext i1 @vreduce_and_v256i1(<256 x i1>)

declare zeroext i1 @vreduce_umax_v256i1(<256 x i1>)

declare zeroext i1 @vreduce_smax_v256i1(<256 x i1>)

declare zeroext i1 @vreduce_umin_v256i1(<256 x i1>)

declare zeroext i1 @vreduce_smin_v256i1(<256 x i1>)

declare zeroext i1 @vreduce_or_v512i1(<512 x i1>)

declare zeroext i1 @vreduce_xor_v512i1(<512 x i1>)

declare zeroext i1 @vreduce_and_v512i1(<512 x i1>)

declare zeroext i1 @vreduce_umax_v512i1(<512 x i1>)

declare zeroext i1 @vreduce_smax_v512i1(<512 x i1>)

declare zeroext i1 @vreduce_umin_v512i1(<512 x i1>)

declare zeroext i1 @vreduce_smin_v512i1(<512 x i1>)

declare zeroext i1 @vreduce_or_v1024i1(<1024 x i1>)

declare zeroext i1 @vreduce_xor_v1024i1(<1024 x i1>)

declare zeroext i1 @vreduce_and_v1024i1(<1024 x i1>)

declare zeroext i1 @vreduce_umax_v1024i1(<1024 x i1>)

declare zeroext i1 @vreduce_smax_v1024i1(<1024 x i1>)

declare zeroext i1 @vreduce_umin_v1024i1(<1024 x i1>)

declare zeroext i1 @vreduce_smin_v1024i1(<1024 x i1>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v8i1(<8 x i1>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

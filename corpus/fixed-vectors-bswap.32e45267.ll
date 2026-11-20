; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+v,+zbb -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x float> splat (float +qnan)
@G.1 = global <4 x i32> splat (i32 -2147483648)
@G.2 = global i1 false
@G.3 = global ptr poison
@G.4 = global ptr poison
@G.5 = global <8 x i1> splat (i1 true)
@G.6 = global <8 x i32> zeroinitializer
@G.7 = global <8 x i32> splat (i32 2147483647)
@G.8 = global i64 42

declare void @bswap_v8i16(ptr, ptr)

define void @bswap_v4i32(ptr %x, ptr %y) {
  %a = load <4 x i32>, ptr %x, align 16
  %G = getelementptr <4 x float>, ptr %x, i128 0
  %L = load i64, ptr %G, align 4
  %c = call <4 x i32> @llvm.bswap.v4i32(<4 x i32> %a)
  store <4 x i32> %c, ptr %x, align 16
  %G1 = getelementptr ptr, ptr %G, i64 %L
  store ptr %G, ptr poison, align 8
  store ptr %G1, ptr poison, align 8
  ret void
}

declare void @bswap_v2i64(ptr, ptr)

define void @bswap_v16i16(ptr %x, ptr %y) {
  %LGV = load i64, ptr @G.8, align 4
  %G = getelementptr ptr, ptr %y, i64 %LGV
  %a = load <16 x i16>, ptr %x, align 32
  %c = call <16 x i16> @llvm.bswap.v16i16(<16 x i16> %a)
  %B = udiv i64 0, -1
  store <16 x i16> %c, ptr %x, align 32
  store i64 %B, ptr poison, align 4
  store ptr %G, ptr poison, align 8
  ret void
}

define void @bswap_v8i32(ptr %x, ptr %y) {
  %LGV = load <8 x i32>, ptr @G.6, align 32
  %a = load <8 x i32>, ptr %x, align 32
  %c = call <8 x i32> @llvm.bswap.v8i32(<8 x i32> %a)
  store <8 x i32> %c, ptr %x, align 32
  %B = and <8 x i32> %c, %LGV
  %C = icmp ult <8 x i32> %a, %c
  store <8 x i1> %C, ptr @G.5, align 1
  store <8 x i32> %B, ptr @G.7, align 32
  ret void
}

define void @bswap_v4i64(ptr %x, ptr %y) {
  %G3 = getelementptr ptr, ptr %x, i16 1
  %LGV1 = load i1, ptr @G.2, align 1
  %a = load <4 x i64>, ptr %x, align 32
  %G = getelementptr <4 x i32>, ptr %y, i1 %LGV1
  %c = call <4 x i64> @llvm.bswap.v4i64(<4 x i64> %a)
  store <4 x i64> %c, ptr %x, align 32
  store ptr %G, ptr @G.3, align 8
  store ptr %G3, ptr @G.4, align 8
  ret void
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.bswap.v16i16(<16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.bswap.v2i64(<2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.bswap.v4i32(<4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.bswap.v4i64(<4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.bswap.v8i16(<8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.bswap.v8i32(<8 x i32>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

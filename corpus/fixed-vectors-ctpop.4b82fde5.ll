; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+v,+zvbb,+zbb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 42
@G.1 = global i16 0
@G.2 = global i16 0
@G.3 = global i1 true

define void @ctpop_v16i8(ptr %x, ptr %y) {
  %LGV2 = load i16, ptr @G.2, align 2
  %LGV = load i16, ptr @G.1, align 2
  %a = load <16 x i8>, ptr %x, align 16
  %c = call <16 x i8> @llvm.ctpop.v16i8(<16 x i8> %a)
  store <16 x i8> %c, ptr %x, align 16
  %C = icmp ule i16 %LGV, %LGV2
  %G = getelementptr i128, ptr %x, i1 true
  store ptr %G, ptr poison, align 8
  store i1 %C, ptr @G.3, align 1
  ret void
}

declare void @ctpop_v8i16(ptr, ptr)

declare void @ctpop_v4i32(ptr, ptr)

declare void @ctpop_v2i64(ptr, ptr)

define void @ctpop_v32i8(ptr %x, ptr %y) {
  %B = add i16 -32768, 1
  %a = load <32 x i8>, ptr %x, align 32
  %c = call <32 x i8> @llvm.ctpop.v32i8(<32 x i8> %a)
  store <32 x i8> %c, ptr %x, align 32
  store i16 %B, ptr poison, align 2
  ret void
}

declare void @ctpop_v16i16(ptr, ptr)

declare void @ctpop_v8i32(ptr, ptr)

declare <8 x i1> @ctpop_v8i32_ult_two(ptr, ptr)

declare <8 x i1> @ctpop_v8i32_ugt_one(ptr, ptr)

declare <8 x i1> @ctpop_v8i32_eq_one(ptr, ptr)

declare <8 x i1> @ctpop_v8i32_ne_one(ptr, ptr)

define void @ctpop_v4i64(ptr %x, ptr %y) {
  %G = getelementptr i64, ptr %x, i8 16
  %a = load <4 x i64>, ptr %G, align 32
  %c = call <4 x i64> @llvm.ctpop.v4i64(<4 x i64> %a)
  store <4 x i64> %c, ptr %x, align 32
  ret void
}

declare <4 x i1> @ctpop_v4i64_ult_two(ptr, ptr)

declare <4 x i1> @ctpop_v4i64_ugt_one(ptr, ptr)

declare <4 x i1> @ctpop_v4i64_eq_one(ptr, ptr)

declare <4 x i1> @ctpop_v4i64_ne_one(ptr, ptr)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.ctpop.v16i16(<16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.ctpop.v16i8(<16 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.ctpop.v2i64(<2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i8> @llvm.ctpop.v32i8(<32 x i8>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.ctpop.v4i32(<4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.ctpop.v4i64(<4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.ctpop.v8i16(<8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.ctpop.v8i32(<8 x i32>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

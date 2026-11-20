; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+v,+zvbb,+zbb -O0 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <32 x i8> splat (i8 16)
@G.1 = global i32 -2147483648
@G.2 = global <16 x i16> splat (i16 1)
@G.3 = global <4 x float> zeroinitializer

declare void @ctpop_v16i8(ptr, ptr)

declare void @ctpop_v8i16(ptr, ptr)

declare void @ctpop_v4i32(ptr, ptr)

define void @ctpop_v2i64(ptr %x, ptr %y) {
  %a = load <2 x i64>, ptr %x, align 16
  %b = load <2 x i64>, ptr %y, align 16
  %B = srem <2 x i64> %a, %b
  store <2 x i64> %B, ptr %x, align 16
  ret void
}

define void @ctpop_v32i8(ptr %x, ptr %y) {
  %LGV = load <4 x float>, ptr @G.3, align 16
  %a = load <32 x i8>, ptr %x, align 32
  %B = and <32 x i8> %a, %a
  %C = fcmp true <4 x float> %LGV, splat (float 1.401300e-45)
  %c = call <32 x i8> @llvm.ctpop.v32i8(<32 x i8> %a)
  store <32 x i8> %c, ptr %x, align 32
  store <32 x i8> %B, ptr @G, align 32
  store <4 x i1> %C, ptr poison, align 1
  ret void
}

define void @ctpop_v16i16(ptr %x, ptr %y) {
  %LGV = load <16 x i16>, ptr @G.2, align 32
  %a = load <16 x i16>, ptr %x, align 32
  %b = load <16 x i16>, ptr %y, align 32
  %B = lshr <16 x i16> %b, %LGV
  %c = call <16 x i16> @llvm.ctpop.v16i16(<16 x i16> %a)
  store <16 x i16> %c, ptr %x, align 32
  store <16 x i16> %B, ptr poison, align 32
  ret void
}

define void @ctpop_v8i32(ptr %x, ptr %y) {
  %LGV = load i32, ptr @G.1, align 4
  %a = load <8 x i32>, ptr %x, align 32
  %c = call <8 x i32> @llvm.ctpop.v8i32(<8 x i32> %a)
  %B = and i32 0, %LGV
  store <8 x i32> %c, ptr %x, align 32
  store i32 %B, ptr @G.1, align 4
  ret void
}

declare <8 x i1> @ctpop_v8i32_ult_two(ptr, ptr)

declare <8 x i1> @ctpop_v8i32_ugt_one(ptr, ptr)

declare <8 x i1> @ctpop_v8i32_eq_one(ptr, ptr)

declare <8 x i1> @ctpop_v8i32_ne_one(ptr, ptr)

declare void @ctpop_v4i64(ptr, ptr)

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

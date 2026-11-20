; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+v,+f -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -2147483648
@G.1 = global i1 true

declare <vscale x 1 x i16> @vp_bswap_nxv1i16(<vscale x 1 x i16>, <vscale x 1 x i1>, i32 zeroext)

define <vscale x 1 x i16> @vp_bswap_nxv1i16_unmasked(<vscale x 1 x i16> %va, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %v = call <vscale x 1 x i16> @llvm.bswap.nxv1i16(<vscale x 1 x i16> %va)
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <vscale x 1 x i16> %v

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

declare <vscale x 2 x i16> @vp_bswap_nxv2i16(<vscale x 2 x i16>, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i16> @vp_bswap_nxv2i16_unmasked(<vscale x 2 x i16>, i32 zeroext)

declare <vscale x 4 x i16> @vp_bswap_nxv4i16(<vscale x 4 x i16>, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i16> @vp_bswap_nxv4i16_unmasked(<vscale x 4 x i16>, i32 zeroext)

declare <vscale x 8 x i16> @vp_bswap_nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i16> @vp_bswap_nxv8i16_unmasked(<vscale x 8 x i16>, i32 zeroext)

declare <vscale x 16 x i16> @vp_bswap_nxv16i16(<vscale x 16 x i16>, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i16> @vp_bswap_nxv16i16_unmasked(<vscale x 16 x i16>, i32 zeroext)

declare <vscale x 32 x i16> @vp_bswap_nxv32i16(<vscale x 32 x i16>, <vscale x 32 x i1>, i32 zeroext)

declare <vscale x 32 x i16> @vp_bswap_nxv32i16_unmasked(<vscale x 32 x i16>, i32 zeroext)

declare <vscale x 1 x i32> @vp_bswap_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i32> @vp_bswap_nxv1i32_unmasked(<vscale x 1 x i32>, i32 zeroext)

declare <vscale x 2 x i32> @vp_bswap_nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i32> @vp_bswap_nxv2i32_unmasked(<vscale x 2 x i32>, i32 zeroext)

declare <vscale x 4 x i32> @vp_bswap_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i32> @vp_bswap_nxv4i32_unmasked(<vscale x 4 x i32>, i32 zeroext)

declare <vscale x 8 x i32> @vp_bswap_nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i32> @vp_bswap_nxv8i32_unmasked(<vscale x 8 x i32>, i32 zeroext)

declare <vscale x 16 x i32> @vp_bswap_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i32> @vp_bswap_nxv16i32_unmasked(<vscale x 16 x i32>, i32 zeroext)

declare <vscale x 1 x i64> @vp_bswap_nxv1i64(<vscale x 1 x i64>, <vscale x 1 x i1>, i32 zeroext)

define <vscale x 1 x i64> @vp_bswap_nxv1i64_unmasked(<vscale x 1 x i64> %va, i32 zeroext %evl) {
  %v = call <vscale x 1 x i64> @llvm.bswap.nxv1i64(<vscale x 1 x i64> %va)
  %B = or <vscale x 1 x i64> %v, %va
  store <vscale x 1 x i64> %B, ptr poison, align 8
  ret <vscale x 1 x i64> %v
}

declare <vscale x 2 x i64> @vp_bswap_nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i64> @vp_bswap_nxv2i64_unmasked(<vscale x 2 x i64>, i32 zeroext)

declare <vscale x 4 x i64> @vp_bswap_nxv4i64(<vscale x 4 x i64>, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i64> @vp_bswap_nxv4i64_unmasked(<vscale x 4 x i64>, i32 zeroext)

declare <vscale x 7 x i64> @vp_bswap_nxv7i64(<vscale x 7 x i64>, <vscale x 7 x i1>, i32 zeroext)

declare <vscale x 7 x i64> @vp_bswap_nxv7i64_unmasked(<vscale x 7 x i64>, i32 zeroext)

declare <vscale x 8 x i64> @vp_bswap_nxv8i64(<vscale x 8 x i64>, <vscale x 8 x i1>, i32 zeroext)

define <vscale x 8 x i64> @vp_bswap_nxv8i64_unmasked(<vscale x 8 x i64> %va, i32 zeroext %evl) {
  %LGV = load i32, ptr @G, align 4
  %v = call <vscale x 8 x i64> @llvm.bswap.nxv8i64(<vscale x 8 x i64> %va)
  %C = icmp sgt i32 %evl, %LGV
  store i1 %C, ptr @G.1, align 1
  ret <vscale x 8 x i64> %v
}

declare <vscale x 64 x i16> @vp_bswap_nxv64i16(<vscale x 64 x i16>, <vscale x 64 x i1>, i32 zeroext)

define <vscale x 64 x i16> @vp_bswap_nxv64i16_unmasked(<vscale x 64 x i16> %va, i32 zeroext %evl) {
  %B = xor <vscale x 64 x i16> %va, %va
  ret <vscale x 64 x i16> %B
}

declare <vscale x 1 x i48> @vp_bswap_nxv1i48(<vscale x 1 x i48>, <vscale x 1 x i1>, i32 zeroext)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i16> @llvm.bswap.nxv16i16(<vscale x 16 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i32> @llvm.bswap.nxv16i32(<vscale x 16 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x i16> @llvm.bswap.nxv1i16(<vscale x 1 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x i32> @llvm.bswap.nxv1i32(<vscale x 1 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x i48> @llvm.bswap.nxv1i48(<vscale x 1 x i48>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x i64> @llvm.bswap.nxv1i64(<vscale x 1 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i16> @llvm.bswap.nxv2i16(<vscale x 2 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i32> @llvm.bswap.nxv2i32(<vscale x 2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i64> @llvm.bswap.nxv2i64(<vscale x 2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 32 x i16> @llvm.bswap.nxv32i16(<vscale x 32 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i16> @llvm.bswap.nxv4i16(<vscale x 4 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i32> @llvm.bswap.nxv4i32(<vscale x 4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i64> @llvm.bswap.nxv4i64(<vscale x 4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 64 x i16> @llvm.bswap.nxv64i16(<vscale x 64 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 7 x i64> @llvm.bswap.nxv7i64(<vscale x 7 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i16> @llvm.bswap.nxv8i16(<vscale x 8 x i16>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i32> @llvm.bswap.nxv8i32(<vscale x 8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i64> @llvm.bswap.nxv8i64(<vscale x 8 x i64>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

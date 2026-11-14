; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64d -riscv-v-vector-bits-min=0 -mattr=+f,+d -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half +inf
@G.1 = global i1 true

declare <2 x i32> @stest_f64i32(<2 x double>)

declare <2 x i32> @utest_f64i32(<2 x double>)

declare <2 x i32> @ustest_f64i32(<2 x double>)

declare <4 x i32> @stest_f32i32(<4 x float>)

declare <4 x i32> @utest_f32i32(<4 x float>)

declare <4 x i32> @ustest_f32i32(<4 x float>)

declare <4 x i32> @stest_f16i32(<4 x half>)

declare <4 x i32> @utest_f16i32(<4 x half>)

declare <4 x i32> @ustest_f16i32(<4 x half>)

declare <2 x i16> @stest_f64i16(<2 x double>)

declare <2 x i16> @utest_f64i16(<2 x double>)

declare <2 x i16> @ustest_f64i16(<2 x double>)

declare <4 x i16> @stest_f32i16(<4 x float>)

declare <4 x i16> @utest_f32i16(<4 x float>)

declare <4 x i16> @ustest_f32i16(<4 x float>)

declare <8 x i16> @stest_f16i16(<8 x half>)

define <8 x i16> @utest_f16i16(<8 x half> %x) {
entry:
  %LGV = load half, ptr @G, align 2
  %conv = fptoui <8 x half> %x to <8 x i32>
  %0 = icmp ult <8 x i32> %conv, splat (i32 65535)
  %C = fcmp ugt half %LGV, 6.550400e+04
  %spec.store.select = select <8 x i1> %0, <8 x i32> %conv, <8 x i32> splat (i32 65535)
  %conv6 = trunc <8 x i32> %spec.store.select to <8 x i16>
  store i1 %C, ptr @G.1, align 1
  ret <8 x i16> %conv6
}

declare <8 x i16> @ustest_f16i16(<8 x half>)

declare <2 x i64> @stest_f64i64(<2 x double>)

declare <2 x i64> @utest_f64i64(<2 x double>)

declare <2 x i64> @ustest_f64i64(<2 x double>)

declare <2 x i64> @stest_f32i64(<2 x float>)

declare <2 x i64> @utest_f32i64(<2 x float>)

declare <2 x i64> @ustest_f32i64(<2 x float>)

declare <2 x i64> @stest_f16i64(<2 x half>)

define <2 x i64> @utest_f16i64(<2 x half> %x) {
entry:
  %conv = fptoui <2 x half> %x to <2 x i128>
  %0 = icmp ult <2 x i128> %conv, splat (i128 18446744073709551616)
  %spec.store.select = select <2 x i1> %0, <2 x i128> %conv, <2 x i128> %conv
  %conv6 = trunc <2 x i128> %spec.store.select to <2 x i64>
  ret <2 x i64> %conv6
}

declare <2 x i64> @ustest_f16i64(<2 x half>)

declare <2 x i32> @stest_f64i32_mm(<2 x double>)

declare <2 x i32> @utest_f64i32_mm(<2 x double>)

declare <2 x i32> @ustest_f64i32_mm(<2 x double>)

declare <4 x i32> @stest_f32i32_mm(<4 x float>)

declare <4 x i32> @utest_f32i32_mm(<4 x float>)

declare <4 x i32> @ustest_f32i32_mm(<4 x float>)

declare <4 x i32> @stest_f16i32_mm(<4 x half>)

declare <4 x i32> @utest_f16i32_mm(<4 x half>)

declare <4 x i32> @ustest_f16i32_mm(<4 x half>)

declare <2 x i16> @stest_f64i16_mm(<2 x double>)

declare <2 x i16> @utest_f64i16_mm(<2 x double>)

declare <2 x i16> @ustest_f64i16_mm(<2 x double>)

declare <4 x i16> @stest_f32i16_mm(<4 x float>)

declare <4 x i16> @utest_f32i16_mm(<4 x float>)

declare <4 x i16> @ustest_f32i16_mm(<4 x float>)

declare <8 x i16> @stest_f16i16_mm(<8 x half>)

declare <8 x i16> @utest_f16i16_mm(<8 x half>)

declare <8 x i16> @ustest_f16i16_mm(<8 x half>)

declare <2 x i64> @stest_f64i64_mm(<2 x double>)

declare <2 x i64> @utest_f64i64_mm(<2 x double>)

declare <2 x i64> @ustest_f64i64_mm(<2 x double>)

declare <2 x i64> @stest_f32i64_mm(<2 x float>)

declare <2 x i64> @utest_f32i64_mm(<2 x float>)

declare <2 x i64> @ustest_f32i64_mm(<2 x float>)

declare <2 x i64> @stest_f16i64_mm(<2 x half>)

declare <2 x i64> @utest_f16i64_mm(<2 x half>)

declare <2 x i64> @ustest_f16i64_mm(<2 x half>)

declare <4 x i32> @ustest_f16i32_nsat(<4 x half>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i128> @llvm.smax.v2i128(<2 x i128>, <2 x i128>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.smax.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.smax.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.smax.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.smax.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.smax.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i128> @llvm.smin.v2i128(<2 x i128>, <2 x i128>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.smin.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.smin.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.smin.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.smin.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.smin.v8i32(<8 x i32>, <8 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i128> @llvm.umin.v2i128(<2 x i128>, <2 x i128>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.umin.v2i32(<2 x i32>, <2 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.umin.v2i64(<2 x i64>, <2 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.umin.v4i32(<4 x i32>, <4 x i32>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.umin.v4i64(<4 x i64>, <4 x i64>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.umin.v8i32(<8 x i32>, <8 x i32>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

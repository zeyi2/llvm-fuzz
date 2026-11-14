; isel-diff-config: -mtriple=riscv32 -mattr=+zbb -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 -1)
@G.1 = global <4 x float> splat (float 4.200000e+01)
@G.2 = global i64 0

; Function Attrs: nounwind
declare i8 @abd_ext_i8(i8, i8) #0

; Function Attrs: nounwind
declare i8 @abd_ext_i8_i16(i8, i16) #0

; Function Attrs: nounwind
declare i8 @abd_ext_i8_undef(i8, i8) #0

; Function Attrs: nounwind
declare i16 @abd_ext_i16(i16, i16) #0

; Function Attrs: nounwind
declare i16 @abd_ext_i16_i32(i16, i32) #0

; Function Attrs: nounwind
declare i16 @abd_ext_i16_undef(i16, i16) #0

; Function Attrs: nounwind
declare i32 @abd_ext_i32(i32, i32) #0

; Function Attrs: nounwind
declare i32 @abd_ext_i32_i16(i32, i16) #0

; Function Attrs: nounwind
declare i32 @abd_ext_i32_undef(i32, i32) #0

; Function Attrs: nounwind
define i64 @abd_ext_i64(i64 %a, i64 %b) #0 {
  %LGV = load i64, ptr @G.2, align 4
  %aext = sext i64 %a to i128
  %C = icmp slt i64 4294967296, %LGV
  %B = or i64 %LGV, 0
  %bext = sext i64 %B to i128
  %sub = sub i128 %aext, %bext
  %abs = call i128 @llvm.abs.i128(i128 %sub, i1 false)
  %trunc = trunc i128 %abs to i64
  store i1 %C, ptr poison, align 1
  ret i64 %trunc
}

; Function Attrs: nounwind
declare i64 @abd_ext_i64_undef(i64, i64) #0

; Function Attrs: nounwind
declare i128 @abd_ext_i128(i128, i128) #0

; Function Attrs: nounwind
declare i128 @abd_ext_i128_undef(i128, i128) #0

; Function Attrs: nounwind
declare i8 @abd_minmax_i8(i8, i8) #0

; Function Attrs: nounwind
declare i16 @abd_minmax_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @abd_minmax_i32(i32, i32) #0

; Function Attrs: nounwind
define i64 @abd_minmax_i64(i64 %a, i64 %b) #0 {
  %A = alloca float, align 4
  store float poison, ptr %A, align 4
  %B = fadd float +qnan, +inf
  %min = call i64 @llvm.smin.i64(i64 %a, i64 %b)
  %max = call i64 @llvm.smax.i64(i64 %a, i64 %b)
  %sub = sub i64 %max, %min
  store float %B, ptr %A, align 4
  ret i64 %sub
}

; Function Attrs: nounwind
declare i128 @abd_minmax_i128(i128, i128) #0

; Function Attrs: nounwind
declare i8 @abd_cmp_i8(i8, i8) #0

; Function Attrs: nounwind
declare i16 @abd_cmp_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @abd_cmp_i32(i32, i32) #0

; Function Attrs: nounwind
declare i64 @abd_cmp_i64(i64, i64) #0

; Function Attrs: nounwind
declare i128 @abd_cmp_i128(i128, i128) #0

; Function Attrs: nounwind
declare i8 @abd_subnsw_i8(i8, i8) #0

; Function Attrs: nounwind
define i8 @abd_subnsw_i8_undef(i8 %a, i8 %b) #0 {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV = load <4 x i32>, ptr @G, align 16
  %C = icmp sle <4 x i32> %LGV, splat (i32 42)
  %sub = sub nsw i8 %a, %b
  %abs = call i8 @llvm.abs.i8(i8 %sub, i1 true)
  store <4 x i1> %C, ptr %A, align 1
  ret i8 %abs
}

; Function Attrs: nounwind
declare i16 @abd_subnsw_i16(i16, i16) #0

; Function Attrs: nounwind
define i16 @abd_subnsw_i16_undef(i16 %a, i16 %b) #0 {
  %LGV = load <4 x float>, ptr @G.1, align 16
  %sub = sub nsw i16 %a, %b
  %abs = call i16 @llvm.abs.i16(i16 %sub, i1 true)
  %C = fcmp oeq <4 x float> %LGV, splat (float +qnan)
  store <4 x i1> %C, ptr poison, align 1
  ret i16 %abs
}

; Function Attrs: nounwind
declare i32 @abd_subnsw_i32(i32, i32) #0

; Function Attrs: nounwind
declare i32 @abd_subnsw_i32_undef(i32, i32) #0

; Function Attrs: nounwind
declare i64 @abd_subnsw_i64(i64, i64) #0

; Function Attrs: nounwind
declare i64 @abd_subnsw_i64_undef(i64, i64) #0

; Function Attrs: nounwind
declare i128 @abd_subnsw_i128(i128, i128) #0

; Function Attrs: nounwind
declare i128 @abd_subnsw_i128_undef(i128, i128) #0

; Function Attrs: nounwind
declare i32 @abd_sub_i32(i32, i32) #0

; Function Attrs: nounwind
declare i8 @abd_select_i8(i8, i8) #0

; Function Attrs: nounwind
declare i16 @abd_select_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @abd_select_i32(i32, i32) #0

; Function Attrs: nounwind
declare i64 @abd_select_i64(i64, i64) #0

; Function Attrs: nounwind
declare i128 @abd_select_i128(i128, i128) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.abs.i128(i128, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.abs.i16(i16, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i256 @llvm.abs.i256(i256, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.abs.i64(i64, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.abs.i8(i8, i1 immarg) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.smax.i128(i128, i128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.smax.i16(i16, i16) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.smax.i8(i8, i8) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.smin.i128(i128, i128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.smin.i16(i16, i16) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.smin.i8(i8, i8) #2

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

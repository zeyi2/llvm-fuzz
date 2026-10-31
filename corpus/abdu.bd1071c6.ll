; isel-diff-config: -mtriple=riscv32 -mattr=+zfinx -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 0
@G.1 = global bfloat 1.000000e+00
@G.2 = global i8 -1
@G.3 = global i64 -1

; Function Attrs: nounwind
declare i8 @abd_ext_i8(i8, i8) #0

; Function Attrs: nounwind
declare i8 @abd_ext_i8_i16(i8, i16) #0

; Function Attrs: nounwind
define i8 @abd_ext_i8_undef(i8 %a, i8 %b) #0 {
  %B = sub i16 1, -1
  %aext = zext i8 %a to i64
  %bext = zext i8 %b to i64
  %sub = sub i64 %aext, %bext
  %abs = call i64 @llvm.abs.i64(i64 %sub, i1 true)
  %trunc = trunc i64 %abs to i8
  store i16 %B, ptr @G, align 2
  ret i8 %trunc
}

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
declare i64 @abd_ext_i64(i64, i64) #0

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
  %LGV = load i64, ptr @G.3, align 4
  %min = call i64 @llvm.umin.i64(i64 %a, i64 %b)
  %C = icmp slt i64 %a, %LGV
  %max = call i64 @llvm.umax.i64(i64 %a, i64 %b)
  %sub = sub i64 %max, %min
  store i1 %C, ptr poison, align 1
  ret i64 %sub
}

; Function Attrs: nounwind
define i128 @abd_minmax_i128(i128 %a, i128 %b) #0 {
  %min = call i128 @llvm.umin.i128(i128 %a, i128 %b)
  %max = call i128 @llvm.umax.i128(i128 %a, i128 %b)
  %sub = sub i128 %max, %min
  store i128 %min, ptr poison, align 4
  ret i128 %sub
}

; Function Attrs: nounwind
declare i8 @abd_cmp_i8(i8, i8) #0

; Function Attrs: nounwind
declare i16 @abd_cmp_i16(i16, i16) #0

; Function Attrs: nounwind
declare i32 @abd_cmp_i32(i32, i32) #0

; Function Attrs: nounwind
define i64 @abd_cmp_i64(i64 %a, i64 %b) #0 {
  %cmp = icmp uge i64 %a, %b
  %ab = sub i64 %a, %b
  %ba = sub i64 %b, %a
  %sel = select i1 %cmp, i64 %ab, i64 %ba
  %C = icmp sge i64 %b, %a
  store i1 %C, ptr poison, align 1
  ret i64 %sel
}

; Function Attrs: nounwind
declare i128 @abd_cmp_i128(i128, i128) #0

; Function Attrs: nounwind
define i8 @abd_select_i8(i8 %a, i8 %b) #0 {
  %LGV1 = load i8, ptr @G.2, align 1
  %LGV = load bfloat, ptr @G.1, align 2
  %C = fcmp ule bfloat %LGV, +qnan
  %cmp = icmp ult i8 %a, %b
  %ab = select i1 %cmp, i8 %a, i8 %b
  %ba = select i1 %C, i8 %b, i8 %a
  %B = and i8 %b, %LGV1
  %sub = sub i8 %ba, %ab
  store i8 %B, ptr @G.2, align 1
  ret i8 %sub
}

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
declare i256 @llvm.abs.i256(i256, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.abs.i64(i64, i1 immarg) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.umax.i128(i128, i128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.umax.i16(i16, i16) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.umax.i8(i8, i8) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.umin.i128(i128, i128) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.umin.i16(i16, i16) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.umin.i8(i8, i8) #2

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

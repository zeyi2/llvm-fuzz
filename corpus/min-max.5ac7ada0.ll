; isel-diff-config: -mtriple=riscv64 -mattr=+short-forward-branch-ialu,+zve32x,+zhinx -O1 -code-model=medium -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i1 false
@G.2 = global <4 x i32> splat (i32 -2147483648)
@G.3 = global <4 x i32> splat (i32 2147483647)
@G.4 = global <8 x i8> splat (i8 16)
@G.5 = global i1 false
@G.6 = global i64 0

declare signext i8 @smax_i8(i8 signext, i8 signext)

define signext i16 @smax_i16(i16 signext %a, i16 signext %b) {
  %LGV = load i1, ptr @G.5, align 1
  %c = call i16 @llvm.smax.i16(i16 %a, i16 %b)
  %B = shl i1 false, %LGV
  store i1 %B, ptr @G.5, align 1
  ret i16 %c
}

declare signext i32 @smax_i32(i32 signext, i32 signext)

declare i64 @smax_i64(i64, i64)

declare signext i8 @smin_i8(i8 signext, i8 signext)

declare signext i16 @smin_i16(i16 signext, i16 signext)

declare signext i32 @smin_i32(i32 signext, i32 signext)

declare i64 @smin_i64(i64, i64)

define i8 @umax_i8(i8 zeroext %a, i8 zeroext %b) {
  %c = call i8 @llvm.umax.i8(i8 %a, i8 %b)
  %B = sdiv i8 %b, %c
  ret i8 %B
}

define i16 @umax_i16(i16 zeroext %a, i16 zeroext %b) {
  %LGV = load <8 x i8>, ptr @G.4, align 8
  %S = shufflevector <8 x i8> splat (i8 42), <8 x i8> %LGV, <8 x i32> poison
  %c = call i16 @llvm.umax.i16(i16 %a, i16 %b)
  store <8 x i8> %S, ptr poison, align 8
  ret i16 %c
}

declare signext i32 @umax_i32(i32 signext, i32 signext)

declare i64 @umax_i64(i64, i64)

declare zeroext i8 @umin_i8(i8 zeroext, i8 zeroext)

define zeroext i16 @umin_i16(i16 zeroext %a, i16 zeroext %b) {
  %B = add i64 -1, 9223372036854775807
  %c = call i16 @llvm.umin.i16(i16 %a, i16 %b)
  store i64 %B, ptr @G.6, align 4
  ret i16 %c
}

declare signext i32 @umin_i32(i32 signext, i32 signext)

declare i64 @umin_i64(i64, i64)

declare signext i32 @smin_same_op_i32(i32 signext)

declare signext i32 @smax_same_op_i32(i32 signext)

declare signext i32 @umin_same_op_i32(i32 signext)

declare signext i32 @umax_same_op_i32(i32 signext)

define signext i32 @smin_undef_i32() {
  %LGV1 = load i1, ptr @G.1, align 1
  %LGV = load i1, ptr @G, align 1
  %c = call i32 @llvm.smin.i32(i32 undef, i32 undef)
  %C = icmp sge i1 %LGV, %LGV1
  store i1 %C, ptr @G, align 1
  ret i32 %c
}

declare signext i32 @smax_undef_i32()

declare signext i32 @umin_undef_i32()

declare signext i32 @umax_undef_i32()

declare signext i32 @smax_i32_pos_constant(i32 signext)

declare signext i32 @smax_i32_pos_constant_trailing_zeros(i32 signext)

declare signext i32 @smin_i32_negone(i32 signext)

declare i64 @smin_i64_negone(i64)

define i64 @umax_i64_one(i64 %a, i64 %b) {
  %LGV = load <4 x i32>, ptr @G.2, align 16
  %c = call i64 @llvm.umax.i64(i64 %a, i64 1)
  %B = srem <4 x i32> splat (i32 42), %LGV
  store <4 x i32> %B, ptr @G.3, align 16
  ret i64 %c
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.smax.i16(i16, i16) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.smax.i8(i8, i8) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.smin.i16(i16, i16) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.smin.i8(i8, i8) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.umax.i16(i16, i16) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.umax.i8(i8, i8) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.umin.i16(i16, i16) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.umin.i8(i8, i8) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

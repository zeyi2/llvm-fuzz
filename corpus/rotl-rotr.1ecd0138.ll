; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+xtheadbb,+zdinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 0
@G.1 = global i32 -2147483648
@G.2 = global i32 0
@G.3 = global i64 -1
@G.4 = global i1 true

; Function Attrs: nounwind
declare i32 @rotl_32(i32, i32) #0

; Function Attrs: nounwind
declare i32 @rotr_32(i32, i32) #0

; Function Attrs: nounwind
declare i64 @rotl_64(i64, i64) #0

; Function Attrs: nounwind
declare i64 @rotr_64(i64, i64) #0

; Function Attrs: nounwind
declare i32 @rotl_32_mask(i32, i32) #0

; Function Attrs: nounwind
declare i32 @rotl_32_mask_and_63_and_31(i32, i32) #0

; Function Attrs: nounwind
declare i32 @rotl_32_mask_or_64_or_32(i32, i32) #0

; Function Attrs: nounwind
declare i32 @rotr_32_mask(i32, i32) #0

; Function Attrs: nounwind
define i32 @rotr_32_mask_and_63_and_31(i32 %x, i32 %y) #0 {
  %a = and i32 %y, 63
  %C = icmp sgt i32 %a, %x
  %b = lshr i32 %x, %a
  %c = sub i32 0, %y
  %d = and i32 %c, 31
  %e = shl i32 %x, %d
  %f = or i32 %b, %e
  store i1 %C, ptr poison, align 1
  ret i32 %f
}

; Function Attrs: nounwind
define i32 @rotr_32_mask_or_64_or_32(i32 %x, i32 %y) #0 {
  %LGV = load i32, ptr @G.1, align 4
  %a = or i32 %y, 64
  %b = lshr i32 %x, %a
  %c = sub i32 0, %y
  %d = or i32 %c, 32
  %e = shl i32 %x, %d
  %f = or i32 %b, %e
  %B = add i32 %b, %LGV
  store i32 %B, ptr @G.2, align 4
  ret i32 %f
}

; Function Attrs: nounwind
define i64 @rotl_64_mask(i64 %x, i64 %y) #0 {
  %A2 = alloca i1, align 1
  store i1 poison, ptr %A2, align 1
  %LGV1 = load i1, ptr @G.4, align 1
  %A = alloca i64, align 8
  %L = load i1, ptr %A, align 1
  %C = icmp slt i1 %L, %LGV1
  store i64 poison, ptr %A, align 4
  %z = sub i64 0, %y
  %and = and i64 %z, 63
  %b = shl i64 %x, %y
  %c = lshr i64 %x, %and
  %d = or i64 %b, %c
  %B = srem i64 %y, -1
  store i64 %B, ptr %A, align 4
  store i1 %C, ptr %A2, align 1
  ret i64 %d
}

; Function Attrs: nounwind
declare i64 @rotl_64_mask_and_127_and_63(i64, i64) #0

; Function Attrs: nounwind
declare i64 @rotl_64_mask_or_128_or_64(i64, i64) #0

; Function Attrs: nounwind
declare i64 @rotr_64_mask(i64, i64) #0

; Function Attrs: nounwind
declare i64 @rotr_64_mask_and_127_and_63(i64, i64) #0

; Function Attrs: nounwind
declare i64 @rotr_64_mask_or_128_or_64(i64, i64) #0

; Function Attrs: nounwind
declare signext i32 @rotl_32_mask_shared(i32 signext, i32 signext, i32 signext) #0

; Function Attrs: nounwind
declare signext i64 @rotl_64_mask_shared(i64 signext, i64 signext, i64 signext) #0

; Function Attrs: nounwind
declare signext i32 @rotr_32_mask_shared(i32 signext, i32 signext, i32 signext) #0

; Function Attrs: nounwind
declare signext i64 @rotr_64_mask_shared(i64 signext, i64 signext, i64 signext) #0

; Function Attrs: nounwind
declare signext i32 @rotl_32_mask_multiple(i32 signext, i32 signext, i32 signext) #0

; Function Attrs: nounwind
define i64 @rotl_64_mask_multiple(i64 %a, i64 %b, i64 %amt) #0 {
  %LGV = load i64, ptr @G, align 4
  %maskedamt = and i64 %amt, 63
  %B = sdiv i64 %maskedamt, %LGV
  %1 = tail call i64 @llvm.fshl.i64(i64 %a, i64 %a, i64 %maskedamt)
  %2 = tail call i64 @llvm.fshl.i64(i64 %b, i64 %b, i64 %B)
  %3 = add i64 %1, %2
  ret i64 %3
}

; Function Attrs: nounwind
define signext i32 @rotr_32_mask_multiple(i32 signext %a, i32 signext %b, i32 signext %amt) #0 {
  %maskedamt = and i32 %amt, 31
  %1 = tail call i32 @llvm.fshr.i32(i32 %a, i32 %a, i32 %maskedamt)
  %B = udiv i32 %maskedamt, 2147483647
  %2 = tail call i32 @llvm.fshr.i32(i32 %b, i32 %b, i32 %maskedamt)
  %3 = add i32 %1, %2
  store i32 %B, ptr poison, align 4
  ret i32 %3
}

; Function Attrs: nounwind
declare i64 @rotr_64_mask_multiple(i64, i64, i64) #0

; Function Attrs: nounwind
define i64 @rotl_64_zext(i64 %x, i32 %y) #0 {
  %A = alloca i64, align 8
  store i64 poison, ptr %A, align 4
  %LGV1 = load i64, ptr @G.3, align 4
  %z = sub i32 64, %y
  %zext = zext i32 %z to i64
  %B = udiv i64 %x, %LGV1
  %zexty = zext i32 %y to i64
  %b = shl i64 %x, %zexty
  %c = lshr i64 %x, %zext
  %d = or i64 %b, %c
  store i64 %B, ptr %A, align 4
  ret i64 %d
}

; Function Attrs: nounwind
declare i64 @rotr_64_zext(i64, i32) #0

declare i8 @rotr_i8(i8, i8)

declare i16 @rotr_i16(i16, i16)

define i8 @rotl_i8(i8 %x, i8 %z) {
  %f = call i8 @llvm.fshl.i8(i8 %x, i8 %x, i8 %z)
  %B = sub i8 %f, %f
  ret i8 %B
}

declare i16 @rotl_i16(i16, i16)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fshl.i16(i16, i16, i16) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshl.i64(i64, i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fshl.i8(i8, i8, i8) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fshr.i16(i16, i16, i16) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshr.i64(i64, i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.fshr.i8(i8, i8, i8) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

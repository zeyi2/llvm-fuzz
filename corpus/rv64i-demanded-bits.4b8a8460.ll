; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 65536
@G.1 = global <4 x i32> splat (i32 -2147483648)
@G.2 = global <4 x i1> zeroinitializer

declare i32 @foo(i32, i32, i32)

declare i64 @mul_self_nsw_sign(i64)

declare void @ori(ptr noundef captures(none))

declare void @xori(ptr noundef captures(none))

declare void @or_signbit(ptr noundef captures(none))

define void @xor_signbit(ptr noundef captures(none) %0) {
  %LGV = load <4 x i32>, ptr @G.1, align 16
  %2 = load i32, ptr %0, align 4
  %C = icmp ult <4 x i32> zeroinitializer, %LGV
  %3 = xor i32 %2, -2147483648
  store i32 %3, ptr %0, align 4
  store <4 x i1> %C, ptr @G.2, align 1
  ret void
}

define signext i32 @andi_sub_cse(i32 signext %0, i32 signext %1, ptr %2) {
  %4 = and i32 %0, -8
  %B = sdiv i32 %4, %0
  %5 = sub i32 %4, %1
  store i32 %5, ptr %2, align 4
  store i32 %B, ptr @G, align 4
  ret i32 %5
}

declare signext i32 @addi_sub_cse(i32 signext, i32 signext, ptr)

define signext i32 @xori_sub_cse(i32 signext %0, i32 signext %1, ptr %2) {
  %4 = xor i32 %0, -8
  %5 = sub i32 %4, %1
  %C = icmp ult i32 %4, %5
  store i32 %5, ptr %2, align 4
  store i1 %C, ptr poison, align 1
  ret i32 %5
}

define signext i32 @ori_sub_cse(i32 signext %0, i32 signext %1, ptr %2) {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %4 = or i32 %0, -8
  %5 = sub i32 %4, %1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  store i32 %5, ptr %2, align 4
  ret i32 %5

T:                                                ; preds = %3
  br label %BB

F:                                                ; preds = %3
  br label %BB
}

declare signext i32 @andi_srliw(i32 signext, ptr, i32 signext)

declare i32 @and_or(i32 signext)

declare i64 @and_allones(i32 signext)

declare i64 @and_mul_32bitsplat(i64)

declare i64 @ctop_hibit_zero(i63 zeroext)

; Function Attrs: optsize
define i64 @ctpop_hibit_zero_optsize(i63 zeroext %x) #0 {
  %a = zext i63 %x to i64
  %b = call i64 @llvm.ctpop.i64(i64 %a)
  %B = and i64 %b, %b
  store i64 %B, ptr poison, align 4
  ret i64 %b
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #1

attributes #0 = { optsize }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

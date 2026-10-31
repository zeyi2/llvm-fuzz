; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+xcvbitmanip,+zhinx,+zvbb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true

declare i32 @test.cv.extractr(i32, i32)

declare i32 @test.cv.extract(i32)

define i32 @test.cv.extract1023(i32 %a) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C1 = fcmp olt float 4.200000e+01, 1.401300e-45
  %C = icmp ne i32 %a, 65536
  %1 = call i32 @llvm.riscv.cv.bitmanip.extract(i32 %a, i32 1023)
  store i1 %C, ptr @G, align 1
  store i1 %C1, ptr %A, align 1
  ret i32 %1
}

declare i32 @test.cv.extractur(i32, i32)

declare i32 @test.cv.extractu(i32)

declare i32 @test.cv.insert(i32, i32)

declare i32 @test.cv.insertr(i32, i32, i32)

define i32 @test.cv.bclrr(i32 %a, i32 %b) {
  %1 = call i32 @llvm.riscv.cv.bitmanip.bclr(i32 %a, i32 %b)
  %C = icmp eq i32 %1, 65536
  store i1 %C, ptr poison, align 1
  ret i32 %1
}

declare i32 @test.cv.bclr(i32)

declare i32 @test.cv.bsetr(i32, i32)

declare i32 @test.cv.bset(i32)

declare i32 @test.cv.ff1(i32)

declare i32 @test.cv.fl1(i32)

declare i32 @test.ctlz.zero.defined(i32)

declare i32 @test.cv.clb(i32)

declare i32 @test.cv.cnt(i32)

declare i32 @test.llvm.fshl.imm(i32)

declare i32 @test.llvm.fshl.reg(i32, i32)

declare i32 @test.llvm.fshr.imm(i32)

declare i32 @test.llvm.fshr.reg(i32, i32)

declare i32 @test.cv.bitrev(i32)

declare i32 @test.llvm.bitrev(i32)

; Function Attrs: nounwind
declare i1 @ctpop_i32_ult_two(i32 signext) #0

; Function Attrs: nounwind
declare i1 @ctpop_i32_ugt_one(i32 signext) #0

; Function Attrs: nounwind
define i1 @ctpop_i32_eq_one(i32 signext %a) #0 {
  %A = alloca <2 x i1>, align 1
  store <2 x i1> poison, ptr %A, align 1
  %1 = call i32 @llvm.ctpop.i32(i32 %a)
  %C = icmp sgt <2 x i64> zeroinitializer, splat (i64 1)
  %2 = icmp eq i32 %1, 1
  store <2 x i1> %C, ptr %A, align 1
  ret i1 %2
}

; Function Attrs: nounwind
declare i1 @ctpop_i32_ne_one(i32 signext) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.bitreverse.i32(i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ctpop.i32(i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.cttz.i32(i32, i1 immarg) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.cv.bitmanip.bclr(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.cv.bitmanip.bitrev(i32, i32 immarg, i32 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.cv.bitmanip.bset(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.cv.bitmanip.clb(i32) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.cv.bitmanip.extract(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.cv.bitmanip.extractu(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.cv.bitmanip.insert(i32, i32, i32) #2

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

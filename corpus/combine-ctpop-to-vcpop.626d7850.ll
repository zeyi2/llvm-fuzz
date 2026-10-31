; isel-diff-config: -mtriple=riscv64 -mattr=+v,+zbb,+zfhmin,+zicond -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i256 -1
@G.2 = global i64 -9223372036854775808

declare i2 @test_v2i1(<2 x i1>)

declare i4 @test_v4i1(<4 x i1>)

define i8 @test_v8i1(<8 x i1> %x) {
entry:
  %A = alloca <8 x i1>, align 1
  store <8 x i1> poison, ptr %A, align 1
  %a = bitcast <8 x i1> %x to i8
  %b = call i8 @llvm.ctpop.i8(i8 %a)
  %C = icmp eq <8 x i1> %x, splat (i1 true)
  store <8 x i1> %C, ptr %A, align 1
  ret i8 %b
}

define i16 @test_v16i1(<16 x i1> %x) {
entry:
  %LGV = load i64, ptr @G.2, align 4
  %a = bitcast <16 x i1> %x to i16
  %E = extractelement <16 x i1> %x, i64 %LGV
  %b = call i16 @llvm.ctpop.i16(i16 %a)
  store i1 %E, ptr poison, align 1
  ret i16 %b
}

declare i32 @test_v32i1(<32 x i1>)

declare i64 @test_v64i1(<64 x i1>)

define i128 @test_v128i1(<128 x i1> %x) {
entry:
  %B = or <128 x i1> %x, zeroinitializer
  %a = bitcast <128 x i1> %B to i128
  %b = call i128 @llvm.ctpop.i128(i128 %a)
  ret i128 %b
}

declare i32 @test_trunc_v128i1(<128 x i1>)

define i256 @test_v256i1(<256 x i1> %x) {
entry:
  %LGV = load i1, ptr @G, align 1
  %a = bitcast <256 x i1> %x to i256
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %T
  ret i256 %B

T:                                                ; preds = %entry
  %B = sub i256 %a, 57896044618658097711785492504343953926634992332820282019728792003956564819967
  br label %BB

F:                                                ; preds = %entry
  %LGV1 = load i256, ptr @G.1, align 4
  ret i256 %LGV1
}

declare i32 @test_trunc_v256i1(<256 x i1>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i128 @llvm.ctpop.i128(i128) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.ctpop.i16(i16) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i2 @llvm.ctpop.i2(i2) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i256 @llvm.ctpop.i256(i256) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i4 @llvm.ctpop.i4(i4) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.ctpop.i8(i8) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

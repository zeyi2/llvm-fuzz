; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zbb,+zdinx -O0 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 -1
@G.1 = global i8 0
@G.2 = global i4 -8
@G.3 = global i1 true
@G.4 = global i1 false
@G.5 = global i32 0
@G.6 = global i64 0

; Function Attrs: nounwind
define i32 @func32(i32 %x, i32 %y, i32 %z) #0 {
  %LGV = load i32, ptr @G.5, align 4
  %B1 = lshr i32 0, 65536
  %B = ashr i32 %B1, %LGV
  %C = icmp ne i32 %x, %B
  store i1 %C, ptr @G.4, align 1
  ret i32 %B1
}

; Function Attrs: nounwind
define i64 @func64(i64 %x, i64 %y, i64 %z) #0 {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %tmp = call i64 @llvm.usub.sat.i64(i64 %x, i64 %z)
  switch i64 %y, label %SW_D [
    i64 -971108014427832681, label %SW_C
    i64 -8499070888948150466, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_C, %SW_D
  %LGV2 = load i64, ptr @G.6, align 4
  %a = mul i64 %y, %z
  store i64 %tmp, ptr poison, align 4
  %B = urem i64 %a, %LGV2
  store i64 %B, ptr poison, align 4
  ret i64 %tmp

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %SW_C1, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_C1, label %BB
}

; Function Attrs: nounwind
declare i16 @func16(i16, i16, i16) #0

; Function Attrs: nounwind
define i8 @func8(i8 %x, i8 %y, i8 %z) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %a = mul i8 %y, %z
  %tmp = call i8 @llvm.usub.sat.i8(i8 %x, i8 %a)
  %C = fcmp false float 1.000000e+00, 4.200000e+01
  %B = srem i8 %y, 0
  store i8 %B, ptr @G.1, align 1
  store i1 %C, ptr %A, align 1
  ret i8 %tmp
}

; Function Attrs: nounwind
define i4 @func4(i4 %x, i4 %y, i4 %z) #0 {
  %B = lshr i4 %x, -6
  %a = mul i4 %y, %z
  %tmp = call i4 @llvm.usub.sat.i4(i4 %x, i4 %a)
  store i4 %tmp, ptr @G.2, align 1
  store i4 %B, ptr @G.2, align 1
  ret i4 %tmp
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.usub.sat.i16(i16, i16) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.usub.sat.i32(i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i4 @llvm.usub.sat.i4(i4, i4) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.usub.sat.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.usub.sat.i8(i8, i8) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

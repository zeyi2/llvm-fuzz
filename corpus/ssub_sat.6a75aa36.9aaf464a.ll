; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zdinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 0
@G.1 = global i4 1
@G.2 = global i4 7
@G.3 = global i8 0
@G.4 = global <2 x i64> splat (i64 -1)
@G.5 = global i1 false
@G.6 = global i16 42
@G.7 = global i1 false
@G.8 = global <2 x i1> splat (i1 true)
@G.9 = global i8 42
@G.10 = global i8 1

; Function Attrs: nounwind
declare signext i32 @func(i32 signext, i32 signext) #0

; Function Attrs: nounwind
declare i64 @func2(i64, i64) #0

; Function Attrs: nounwind
define signext i16 @func16(i16 signext %x, i16 signext %y) #0 {
  %A = alloca i32, align 4
  %L1 = load double, ptr %A, align 8
  store i32 poison, ptr %A, align 4
  %B1 = xor i32 -2147483648, 0
  %LGV = load i16, ptr @G, align 2
  %B = add i16 %LGV, %y
  store i32 %B1, ptr %A, align 4
  %C = fcmp olt double 4.200000e+01, %L1
  store i1 %C, ptr @G.5, align 1
  ret i16 %B
}

; Function Attrs: nounwind
define signext i8 @func8(i8 signext %x, i8 signext %y) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV2 = load i16, ptr @G.6, align 2
  %LGV = load <2 x i64>, ptr @G.4, align 16
  %tmp = call i8 @llvm.ssub.sat.i8(i8 %x, i8 %y)
  %B = srem i8 %x, 1
  store i8 %B, ptr @G.3, align 1
  switch i16 %LGV2, label %SW_D [
    i16 836, label %SW_C
    i16 9986, label %SW_C3
    i16 17977, label %SW_C4
    i16 -10538, label %SW_C5
    i16 15456, label %SW_C6
  ]

BB:                                               ; preds = %SW_C6, %SW_C5, %SW_C3, %SW_D
  %B1 = add <2 x i64> %LGV, splat (i64 9223372036854775807)
  store <2 x i64> %B1, ptr poison, align 16
  ret i8 %tmp

SW_D:                                             ; preds = %0
  %LGV9 = load i8, ptr @G.9, align 1
  %B10 = lshr i8 %x, %LGV9
  store i8 %B10, ptr @G.10, align 1
  br label %BB

SW_C:                                             ; preds = %0
  ret i8 %x

SW_C3:                                            ; preds = %SW_C3, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_C3, label %BB

SW_C4:                                            ; preds = %0
  ret i8 %x

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %SW_C6, %0
  %LGV8 = load i1, ptr @G.7, align 1
  br i1 %LGV8, label %SW_C6, label %BB
}

; Function Attrs: nounwind
define signext i4 @func3(i4 signext %x, i4 signext %y) #0 {
  %tmp = call i4 @llvm.ssub.sat.i4(i4 %x, i4 %y)
  %B = mul i4 %y, %tmp
  store i4 %B, ptr @G.1, align 1
  %C1 = icmp ne i4 %y, 4
  store i1 %C1, ptr poison, align 1
  %C = icmp ult <2 x i64> splat (i64 -9223372036854775808), splat (i64 -9223372036854775808)
  store <2 x i1> %C, ptr @G.8, align 1
  ret i4 %tmp
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.ssub.sat.i16(i16, i16) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ssub.sat.i32(i32, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i4 @llvm.ssub.sat.i4(i4, i4) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ssub.sat.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.ssub.sat.i8(i8, i8) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

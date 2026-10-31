; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx,+zicsr -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@x = local_unnamed_addr global fp128 +inf, align 16
@y = local_unnamed_addr global fp128 +inf, align 16
@G = global <4 x i32> splat (i32 1)
@G.1 = global i128 1
@G.2 = global i1 true
@G.3 = global <8 x i8> splat (i8 1)

; Function Attrs: nounwind
declare i32 @test_load_and_cmp() #0

; Function Attrs: nounwind
define i32 @test_add_and_fptosi() #0 {
  %LGV1 = load i128, ptr @G.1, align 4
  %LGV = load <4 x i32>, ptr @G, align 16
  %1 = load fp128, ptr @x, align 16
  %B = ashr <8 x i8> splat (i8 42), splat (i8 16)
  %2 = load fp128, ptr @y, align 16
  %3 = fadd fp128 %1, %2
  store <8 x i8> %B, ptr @G.3, align 8
  switch i128 %LGV1, label %SW_D [
    i128 14136699116338369072, label %SW_C
    i128 13395692558097366043, label %SW_C2
    i128 14565308459428350923, label %SW_C3
    i128 11107813690391032213, label %SW_C4
    i128 13291091642482866790, label %SW_C5
    i128 5188675586592404693, label %SW_C6
  ]

BB:                                               ; preds = %SW_C6, %SW_C5, %SW_C4, %SW_C3, %SW_C2, %SW_C, %SW_D
  %4 = fptosi fp128 %3 to i32
  %S = shufflevector <4 x i32> splat (i32 42), <4 x i32> %LGV, <4 x i32> poison
  store <4 x i32> %S, ptr @G, align 16
  ret i32 %4

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %SW_C5, %0
  %LGV7 = load i1, ptr @G.2, align 1
  br i1 %LGV7, label %SW_C5, label %BB

SW_C6:                                            ; preds = %0
  br label %BB
}

declare fp128 @fmaximum(fp128, fp128)

define fp128 @fminimum(fp128 %x, fp128 %y) {
  %B = fdiv fp128 %x, 0.000000e+00
  %a = call fp128 @llvm.minimum.f128(fp128 %x, fp128 %y)
  %C = fcmp uge fp128 %x, +qnan
  store i1 %C, ptr poison, align 1
  store fp128 %B, ptr @y, align 16
  ret fp128 %a
}

; Function Attrs: nounwind
declare { fp128, fp128 } @modf(fp128) #0

; Function Attrs: nounwind
declare i96 @fptosi_fp128_to_i96(fp128) #0

; Function Attrs: nounwind
declare i32 @lround_f128() #0

; Function Attrs: nounwind
declare fp128 @ldexp_f128(fp128, i32) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.ldexp.f128.i32(fp128, i32) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lround.i32.f128(fp128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.maximum.f128(fp128, fp128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.minimum.f128(fp128, fp128) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { fp128, fp128 } @llvm.modf.f128(fp128) #2

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

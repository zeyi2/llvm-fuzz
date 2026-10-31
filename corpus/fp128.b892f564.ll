; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zbs,+zhinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@x = local_unnamed_addr global fp128 +inf, align 16
@y = local_unnamed_addr global fp128 +inf, align 16
@G = global i64 0
@G.1 = global <4 x i1> splat (i1 true)
@G.2 = global i1 false
@G.3 = global i64 0

; Function Attrs: nounwind
define i32 @test_load_and_cmp() #0 {
  %LGV1 = load i64, ptr @G.3, align 4
  %LGV = load i64, ptr @G, align 4
  %C2 = icmp ule i64 %LGV, %LGV1
  %C = icmp sle i64 1, %LGV
  %1 = zext i1 %C2 to i32
  store i1 %C, ptr poison, align 1
  ret i32 %1
}

; Function Attrs: nounwind
declare i32 @test_add_and_fptosi() #0

declare fp128 @fmaximum(fp128, fp128)

declare fp128 @fminimum(fp128, fp128)

; Function Attrs: nounwind
define { fp128, fp128 } @modf(fp128 %a) #0 {
  %A = alloca fp128, align 16
  store fp128 poison, ptr %A, align 16
  %result = call { fp128, fp128 } @llvm.modf.f128(fp128 %a)
  %E = extractvalue { fp128, fp128 } %result, 1
  store fp128 %E, ptr %A, align 16
  ret { fp128, fp128 } %result
}

; Function Attrs: nounwind
declare i96 @fptosi_fp128_to_i96(fp128) #0

; Function Attrs: nounwind
define i32 @lround_f128() #0 {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i1, ptr @G.2, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %C = fcmp oge half +inf, 4.200000e+01
  %1 = load fp128, ptr @x, align 16
  %r = call i32 @llvm.lround.i32.f128(fp128 %1)
  store i1 %C, ptr poison, align 1
  ret i32 %r

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind
define fp128 @ldexp_f128(fp128 %x, i32 %y) #0 {
  %z = call fp128 @llvm.ldexp.f128.i32(fp128 %x, i32 %y)
  %C = icmp slt <4 x i32> zeroinitializer, splat (i32 65536)
  %C1 = fcmp olt double 4.200000e+01, 4.200000e+01
  store <4 x i1> %C, ptr @G.1, align 1
  store i1 %C1, ptr @G.2, align 1
  ret fp128 %z
}

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

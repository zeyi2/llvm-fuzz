; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zfinx,+zvbb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@x = local_unnamed_addr global fp128 +inf, align 16
@y = local_unnamed_addr global fp128 +inf, align 16
@G = global i32 -2147483648
@G.1 = global i1 false
@G.2 = global float 4.200000e+01
@G.4 = global i32 -1
@G.5 = global { fp128, fp128 } poison

; Function Attrs: nounwind
declare i32 @test_load_and_cmp() #0

; Function Attrs: nounwind
declare i32 @test_add_and_fptosi() #0

define fp128 @fmaximum(fp128 %x, fp128 %y) {
  %LGV6 = load i32, ptr @G.4, align 4
  %A5 = alloca i1, align 1
  store i1 poison, ptr %A5, align 1
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load float, ptr @G.2, align 4
  %LGV = load i32, ptr @G, align 4
  %G = getelementptr fp128, ptr %A, i32 %LGV6
  %C2 = fcmp ugt float +qnan, %LGV1
  %B = frem fp128 %x, %x
  %C4 = icmp ule i1 %C2, %C2
  %C = icmp sle i32 -2147483648, %LGV
  store i1 %C, ptr @G.1, align 1
  store i1 %C2, ptr %G, align 1
  store i1 %C4, ptr %A5, align 1
  ret fp128 %B
}

declare fp128 @fminimum(fp128, fp128)

; Function Attrs: nounwind
define { fp128, fp128 } @modf(fp128 %a) #0 {
  %result = call { fp128, fp128 } @llvm.modf.f128(fp128 %a)
  %C = fcmp ult fp128 %a, 4.200000e+01
  %A = alloca { fp128, fp128 }, align 16
  %I = insertvalue { fp128, fp128 } %result, fp128 %a, 0
  %E = extractvalue { fp128, fp128 } %result, 0
  store { fp128, fp128 } poison, ptr %A, align 16
  store { fp128, fp128 } %result, ptr %A, align 16
  store i1 %C, ptr @G.1, align 1
  store fp128 %E, ptr poison, align 16
  store { fp128, fp128 } %I, ptr @G.5, align 16
  ret { fp128, fp128 } %result
}

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

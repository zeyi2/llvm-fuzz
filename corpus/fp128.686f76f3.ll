; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zfinx -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@x = local_unnamed_addr global fp128 +inf, align 16
@y = local_unnamed_addr global fp128 +inf, align 16
@G = global i1 false
@G.1 = global <4 x i32> splat (i32 42)

; Function Attrs: nounwind
declare i32 @test_load_and_cmp() #0

; Function Attrs: nounwind
define i32 @test_add_and_fptosi() #0 {
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %LGV = load <4 x i32>, ptr @G.1, align 16
  %1 = load fp128, ptr @x, align 16
  %2 = load fp128, ptr @y, align 16
  %C = fcmp olt fp128 %2, %2
  %3 = fadd fp128 %1, %2
  %4 = fptosi fp128 %3 to i32
  store i1 %C, ptr poison, align 1
  %I = insertelement <4 x i32> %LGV, i32 -2147483648, i1 %C
  store <4 x i32> %I, ptr %A, align 16
  ret i32 %4
}

define fp128 @fmaximum(fp128 %x, fp128 %y) {
  %a = call fp128 @llvm.maximum.f128(fp128 %x, fp128 %y)
  %C = fcmp uge fp128 %x, %y
  store i1 %C, ptr @G, align 1
  ret fp128 %a
}

declare fp128 @fminimum(fp128, fp128)

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

; isel-diff-config: -mtriple=riscv64 -mattr=+zdinx -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i32 -2147483648
@G.2 = global bfloat 4.200000e+01

; Function Attrs: nounwind
define i32 @lrint_f32(float %a) #0 {
  %LGV = load i1, ptr @G, align 1
  %r = call i32 @llvm.lrint.i32.f32(float %a)
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F
  ret i32 %B

T:                                                ; preds = %0
  %LGV1 = load i32, ptr @G.1, align 4
  ret i32 %LGV1

F:                                                ; preds = %0
  %B = srem i32 65536, %r
  br label %BB
}

; Function Attrs: nounwind
define i32 @lrint_f64(double %a) #0 {
  %B = fsub double %a, %a
  %r = call i32 @llvm.lrint.i32.f64(double %B)
  ret i32 %r
}

; Function Attrs: nounwind
define i64 @llrint_f32(float %a) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp false float 4.200000e+01, 4.200000e+01
  %r = call i64 @llvm.llrint.i64.f32(float %a)
  store i1 %C, ptr %A, align 1
  ret i64 %r
}

; Function Attrs: nounwind
define i64 @llrint_f64(double %a) #0 {
  %LGV = load bfloat, ptr @G.2, align 2
  %C = fcmp ule bfloat %LGV, +qnan
  %r = call i64 @llvm.llrint.i64.f64(double %a)
  store i1 %C, ptr poison, align 1
  ret i64 %r
}

; Function Attrs: nounwind
define i32 @lrint_f128(fp128 %a) #0 {
  %r = call i32 @llvm.lrint.i32.f128(fp128 %a)
  %B = fmul <4 x float> splat (float f0x7F7FFFFF), splat (float +inf)
  %A = alloca <4 x float>, align 16
  store <4 x float> poison, ptr %A, align 16
  %L = load i32, ptr %A, align 4
  %G = getelementptr fp128, ptr %A, i32 %L
  store <4 x float> %B, ptr %G, align 16
  ret i32 %r
}

; Function Attrs: nounwind
declare i64 @llrint_f128(fp128) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lrint.i32.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lrint.i32.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.llrint.i64.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.llrint.i64.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lrint.i32.f128(fp128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.llrint.i64.f128(fp128) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

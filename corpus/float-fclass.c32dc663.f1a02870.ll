; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+f -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -2147483648
@G.1 = global i1 true

define i1 @fpclass(ptr %x) {
  %G1 = getelementptr bfloat, ptr %x, i1 false
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %B = or i32 0, 1
  %B1 = add i32 %B, %B
  %G = getelementptr ptr, ptr %x, i32 %B
  %L = load i1, ptr %G, align 1
  %L4 = load i1, ptr %A, align 1
  br i1 %L4, label %T, label %F

BB:                                               ; preds = %T
  %L2 = load i1, ptr %G, align 1
  %a = load float, ptr %G, align 4
  %C = fcmp ogt float %a, 0.000000e+00
  %cmp = call i1 @llvm.is.fpclass.f32(float %a, /* (nan inf zero nsub nnorm) */ i32 639)
  %G3 = getelementptr i8, ptr %x, i1 %L2
  store i32 %B, ptr %G3, align 4
  store i32 %B1, ptr %G, align 4
  %G6 = getelementptr <4 x float>, ptr %x, i1 %L
  store ptr %G6, ptr %A, align 8
  store i1 %C, ptr %G3, align 1
  ret i1 %cmp

T:                                                ; preds = %0
  %B8 = srem i16 -1, 0
  store i16 %B8, ptr %A, align 2
  br label %BB

F:                                                ; preds = %0
  %LGV = load i1, ptr %G1, align 1
  ret i1 %LGV
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.is.fpclass.f32(float, i32 immarg) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

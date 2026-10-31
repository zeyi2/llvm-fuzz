; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zhinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

%struct.large = type { i64, i64, i64, i64 }
%struct.small = type { i64, ptr }

@G = global i128 0
@G.1 = global i64 -9223372036854775808
@G.2 = global i64 -1
@G.3 = global i1 true
@G.4 = global i1 false
@G.5 = global i1 false
@G.6 = global <4 x i32> splat (i32 65536)
@G.7 = global <2 x i64> splat (i64 4294967296)
@G.8 = global half +qnan

; Function Attrs: nounwind
declare i64 @callee_i128_in_regs(i64, i128) #0

; Function Attrs: nounwind
define i64 @caller_i128_in_regs() #0 {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV = load <4 x i32>, ptr @G.6, align 16
  %C = icmp ule <4 x i32> splat (i32 -2147483648), %LGV
  %1 = call i64 @callee_i128_in_regs(i64 1, i128 2)
  store <4 x i1> %C, ptr %A, align 1
  ret i64 %1
}

; Function Attrs: nounwind
declare i32 @callee_many_scalars(i8, i16, i32, i128, i32, i32, i128, i32) #0

; Function Attrs: nounwind
declare i32 @caller_many_scalars() #0

; Function Attrs: nounwind
declare i64 @callee_large_scalars(i256, i256) #0

; Function Attrs: nounwind
declare i64 @caller_large_scalars() #0

; Function Attrs: nounwind
define i64 @callee_large_scalars_exhausted_regs(i64 %a, i64 %b, i64 %c, i64 %d, i64 %e, i64 %f, i64 %g, i256 %h, i64 %i, i256 %j) #0 {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i128, ptr @G, align 4
  switch i128 %LGV, label %SW_D [
    i128 5011256578661349499, label %SW_C
    i128 14251416980859255702, label %SW_C1
    i128 2330408993174734843, label %SW_C2
    i128 2883051399685320044, label %SW_C3
    i128 14623344828497580901, label %SW_C4
    i128 2159818324022275550, label %SW_C5
  ]

BB:                                               ; preds = %SW_C5, %SW_C4, %SW_C3, %SW_C2, %SW_C
  %1 = icmp eq i256 %h, %j
  %2 = zext i1 %1 to i64
  ret i64 %2

SW_D:                                             ; preds = %0
  %LGV6 = load i64, ptr @G.1, align 4
  ret i64 %LGV6

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  %LGV7 = load i64, ptr @G.2, align 4
  ret i64 %LGV7

SW_C2:                                            ; preds = %SW_C2, %0
  %LGV8 = load i1, ptr @G.3, align 1
  br i1 %LGV8, label %SW_C2, label %BB

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %SW_C4, %0
  %LGV9 = load i1, ptr @G.4, align 1
  br i1 %LGV9, label %SW_C4, label %BB

SW_C5:                                            ; preds = %SW_C5, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %SW_C5
}

; Function Attrs: nounwind
declare i64 @caller_large_scalars_exhausted_regs() #0

; Function Attrs: nounwind
define i64 @caller_mixed_scalar_libcalls(i64 %a) #0 {
  %LGV = load half, ptr @G.8, align 2
  %C = fcmp false half 1.000000e+00, %LGV
  %1 = sitofp i64 %a to fp128
  %2 = bitcast fp128 %1 to i128
  %3 = trunc i128 %2 to i64
  store i1 %C, ptr @G.4, align 1
  ret i64 %3
}

; Function Attrs: nounwind
define i64 @callee_small_coerced_struct([2 x i64] %a.coerce) #0 {
  %1 = extractvalue [2 x i64] %a.coerce, 0
  %2 = extractvalue [2 x i64] %a.coerce, 1
  %3 = icmp eq i64 %1, %2
  %4 = zext i1 %3 to i64
  %B = urem <2 x i64> splat (i64 1), splat (i64 -1)
  store <2 x i64> %B, ptr @G.7, align 16
  ret i64 %4
}

; Function Attrs: nounwind
declare i64 @caller_small_coerced_struct() #0

; Function Attrs: nounwind
declare i64 @callee_large_struct(ptr byval(%struct.large) align 8) #0

; Function Attrs: nounwind
declare i64 @caller_large_struct() #0

; Function Attrs: nounwind
define i64 @callee_aligned_stack(i64 %a, i64 %b, i64 %c, i64 %d, i64 %e, i128 %f, i64 %g, i64 %h, i128 %i, i64 %j, [2 x i64] %k) #0 {
  %f_trunc = trunc i128 %f to i64
  %1 = add i64 %f_trunc, %g
  %2 = add i64 %1, %h
  %3 = trunc i128 %i to i64
  %4 = add i64 %2, %3
  %5 = add i64 %4, %j
  %6 = extractvalue [2 x i64] %k, 0
  %C = icmp eq i64 %3, %4
  %7 = add i64 %5, %6
  store i1 %C, ptr @G.5, align 1
  ret i64 %7
}

; Function Attrs: nounwind
declare void @caller_aligned_stack() #0

; Function Attrs: nounwind
declare i128 @callee_small_scalar_ret() #0

; Function Attrs: nounwind
declare i64 @caller_small_scalar_ret() #0

; Function Attrs: nounwind
declare %struct.small @callee_small_struct_ret() #0

; Function Attrs: nounwind
declare i64 @caller_small_struct_ret() #0

; Function Attrs: nounwind
declare i256 @callee_large_scalar_ret() #0

; Function Attrs: nounwind
declare void @caller_large_scalar_ret() #0

; Function Attrs: nounwind
declare void @callee_large_struct_ret(ptr noalias sret(%struct.large)) #0

; Function Attrs: nounwind
declare i64 @caller_large_struct_ret() #0

attributes #0 = { nounwind }

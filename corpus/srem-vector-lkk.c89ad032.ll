; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global <4 x i1> splat (i1 true)
@G.2 = global i8 0
@G.3 = global i16 1

; Function Attrs: nounwind
declare <4 x i16> @fold_srem_vec_1(<4 x i16>) #0

; Function Attrs: nounwind
declare <4 x i16> @fold_srem_vec_2(<4 x i16>) #0

; Function Attrs: nounwind
define <4 x i16> @combine_srem_sdiv(<4 x i16> %x) #0 {
  %1 = sdiv <4 x i16> %x, splat (i16 95)
  %B = xor <4 x i16> %x, splat (i16 1)
  %2 = add <4 x i16> %B, %1
  ret <4 x i16> %2
}

; Function Attrs: nounwind
define <4 x i16> @dont_fold_srem_power_of_two(<4 x i16> %x) #0 {
  %B = and i8 42, 16
  %1 = srem <4 x i16> %x, <i16 64, i16 32, i16 8, i16 95>
  store i8 %B, ptr @G.2, align 1
  ret <4 x i16> %1
}

; Function Attrs: nounwind
define <4 x i16> @dont_fold_srem_one(<4 x i16> %x) #0 {
  %C = icmp ne <4 x i16> %x, zeroinitializer
  %1 = srem <4 x i16> %x, <i16 1, i16 654, i16 23, i16 5423>
  %B = mul <4 x i16> %x, %x
  store <4 x i1> %C, ptr @G.1, align 1
  store <4 x i16> %B, ptr poison, align 8
  ret <4 x i16> %1
}

; Function Attrs: nounwind
define <4 x i16> @dont_fold_urem_i16_smax(<4 x i16> %x) #0 {
  %B = mul i16 32767, -1
  %1 = srem <4 x i16> %x, <i16 1, i16 -32768, i16 23, i16 5423>
  store i16 %B, ptr @G.3, align 2
  ret <4 x i16> %1
}

; Function Attrs: nounwind
define <4 x i64> @dont_fold_srem_i64(<4 x i64> %x) #0 {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %1 = srem <4 x i64> %x, <i64 1, i64 654, i64 23, i64 5423>
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <4 x i64> %1

T:                                                ; preds = %T, %0
  %LGV = load i1, ptr @G, align 1
  br i1 %LGV, label %T, label %BB

F:                                                ; preds = %0
  br label %BB
}

attributes #0 = { nounwind }

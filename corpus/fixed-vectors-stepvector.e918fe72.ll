; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zdinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global <2 x i64> zeroinitializer
@G.2 = global <2 x i1> splat (i1 true)
@G.3 = global <4 x i32> splat (i32 1)
@G.4 = global i128 0

define <2 x i8> @stepvector_v2i8() {
  %v = call <2 x i8> @llvm.stepvector.v2i8()
  %B = fadd float 1.401300e-45, 1.401300e-45
  store float %B, ptr poison, align 4
  ret <2 x i8> %v
}

define <3 x i8> @stepvector_v3i8() {
  %A = alloca <2 x i1>, align 1
  %L1 = load <2 x i64>, ptr %A, align 16
  store <2 x i1> poison, ptr %A, align 1
  %C2 = icmp ule <2 x i64> splat (i64 -9223372036854775808), %L1
  %LGV = load <2 x i64>, ptr @G.1, align 16
  %C = icmp ugt <2 x i64> %LGV, splat (i64 -9223372036854775808)
  %v = call <3 x i8> @llvm.stepvector.v3i8()
  store <2 x i1> %C, ptr %A, align 1
  store <2 x i1> %C2, ptr @G.2, align 1
  ret <3 x i8> %v
}

declare <4 x i8> @stepvector_v4i8()

declare <8 x i8> @stepvector_v8i8()

declare <16 x i8> @stepvector_v16i8()

define <2 x i16> @stepvector_v2i16() {
  %A2 = alloca i128, align 8
  store i128 poison, ptr %A2, align 4
  %LGV = load i128, ptr @G.4, align 4
  %A = alloca i128, align 8
  store i128 poison, ptr %A, align 4
  %B = ashr i128 42, 170141183460469231731687303715884105727
  %v = call <2 x i16> @llvm.stepvector.v2i16()
  store i128 %B, ptr %A, align 4
  %B1 = mul i128 %B, %LGV
  store i128 %B1, ptr %A2, align 4
  ret <2 x i16> %v
}

define <4 x i16> @stepvector_v4i16() {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %v = call <4 x i16> @llvm.stepvector.v4i16()
  %C = fcmp uge bfloat 3.389530e+38, 1.000000e+00
  store i1 %C, ptr @G, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <4 x i16> %v

T:                                                ; preds = %T, %0
  br i1 %C, label %BB, label %T

F:                                                ; preds = %0
  br label %BB
}

declare <8 x i16> @stepvector_v8i16()

declare <16 x i16> @stepvector_v16i16()

declare <2 x i32> @stepvector_v2i32()

declare <4 x i32> @stepvector_v4i32()

declare <8 x i32> @stepvector_v8i32()

declare <16 x i32> @stepvector_v16i32()

declare <2 x i64> @stepvector_v2i64()

define <4 x i64> @stepvector_v4i64() {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %LGV = load <4 x i32>, ptr @G.3, align 16
  %v = call <4 x i64> @llvm.stepvector.v4i64()
  %C = icmp ult <4 x i32> splat (i32 -2147483648), %LGV
  store <4 x i1> %C, ptr %A, align 1
  ret <4 x i64> %v
}

declare <8 x i64> @stepvector_v8i64()

declare <16 x i64> @stepvector_v16i64()

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x i16> @llvm.stepvector.v16i16() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x i32> @llvm.stepvector.v16i32() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x i64> @llvm.stepvector.v16i64() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x i8> @llvm.stepvector.v16i8() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i16> @llvm.stepvector.v2i16() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i32> @llvm.stepvector.v2i32() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i64> @llvm.stepvector.v2i64() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i8> @llvm.stepvector.v2i8() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <3 x i8> @llvm.stepvector.v3i8() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i16> @llvm.stepvector.v4i16() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i32> @llvm.stepvector.v4i32() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i64> @llvm.stepvector.v4i64() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i8> @llvm.stepvector.v4i8() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x i16> @llvm.stepvector.v8i16() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x i32> @llvm.stepvector.v8i32() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x i64> @llvm.stepvector.v8i64() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x i8> @llvm.stepvector.v8i8() #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(none) }

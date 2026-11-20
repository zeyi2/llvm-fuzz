; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i1 false
@G.2 = global <4 x i64> zeroinitializer
@G.3 = global i8 0

declare <2 x i8> @stepvector_v2i8()

declare <3 x i8> @stepvector_v3i8()

define <4 x i8> @stepvector_v4i8() {
  %B = lshr i64 0, 0
  %v = call <4 x i8> @llvm.stepvector.v4i8()
  store i64 %B, ptr poison, align 4
  ret <4 x i8> %v
}

declare <8 x i8> @stepvector_v8i8()

declare <16 x i8> @stepvector_v16i8()

define <2 x i16> @stepvector_v2i16() {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i8, ptr @G.3, align 1
  %v = call <2 x i16> @llvm.stepvector.v2i16()
  %C = icmp sgt i8 0, %LGV
  store i1 %C, ptr %A, align 1
  ret <2 x i16> %v
}

declare <4 x i16> @stepvector_v4i16()

define <8 x i16> @stepvector_v8i16() {
  %v = call <8 x i16> @llvm.stepvector.v8i16()
  %C = icmp sge i64 1, 0
  store i1 %C, ptr @G.1, align 1
  ret <8 x i16> %v
}

declare <16 x i16> @stepvector_v16i16()

declare <2 x i32> @stepvector_v2i32()

declare <4 x i32> @stepvector_v4i32()

declare <8 x i32> @stepvector_v8i32()

declare <16 x i32> @stepvector_v16i32()

declare <2 x i64> @stepvector_v2i64()

define <4 x i64> @stepvector_v4i64() {
  %LGV1 = load <4 x i64>, ptr @G.2, align 32
  %v = call <4 x i64> @llvm.stepvector.v4i64()
  %C = fcmp uno half 4.200000e+01, +qnan
  store i1 %C, ptr @G, align 1
  %B = and <4 x i64> %v, %LGV1
  ret <4 x i64> %B
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

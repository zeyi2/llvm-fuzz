; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+zihintpause,+zhinx,+c -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global half 1.000000e+00
@G.2 = global half +qnan
@G.3 = global <2 x i64> splat (i64 42)
@G.4 = global <2 x i1> splat (i1 true)
@G.5 = global <4 x i1> zeroinitializer
@G.6 = global i128 0
@G.7 = global i8 -128
@G.8 = global i1 false
@G.9 = global <2 x i16> splat (i16 1)
@G.10 = global i128 0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pnsrl.v4i8.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pnsrl.v2i16.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pnsra.v4i8.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pnsra.v2i16.v2i32(<2 x i32>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i8> @llvm.riscv.pnsrar.v4i8.v4i16(<4 x i16>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i16> @llvm.riscv.pnsrar.v2i16.v2i32(<2 x i32>, i32) #0

declare <4 x i8> @pnsrl_v4i8(<4 x i16>, i32)

declare <2 x i16> @pnsrl_v2i16(<2 x i32>, i32)

declare <4 x i8> @pnsra_v4i8(<4 x i16>, i32)

declare <2 x i16> @pnsra_v2i16(<2 x i32>, i32)

declare <4 x i8> @pnsrar_v4i8(<4 x i16>, i32)

define <2 x i16> @pnsrar_v2i16(<2 x i32> %x, i32 %shamt) {
  %LGV = load i1, ptr @G, align 1
  %res = call <2 x i16> @llvm.riscv.pnsrar.v2i16.v2i32(<2 x i32> %x, i32 %shamt)
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <2 x i16> %res

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %B = mul <2 x i16> %res, %res
  %LGV1 = load i1, ptr @G.8, align 1
  %C = icmp sge i1 true, %LGV1
  store <2 x i16> %B, ptr @G.9, align 4
  br i1 %C, label %BB, label %F
}

define <4 x i8> @pnsrl_v4i8_15(<4 x i16> %x) {
  %LGV = load i128, ptr @G.10, align 4
  %res = call <4 x i8> @llvm.riscv.pnsrl.v4i8.v4i16(<4 x i16> %x, i32 15)
  %C1 = icmp sgt i128 -1, %LGV
  %C = icmp ne <4 x i8> %res, zeroinitializer
  store <4 x i1> %C, ptr @G.5, align 1
  store i1 %C1, ptr @G, align 1
  ret <4 x i8> %res
}

declare <4 x i8> @pnsrl_v4i8_16(<4 x i16>)

declare <4 x i8> @pnsrl_v4i8_32(<4 x i16>)

declare <2 x i16> @pnsra_v2i16_31(<2 x i32>)

declare <2 x i16> @pnsra_v2i16_32(<2 x i32>)

define <4 x i8> @pnsrar_v4i8_15(<4 x i16> %x) {
  %B = mul <4 x i16> %x, %x
  %LGV2 = load i128, ptr @G.6, align 4
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV1 = load half, ptr @G.2, align 2
  %LGV = load half, ptr @G.1, align 2
  %G = getelementptr ptr, ptr %A, i128 %LGV2
  %C = fcmp ueq half %LGV, %LGV1
  %res = call <4 x i8> @llvm.riscv.pnsrar.v4i8.v4i16(<4 x i16> %B, i32 15)
  store i1 %C, ptr %G, align 1
  ret <4 x i8> %res
}

declare <4 x i8> @pnsrar_v4i8_16(<4 x i16>)

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

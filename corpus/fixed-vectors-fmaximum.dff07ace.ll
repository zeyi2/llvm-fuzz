; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+d,+zvfhmin,+experimental-zvfbfa,+zicond -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 -1
@G.1 = global i1 true
@G.2 = global <2 x half> splat (half 6.550400e+04)
@G.3 = global <2 x half> zeroinitializer

declare <2 x bfloat> @vfmax_v2bf16_vv(<2 x bfloat>, <2 x bfloat>)

define <4 x bfloat> @vfmax_v4bf16_vv(<4 x bfloat> %a, <4 x bfloat> %b) {
  %v = call <4 x bfloat> @llvm.maximum.v4bf16(<4 x bfloat> %a, <4 x bfloat> %b)
  %C = fcmp ule <4 x bfloat> %b, zeroinitializer
  store <4 x i1> %C, ptr poison, align 1
  ret <4 x bfloat> %v
}

declare <8 x bfloat> @vfmax_v8bf16_vv(<8 x bfloat>, <8 x bfloat>)

declare <16 x bfloat> @vfmax_v16bf16_vv(<16 x bfloat>, <16 x bfloat>)

declare <2 x half> @vfmax_v2f16_vv(<2 x half>, <2 x half>)

declare <4 x half> @vfmax_v4f16_vv(<4 x half>, <4 x half>)

declare <8 x half> @vfmax_v8f16_vv(<8 x half>, <8 x half>)

declare <16 x half> @vfmax_v16f16_vv(<16 x half>, <16 x half>)

declare <2 x float> @vfmax_v2f32_vv(<2 x float>, <2 x float>)

declare <4 x float> @vfmax_v4f32_vv(<4 x float>, <4 x float>)

declare <8 x float> @vfmax_v8f32_vv(<8 x float>, <8 x float>)

declare <16 x float> @vfmax_v16f32_vv(<16 x float>, <16 x float>)

define <2 x double> @vfmax_v2f64_vv(<2 x double> %a, <2 x double> %b) {
  %A = alloca i128, align 8
  store i128 poison, ptr %A, align 4
  %v = call <2 x double> @llvm.maximum.v2f64(<2 x double> %a, <2 x double> %b)
  %B = lshr i128 42, 0
  store i128 %B, ptr %A, align 4
  ret <2 x double> %v
}

declare <4 x double> @vfmax_v4f64_vv(<4 x double>, <4 x double>)

declare <8 x double> @vfmax_v8f64_vv(<8 x double>, <8 x double>)

; Function Attrs: nounwind
declare <16 x double> @vfmax_v16f64_vv(<16 x double>, <16 x double>) #0

declare <2 x half> @vfmax_v2f16_vv_nnan(<2 x half>, <2 x half>)

define <2 x half> @vfmax_v2f16_vv_nnana(<2 x half> %a, <2 x half> %b) {
  %A14 = alloca <2 x half>, align 4
  store <2 x half> poison, ptr %A14, align 4
  %A11 = alloca i1, align 1
  store i1 true, ptr %A11, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i64, ptr @G, align 4
  %c = fadd nnan <2 x half> %a, %a
  switch i64 %LGV, label %SW_D [
    i64 -8461801310953452687, label %SW_C
    i64 -4029211783732104690, label %SW_C1
    i64 8531351077749884841, label %SW_C2
    i64 -7351963037231923833, label %SW_C3
    i64 -6890006911598499052, label %SW_C4
    i64 -6171748137253777047, label %SW_C5
    i64 -7734269165797204087, label %SW_C6
    i64 -2390723298561913591, label %SW_C7
  ]

BB:                                               ; preds = %SW_C6, %SW_C5, %SW_C1, %SW_C, %SW_D
  %v = call <2 x half> @llvm.maximum.v2f16(<2 x half> %c, <2 x half> %b)
  store <2 x half> %v, ptr %A14, align 4
  ret <2 x half> %v

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %SW_C1, %0
  %LGV8 = load i1, ptr @G.1, align 1
  br i1 %LGV8, label %BB, label %SW_C1

SW_C2:                                            ; preds = %0
  %LGV9 = load <2 x half>, ptr @G.2, align 4
  store <2 x half> %LGV9, ptr %A14, align 4
  ret <2 x half> %LGV9

SW_C3:                                            ; preds = %0
  %LGV10 = load <2 x half>, ptr @G.2, align 4
  ret <2 x half> %b

SW_C4:                                            ; preds = %0
  ret <2 x half> %a

SW_C5:                                            ; preds = %SW_C5, %0
  %L = load i1, ptr %A11, align 1
  br i1 %L, label %BB, label %SW_C5

SW_C6:                                            ; preds = %SW_C6, %0
  %L12 = load i1, ptr %A11, align 1
  store i1 %L12, ptr %A14, align 1
  br i1 %L12, label %BB, label %SW_C6

SW_C7:                                            ; preds = %0
  %LGV13 = load <2 x half>, ptr @G.3, align 4
  ret <2 x half> %LGV13
}

declare <2 x half> @vfmax_v2f16_vv_nnanb(<2 x half>, <2 x half>)

declare <4 x half> @vfmax_v2f16_vv_nnan_insert_subvector(<2 x half>, <2 x half>, <4 x half>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x bfloat> @llvm.maximum.v16bf16(<16 x bfloat>, <16 x bfloat>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x half> @llvm.maximum.v16f16(<16 x half>, <16 x half>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.maximum.v16f32(<16 x float>, <16 x float>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x double> @llvm.maximum.v16f64(<16 x double>, <16 x double>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x bfloat> @llvm.maximum.v2bf16(<2 x bfloat>, <2 x bfloat>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x half> @llvm.maximum.v2f16(<2 x half>, <2 x half>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.maximum.v2f32(<2 x float>, <2 x float>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.maximum.v2f64(<2 x double>, <2 x double>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x bfloat> @llvm.maximum.v4bf16(<4 x bfloat>, <4 x bfloat>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x half> @llvm.maximum.v4f16(<4 x half>, <4 x half>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.maximum.v4f32(<4 x float>, <4 x float>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @llvm.maximum.v4f64(<4 x double>, <4 x double>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x bfloat> @llvm.maximum.v8bf16(<8 x bfloat>, <8 x bfloat>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x half> @llvm.maximum.v8f16(<8 x half>, <8 x half>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.maximum.v8f32(<8 x float>, <8 x float>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x double> @llvm.maximum.v8f64(<8 x double>, <8 x double>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x half> @llvm.vector.insert.v4f16.v2f16(<4 x half>, <2 x half>, i64 immarg) #2

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

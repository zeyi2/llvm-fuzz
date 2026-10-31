; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -1
@G.1 = global i8 42
@G.2 = global float +qnan
@G.3 = global i128 42

declare zeroext i1 @vreduce_or_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_xor_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_and_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_umax_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_smax_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_umin_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_smin_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_or_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_xor_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_and_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_umax_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_smax_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_umin_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_smin_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_or_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_xor_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_and_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_umax_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_smax_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_umin_v4i1(<4 x i1>)

define zeroext i1 @vreduce_smin_v4i1(<4 x i1> %v) {
  %red = call i1 @llvm.vector.reduce.smin.v4i1(<4 x i1> %v)
  %C = icmp slt i1 %red, %red
  ret i1 %C
}

declare zeroext i1 @vreduce_or_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_xor_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_and_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_umax_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_smax_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_umin_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_smin_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_or_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_xor_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_and_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_umax_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_smax_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_umin_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_smin_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_or_v32i1(<32 x i1>)

declare zeroext i1 @vreduce_xor_v32i1(<32 x i1>)

declare zeroext i1 @vreduce_and_v32i1(<32 x i1>)

define zeroext i1 @vreduce_umax_v32i1(<32 x i1> %v) {
  %LGV = load float, ptr @G.2, align 4
  %C = fcmp one float 1.000000e+00, %LGV
  %red = call i1 @llvm.vector.reduce.umax.v32i1(<32 x i1> %v)
  store i1 %C, ptr poison, align 1
  ret i1 %red
}

declare zeroext i1 @vreduce_smax_v32i1(<32 x i1>)

declare zeroext i1 @vreduce_umin_v32i1(<32 x i1>)

declare zeroext i1 @vreduce_smin_v32i1(<32 x i1>)

declare zeroext i1 @vreduce_or_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_xor_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_and_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_umax_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_smax_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_umin_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_smin_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_add_v1i1(<1 x i1>)

declare zeroext i1 @vreduce_add_v2i1(<2 x i1>)

declare zeroext i1 @vreduce_add_v4i1(<4 x i1>)

declare zeroext i1 @vreduce_add_v8i1(<8 x i1>)

declare zeroext i1 @vreduce_add_v16i1(<16 x i1>)

declare zeroext i1 @vreduce_add_v32i1(<32 x i1>)

declare zeroext i1 @vreduce_add_v64i1(<64 x i1>)

declare zeroext i1 @vreduce_or_v128i1(<128 x i1>)

declare zeroext i1 @vreduce_xor_v128i1(<128 x i1>)

define zeroext i1 @vreduce_and_v128i1(<128 x i1> %v) {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i128, ptr @G.3, align 4
  %red = call i1 @llvm.vector.reduce.and.v128i1(<128 x i1> %v)
  switch i128 %LGV, label %SW_D [
    i128 16327508363394376575, label %SW_C
    i128 631312775201607800, label %SW_C1
    i128 10923245523169457324, label %SW_C2
    i128 11789173086994412142, label %SW_C3
    i128 6512296780732932652, label %SW_C4
    i128 15188906640950447766, label %SW_C5
    i128 8224072177331258413, label %SW_C6
    i128 11474299638528446547, label %SW_C7
  ]

BB:                                               ; preds = %SW_C6, %SW_C5, %SW_C4, %SW_C3, %SW_C2, %SW_C, %SW_D
  ret i1 %red

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %0
  ret i1 false

SW_C2:                                            ; preds = %SW_C2, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %SW_C2, label %BB

SW_C3:                                            ; preds = %0
  br label %BB

SW_C4:                                            ; preds = %0
  br label %BB

SW_C5:                                            ; preds = %0
  br label %BB

SW_C6:                                            ; preds = %0
  br label %BB

SW_C7:                                            ; preds = %0
  ret i1 %red
}

declare zeroext i1 @vreduce_umax_v128i1(<128 x i1>)

declare zeroext i1 @vreduce_smax_v128i1(<128 x i1>)

declare zeroext i1 @vreduce_umin_v128i1(<128 x i1>)

declare zeroext i1 @vreduce_smin_v128i1(<128 x i1>)

declare zeroext i1 @vreduce_or_v256i1(<256 x i1>)

declare zeroext i1 @vreduce_xor_v256i1(<256 x i1>)

declare zeroext i1 @vreduce_and_v256i1(<256 x i1>)

declare zeroext i1 @vreduce_umax_v256i1(<256 x i1>)

declare zeroext i1 @vreduce_smax_v256i1(<256 x i1>)

declare zeroext i1 @vreduce_umin_v256i1(<256 x i1>)

define zeroext i1 @vreduce_smin_v256i1(<256 x i1> %v) {
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %LGV = load i8, ptr @G.1, align 1
  %red = call i1 @llvm.vector.reduce.smin.v256i1(<256 x i1> %v)
  %B = or i8 16, %LGV
  store i8 %B, ptr %A, align 1
  ret i1 %red
}

declare zeroext i1 @vreduce_or_v512i1(<512 x i1>)

declare zeroext i1 @vreduce_xor_v512i1(<512 x i1>)

define zeroext i1 @vreduce_and_v512i1(<512 x i1> %v) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i32, ptr @G, align 4
  %C = icmp sle i32 0, %LGV
  %red = call i1 @llvm.vector.reduce.and.v512i1(<512 x i1> %v)
  store i1 %C, ptr %A, align 1
  ret i1 %red
}

declare zeroext i1 @vreduce_umax_v512i1(<512 x i1>)

declare zeroext i1 @vreduce_smax_v512i1(<512 x i1>)

declare zeroext i1 @vreduce_umin_v512i1(<512 x i1>)

declare zeroext i1 @vreduce_smin_v512i1(<512 x i1>)

declare zeroext i1 @vreduce_or_v1024i1(<1024 x i1>)

declare zeroext i1 @vreduce_xor_v1024i1(<1024 x i1>)

declare zeroext i1 @vreduce_and_v1024i1(<1024 x i1>)

declare zeroext i1 @vreduce_umax_v1024i1(<1024 x i1>)

declare zeroext i1 @vreduce_smax_v1024i1(<1024 x i1>)

declare zeroext i1 @vreduce_umin_v1024i1(<1024 x i1>)

declare zeroext i1 @vreduce_smin_v1024i1(<1024 x i1>)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.add.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.and.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.or.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smax.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.smin.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umax.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.umin.v8i1(<8 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v1024i1(<1024 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v128i1(<128 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v16i1(<16 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v1i1(<1 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v256i1(<256 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v2i1(<2 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v32i1(<32 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v4i1(<4 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v512i1(<512 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v64i1(<64 x i1>) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.vector.reduce.xor.v8i1(<8 x i1>) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

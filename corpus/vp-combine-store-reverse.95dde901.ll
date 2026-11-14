; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+f,+v,+m,+zvkb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 0
@G.1 = global i128 0
@G.2 = global i1 true
@G.3 = global <4 x i32> splat (i32 -1)
@G.4 = global ptr poison

define void @test_store_reverse_combiner(<vscale x 2 x float> %val, ptr %ptr, i32 zeroext %evl) {
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %LGV1 = load <4 x i32>, ptr @G.3, align 16
  %rev = call <vscale x 2 x float> @llvm.experimental.vp.reverse.nxv2f32(<vscale x 2 x float> %val, <vscale x 2 x i1> splat (i1 true), i32 %evl)
  call void @llvm.vp.store.nxv2f32.p0(<vscale x 2 x float> %rev, ptr %ptr, <vscale x 2 x i1> splat (i1 true), i32 %evl)
  %B = or <4 x i32> zeroinitializer, %LGV1
  store <4 x i32> %B, ptr %A, align 16
  ret void
}

define void @test_store_mask_is_vp_reverse(<vscale x 2 x float> %val, ptr %ptr, <vscale x 2 x i1> %mask, i32 zeroext %evl) {
  %LGV = load i128, ptr @G.1, align 4
  %storemask = call <vscale x 2 x i1> @llvm.experimental.vp.reverse.nxv2i1(<vscale x 2 x i1> %mask, <vscale x 2 x i1> splat (i1 true), i32 %evl)
  %rev = call <vscale x 2 x float> @llvm.experimental.vp.reverse.nxv2f32(<vscale x 2 x float> %val, <vscale x 2 x i1> splat (i1 true), i32 %evl)
  call void @llvm.vp.store.nxv2f32.p0(<vscale x 2 x float> %rev, ptr %ptr, <vscale x 2 x i1> %storemask, i32 %evl)
  switch i128 %LGV, label %SW_D [
    i128 9517432170708910931, label %SW_C
    i128 291121430443824451, label %SW_C1
    i128 639559052736931647, label %SW_C2
    i128 3720008921586782463, label %SW_C3
  ]

BB:                                               ; preds = %SW_C2, %SW_C1, %SW_C, %SW_D
  ret void

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %LGV4 = load i1, ptr @G.2, align 1
  br i1 %LGV4, label %SW_C, label %BB

SW_C1:                                            ; preds = %0
  br label %BB

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  ret void
}

declare void @test_store_mask_is_vp_reverse_with_mask(<vscale x 2 x float>, ptr, <vscale x 2 x i1>, <vscale x 2 x i1>, i32 zeroext)

declare void @test_different_evl(<vscale x 2 x float>, ptr, <vscale x 2 x i1>, i32 zeroext, i32 zeroext)

define void @test_store_splice_reverse_combiner(<vscale x 2 x float> %val, ptr %ptr, i32 zeroext %evl) {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV = load i32, ptr @G, align 4
  %rev = call <vscale x 2 x float> @llvm.vector.reverse.nxv2f32(<vscale x 2 x float> %val)
  %splice = call <vscale x 2 x float> @llvm.vector.splice.right.nxv2f32(<vscale x 2 x float> %rev, <vscale x 2 x float> poison, i32 %evl)
  %B = lshr i32 %LGV, %evl
  call void @llvm.vp.store.nxv2f32.p0(<vscale x 2 x float> %splice, ptr %ptr, <vscale x 2 x i1> splat (i1 true), i32 %evl)
  store i32 %B, ptr %A, align 4
  ret void
}

define void @test_store_splice_mask_is_reverse(<vscale x 2 x float> %val, ptr %ptr, <vscale x 2 x i1> %mask, i32 zeroext %evl) {
  %B = and <vscale x 2 x i1> %mask, splat (i1 true)
  %G = getelementptr i32, ptr %ptr, i32 %evl
  %storemask.splice = call <vscale x 2 x i1> @llvm.vector.splice.right.nxv2i1(<vscale x 2 x i1> %B, <vscale x 2 x i1> poison, i32 %evl)
  %rev = call <vscale x 2 x float> @llvm.vector.reverse.nxv2f32(<vscale x 2 x float> %val)
  %splice = call <vscale x 2 x float> @llvm.vector.splice.right.nxv2f32(<vscale x 2 x float> %rev, <vscale x 2 x float> poison, i32 %evl)
  call void @llvm.vp.store.nxv2f32.p0(<vscale x 2 x float> %splice, ptr %ptr, <vscale x 2 x i1> %storemask.splice, i32 %evl)
  store ptr %G, ptr @G.4, align 8
  ret void
}

declare void @test_store_splice_different_evl(<vscale x 2 x float>, ptr, i32 zeroext, i32 zeroext)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x float> @llvm.experimental.vp.reverse.nxv2f32(<vscale x 2 x float>, <vscale x 2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i1> @llvm.experimental.vp.reverse.nxv2i1(<vscale x 2 x i1>, <vscale x 2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x float> @llvm.vector.reverse.nxv2f32(<vscale x 2 x float>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i1> @llvm.vector.reverse.nxv2i1(<vscale x 2 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x float> @llvm.vector.splice.right.nxv2f32(<vscale x 2 x float>, <vscale x 2 x float>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i1> @llvm.vector.splice.right.nxv2i1(<vscale x 2 x i1>, <vscale x 2 x i1>, i32) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.vp.store.nxv2f32.p0(<vscale x 2 x float>, ptr captures(none), <vscale x 2 x i1>, i32) #1

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
